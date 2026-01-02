-- SQL FUNCTION : A built in sql code , accept an input value , processes it , return an output value
-- 1. Single row fuction eg = LOWER() LIKE String , Numeric , Date AND Time ,Null , - Data engineer - clean up , maniputation , collection of data
--2.  Multi Row fuction eg = sum() like  Aggregate , Window  - Data analyst - for analysation of present data

-- String Function 
--TYPES 1. MANIPULATION  - CONCATE , UPPER , LOWER , TRIM , REPLACE
--CALCULATION , - LEN
--STRING EXTRACTION - LEFT , RIGHT , SUBSTRING

--CONCAT - Combines multiple strings into one 
-- que - Concatenate first name and country into one column
/*
SELECT 
first_name,
country,
CONCAT(first_name,' '  ,country) AS name_country
FROM 
customers

-- UPPER - Convert all characters to uppercase
SELECT 
first_name,
country,
UPPER (first_name) AS Upper_name
FROM 
customers

-- LOWER - Convert all characters to lowercase
SELECT 
first_name,
country,
LOWER (first_name) AS Lower_name
FROM 
customers

-- Trim - Removes Leading and Trailing spaces - use in data cleaning eg - "john__"
--Find the customers whose first name conatain leading or trailing spaces
SELECT 
first_name,
LEN(first_name) AS len_name,
LEN(TRIM (first_name))AS lenTrim_name,
LEN(first_name) - LEN(TRIM (first_name)) flag
FROM 
customers
--WHERE first_name != TRIM(first_name)
*/

-- REPLACE : Replace specific character with new character
-- Remove the (-) from phone number
--SELECT '123-456-7890' phone,
--replace('123-456-7890', '-' , '') clean_phone

--Replace file extence from txt to csv
--SELECT 'report.txt' initial, 
--REPLACE('report.txt','txt','csv') final

--	CALCULATION -LEN
--LEN :count how many characters you have in one value
--calculate the length of each customers first name
--SELECT 
--first_name,
--LEN(first_name) len_first_name,
--country
--FROM 
--customers

-- STRING EXTRACTION
--LEFT = Extract specific Number of character from the start
-- Retrieve the first 2 characters of each first name
/*SELECT 
first_name,
LEFT( TRIM (first_name ), 2) first_2_char,
country
FROM 
customers

--RIGHT = Extract specific Number of character from the end
-- Retrieve the LAST 2 characters of each first name

SELECT 
first_name,
RIGHT( first_name , 2) last_2_char,
country
FROM 
customers
 
 -- substring - extract a part of string at a specific position
 --substring(value, start , length)
 --remove first character of first_name
 SELECT 
first_name,
SUBSTRING(TRIM(first_name) ,2, Len(first_name)) subname, 
--SUBSTRING(first_name ,2,5) subname, 

country
FROM 
customers */

--DONE STRING FUNCTION

--Lets Learn Numeric Function = ROUND ,ABS
--ROUND
SELECT 3.517,
ROUND(3.517, 2) AS round2,
ROUND(3.517, 3) AS round3,
ROUND(3.517, 1) AS round2

--ABS : change to possitive value

SELECT -543,
ABS(-543),
ABS(43)