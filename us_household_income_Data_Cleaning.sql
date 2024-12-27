#We begin by data cleaning
Select *
FROM us_household_income;

Select *
FROM US_project.us_household_income_statistics;

SELECT COUNT(id)
FROM us_household_income;

Select COUNT(id)
FROM US_project.us_household_income_statistics;

#First lets find all the duplicates if there are any
SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) >1 ;

#Now we are needing to assign them row numbers so that they are Identifiable so that we can delete them
SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id Order BY id) AS row_num
FROM us_household_income
) AS duplicates
WHERE row_num > 1
;


#Rememeber before deleting them to make sure that you inport a back up tbale. 
DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM(
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id Order BY id) AS row_num
FROM us_household_income
) AS duplicates
WHERE row_num > 1)
;

#check if duplicates are deleted
SELECT *
FROM(
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id Order BY id) AS row_num
FROM us_household_income
) AS duplicates
WHERE row_num > 1
;

#Now lets do this for the statistics table which actualy returns 0 rows therefore there are no duplicates delete
SELECT id, COUNT(id)
FROM us_household_income_statistics
GROUP BY id
HAVING COUNT(id) >1 ;


# My SQL seems to fix some of the spelling mistakes with capitalisation and so it isnt a good thing so we need make sure alabama is changed to Alabama. Also to fix the name georia to Georgia
Select *
FROM us_household_income;

Select State_Name, Count(state_name)
FROM us_household_income
GROUP BY State_Name;

SELECT DISTINCT(State_name)
FROM us_household_income
ORDER BY 1; 

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_name = 'georia';

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_name = 'alabama';


#lets just check the state abbreviations if they are correct and it does look okay
SELECT DISTINCT(State_ab)
FROM us_household_income
ORDER BY 1; 

#It has been noticed that there are missing values in place so we need to fix that too
SELECT * 
FROM us_household_income
WHERE Place = ''
ORDER BY 1; 

#Only one shows up
SELECT * 
FROM us_household_income
WHERE County = 'Autauga County'
ORDER BY 1; 

#Here we are updating the empty place with a value as wecan precdict from the data as to what is. However, we dont want to change all rows where the county is 'Autaugaville' instead just the row where the plce is empty so we use AND to single out the row needing to be changed. 
UPDATE us_household_income 
SET PLACE = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'; 

#Check that the blanks have been filled out
SELECT * 
from us_household_income 
WHERE  City = 'Vinemont'; 


#Lets check the Type column
SELECT Type, COUNT(Type)
FROM us_household_income 
GROUP BY type;

#Boroughs fields need to be changed to Borough
UPDATE us_household_income
SET Type =  'Borough'
WHERE Type =  'Boroughs'
;


#Lets look at the table and data again
Select *
FROM us_household_income;

SELECT ALand, AWater
FROM us_household_income
WHERE (AWater = 0 OR AWater ='' OR AWater IS NULL)
AND (ALand = 0 OR ALand= '' OR ALand IS NULL)
;

#Lets make sure that there are no land with 0 land area as that will be wrong. However it is possible for land no to have water area. 
SELECT ALand, AWater
FROM us_household_income
WHERE (ALand = 0 OR ALand= '' OR ALand IS NULL)
;




