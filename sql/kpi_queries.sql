
-- kpi_queries.sql

CREATE TABLE satellites(
			sat_name TEXT,
			country_registry TEXT,
			country_operator TEXT,
			operator TEXT,
			purpose TEXT,
			detailed_purpose TEXT,
			perigee_km DOUBLE PRECISION,
			apogee_km DOUBLE PRECISION,
			inclination_degrees	DOUBLE PRECISION,
			date_of_launch TIMESTAMP,
			mean_alt_km	DOUBLE PRECISION,
			launch_year INT,
			age_years DOUBLE PRECISION,
			orbit_shell TEXT,
			alt_band_1000km INT,
			old_10y BOOLEAN,
			old_15y BOOLEAN
);


-- KPI 1: Satellite Count. 
-- Total Satellite Count
SELECT COUNT(*) AS total_satellites 
FROM satellites;

-- Total Satellite Count by Orbit Shell
SELECT orbit_shell, 
		COUNT(*) AS count 
FROM satellites 
GROUP BY orbit_shell 
ORDER BY count DESC;


-- KPI 2: Top 10 Operators (by count) and percentage share in a shell.
-- Top 10 Operators by Count
SELECT operator, 
	   COUNT(*) AS sat_count
FROM satellites
GROUP BY operator
ORDER BY sat_count DESC
LIMIT 10;

-- Top 10 Operators per-shell with percent share
SELECT orbit_shell, 
	   operator, 
	   cnt,
       ROUND(100.0 * cnt / SUM(cnt) OVER (PARTITION BY orbit_shell), 2) AS percent_share
FROM (
  SELECT orbit_shell, operator, COUNT(*) AS cnt
  FROM satellites
  GROUP BY orbit_shell, operator
) 
ORDER BY orbit_shell, cnt DESC;


-- KPI 3: Average Satellite Age. 
-- Average Satellite Age per shell
SELECT orbit_shell, 
	   ROUND(AVG(age_years)::numeric, 2) AS avg_age, 
	   COUNT(*) AS count
FROM satellites
GROUP BY orbit_shell
ORDER BY avg_age DESC;

-- Average Satellite Age per operator
SELECT operator, 
	   ROUND(AVG(age_years)::numeric,2) AS avg_age, 
	   COUNT(*) AS count
FROM satellites
GROUP BY operator
HAVING COUNT(*)>=5
ORDER BY avg_age DESC;

-- KPI 4: Percentage of satellites in each category (communication, earth observation, scientific, and military) within each orbital shell. 
SELECT orbit_shell,
	   detailed_purpose AS mission_type, 
	   COUNT(*) AS count,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY orbit_shell), 2) AS percent_in_shell
FROM satellites
GROUP BY orbit_shell, detailed_purpose
ORDER BY orbit_shell, percent_in_shell ASC;

-- KPI 5: Number of satellites per 1000-kilometer altitude range.
SELECT alt_band_1000km AS altitude_band_1000km, 
	   COUNT(*) as sat_count
FROM satellites
WHERE alt_band_1000km IS NOT NULL
GROUP BY alt_band_1000km
ORDER BY sat_count DESC;

-- KPI 6: Percentage of satellites that are older than 15 years.
SELECT orbit_shell,
       COUNT(*) FILTER (WHERE age_years > 15) AS older_than_15,
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) FILTER (WHERE age_years > 15) / NULLIF(COUNT(*),0),2) AS percent_older_than_15
FROM satellites
GROUP BY orbit_shell
ORDER BY percent_older_than_15 DESC;
