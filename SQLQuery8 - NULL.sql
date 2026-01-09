--NULL FUNCTION 
--NULL means nothing , unknown , null is not equal to anything ,
--null is not zero , null in not empty, null is not blank space 
--syntax = ISNULL(value, replacement_value)
--COALESCE() = return the first non value fromthe list
--Syntax = COALESCE(value1 , value2 ,value3...)

/*
SELECT 
CustomerID,
Score,
COALESCE (Score, 0) Score2,
--AVG(Score) OVER () AvgScores
AVG(Score) OVER () AvgScores,

AVG(COALESCE(Score , 0)) OVER() AvgScores2
From Sales.Customers
*/
--use case = handling nulls - Mathematical operations (handle the null before doing mathematical operations - 1+5 = 6 , a + b = ab , null +5 = null problem
/*--Display the full name of customers in a single field by merging their first and last names, and add 10 bonus pions to each customerss score
SELECT
CustomerID,
FirstName,
LastName,
FirstName + COALESCE(LastName, ' ' )  AS FullName,
Score,
COALESCE(Score , 0)+10 AS newScore
FROM Sales.Customers


--Handling joins
--like on a.year = b.year and isnull(a.type , '') = isnull(b.type , '')
--Sorting the data
--sort the custoemrs from lowest to highest scores with nulls appearing last
SELECT
CustomerId,
Score,
--COALESCE(Score , 0),
CASE WHEN Score IS NULL THEN 1 ELSE 0 END
FROM Sales.Customers
ORDER BY COALESCE(Score , 0)



--NULL IF
--Syntax= NULLIF(Value1 , value2)
--Preventing the error of dividing by zero
-- Find the sales price of each order by dividing the sales by the quantity
SELECT 
OrderID,
Sales, 
Sales/NULLIF(Quantity ,0)AS newSales,
Quantity
FROM Sales.Orders

--IS NULL = Returns True if the value is null , otherwise it returns False
--IS NOT NULL = Returns True if the value is not null , otherwise it returns False
--Syntax = Value IS NULL 
-- Value IS NOT NULL 

--use - searching foe missing information
--Identify the customers who have no scores
SELECT 
*
FROM Sales.Customers
WHERE Score IS NULL
--Identify the customers who have scores
SELECT 
*
FROM Sales.Customers
WHERE Score IS NOT NULL

--LEFT ANTI JOIN| RIGHT ANTI JOIN
--USE = finding the unmatched rows between two tables
-- left join + is null we can join inthis way
--que - List all details for the customers who have not placed any orders
SELECT c. *,
o.OrderID
FROM 
Sales.Customers c
LEFT JOIN Sales.Orders o
on c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
*/
--	Empty String  = String value has ZERO Character
-- ' ' String value has one or more space characters
WITH Orders AS(
SELECT 1 Id, 'A' Category UNION
SELECT 2, null UNION
SELECT 3, '' UNION
SELECT 4, '  '
)
select
*,
DATALENGTH(Category) catLen
FROM Orders

--Handling nulls Data Policies
--Set of rules that defines how data should be handled
--1. only use nulls and empty strings, but avoid blank spaces, =  use trim function 
--2. only use nulls avoi using empty string and blank spaces = nullif trim
--3.use the default value and avoid null , empty , blank = trim null if coalesce

-- using nulls can optimize storage nd performance


--DONE
 
