![](https://github.com/mayank1ahuja/SpaceSight/blob/0699bc36a5a56e3a9d8bc85222a7d98880b518c2/images/header.png)
<h1 align = "center"> SpaceSight
A Satellite Analytics & Orbit Insights Project</h1>

## TL;DR 
This end-to-end project was developed to transform the UCS Satellite Database into decision-grade orbital KPIs and visual narratives across LEO, MEO and GEO. Deliverables include reproducible notebooks, canonical SQL KPI schemas, two interactive Tableau dashboards, and export-ready visuals for stakeholder briefings

## Contents
- [Project Overview](#project-overview)
- [Dashboard Preview](#dashboard-preview)
- [Background and Motivation](#background-and-motivation)
- [Data Source](#data-source)
- [Objectives](#objectives)
- [Methodology](#methodology)
- [Visual Highlights](#visual-highlights)
- [Key Findings](#key-findings)
- [Dashboard and Deliverables](#dashboard-and-deliverables)
- [Impact and Skills Demonstrated](#impact-and-skills-demonstrated)
- [Author](#author)


## Project Overview 

Satellite operations are no longer driven by curiosity, rather serve as infrastructure. Space agencies, satellite operators, and ground-station networks require clear answers to operational questions: Which orbital shells are becoming most congested, and who is driving that growth? What is the age and mission-type composition of satellites in those crowded shells?

Thus, this end-to-end analytics product was developed to answer these questions. Using the UCS Satellite Database, the project computes domain-relevant KPIs — growth rates, operator/country concentration, age, distribution of purposes within a group, and a practical density proxy and packages those insights in reproducible notebooks, canonical SQL, and an interactive Tableau workbook. The goal is to produce actionable intelligence for mission planners, regulators, insurers, and engineering leads.

## Dashboard Preview
![Industry Landscape](https://github.com/mayank1ahuja/SpaceSight/blob/a461ee4701a56b89760f903d9c8b8ac51271860b/assets/tableau/dashboard%201.png)  
*Interactive Tableau dashboard highlighting orbital shell distribution, growth trends, operator concentration, and mission purposes.*  

## Background and Motivation
Managing satellite traffic and collision risk across orbital shells is an urgent operational problem. The number of satellites launched each year has increased rapidly, leading to congestion in certain orbital shells. This can strain ground-station resources and raise safety concerns. To address this challenge, data was used from the UCS Satellite Database, which contains detailed information on satellite launches, orbital parameters, operators, and mission purposes.

## Data Source
* **Source**: UCS Satellite Database (Union of Concerned Scientists).
* [**Dataset**](https://www.ucs.org/resources/satellite-database#:~:text=In,purpose%2C%20and%20other%20operational%20details)
* This public dataset (updated May 2023) lists 7,560 active satellites currently orbiting Earth. It is available in both Excel and Text Format. Each row is one satellite with ~28 fields. Key columns include satellite name, operator/owner country, country of registry, launch date and orbital parameters.

## Objectives
Primary objectives:
1. **Identify Crowded Orbital Shells:** Find altitude/inclination bands with the fastest growth in satellite count per year.
2. **Determine Growth Drivers:** Identify top operators and countries contributing to growth in each shell.
3. **Analyze Purpose Distribution:** Quantify age distribution and purpose distribution in crowded shells to assess reliability and risk.
4. **Provide Actionable Recommendations:** prioritize monitoring, capacity planning, insurance flags, and policy triggers.

## Methodology
The project follows an end-to-end analytics pipeline, moving systematically from raw satellite records to decision-oriented outputs:
1. **Data Ingestion**: The UCS Satellite Database was imported into the working environment as the primary data source.
2. **Data Cleaning & Feature Engineering**: Using Python (pandas in ```data cleaning.ipynb```), the dataset was cleaned and enhanced with derived features such as mean altitude, orbital shell classification (LEO/MEO/GEO), satellite age (in years), and altitude bands. The cleaned dataset was then exported for reproducibility.
3. **KPI Computation**: Canonical metrics were computed using SQL scripts in ```kpi_queries.sql```. These included satellite counts by shell, annual growth rates, operator and country market shares, mission-type mixes, average ages, and concentration measures.
4. **Exploratory Analysis & Visualizations**: Exploratory analysis was conducted in Jupyter ```exploratory analysis.ipynb```, producing plots and summary tables. Visuals covered time-series growth by shell, operator distributions, satellite age profiles, mission-type breakdowns, and altitude–inclination density heatmaps.
5. **Dashboard Development**: The final deliverable was an interactive Tableau workbook called ```Satellite Analytics & Orbit Insights.twbx``` that integrated the cleaned dataset and KPIs. The dashboard allowed stakeholders to explore satellite trends by orbital shell, operator, country, and mission type through intuitive charts and key performance indicators.

## Visual Highlights

### Dashboard 1 – Global Satellite Industry Landscape
![Industry Landscape](https://github.com/mayank1ahuja/SpaceSight/blob/a461ee4701a56b89760f903d9c8b8ac51271860b/assets/tableau/dashboard%201.png)  

### Dashboard 2 – Risks & Global Distribution
![Risk & Geography](https://github.com/mayank1ahuja/SpaceSight/blob/a461ee4701a56b89760f903d9c8b8ac51271860b/assets/tableau/dashboard%202.png)  

### Selected Plotly Charts
### Plot 1 - Launches per Year
![Launches per Year](https://github.com/mayank1ahuja/SpaceSight/blob/2fa8730fed89a4740c881afff3350a8942e746db/assets/plotly/satellite%20launches%20per%20year%20by%20orbit%20shell.png)  

### Plot 2 - Average Age of Satellites by Operator
![Average Age of Satellites by Operator](https://github.com/mayank1ahuja/SpaceSight/blob/2fa8730fed89a4740c881afff3350a8942e746db/assets/plotly/average%20satellite%20age%20by%20operator.png)  

### Plot 3 - Dominant Orbit Shells by Country
![Dominant Orbit Shells by Country](https://github.com/mayank1ahuja/SpaceSight/blob/2fa8730fed89a4740c881afff3350a8942e746db/assets/plotly/dominant%20orbit%20shell%20by%20country.png)  


## Key Findings
1. **Rapid growth in specific orbits**:  Certain orbital shells (specific altitude bands) were identified as accumulating satellites at the fastest rates. These shells are often populated by recent deployments of large commercial communications constellations.
2. **Leading operators and countries**: A small number of major operators and their home countries were found to dominate new launches in the most congested shells. This pattern highlights which organizations and jurisdictions are most active in those orbital bands.
3. **Satellite age and purpose distribution**: Satellites in the busiest shells were observed to be relatively new, with many launched in the last few years. The mission-type breakdown within these shells shows a predominance of commercial communications and Earth-observation payloads.
4. **Actionable recommendations**: It is recommended that monitoring and collision-mitigation efforts be prioritized for the identified high-growth shells. Ground-station capacity planning should be aligned with these altitude bands. Additionally, satellites operating in these congested zones should be considered for insurance or maintenance review due to their elevated operational risk profile.

## Dashboards and Deliverables
The final deliverables are two interactive Tableau dashboards that stakeholders can use to explore the insights. 

Key features include:
* Time-series charts showing satellite count growth by orbital shell.
* Bar charts of top operators and countries in each shell.
* Distribution charts of satellite ages and mission types within each shell.

The GitHub repository includes:
* Jupyter notebooks detailing the data processing and analysis steps.
* A SQL script containing the key queries for metric calculations.
* The Tableau workbook file for the interactive dashboard.

## Impact and Skills Demonstrated
This project showcases the ability to turn raw space-traffic data into strategic intelligence. It combines domain framing with solid data techniques:

* **Domain Knowledge**: Framing satellite congestion as an operational risk and capacity planning problem.
* **Technical Skills**: Data ingestion, transformation, and analysis using Python and SQL; dashboard and KPI design using Tableau.
* **Analytical Techniques**: Time-series trend analysis, geospatial grouping (orbital shells), and multi-dimensional aggregation.
* **Business Outcome**: Clear recommendations for monitoring and resource allocation, showing how data insights support decision-making.

The approach is scalable and can be applied to other datasets (e.g., Two-Line Element sets or ground-station logs) for broader space traffic analytics projects.

## Author
### **Mayank Ahuja**  
- Email: ahuja.1mayank@gmail.com  
- LinkedIn: https://www.linkedin.com/in/mayank1ahuja/  
- GitHub: https://github.com/mayank1ahuja
- X: https://x.com/maxsiie

