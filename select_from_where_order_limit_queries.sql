SELECT,FROM, WHERE,ORDER,LIMIT
Learning objectives
In this train, we will learn:

How to use SELECT and SELECT DISTINCT to select columns.
How to use WHERE to filter data based on a condition.
Save results sets as new tables.

Exercise

Suppose we want to find out which country had the lowest percentage of people with access to managed drinking water services in 2020.

Exploring the database
Use the SELECT statement to display all the columns from the Access_to_Basic_Services table. This will help us get a feel for the data we're working with.
 
%%sql
select Pct_managed_drinking_water_services
from access_to_basic_services

LIMIT 100; 

* mysql+pymysql://root:***@localhost:3306/united_nations
100 rows affected.

The previous query may return a large number of rows, which could slow down our system. Modify the query to limit the number of rows returned to 10.

%%sql
select Pct_managed_drinking_water_services
from access_to_basic_services
limit 10;

* mysql+pymysql://root:***@localhost:3306/united_nations
10 rows affected.


2. Unique country names
Extract a list of unique country names in the database.

%%sql
select distinct 
country_name 

from united_nations.access_to_basic_services 
limit 20;

* mysql+pymysql://root:***@localhost:3306/united_nations
20 rows affected.

Create a new table called Country_list and save the unique country names into this table.

%%sql
create table country_list(country varchar(255));
insert into country_list(country)
select distinct
country_name
from united_nations.access_to_basic_services;

 * mysql+pymysql://root:***@localhost:3306/united_nations
0 rows affected.
182 rows affected.

3. Selecting specific fields
Select the country_name, time_period, and pct_managed_drinking_water_services fields from the Access_to_Basic_Services table.

%%sql
select country_name, time_period, pct_managed_drinking_water_services
from united_nations.access_to_basic_services

LIMIT 20;

* mysql+pymysql://root:***@localhost:3306/united_nations
20 rows affected.

Rename the pct_managed_drinking_water_services field to pct_access_to_water in your query results.

%%sql
select country_name, 
time_period,
pct_managed_drinking_water_services as pct_access_to_water
from united_nations.access_to_basic_services 

LIMIT 20;

* mysql+pymysql://root:***@localhost:3306/united_nations
20 rows affected.

4.Filtering and sorting data
Modify your query to only display data for the year 2020.

%%sql
select country_name, 
time_period,
pct_managed_drinking_water_services as pct_access_to_water
from united_nations.access_to_basic_services 
where time_period="2020"



LIMIT 20;

The previous query may return a large number of rows, which could slow down our system. Modify the query to limit the number of rows returned to 10.

%%sql

select country_name, 
time_period,
pct_managed_drinking_water_services as pct_access_to_water
from united_nations.access_to_basic_services 
where time_period="2020"
order by pct_access_to_water
LIMIT 10;

* mysql+pymysql://root:***@localhost:3306/united_nations
10 rows affected.
c
