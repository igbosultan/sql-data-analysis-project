Initial data analysis with numeric functions
In this notebook, we demonstrate how to extract basic metadata about a dataset using numeric functions.

Learning objectives
By the end of this train, you should:

Understand how to perform an initial data analysis using SQL numeric functions.

Connecting to our MySQL database
Using our Access_to_Basic_Services table created in MySQL Workbench, we want to answer some questions on the range of our dataset. We can apply the same queries in MySQL Workbench and in this notebook if we connect to our MySQL server. Since we have a MySQL database, we can connect to it using mysql and pymysql.

To make a query, we add the %%sql command to the start of a cell, create one open line, and then the query like below, and run the cell.

%%sql

SELECT 
    *
FROM
    Access_to_Basic_Services
LIMIT 5;

 * mysql+pymysql://root:***@localhost:3306/united_nations
5 rows affected.


Exercise
We want to determine the following:

What is the total number of entries in the dataset?
What are the earliest and latest years for which we have data?
How many countries are included in this dataset?
What is the average percentage of people who have access to managed drinking water services across all years and all countries included in our dataset?

1. What is the total number of entries in the dataset?
Count the number of entries in the dataset using the COUNT function. Return the result with an alias.

%%sql
select 
count(*) as total_number_of_entries
from united_nations.access_to_basic_services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1 rows affected.


total_number_of_entries
1048

2. What are the earliest and latest years for which we have data?
Determine the earliest and latest years by calculating the minimum and maximum of the Time_period column using the MIN and MAX functions respectively. Use aliases to name the results.

%%sql
select 
min(Time_period) as minimum_time_period,
max(Time_period) as maximum_time_period
from united_nations.access_to_basic_services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
1 rows affected.
minimum_time_period	maximum_time_period
2015	                     2020

3. How many countries are included in this dataset?
Count the number of countries in the Country_name column. Note, if we only use the COUNT function without an additional keyword, SQL will return the total number of entries in the column, including duplicates. Use the DISTINCT keyword to only return unique country names. Return the result with an alias.

%%sql
select distinct 
count(country_name) as country_name_count

from united_nations.access_to_basic_services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1 rows affected.
country_name_count
1048

4. What is the average percentage of people who have access to managed drinking water services across all years and all countries included in our dataset?
Use the AVG function to calculate the average of the Pct_managed_drinking_water_services column. Use an alias.
%%sql

select 
avg (Pct_managed_drinking_water_services) as Pct_managed_drinking_water_service_average

from united_nations.access_to_basic_services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1 rows affected.
Pct_managed_drinking_water_service_average
87.189103
