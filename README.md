![](https://github.com/mayank1ahuja/SpaceSight/blob/0699bc36a5a56e3a9d8bc85222a7d98880b518c2/images/header.png)
<h1 align = "center"> SpaceSight </h1>

## **Overview of the Project**

Satellite operations are no longer driven by curiosity, rather serve as infrastructure. Space agencies, satellite operators, and ground-station networks require clear answers to operational questions: Which orbital shells are becoming most congested, and who is driving that growth? What is the age and mission-type composition of satellites in those crowded shells?

Thus, this end-to-end analytics product was developed to answer these questions. Using the UCS Satellite Database, the project computes domain-relevant KPIs — growth rates, operator/country concentration, age, distribution of purposes within a group, and a practical density proxy and packages those insights in reproducible notebooks, canonical SQL, and an interactive Tableau workbook. The goal is to produce actionable intelligence for mission planners, regulators, insurers, and engineering leads.

## Background & Motivation
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
4. **Exploratory Analysis & Visualizations**: Exploratory analysis was conducted in Jupyter ```exploartory analysis.ipynb```, producing plots and summary tables. Visuals covered time-series growth by shell, operator distributions, satellite age profiles, mission-type breakdowns, and altitude–inclination density heatmaps.
5. **Dashboard Development**: The final deliverable was an interactive Tableau workbook called ```Satellite Analytics & Orbit Insights.twbx``` that integrated the cleaned dataset and KPIs. The dashboard allowed stakeholders to explore satellite trends by orbital shell, operator, country, and mission type through intuitive charts and key performance indicators.
