Transform columns using numeric functions
In this notebook, we demonstrate how to use numeric functions to transform columns in a table in SQL.

⚠️ This notebook will not run on Google Colab because it cannot connect to a local database. Please make sure that this notebook is running on the same local machine as your MySQL Workbench installation and MySQL united_nations database.

Learning objectives
By the end of this train, you should:

Understand how to use SQRT, LOG, and ROUND functions to transform columns in a table in SQL.
Connecting to our MySQL database
Continuing with the numerical analysis of our Access_to_Basic_Services table, we are trying to get an understanding of the scope of our dataset, more specifically, the numerical columns. We can apply the same queries in MySQL Workbench and in this notebook if we connect to our MySQL server. Since we have a MySQL database, we can connect to it using mysql and pymysql.
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

What is the GDP per year for each country?
What are the rounded-off values of the Est_gdp_in_billions column?
What is the logarithm of GDP for each country over the time period?
What is the square root of GDP for each country over the time period?
1. What is the GDP per year for each country?
Calculate the GDP per year for each country using the Country_name, Time_period, and Est_gdp_in_billions columns.

%%sql
SELECT
Country_name, Time_period, Est_gdp_in_billions columns

    FROM united_nations.access_to_basic_services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.

2. What are the rounded-off values of the Est_gdp_in_billions column?
When looking at many billion-dollar figures, the decimal places can be a little distracting. We can round off the numbers in the Est_gdp_in_billions column to make them more manageable.

Using the same query executed above, round off the values in the Est_gdp_in_billions column using the ROUND function.


%%sql

SELECT
Country_name, 
Time_period, 
round(Est_gdp_in_billions) as rounded_Est_gdp_in_billions 

    FROM united_nations.access_to_basic_services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.


3. What is the logarithm of GDP for each country over the time period?
In order to calculate the growth rate of GDP over the time period, we can use the logarithm of GDP. This is because using the logarithm allows for easier comparison and analysis of growth rates with more digestible representations of larger numbers. Logarithmic transformations capture proportional changes rather than absolute changes, which is often more meaningful when analysing economic growth rates.

Calculate the logarithmic of the Est_gdp_in_billions column using the LOG function.



%%sql

Select Country_name, 
    Time_period, 
    LOG(Est_gdp_in_billions) AS Log_est_gdp_in_billions
FROM Access_to_Basic_Services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.

4. What is the square root of GDP for each country over the time period?
Alternatively, to get a similar effect, we could use the SQRT function to calculate the square roots of the values in the Est_gdp_in_billions column in order to get a smaller representation of these values.

Calculate the square root of the Est_gdp_in_billions column using the SQRT function.

%sql

Select Country_name, 
    Time_period, 
    SQRT(Est_gdp_in_billions) AS SQRT_est_gdp_in_billions
FROM Access_to_Basic_Services;

* mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.

Summary
We can also combine all of our queries into a single query to have a single return that includes all of the values.

%%sql

Select Country_name, 
    Time_period, 
    ROUND(Est_gdp_in_billions),
    LOG(Est_gdp_in_billions) AS Log_est_gdp_in_billions,
    SQRT(Est_gdp_in_billions) AS SQRT_est_gdp_in_billions
FROM Access_to_Basic_Services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
1048 rows affected.
