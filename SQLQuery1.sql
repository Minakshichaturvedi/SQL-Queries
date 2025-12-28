-- this is a comment
/*efgh
sdf
er

--Retrieve All Customer Data
SELECT *
FROM customers
-- DDL - DATA DEFINITION LANGUAGE
-- FOR CREATION OF TABLE 
CREATE TABLE persons(
id INT not null,
name VARCHAR(50) not null,
email VARCHAR(30) not null,
birth_date DATE,
phone VARCHAR(15) not null
CONSTRAINT pk_persons PRIMARY KEY (id)
)*/

--SELECT * FROM persons;

-- Alter = change the defintion of table - add new column
--ALTER TABLE persons ADD email VARCHAR(50) NOT NULL   -- it will in the last if you want to add in between you have delete and create again 
--SELECT * FROM persons

--DROP will delete the data from table
-- DROP  will remove table from databasev -- DROP TABLE persons
--ALTER TABLE persons
--DROP COLUMN email

-- Data Manipulation Language 
--INSERT INTO table_name (col1 , col2 , col3)  -- if no column are specified SQLexpects value for all columns
--VALUES (val1 , val2 , val3), (----) -- Must match the number of column and values

--INSERT INTO customers(id , first_name , country, score)
--VALUES(6,'anna' , 'USA' , null),
--(7, 'SAM' , null, 100)

--select * from customers



--you are allowed to add only two element like this
--INSERT INTO customers(id , first_name )
--VALUES(8,'tiya') -- other will be null

--select * from customers


-- tranfer data from one to other
-- first you have to query to source table in order to collect the data you need and inser it into target table
--copy data from customers table into persons
--INSERT INTO persons (id, name, birth_date, phone)
--SELECT id,first_name ,NULL , 'Unknown' from customers
--SELECT *FROM persons



--UPDATE COMMAND
-- want to change the content of already existing rows
/*UPDATE table_name
SET col1 = val1,
col2 = val2
WHERE <CONDITION> */
--note == always use where to avoid updating all the rows unintentionally

-- Change the score of customer 6 to 0
/*SELECT* FROM customers
UPDATE customers 
SET score = 0
WHERE (id = 6)

SELECT* FROM customers*/


--change score of the customer 8 to 0 and update the country to uk
/*SELECT * FROM customers
UPDATE customers
SET score = 0 ,
country = 'uk'
WHERE(id = 8)

SELECT * FROM customers*/

-- Update all cutomers with null score by setting their score 0
/*SELECT * from customers
UPDATE customers
SET score = null 
where(score = 0)
SELECT * from customers*/


-- DELETE = delete row 
-- note = always use where to avoid deleting all rows unintentionlly without where all rows will be updated
--DELETE FROM table_name
--Where <condition>

-- DELETE All customers with an ID greater than 5
--SELECT * FROM customers
--DELETE FROM customers
--where(id>5)
--SELECT * FROM customers 


--DELETE All data from table persons
-- WE dont want to delte the table just want to delete the data 
-- TRUNCATE = clears whole table at once without checking or logging
-- TRUNCATE IS FASTER THAN DELETE because in large db date check logs and protocals which makes it slow truncate skip all this
--DELETE FROM persons

 --TRUNCATE TABLE persons -- make table empty but table still exist


 -- Basics DONE







