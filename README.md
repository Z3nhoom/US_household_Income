# US_household_Income

**Data Cleaning Project Summary**

​

Project Description:


This project involved cleaning and preparing two real-world datasets, us_household_income and us_household_income_statistics to ensure data accuracy and consistency for analysis. The process included identifying and removing duplicates, correcting inconsistent data entries, and filling in missing values.

​

Key Skills Utilized:

​

SQL Data Querying: Used SQL to select, count, and group data to identify duplicates and inconsistencies.

Data Deduplication: Assigned row numbers to duplicates using ROW_NUMBER() OVER(PARTITION BY ...) for easy identification and deletion.

Data Backup: Created backup tables before performing deletion operations to ensure data safety.

Data Standardization: Corrected inconsistent state names and abbreviations using UPDATE statements.

Data Imputation: Filled missing values based on logical predictions from existing data.

Data Validation: Checked for and corrected wrong entries in the dataset, such as zero land areas.

​

​

Detailed Steps:

​

Initial Data Inspection:

Queried the datasets to inspect the data and count the total number of entries.

Identified duplicates by grouping and counting IDs.

Data Deduplication:

Assigned row numbers to duplicates for identification.

Deleted duplicates while ensuring a backup was created.

Verified the deletion of duplicates.

Data Standardization:

Corrected inconsistent state names (e.g., 'alabama' to 'Alabama', 'georia' to 'Georgia').

Checked and confirmed the correctness of state abbreviations.

Data Imputation:

Identified and filled missing values in the 'Place' column based on logical predictions.

Data Validation:

Checked and corrected the 'Type' column, changing 'Boroughs' to 'Borough'.

Validated land and water area values, ensuring no entries had zero land area.

​

Outcome:


The data cleaning process ensured that the us_household_income and US_project.us_household_income_statistics datasets were accurate, consistent, and ready for further analysis, contributing to more reliable and insightful data analysis results.



**Exploratory Data Analysis Project Summary**

​

Project Description:


This project involved conducting exploratory data analysis (EDA) on the us_household_income and us_household_income_statistics datasets to uncover insights about household income, land, and water areas across different states and regions in the United States. The analysis included identifying states with the largest land and water areas, examining household income statistics, and exploring the relationships between different types of land and household income.

​



Key Skills Utilized:

​

SQL Data Querying: Extensively used SQL to select, join, group, and order data to derive meaningful insights.

Data Aggregation: Applied aggregate functions (SUM, AVG, ROUND, COUNT) to summarize data and calculate averages.

Data Joining: Combined multiple tables using INNER JOIN to enrich the dataset for deeper analysis.

Data Filtering: Used WHERE and HAVING clauses to filter data based on specific conditions.

Data Sorting and Limiting: Ordered data by different columns and limited the number of results for focused analysis.





Detailed Steps:

​

Initial Data Inspection:

Queried both datasets to understand their structure and contents.

State-wise Land and Water Area Analysis:

Identified states with the largest land and water areas using GROUP BY and ORDER BY clauses.

Listed top 10 states by land area and water area.

​

Combining and Exploring Data:

Joined us_household_income and US_project.us_household_income_statistics tables on the id column.

Filtered out rows where the Mean household income was zero.

​

State-wise Household Income Analysis:

Identified states with the lowest and highest average household income.

Calculated average Mean and Median household income for each state.


**Insights Extracted from Exploratory Data Analysis (EDA)**

​

Largest Land and Water Areas by State:

Largest Land Area: Texas and Alaska have the largest land areas.

Largest Water Area: Alaska, Michigan, and Texas have the largest water areas.

These insights highlight the significant geographic size and water resources of these states, which can influence their economic activities and environmental policies.

​

Household Income Analysis by State:

States with Lowest Average Household Income: Identified states with the lowest average household income, providing insights into regions that may require economic support and development.

States with Highest Average Household Income: District of Columbia, Connecticut, and New Jersey have the highest average household incomes, indicating prosperous regions with potentially higher costs of living.

​

Household Income Analysis by Land Type:

High Average Household Income by Land Type: Identified specific land types, such as municipalities, with very high average household incomes, though some had limited data points.

Land Types with Significant Data: Analyzed land types with more than 100 data points to ensure meaningful insights, showing that urban areas and communities typically have lower household incomes.

​

City-wise Household Income Analysis:

Cities with the Highest Household Income: Delta Junction in Alaska, Short Hills in New Jersey, and Narberth in Pennsylvania have the highest household incomes. This could indicate affluent communities within these states.

Potential Data Quality Issue: Observations of household income capped at 300,000 suggest a potential data quality issue, which requires further investigation.

​

Summary:


The EDA provided valuable insights into the geographic and economic characteristics of states and cities in the U.S. It highlighted regions with significant land and water resources, identified economic disparities among states, and revealed patterns in household income distribution. These insights can inform policy-making, economic development initiatives, and further research into socioeconomic factors affecting different regions.

​

​

​​​​​​​​​Outcome:


The exploratory data analysis provided insights into the distribution of household income across different states and cities, the relationship between land types and household income, and highlighted potential data quality issues. This analysis helps in making informed decisions and understanding socioeconomic patterns across the United States.

