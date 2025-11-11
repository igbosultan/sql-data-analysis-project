⚠️ This notebook will not run on Google Colab because it cannot connect to a local database. Please make sure that this notebook is running on the same local machine as your MySQL Workbench installation and MySQL united_nations database.

Learning objectives
In this train, we will learn:

How to use the ROW_NUMBER() and RANK() functions to perform partition-wise ranking operations.
How the ranking results of these two functions differ from each other.
Overview
Let's say we want to quickly order the countries from worst to best in terms of levels of access to drinking water services per year.

We can use Top-N analysis which focuses on identifying and analysing the highest-ranked elements in a dataset based on a specific criterion. The criterion in our case is ‘levels of access to managed drinking water services per year.’

SQL ranking functions will be useful in this case.

Connecting to our MySQL database
We will use our Access_to_Basic_Services table in our united_nations database that we created in MySQL Workbench. We can apply the same queries we used in MySQL Workbench in this notebook if we connect to our MySQL server by running the cells below.



Exercise
Let's enter the following base query which selects the three columns we will be using from our Access_to_Basic_Services table: Country_name, Time_period, and Pct_managed_drinking_water_services.

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services
FROM
    united_nations.Access_to_Basic_Services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.


1. Order countries based on their water access levels per year.
Use the ROW_NUMBER() function to order the countries based on their water access levels per year.

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    ROW_NUMBER() OVER( PARTITION BY Time_period 
    ORDER BY Pct_managed_drinking_water_services ASC) AS Rank_of_water_services
FROM 
    united_nations.Access_to_Basic_Services;


* mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.

2. Assess the rankings for countries with the same water level access in a given year.
We expect countries with the same water level access in a given year to have the same rank since they are exactly the same value. Let us assess whether this is the case by filtering our results such that only records with 100% water level access are retrieved.

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    ROW_NUMBER() OVER( PARTITION BY Time_period 
    ORDER BY Pct_managed_drinking_water_services ASC) AS Rank_of_water_services
FROM 
    united_nations.Access_to_Basic_Services
WHERE 
    Pct_managed_drinking_water_services = 100;

 * mysql+pymysql://root:***@localhost:3306/united_nations
208 rows affected.

3. Apply the RANK function instead.
Replace the ranking function used in Exercise 1 with the RANK() function, and observe how the results differ.

%%sql

SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    RANK() OVER( PARTITION BY Time_period 
    ORDER BY Pct_managed_drinking_water_services ASC) AS Rank_of_water_services
FROM 
    united_nations.Access_to_Basic_Services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.