Aggregation using window functions
⚠️ This notebook will not run on Google Colab because it cannot connect to a local database. Please make sure that this notebook is running on the same local machine as your MySQL Workbench installation and MySQL united_nations database.

Learning objectives
Understand the concept of window functions in SQL.
Learn how to use window functions for data aggregation.
Understand how to use window functions to partition data.
Practise using window functions to solve complex problems.
Overview
In this notebook, we will explore how to use window functions in SQL to solve complex problems. Window functions are a type of function in SQL that performs a calculation across a set of table rows that are related to the current row.

We will use the united_nations.Access_to_Basic_Services table, which contains information about different countries, their GDP, and access to basic services.

Let's begin by calculating each country's land cover as a percentage per subregion for the year 2020.

Connecting to our MySQL database
Since we have a MySQL database, we can connect to it using mysql and pymysql.

Exercise
Task 1: Select the data required for the analysis
The columns you select should include:

Sub_region
Country_name
Land_area
Filter out the results using the following criteria:

For the Time_period of 2020.
For Land_area values that are not missing.


%%sql
select
Sub_region,Country_name,Land_area

from united_nations.access_to_basic_services 
where time_period = 2020
and 
land_area is not null;


* mysql+pymysql://root:***@localhost:3306/united_nations
130 rows affected.

Task 2: Calculate the land area covered as a percentage of the country's subregion
Calculate each land area as a percentage within its sub_region:

Divide the Land_area by the SUM() BY the areas OVER each Sub_region's PARTITION. Name this column pct_sub_region_land_area.
Round the calculation off to 4 decimal places.

%%sql
select
land_area, 
sub_region, 
country_name,
round((land_area/ sum(land_area) over(partition by sub_region)) *100, 4) as pct_sub_region_land_area
from united_nations.access_to_basic_services
where Time_period = 2020
and land_area is not null;

 * mysql+pymysql://root:***@localhost:3306/united_nations
130 rows affected.


Task 3: Calculate The running population average for each country's subregion
Start by selecting the columns needed for this analysis:

Sub_region
Country_name
Time_period
Pct_managed_drinking_water_services
Pct_managed_sanitation_services
Est_gdp_in_billions
Est_population_in_millions
Calculate the running average:

Calculate the AVG() of the Est_population_in_millions.
PARTITION the calculation OVER each country's Sub_region, and name this column Running_average_population.
ROUND the calculation off to 4 decimal places.
Filter the results WHERE there are values of Est_gdp_in_billions that are NOT NULL.


%%sql
select
Sub_region,
Country_name,
Time_period,
Pct_managed_drinking_water_services,
Pct_managed_sanitation_services,
Est_gdp_in_billions,
Est_population_in_millions,

round(avg (Est_population_in_millions) over (partition by sub_region),4) as Running_average_population
       from 
united_nations.access_to_basic_services

      where 
Est_gdp_in_billions is not null;

* mysql+pymysql://root:***@localhost:3306/united_nations
800 rows affected.



