-- How to join Multiple table 
-- using Sales db , Retrieve a list of orders along with the rated customers , product and employee details for each order , display
-- order id , customer name , product name , sales amount , product price , sales person name

--SELECT * 
--FROM Sales.Orders

-- SET = set operations in sql combine the results of multiple queries into a single result
-- Union , Union All , Except , Intersect
--RULE 1 : SET operator can be used almost in all clauses(WHERE|JOIN|GROUP BY|HAVING) , ORDER BY is allowed only once at the end of query
--RULE 2 : the number of column in each query must be the same

SELECT 

FirstName, -- CustomersID not work here mismatch
LastName
FROM 
Sales.Customers

UNION

SELECT 
FirstName,
LastName --- change order will cause error
FROM 
Sales.Employees

--RULE 3 : Data types of columns in each query must be compatible
--RULE 4 : THE order of the columns in each query must be the same
--RULE 5 : THE column names in the result set are determined by the column names specified in the first query
--RULE 6 : Even if all rules are met and sql show no errors, the result may be incorrect , Incorrect column selection leads to inaccurate results
