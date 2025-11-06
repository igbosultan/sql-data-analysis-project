

Connecting to our MySQL database
Using our Access_to_Basic_Services table in our united_nations database we created in MySQL Workbench, we want to answer some questions about our dataset. We can apply the same queries we used in MySQL Workbench in this notebook if we connect to our MySQL server by running the cells below.

Exercise
We will be working with the united_nations.Access_to_Basic_Services table, which contains information about different countries, their access to basic services, and their estimated GDP.

In this exercise We would like to determine if the GDP of a country, specifically in Sub-Saharan Africa has any correlation to its access to basic services

### Task 1 
Select data from the Sub-Saharan African region during the year 2020.

%%sql
 SELECT 
	Country_name,
	Time_period,
	Pct_managed_drinking_water_services,
	Pct_managed_sanitation_services,
	Est_population_in_millions,
	Est_gdp_in_billions
FROM 
	united_nations.Access_to_Basic_Services
WHERE
	region = "Sub-Saharan Africa"
AND 
    Time_period = 2020;

 * mysql+pymysql://root:***@localhost:3306/united_nations
47 rows affected.

Task 2
Sometimes there are null values in our entries. Any country having Null values for their GDP should not be included in our query as they will not help us determine if there is any correlation between GDP and access to basic services. For this task determine if there are any NULL values in the GDP column

%%sql


SELECT 
	Country_name,
	Time_period,
	Pct_managed_drinking_water_services,
	Pct_managed_sanitation_services,
	Est_gdp_in_billions,
    region
FROM 
	united_nations.Access_to_Basic_Services
WHERE
	region = 'Sub-Saharan Africa'
AND 
	Time_period = 2020
AND 
	Est_gdp_in_billions IS NULL;

* mysql+pymysql://root:***@localhost:3306/united_nations
9 rows affected.

Task 3
If there are any Null values exclude them from your query.

%%sql
SELECT 
	Country_name,
	Time_period,
	Pct_managed_drinking_water_services,
	Pct_managed_sanitation_services,
	Est_gdp_in_billions,
    	region
FROM 
	united_nations.Access_to_Basic_Services
WHERE
	region = 'Sub-Saharan Africa'
AND 
	Time_period = 2020
AND 
	Est_gdp_in_billions IS NOT NULL;

# Use LIMIT if you think the results set will be large
# Use ORDER BY Est_gdp_in_billions to order your results

* mysql+pymysql://root:***@localhost:3306/united_nations
38 rows affected.
0 rows affected.

Task 4
Lets get an idea if there's any correlation between the GDP and access to basic services for the top 5 economies in Sub-Saharan Africr. The top 5 GDP's are : ('Nigeria','South Africa','Ethiopia','Kenya','Ghana'). Make sure your query only includes these countries.

%%sql

SELECT 
	Country_name,
	Time_period,
	Pct_managed_drinking_water_services,
	Pct_managed_sanitation_services,
	Est_population_in_millions,
	Est_gdp_in_billions
FROM 
	united_nations.Access_to_Basic_Services

WHERE
	Region = "Sub-Saharan Africa"
AND 
Time_period = 2020

AND 
	Est_gdp_in_billions IS NOT NULL

AND 
	Country_name  NOT IN ('Nigeria','South Africa','Ethiopia','Kenya','Ghana');


# Use LIMIT if you think the results set will be large
# Use ORDER BY Est_gdp_in_billions to order your results

* mysql+pymysql://root:***@localhost:3306/united_nations
33 rows affected.
0 rows affected.

Based on your results. Is there any correlation between the GDP and access to basic services? Does a higher GDP translate to better services?

Task 5
We only looked at 5 countries in the previous query. Lets have a look at the rest of Sub-Saharan Africa . Exclude the countries mentioned in the previous task

%%sql

SELECT 
	Country_name,
	Time_period,
	Pct_managed_drinking_water_services,
	Pct_managed_sanitation_services,
	Est_population_in_millions,
	Est_gdp_in_billions
FROM 
	united_nations.Access_to_Basic_Services

WHERE
	Region = "Sub-Saharan Africa"
AND 
Time_period = 2020

AND 
	Est_gdp_in_billions IS NOT NULL

AND 
	Country_name   IN ('Nigeria','South Africa','Ethiopia','Kenya','Ghana');

# Use LIMIT if you think the results set will be large
# Use ORDER BY Est_gdp_in_billions to order your results by GDP
# Use ORDER BY Pct_managed_drinking_water_services to order percentage managed drinking water services
# Use ORDER BY Pct_managed_sanitation_services to order your results by percentage managed sanitation services

* mysql+pymysql://root:***@localhost:3306/united_nations
5 rows affected.
0 rows affected.


