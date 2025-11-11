Filtering and analysing a summary statistic report
In this notebook, we demonstrate how to filter and analyse a summary statistic report using the WHERE and HAVING clauses.

⚠️ This notebook will not run on Google Colab because it cannot connect to a local database. Please make sure that this notebook is running on the same local machine as your MySQL Workbench installation and MySQL united_nations database.

Learning objectives
By the end of this train, you should:

Know how to analyse a summary statistic report using the WHERE and HAVING clauses.
Connecting to our MySQL database
Continuing with the numerical analysis of our Access_to_Basic_Services table created in MySQL Workbench, we want to filter and analyse our already-created summary statistic report. We can apply the same queries in MySQL Workbench and in this notebook if we connect to our MySQL server. Since we have a MySQL database, we can connect to it using mysql and pymysql.

Exercise
We started with finding out the minimum, maximum, and average percentage of people that have access to drinking water services, the number of countries, and the total GDP per region and sub-region. We also ordered this data by estimated GDP.

%%sql

SELECT Region, 
    Sub_region,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services, 
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services, 
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    COUNT(DISTINCT(Country_name)) AS Number_of_countries,
    SUM(EST_gdp_in_billions) AS EST_total_gdp_in_billions 
FROM united_nations.Access_to_Basic_Services 
GROUP BY Region, Sub_region
ORDER BY EST_total_gdp_in_billions;

* mysql+pymysql://root:***@localhost:3306/united_nations
18 rows affected.


Let's continue with our analysis.

We want to use the summary statistic report to do the following:

Filter for the year 2020.
Focus on countries where the percentage of managed drinking water services is below 60%.
Filter for the regions and sub-regions that have fewer than four countries.
1. Filter for the year 2020.
Using the above query, focus on results where the time period is 2020 using the WHERE clause.

%%sql

SELECT Region, 
    Sub_region,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services, 
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services, 
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    COUNT(DISTINCT(Country_name)) AS Number_of_countries,
    SUM(EST_gdp_in_billions) AS EST_total_gdp_in_billions 
FROM united_nations.Access_to_Basic_Services 
where time_period = "2020"
GROUP BY Region, Sub_region
ORDER BY EST_total_gdp_in_billions;


 * mysql+pymysql://root:***@localhost:3306/united_nations
18 rows affected.


2. Focus on countries where the percentage of managed drinking water services is below 60%.
Adding onto your query above, focus on results where the percentage of managed drinking water services is smaller than 60% using the WHERE clause.

%%sql

SELECT Region, 
    Sub_region,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services, 
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services, 
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    COUNT(DISTINCT(Country_name)) AS Number_of_countries,
    SUM(EST_gdp_in_billions) AS EST_total_gdp_in_billions 
FROM united_nations.Access_to_Basic_Services 
where time_period = "2020"
and Pct_managed_drinking_water_services <60

GROUP BY Region, Sub_region
ORDER BY EST_total_gdp_in_billions;

* mysql+pymysql://root:***@localhost:3306/united_nations
4 rows affected.


3. Filter for the sub-regions that have fewer than four countries.
Filter the results above to only include the regions and sub-regions that have fewer than four countries in the Number_of_countries alias using the HAVING clause.



%%sql

SELECT Region, 
    Sub_region,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services, 
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services, 
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    COUNT(DISTINCT(Country_name)) AS Number_of_countries,
    SUM(EST_gdp_in_billions) AS EST_total_gdp_in_billions 
FROM united_nations.Access_to_Basic_Services 
where time_period = "2020"
and Pct_managed_drinking_water_services <60
GROUP BY Region, Sub_region
HAVING Number_of_countries < 4
ORDER BY EST_total_gdp_in_billions;


 * mysql+pymysql://root:***@localhost:3306/united_nations
2 rows affected.