/*

SQL QUERY

ORDER OF QUERY
 |

SELECT
DISTINCT
TOP
FROM
WHERE
GROUP BY
HAVING
ORDER BY
	+++++++++++++++++++++
EXECUTION ORDER
|

FROM
WHERE
GROUP BY
HAVING
SELECT 
DISTINT
ORDER BY
TOP


--SELECT *
--FROM orders

--select few column from table
SELECT 
first_name,
country,
score
FROM customers*/

--Where clause uses : filter your data based on condition
/*SELECT *
FROM customers
--Where score>500
--WHERE score !=0
Where country = 'Germany' -- for character use ''


--Order By " Sort your data ASC(default) , DESC
SELECT *
FROM customers
--ORDER BY score ASC
ORDER BY score DESC

--Nested Order By - Sort your data
SELECT *
FROM customers
ORDER BY country ASC,
score DESC

-- Retieve the all customers and sort the results by the country and then by the highest score
SELECT *
FROM customers
Order by country Asc,score DESC

-- group by- Aggregate you data -combine rows with the same value
-- Aggregate the column by other column
-- total score of each country
SELECT country,
--SUM(score) -- no name for this as this is result of manopulation so we use AS(ALIAS) to assign name to column
SUM(score) AS total_score
FROM customers
GROUP BY country -- select ..... must be mention in group by .... like here country 
-- the result of group by determined by thr unique values of the grouped column
 
-- find total score and total number of customers for each country
SELECT country,
SUM(score) AS total_acore,
COUNT(id) AS total_customers
FROM customers
GROUP BY country


--HAVING - filter Aggregated data - can be used only after group by
SELECT country,
SUM(score) AS total_score,
COUNT(id) AS cust_total
FROM customers
GROUP BY country
HAVING SUM(score)> 800

-- filter before aggregation  --- use WHERE otherwise use HAVING 

-- FIND the avg score of each country considering only customers with a score not equal to 0 and return only those country with avg > 430
SELECT country,
AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score)> 430

--DISTINCT - remove Duplicates - to print unique list - dont use unnecessary it slow down the query
--SELECT DISTINCT country
--FROM customers



-- TOP - limit your data- restrict the number of rows returned
-- top three customers
SELECT TOP 3 *
FROM customers

-- retieve the top 3 customers with the highest scores
SELECT TOP 3*
FROM customers
ORDER BY score DESC

--Retrieve the lowest 2 customers based on the score
SELECT TOP 2*
FROM customers
ORDER BY score ASC

-- GET two most recent order
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC*/












