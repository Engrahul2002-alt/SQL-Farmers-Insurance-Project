create database if not exists ndap;
use ndap;
select * from farmers_insurance;



-- ----------------------------------------------------------------------------------------------
-- SECTION 1. 
-- SELECT Queries [5 Marks]

-- 	Q1.	Retrieve the names of all states (srcStateName) from the dataset.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT DISTINCT(srcStateName)
FROM farmers_insurance;
-- <write your answers in the empty spaces given, the length of solution queries (and the solution writing space) can vary>


###

-- 	Q2.	Retrieve the total number of farmers covered (TotalFarmersCovered) 
-- 		and the sum insured (SumInsured) for each state (srcStateName), ordered by TotalFarmersCovered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcStateName,
SUM(TotalFarmersCovered) AS Total_farmers_covered,
SUM(SumInsured) AS Total_sum_insured
FROM farmers_insurance
GROUP BY srcStateName
ORDER BY Total_farmers_covered DESC;


-- ###

-- --------------------------------------------------------------------------------------
-- SECTION 2. 
-- Filtering Data (WHERE) [15 Marks]

-- 	Q3.	Retrieve all records where Year is '2020'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT *
FROM farmers_insurance
WHERE srcYear = 2020;


-- ###

-- 	Q4.	Retrieve all rows where the TotalPopulationRural is greater than 1 million and the srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT *
FROM farmers_insurance
WHERE totalpopulation > 1000000
AND srcStateName = 'HIMACHAL PRADESH';


-- ###

-- 	Q5.	Retrieve the srcStateName, srcDistrictName, and the sum of FarmersPremiumAmount for each district in the year 2018, 
-- 		and display the results ordered by FarmersPremiumAmount in ascending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcStateName,
srcDistrictName,
SUM(FarmersPremiumAmount) AS Total_premium_amount
FROM farmers_insurance
WHERE srcYear = 2018
GROUP BY srcStateName, srcDistrictName
ORDER BY Total_premium_amount ASC;


-- ###

-- 	Q6.	Retrieve the total number of farmers covered (TotalFarmersCovered) and the sum of premiums (GrossPremiumAmountToBePaid) for each state (srcStateName) 
-- 		where the insured land area (InsuredLandArea) is greater than 5.0 and the Year is 2018.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcStateName,
SUM(TotalFarmersCovered) AS Total_Farmers_Covered,
SUM(GrossPremiumAmountToBePaid) AS Total_Gross_Premium
FROM farmers_insurance
WHERE InsuredLandArea > 5
AND srcYear = 2018
GROUP BY srcStateName;


	  
-- ###
-- ------------------------------------------------------------------------------------------------

-- SECTION 3.
-- Aggregation (GROUP BY) [10 marks]

-- 	Q7. 	Calculate the average insured land area (InsuredLandArea) for each year (srcYear).
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcYear,
AVG(InsuredLandArea) AS Average_Insured_Land_Area
FROM farmers_insurance
GROUP BY srcYear;



-- ###

-- 	Q8. 	Calculate the total number of farmers covered (TotalFarmersCovered) for each district (srcDistrictName) where Insurance units is greater than 0.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcDistrictName,
SUM(TotalFarmersCovered) AS Total_Farmers_Covered
FROM farmers_insurance
WHERE `Insurance units` > 0
GROUP BY srcDistrictName;



-- ###

-- 	Q9.	For each state (srcStateName), calculate the total premium amounts (FarmersPremiumAmount, StatePremiumAmount, GOVPremiumAmount) 
-- 		and the total number of farmers covered (TotalFarmersCovered). Only include records where the sum insured (SumInsured) is greater than 500,000 (remember to check for scaling).
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select
srcStateName, 
sum(FarmersPremiumAmount) as total_premium_amount,
sum(StatePremiumAmount) as total_state_pre_amount,
sum(GOVPremiumAmount) as total_gov_pre_amount,
SUM(TotalFarmersCovered) AS Total_Farmers_Covered
from farmers_insurance
where SumInsured > 500000
group by srcStateName;

-- No records satisfy the condition SumInsured > 500000
-- ###

-- -------------------------------------------------------------------------------------------------
-- SECTION 4.
-- Sorting Data (ORDER BY) [10 Marks]

-- 	Q10.	Retrieve the top 5 districts (srcDistrictName) with the highest TotalPopulation in the year 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select
srcDistrictName,
totalPopulation
from farmers_insurance
where srcYear = 2020
order by srcDistrictName desc
limit 5;



-- ###

-- 	Q11.	Retrieve the srcStateName, srcDistrictName, and SumInsured for the 10 districts with the lowest non-zero FarmersPremiumAmount, 
-- 		ordered by insured sum and then the FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select
srcStateName,
srcDistrictName,
sumInsured 
from farmers_insurance
where FarmersPremiumAmount > 0
order by sumInsured asc, FarmersPremiumAmount asc
limit 10;

###

-- 	Q12. 	Retrieve the top 3 states (srcStateName) along with the year (srcYear) where the ratio of insured farmers (TotalFarmersCovered) to the total population (TotalPopulation) is highest. 
-- 		Sort the results by the ratio in descending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcStateName,
srcYear,
(TotalFarmersCovered / TotalPopulation) as Farmers_population_ratio
from farmers_insurance
where totalPopulation > 0
order by farmers_population_ratio desc
limit 3;

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 5.
-- String Functions [6 Marks]

-- 	Q13. 	Create StateShortName by retrieving the first 3 characters of the srcStateName for each unique state.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select distinct(srcStateName),
left(srcStateName,3)as first_thre_characters
from farmers_insurance;



-- ###

-- 	Q14. 	Retrieve the srcDistrictName where the district name starts with 'B'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcDistrictName
from farmers_insurance
where srcDistrictName like 'B%';

-- ###

-- 	Q15. 	Retrieve the srcStateName and srcDistrictName where the district name contains the word 'pur' at the end.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcStateName,
srcDistrictName
from farmers_insurance
where srcDistrictName like '%pur';


-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 6.
-- Joins [14 Marks]

-- 	Q16. 	Perform an INNER JOIN between the srcStateName and srcDistrictName columns to retrieve the aggregated FarmersPremiumAmount for districts where the district’s Insurance units for an individual year are greater than 10.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcStateName,
srcDistrictName,
sum(FarmersPremiumAmount) as total_premium_amount
from farmers_insurance
where `Insurance units`> 10
group by srcStateName, srcDistrictName;



-- ###

-- 	Q17.	Write a query that retrieves srcStateName, srcDistrictName, Year, TotalPopulation for each district and the the highest recorded FarmersPremiumAmount for that district over all available years
-- 		Return only those districts where the highest FarmersPremiumAmount exceeds 20 crores.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcStateName,
srcDistrictName,
srcYear,
TotalPopulation,
max(FarmersPremiumAmount) as highest_farmers_premium 
from farmers_insurance
group by srcStateName ,srcDistrictName,srcYear,TotalPopulation
having highest_farmers_premium > 200000000;
-- no disrticts satisfy the condition because the maxium FarmersPremiumAmount in the dataset is 7244.22


-- ###

-- 	Q18.	Perform a LEFT JOIN to combine the total population statistics with the farmers’ data (TotalFarmersCovered, SumInsured) for each district and state. 
-- 		Return the total premium amount (FarmersPremiumAmount) and the average population count for each district aggregated over the years, where the total FarmersPremiumAmount is greater than 100 crores.
-- 		Sort the results by total farmers' premium amount, highest first.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select A.srcStateName,
A.srcDistrictName,
SUM(B.TotalFarmersCovered) AS Total_Farmers_Covered,
SUM(B.SumInsured) AS Total_Sum_Insured,
SUM(B.FarmersPremiumAmount) AS Total_Farmers_Premium,
AVG(A.TotalPopulation) AS Average_Population
from farmers_insurance A
left join farmers_insurance B
ON A.srcStateName = B.srcStateName
AND A.srcDistrictName = B.srcDistrictName
GROUP BY A.srcStateName, A.srcDistrictName
HAVING SUM(B.FarmersPremiumAmount) > 1000000000
ORDER BY Total_Farmers_Premium DESC;




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 7.
-- Subqueries [10 Marks]

-- 	Q19.	Write a query to find the districts (srcDistrictName) where the TotalFarmersCovered is greater than the average TotalFarmersCovered across all records.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcStateName,
TotalFarmersCovered
from farmers_insurance
where TotalFarmersCovered >
(
select avg(TotalFarmersCovered)
from farmers_insurance
);


-- ###

-- 	Q20.	Write a query to find the srcStateName where the SumInsured is higher than the SumInsured of the district with the highest FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcStateName,
SumInsured
from farmers_insurance
where Suminsured >
(
Select sumInsured
from farmers_insurance
order by FarmersPremiumAmount desc
limit 1);
-- No rows returned because the highest FarmersPremiumAmount record also has the maximum SumInsured value.



-- ###

-- 	Q21.	Write a query to find the srcDistrictName where the FarmersPremiumAmount is higher than the average FarmersPremiumAmount of the state that has the highest TotalPopulation.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
select srcDistrictName,
FarmersPremiumAmount
from farmers_insurance
where FarmersPremiumAmount >
(select 
avg(FarmersPremiumAmount)
from farmers_insurance
where srcStateName =
(select srcStateName
from farmers_insurance
order by TotalPopulation desc
limit 1
)
);


-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 8.
-- Data Integrity (Constraints, Foreign Keys) [4 Marks]

-- 	Q22.	Create a table 'districts' with DistrictCode as the primary key and columns for DistrictName and StateCode. 
-- 		Create another table 'states' with StateCode as primary key and column for StateName.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
CREATE TABLE districts
(DISTRICTCODE INT primary key ,
DISTRICTNAME VARCHAR (100),
STATECODE INT
);
CREATE TABLE IF NOT EXISTS  STATES
(STATECODE INT PRIMARY KEY,
STATENAME VARCHAR(100)
);
SHOW TABLES;
DESCRIBE districts;
DESCRIBE STATES;


-- ###

-- 	Q23.	Add a foreign key constraint to the districts table that references the StateCode column from a states table.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
ALTER TABLE districts
ADD CONSTRAINT fk_statecode
FOREIGN KEY(StateCode)
REFERENCES states(StatesCode);




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 9.
-- UPDATE and DELETE [6 Marks]

-- 	Q24.	Update the FarmersPremiumAmount to 500.0 for the record where rowID is 1.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
UPDATE farmers_insurance
SET FarmersPremiumAmount = 500.0
WHERE rowID = 1;
SELECT rowID, FarmersPremiumAmount
FROM farmers_insurance
WHERE rowID = 1;

-- ###

-- 	Q25.	Update the Year to '2021' for all records where srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
update farmers_insurance
set srcYear = 2021
where srcStateName = 'HIMACHAL PRADESH';
SELECT srcStateName, srcYear
FROM farmers_insurance
WHERE srcStateName = 'HIMACHAL PRADESH';


-- ###

-- 	Q26.	Delete all records where the TotalFarmersCovered is less than 10000 and Year is 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
DELETE FROM farmers_insurance
WHERE TotalFarmersCovered < 10000
AND srcYear = 2020;
-- No records matched the condition, so 0 rows were deleted.

-- ###