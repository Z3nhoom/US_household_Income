#Exploratory data analysis
Select *
FROM us_household_income;

Select *
FROM US_project.us_household_income_statistics;

#Which states have the largest area of land and water. and we see the largest land is unsuprisingly Texas and alaska. the largest area of water we see is in Alaska, Michigan and texas too. 
Select State_Name, SUM(Aland), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC;

Select State_Name, SUM(Aland), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC;

#Lets look at the top 10 by land area and water area.
Select State_Name, SUM(Aland), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
Limit 10;

Select State_Name, SUM(Aland), SUM(Awater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
Limit 10; 

#We should now tie the two tables together and explroe that data. We also get rid of the mean as in the US some states do not report back to the higher government.
SELECT * 
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
 ON u.id = us.id
 WHERE Mean <> 0 ; 
 
 
 #Lets have a look a lok and more of the columns. We are looking at the states with the lowest household income. 
 SELECT u.State_name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
 ON u.id = us.id
 WHERE Mean <> 0 
 GROUP BY u.State_name
 ORDER BY 2
 LIMIT 5; 
 
 #Now lets look at the highest household incomes by State. district of columbia, Connecticut and New jersey are show to have the highest. 
  SELECT u.State_name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
 ON u.id = us.id
 WHERE Mean <> 0 
 GROUP BY u.State_name
 ORDER BY 2 DESC
 LIMIT 10; 
 
 
 #Now we are looking at the type of land which have the highest average household income, but we need to do account to really see how viable the data is. Municipality has a very high average mean household income but only one data set is presented for it. If your living urban or community then you can see there is a dramatically lowered household income.
  SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
 ON u.id = us.id
 WHERE Mean <> 0 
 GROUP BY Type 
 ORDER BY 3
 LIMIT 20;
 
 #No we are looking at the median instead. We also consider outliers and hence use having count > 100 as very little data is almost useless
   SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u 
INNER JOIN US_project.us_household_income_statistics us 
 ON u.id = us.id
 WHERE Mean <> 0 
 GROUP BY Type 
 HAVING COUNT(Type) > 100
 ORDER BY 4
 LIMIT 20;
 
 
 #We now want to look at the house hold income related to state name and importantly the the city as well. Interestingly it seems that it is capped at 300,000 as that seems to be the upper limit which may an a data quality issue? The cities which make the most income are Delta Junction in alaska, Short hilld in Newjersey and Narberth Pennsylvania. 
 SELECT u.State_Name, City, ROUND( AVG(mean),1)
 FROM us_household_income u
 JOIN us_household_income_statistics us
    ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND( AVG(mean),1) DESC
LIMIT 20;
    