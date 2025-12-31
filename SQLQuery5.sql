-- How to join Multiple table 
-- using Sales db , Retrieve a list of orders along with the rated customers , product and employee details for each order , display
-- order id , customer name , product name , sales amount , product price , sales person name

--SELECT * 
--FROM Sales.Orders

-- SET = set operations in sql combine the results of multiple queries into a single result
-- Union , Union All , Except , Intersect
--RULE 1 : SET operator can be used almost in all clauses(WHERE|JOIN|GROUP BY|HAVING) , ORDER BY is allowed only once at the end of query
--RULE 2 : the number of column in each query must be the same
 -- union = combine the data from employee and customers into one table
--SELECT 

--FirstName, -- CustomersID not work here mismatch
--LastName
--FROM 
--Sales.Customers

--UNION

--SELECT 
--FirstName,
--LastName --- change order will cause error
--FROM 
--Sales.Employees

--RULE 3 : Data types of columns in each query must be compatible
--RULE 4 : THE order of the columns in each query must be the same
--RULE 5 : THE column names in the result set are determined by the column names specified in the first query
--RULE 6 : Even if all rules are met and sql show no errors, the result may be incorrect , Incorrect column selection leads to inaccurate results

--Union : Return all rows from both queries
--Remove duplicate rows from the result


--UNION ALL = Return all rows from both queries, including duplicates
-- only difference is it will not remove any duplicates show all rows as it is
--UNION ALL is generally faster than UNION, use if no duplicates

--SELECT 
--FirstName, 
--LastName
--FROM 
--Sales.Customers

--UNION ALL

--SELECT 
--FirstName,
--LastName
--FROM 
--Sales.Employees

--EXCEPT(MINUS) : return all the distinct rows from the first query that are not found in the second query
-- IT is the only one where the order of queries affects the final result
-- Return the unique rows in the 1st table that are not in 2nd table
-- find the customers who are not employee at the same time or vise versa
-- order of query affect the result
--SELECT 
--FirstName, 
--LastName
--FROM 
--Sales.Customers

--EXCEPT

--SELECT 
--FirstName,
--LastName
--FROM 
--Sales.Employees


--Intersect : Returns only the rows that are common in both queries
--FIND the employee that are customers too
SELECT 
FirstName, 
LastName
FROM 
Sales.Customers

INTERSECT

SELECT 
FirstName,
LastName
FROM 
Sales.Employees

--UNION USE CASE = COMBINE INFORMATION
--1.combine information - combine similar information before analysing the data

SELECT 
*
FROM 
Sales.Orders

UNION

SELECT 
*
FROM 
Sales.OrdersArchive

--2 : DELTA DETECTION : identifying the difference or changes(delta) between two batches of data
--3: Data completeness check = Except operator can be used to comapare tables to detect discrepancies between databases
  -- DONE WITH SET