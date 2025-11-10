Create a summary statistic report in SQL
In this notebook, we will demonstrate how to create a summary statistic report in SQL using numeric functions and aggregations.

⚠️ This notebook will not run on Google Colab because it cannot connect to a local database. Please make sure that this notebook is running on the same local machine as your MySQL Workbench installation and MySQL united_nations database.

Learning objectives
By the end of this train, you should:

Know how to use the GROUP BY clause to examine the same dataset at different levels of granularity.
Connecting to our MySQL database
Using our Access_to_Basic_Services table created in MySQL Workbench, we want to answer some questions on the range of our dataset. We can apply the same queries in MySQL Workbench and in this notebook if we connect to our MySQL server. Since we have a MySQL database, we can connect to it using mysql and pymysql.

To make a query, we add the %%sql command to the start of a cell, create one open line, and then the query like below, and run the cell.

%%sql

SELECT 
    *
FROM
    Access_to_Basic_Services
LIMIT 10;


* mysql+pymysql://root:***@localhost:3306/united_nations
10 rows affected.

Exercise
We want to determine the following:

What is the minimum, maximum, and average percentage of people that have access to managed drinking water services per region and sub_region?
What is the number of countries within each region and sub_region?
What is the total GDP for each region and sub_region?

1. What is the minimum, maximum, and average percentage of people that have access to managed drinking water services per region and sub_region?
Calculate the minimum, maximum, and average percentage of people that have access to managed drinking water services per region and sub_region in our dataset using the MIN, MAX, and AVG functions. Return the result with aliases.

%%sql
Select
region,sub_region
min(Pct_managed_sanitation_services), as minimum_managed_sanitation
max(Pct_managed_sanitation_services), as maximum_managed_sanitation
AVG(Pct_managed_sanitation_services) as Avg_managed_sanitation

from
united_nations.access_to_basic_services

group by region,sub_region;

* mysql+pymysql://root:***@localhost:3306/united_nations
18 rows affected.


2. What is the total number of countries within each region and sub_region?
Determine the number of countries within each region and sub-region by using the COUNT function. Use an alias to name the result.

%%sql

SELECT Region,
    Sub_region,
    COUNT(DISTINCT(Country_name)) AS Number_of_countries
FROM united_nations.Access_to_Basic_Services 
GROUP BY Region, Sub_region;

 * mysql+pymysql://root:***@localhost:3306/united_nations
18 rows affected.

3. What is the total GDP for each region and sub_region?
Determine the total GDP for each region and sub-region by using the SUM function to add all GDP values for each region and sub_region. Use an alias to name the result.

%%sql

SELECT Region,
    Sub_region,
    SUM(EST_gdp_in_billions) AS EST_total_gdp_in_billions
FROM united_nations.Access_to_Basic_Services 
GROUP BY Region, Sub_region;

* mysql+pymysql://root:***@localhost:3306/united_nations
18 rows affected.


Summary
We can also combine all of our queries into a single query to have a single return that includes all of the values.

%%sql

SELECT Region,
    Sub_region,
    MIN(Pct_managed_drinking_water_services) AS min_Pct_managed_drinking_water_services, 
    MAX(Pct_managed_drinking_water_services) AS max_Pct_managed_drinking_water_services, 
    AVG(Pct_managed_drinking_water_services) AS avg_Pct_managed_drinking_water_services,
    COUNT(DISTINCT(Country_name)) AS Number_of_countries,
    SUM(EST_gdp_in_billions) AS EST_total_gdp_in_billions
FROM united_nations.Access_to_Basic_Services 
GROUP BY Region, Sub_region;

 * mysql+pymysql://root:***@localhost:3306/united_nations
18 rows affected.
