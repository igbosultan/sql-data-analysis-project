Using value-based window functions
In this notebook, we will explore the use of value-based window functions to access values from the previous row and use these values to calculate the rate of change between consecutive rows.

⚠️ This notebook will not run on Google Colab because it cannot connect to a local database. Please make sure that this notebook is running on the same local machine as your MySQL Workbench installation and MySQL united_nations database.

Learning objectives
In this train, we will learn:

How to use the LAG() value-based window function to extract particular column values from the previous row.
How the results from LAG() can be used to perform analysis such as calculating the rate of change between consecutive values.
Overview
Say we want to investigate how the percentage of managed drinking water changes from one year to the next in every country. We can add a new column with the previous year's percentage of managed drinking water using the LAG() function. This is a value-based window function that extracts the value of a specific column from a previous row.

Connecting to our MySQL database
We will use our Access_to_Basic_Services table in our united_nations database we created in MySQL Workbench. We can apply the same queries we used in MySQL Workbench in this notebook if we connect to our MySQL server by running the cells below.

# Load and activate the SQL extension to allow us to execute SQL in a Jupyter notebook. 
# If you get an error here, make sure that mysql and pymysql are installed correctly. 

%load_ext sql
# Establish a connection to the local database using the '%sql' magic command.
# Replace 'password' with our connection password and `db_name` with our database name. 
# If you get an error here, please make sure the database name or password is correct.


Let us enter the following base query which selects the three columns we will be using from our Access_to_Basic_Services table: Country_name, Time_period, and Pct_managed_drinking_water_services.

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services
FROM
    united_nations.Access_to_Basic_Services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.


1. Add a new column with the previous year's percentage of managed drinking water.
Add the line with the LAG() function to the base query above to extract the previous year's percentage of managed drinking water within each country. Store the results in a new column.

Selection deleted

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    LAG(Pct_managed_drinking_water_services) OVER( PARTITION BY Country_name 
    ORDER BY Time_period ASC) AS Prev_year_pct_managed_drinking_water_services
FROM 
    united_nations.Access_to_Basic_Services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.


2. Determine the Annual Rate of Change between consecutive years.
Adding on to the query above, let us go further and determine the Annual Rate of Change between consecutive years found by calculating the difference between a measurement and its lag.

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    LAG(Pct_managed_drinking_water_services) OVER( PARTITION BY Country_name 
    ORDER BY Time_period ASC) AS Prev_year_pct_managed_drinking_water_services,
    Pct_managed_drinking_water_services - LAG(Pct_managed_drinking_water_services) OVER( PARTITION BY Country_name 
    ORDER BY Time_period ASC) AS ARC_pct_managed_drinking_water_services
FROM 
    united_nations.Access_to_Basic_Services
LIMIT 80;

 * mysql+pymysql://root:***@localhost:3306/united_nations
80 rows affected.

Summary
Further analysis can now be done to understand the factors influencing the change in the water access percentages over time.

