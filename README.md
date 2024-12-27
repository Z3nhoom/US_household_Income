# US_household_Income

Exploratory Data Analysis Project Summary
Project Description:
This project involved conducting exploratory data analysis (EDA) on the us_household_income and US_project.us_household_income_statistics datasets to uncover insights about household income, land, and water areas across different states and regions in the United States. The analysis included identifying states with the largest land and water areas, examining household income statistics, and exploring the relationships between different types of land and household income.

Key Skills Utilized:

SQL Data Querying: Extensively used SQL to select, join, group, and order data to derive meaningful insights.
Data Aggregation: Applied aggregate functions (SUM, AVG, ROUND, COUNT) to summarize data and calculate averages.
Data Joining: Combined multiple tables using INNER JOIN to enrich the dataset for deeper analysis.
Data Filtering: Used WHERE and HAVING clauses to filter data based on specific conditions.
Data Sorting and Limiting: Ordered data by different columns and limited the number of results for focused analysis.
Detailed Steps:

Initial Data Inspection:

Queried both datasets to understand their structure and contents.
State-wise Land and Water Area Analysis:

Identified states with the largest land and water areas using GROUP BY and ORDER BY clauses.
Listed top 10 states by land area and water area.
SQL
Select State_Name, SUM(Aland), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(Aland) DESC
Limit 10;

Select State_Name, SUM(Aland), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY SUM(Awater) DESC
Limit 10;
Combining and Exploring Data:

Joined us_household_income and US_project.us_household_income_statistics tables on the id column.
Filtered out rows where the Mean household income was zero.
SQL
SELECT * 
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
ON u.id = us.id
WHERE Mean <> 0;
State-wise Household Income Analysis:

Identified states with the lowest and highest average household income.
Calculated average Mean and Median household income for each state.
SQL
SELECT u.State_name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
ON u.id = us.id
WHERE Mean <> 0 
GROUP BY u.State_name
ORDER BY AVG(Mean)
LIMIT 5;

SELECT u.State_name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
ON u.id = us.id
WHERE Mean <> 0 
GROUP BY u.State_name
ORDER BY AVG(Mean) DESC
LIMIT 10;
Land Type and Household Income Analysis:

Analyzed average household income by land type, considering the count of each type.
Focused on land types with significant data to ensure meaningful results.
SQL
SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
ON u.id = us.id
WHERE Mean <> 0 
GROUP BY Type 
HAVING COUNT(Type) > 100
ORDER BY AVG(Median)
LIMIT 20;
City-wise Household Income Analysis:

Analyzed household income at the city level.
Identified cities with the highest average household income.
SQL
SELECT u.State_Name, City, ROUND(AVG(mean), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(mean), 1) DESC
LIMIT 20;
Outcome:
The exploratory data analysis provided insights into the distribution of household income across different states and cities, the relationship between land types and household income, and highlighted potential data quality issues. This analysis helps in making informed decisions and understanding socioeconomic patterns across the United States.
