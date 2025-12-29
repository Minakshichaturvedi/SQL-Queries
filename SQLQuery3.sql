-- This is Advance verion 
-- WHERE Operator
-- comaparion operator = = <> =! > >= < <=
-- Logical Operator = AND OR NOT 
-- Range Operator BETWEEN
--Membership Operator = IN , NOT IN
-- Search Operator = LIKE

--	COMPARISION OPERATOR = compare two things
 --conditon =  expression  operator expression  , col1 = col2, fuction = UPPER(fn) = 'john' , subquery = value
 -- = : Retrive all customers from germany
-- SELECT * FROM customers
 --WHERE country = 'Germany'

 -- for not from germany != or <> both are same
 --WHERE country <> 'Germany'

 --score greate than 500 or 500
 --WHERE score >500
 --WHERE score >=500

 --< score less than 500 OR <=
-- WHERE score <=500


--LOGICAL OPERATOR - AND OR NOT
--Retrieve all customers who are from usa and have score greater than 500
--WHERE country = 'USA' AND score >500

-- Retrieve all customers who are either from usa or score greater than 500
--WHERE country = 'USA' OR score >500

--retrieve all customers who not score 500
--WHERE NOT score < 500


-- RANGE Operator   BETWEEN
-- Retrieve all customers whose score falls in the range between 100 and 500
--WHERE score BETWEEN 100 AND 500

--MEMBERSHIP OPERATOR  = IN : CHECK if a value exist in a list , NOT IN :
-- retrieve all customers from wither germany or usa
 --WHERE country = 'Germany' OR country = 'USA' 
 --WHERE country IN ('Germany','USA')  -- USE IN instead of OR for multiple values in the same column to simplify SQL

 --Search Operator
 --Like - Seach for a Pattern in text  - M% , %m , %m%

 --Find All customers whose first name start with 'M'

--WHERE first_name LIKE 'M%'
 --WHERE first_name LIKE  '%n'
 --WHERE first_name LIKE  '%r%'
 --WHERE first_name LIKE  '___r%'

 -- DONE next will be combining data 



































