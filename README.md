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

​

​​​​

Outcome:


The data cleaning process ensured that the us_household_income and US_project.us_household_income_statistics datasets were accurate, consistent, and ready for further analysis, contributing to more reliable and insightful data analysis results.
