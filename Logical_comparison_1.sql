Objectives
Understand the concept of logic and comparison operators in SQL.
Learn how to use the WHERE clause to filter data based on specific conditions.
Understand the use of IN, BETWEEN, and other SQL operators to streamline queries

In this notebook, we will explore the use of logic and comparison operators in SQL to filter and extract specific data from a dataset. These operators are essential tools in SQL that allow us to narrow down our data based on certain conditions.

We will be working with the united_nations.Access_to_Basic_Services table, which contains information about different countries, their GDP, access to basic services, and more.


Connecting to our MySQL database
Since we have a MySQL database, we can connect to it using mysql and pymysql.

Exercise
Task 1: Basic Filtering with Comparison Operators
You will be working with the united_nations.Access_to_Basic_Services table. The columns to SELECT include

Country_name
Time_period
Pct_managed_drinking_water_services
Pct_managed_sanitation_services
Est_population_in_millions
and Est_gdp_in_billions
Use the WHERE clause to filter out records of specific countries:

Nigeria,
Ethiopia,
Congo,
Egypt,
Tanzania,
Kenya,
and South Africa
for the time period between 2019 and 2020. Utilize the OR operator to include multiple countries in your filter.

%%sql
select
Country_name,
Time_period,
Pct_managed_drinking_water_services,
Pct_managed_sanitation_services,
Est_population_in_millions,Est_gdp_in_billions

from united_nations.access_to_basic_services
where (country_name ="Nigeria"
       or country_name = "Ethipia"
        or country_name = "Congo"
        or country_name = "Egpyt"
        or country_name = " Tanzania"
        or country_name = "Kenya"
        or country_name = "South Africa")
       and time_period between 2019 and 2020;

* mysql+pymysql://root:***@localhost:3306/united_nations
8 rows affected.

Task 2: Streamlining with the IN Operator
Building on the first task, you might have noticed that using multiple OR operators can make the query lengthy and a bit complicated. The 'IN' operator offers a more efficient way to achieve the same result. The IN operator allows you to specify multiple values in a WHERE clause, making the query more concise. Try to retrieve data for the same list of countries for the same time range, but this time, use the IN operator to simplify your query.

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
Country_name IN (
        'Nigeria', 
        'Ethiopia' , 
        'Congo', 
        'Egypt', 
        'Tanzania', 
        'Kenya', 
        'South Africa'
 )
AND Time_period BETWEEN 2019 AND 2020;


* mysql+pymysql://root:***@localhost:3306/united_nations
12 rows affected.



Task 3: Combining Multiple Conditions
The <= operator is a comparison operator that checks if the value on the left is less than or equal to the value on the right. In this task, you'll use it to filter countries based on specific service percentages. You'll continue working with the united_nations.Access_to_Basic_Services table. The columns to be selected for this task are

Region,
Country_name,
Time_period,
Pct_managed_drinking_water_services,
Pct_managed_sanitation_services,
Est_population_in_millions, and
Est_gdp_in_billions.
Your goal is to extract data for the year 2020, focusing on countries where less than or equal to 50% of the population has access to sanitation services. This will help identify countries with critical sanitation needs. By using the <= operator with the Pct_managed_sanitation_services column, you can filter out countries that exceed this threshold, leaving only those with the most pressing sanitation challenges.

%%sql
select 
Region,
Country_name,
Time_period,
Pct_managed_drinking_water_services,
Pct_managed_sanitation_services,
Est_population_in_millions,
Est_gdp_in_billions

from united_nations.Access_to_Basic_Services
where Pct_managed_sanitation_services <= 50
and time_period = "2020";

 * mysql+pymysql://root:***@localhost:3306/united_nations
41 rows affected.