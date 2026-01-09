--CASE STATEMENT = Evaluate a list of condition and return a value when the first condition is met
--syntax = CASE // the start of the logic
--WHEN condition 1 THEN result1
--WHEN condition 2 THEN result2 // condition to be evaluated
--WHEN condition 3 THEN result3 // result if codition is true 
--WHEN condition 4 THEN result4 // order of codition is important
--else result // default value(optional)

--END // the end of the logic
--use = categorization  of data ,data transformation
-- DATA CATEGORIZATION = Group the data into different category based on certain codition
/*
--que - Create report showing total sales for each of the following categories:
--High (Sales over 50) Medium (sales 21-50) and low (Sales 20 or less)
--sort the category from the highest sales to lowest
SELECT
OrderId,
Sales,
CASE 
WHEN Sales > 50 THEN 'HIGH'
WHEN Sales > 20 THEN 'MEDIUM'
ELSE 'LOW'
END Category
FROM Sales.Orders
*/
--SELECT
--Category,
--SUM(Sales) AS TotalSum
--FROM(
--SELECT
--OrderId,
--Sales,
--CASE 
--WHEN Sales > 50 THEN 'HIGH'
--WHEN Sales > 20 THEN 'MEDIUM'
--ELSE 'LOW'
--END Category
--FROM Sales.Orders)t
--GROUP BY Category
--Order by Totalsum DESC

--RULE = Data type of the result must be matching
-- case statement can be used anywhere in the query


-- USE = MAPPING
--Retrive employee detail with gender displayed as full text
/*
SELECT 
EmployeeID,
FirstName,
LastName,
Gender,
CASE 
WHEN Gender= 'M' THEN 'Male'
WHEN Gender= 'F' THEN 'Female'
END
AS fullGender
FROM Sales.Employees
*/

--Retrieve customer detail with abbreviated country code

SELECT
CustomerID,
FirstName,
LastName,
Country,
CASE
WHEN Country = 'Germany' THEN 'GE'
WHEN Country = 'USA' THEN 'US'
END AS abbreviation

/*
when we have same column name like in this case
CASE
WHEN Country = 'Germany' THEN 'GE'
WHEN Country = 'USA' THEN 'US'
END 
so we can write it as in differnrt manner
CASE Country
WHEN 'Germany' THEN 'GE'
WHEN 'USA' THEN 'US'
END 
*/
From Sales.Customers
--SELECT DISTINCT Country From Sales.Customers


--use  = handle nulls
--Find the avg score of customers and treat nulls as 0 
--Additionally provide details such CustomersID and LastName
SELECT
CustomerID,
FirstName,
LastName,
Score,
CASE WHEN Score is null then 0
else Score
END ,
AVG(Score) OVER() AvgCustomer
FROM Sales.Customers

-- Coditional a Aggregation
-- APPLY aggregate function only on subsets of data that fulfill certail condition
--Count how many times each customers has made an order with sales greater than 30

--SELECT
--OrderID,
--CustomerID,
--Sales,
--CASE
--WHEN Sales>30 THEN 1
--ELSE 0
--END flag
--FROM Sales.Orders
--Order by CustomerID

SELECT
CustomerID,
SUM(CASE
WHEN Sales>30 THEN 1
ELSE 0
END) flag,
COUNT(*) flag
FROM Sales.Orders
GROUP by CustomerID

--DONE