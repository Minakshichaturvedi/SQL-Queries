--SQL JOIN Basics
-- how to combine two table either rows or column
-- columns = JOINS(key column) (no , inner , full , left , right)(left anti join , right anti , full anti , cross join)
-- rows  =SET operators (same column)(union , union all , except, intersect)

-- when to use joins = recombine data - Big Picture, data enrichment - Extra Info, check for existance - ' filtering'  ,

-- when two table overlap - 1, matchind data , all data of one , unmatching data
-- NO JOIN
--Return data from tables without combing them
-- retrieve all data from customers and orders in two different results

SELECT * FROM customers;
SELECT * FROM orders;

-- inner join = only matching rows/data
--SELECT * FROM customers [TYPE]JOIN orders ON <CONDITION(HOW TO MATCH ROWSS??>

--Get all the customers long with their orders but only who have placed an order
/*SELECT *
FROM customers 
INNER JOIN orders
ON (customers.id = orders.customer_id)*/


-- when we dont need everything you can select instead of *
--SELECT 
--id,--IF the name is same in both the table we use column name. like customers.id
--first_name,
--order_id,
--sales
--FROM customers 
--INNER JOIN orders
--ON (customers.id = orders.customer_id)

--SELECT 
--customers.id,--IF the name is same in both the table we use column name. like customers.id
--customers.first_name,
--orders.order_id,
--orders.sales
--FROM customers 
--INNER JOIN orders
--ON (customers.id = orders.customer_id)
    --this is very lengthy and not recommended so we use alias
--SELECT 
--c.id,--IF the name is same in both the table we use column name. like customers.id
--c.first_name,
--o.order_id,
--o.sales
--FROM customers AS c -- this is better way of doing this
--INNER JOIN orders AS o
--ON (c.id = o.customer_id)

-- left join = all the row from left table and only the matching row from right other will be null
--SELECT 
--*
--FROM customers AS c -- this is better way of doing this
--LEFT JOIN orders AS o
--ON (c.id = o.customer_id)


-- Get all customers alog with their orders including those without orders

--SELECT 
--c.id,--IF the name is same in both the table we use column name. like customers.id
--c.first_name,
--o.order_id,
--o.sales
--FROM customers AS c -- this is better way of doing this
--LEFT JOIN orders AS o
--ON (c.id = o.customer_id)

--Right join = return all rows from right table and matching from left


-- Get all customers along with their orders including orders without matching customers
--SELECT 
--c.id,
--c.first_name,
--o.order_id,
--o.sales
--FROM customers AS c -- this is better way of doing this
--RIGHT JOIN orders AS o
--ON (c.id = o.customer_id)



-- using left join for the same question
--SELECT
--c.id,
--c.first_name,
--o.order_id,
--o.sales
--FROM orders AS o -- this is better way of doing this
--LEFT JOIN customers AS c
--ON (c.id = o.customer_id)



-- FULL JOIN all ROWS from both the table
-- get all cutomers and all orders , even if there no match
--SELECT
--c.id,
--c.first_name,
--o.order_id,
--o.sales
--FROM customers AS c -- this is better way of doing this
--FULL JOIN orders AS o
--ON (c.id = o.customer_id)



-- THIS IS ALL BASICS OF JOIN
-- NEXT - ADVANCE JOIN

-- Advance 

--LEFT ANTI JOIN - Return rows from left that has no match in right  
-- use where clause to remove matching data

-- que = get the customers who havenot placed any order
--SELECT
--c.id,
--c.first_name,
--o.order_id,
--o.sales
--FROM customers AS c -- this is better way of doing this
--LEFT JOIN orders AS o
--ON (c.id = o.customer_id)
--WHERE o.customer_id IS NULL

-- RIGHT ANTI JOIN
-- get all the orders without matching cutomers
--SELECT
--c.id,
--c.first_name,
--o.order_id,
--o.sales
--FROM customers AS c -- this is better way of doing this   -- switch from right to left
--RIGHT JOIN orders AS o
--ON (c.id = o.customer_id)
--where c.id IS NULL

-- FULL ANTI JOIN = only the rows that dont match in either table

-- FIND customers without orders and orders without customers
--SELECT
--*
--FROM customers AS c 
--FULL JOIN orders AS o
--ON (c.id = o.customer_id)
--where c.id IS NULL 
-- OR o.customer_id IS NULL

--Get all the customers along with their orders, but only for customers who have placed an order (without using inner join)
--SELECT * FROM customers AS c
--LEFT JOIN orders AS o
--ON (c.id = o .customer_id)
--WHERE o.customer_id IS NOT NULL

-- CROSS JOIN = combines every row form left and every row from right = ALL POSSIBLE COMBINATION - cARTESIAN JOIN
--SELECT * FROM customers
--CROSS JOIN orders











