--Date and Time Function
--Date = 2025-08-20 date- month - day 
--Time = 19:55:45 = hours:minutes:seconds 
--Date + Time (sql) = TimeStamp(oracle . postgres, musql)
/*
SELECT OrderID,OrderDate, ShipDate,
CreationTime From Sales.orders
--THREE different sources in order to query the date
--1.Date column from a table
SELECT OrderID,
CreationTime From Sales.orders
--2.Haedcoded Constant String Value
SELECT OrderID,
'2025-08-20' hardcoded,
CreationTime From Sales.orders
--3.GETDATE() Function - return the current date and time at the moment when the query is executed
SELECT OrderID,
'2025-08-20' hardcoded,
GETDATE() Today   --WOW 18 july yehhhhhh
 From Sales.orders
 */

 --FUNCTIONS OVERVIEW
 -- how to manipulate using functions
 --like extract the part of the date , change date formate, - to/ , calculation(+,-), validation whether real or not

 -- THERE are FOUR types of functions 
 --1. Part EXTRACTION = DAY , MONTH , YEAR, DATEPART, DATENAME, DATETRUNC , EOMONTH
 --2.FORMATE AND CASTING = FORMAT , CONVERT , CAST
 --3.CALCULATIONS = DATEADD , DATEDIFF
 --4.VALIDATION = ISDATE 

 --LETS START ONE BY ONE
 -- PART EXTRACTION 
 /*
 DAY () = RETURN day from a date
 MONTH () =  RETURN month from a date
 YEAR(), = RETURN year from a date
 DATEPART(), 
 DATENAME(), 
 DATETRUNC() , 
 EOMONTH()
 */
 /*
 SELECT OrderID,
 creationTime,
DAY(CreationTime)
 From Sales.orders


 SELECT OrderID,
 creationTime,
MONTH(CreationTime)
 From Sales.orders


 SELECT OrderID,
 creationTime,
YEAR(CreationTime)
 From Sales.orders
 */
 --DatePart = syntax:DATEPART(part , date)
 --IT give number
 /*
 SELECT OrderID,
 creationTime,
 DATEPART(month , creationTime), --0r mm instead of month
 DATEPART(year , creationTime) year, 
 DATEPART(day , creationTime) day,
 DATEPART(hour , creationTime)month,
 DATEPART(quarter , creationTime)quarter,
 DATEPART(week, creationTime)week

 From Sales.orders

 --DATENAME() - Return the name of a specific part of a date
 -- it give specific day
 SELECT OrderID,
 creationTime,
 DATENAME(month , creationTime), --0r mm instead of month
 DATENAME(year , creationTime) year, 
 DATENAME(day , creationTime) day,
 DATENAME(hour , creationTime)month,
 DATENAME(quarter , creationTime)quarter,
 DATENAME(week, creationTime)week

 From Sales.orders

 -- DATETRUNC - Truncate the date to the specific part
 -- minute nad second resent upto hour
 SELECT OrderID,
 creationTime,
 DATETRUNC(month , creationTime), --0r mm instead of month
 DATETRUNC(year , creationTime) year, 
 DATETRUNC(day , creationTime) day,
 DATETRUNC(hour , creationTime)month,
 DATETRUNC(quarter , creationTime)quarter,
 DATETRUNC(week, creationTime)week

 From Sales.orders

 --que
 SELECT 
 CreationTime,
 count(*)
 FROM Sales.orders
 GROUP BY   CreationTime

 --EOMONTH() = RETURN the last day of a month
 SELECT OrderID,
 creationTime,
EOMONTH(CreationTime)
 From Sales.orders

 --HOW MANY ORDERS WERE PLACED EACH YEAR - DATE AGGREGATION
 SELECT
 MONTH(OrderDate),
 count(*)
 FROM Sales.Orders
 GROUP BY MONTH(OrderDate)

 --Show all orders thar were placed during the month of february
 SELECT
 *
 FROM Sales.Orders
 WHERE Month(OrderDate) = 2
 */

 --DONE DAY 1

 --Format-(changing the formate of a value from one to another , changing how the data looks) and casting- (changing the data type from one to another)cast(), convert()
 --like YYYY-MM-dd - hh :mm:ss formate specifier
 --format - format a data ana time value
 --sytax - FORMAT(VALUE, FORMATE , [,CULTURE]-OPTIONAL)
 /*
 SELECT
 OrderID,
 CreationTime,
  FORMAT(CreationTime , 'MM-dd-yyyy') USA_format,
  FORMAT(CreationTime , 'dd-MM-yyyy'),
  FORMAT(CreationTime , 'dd') dd,
  FORMAT(CreationTime , 'ddd') ddd,
  FORMAT(CreationTime , 'dddd') dddd,
  FORMAT(CreationTime , 'MM') MM,
  FORMAT(CreationTime , 'MMM') MMM,
  FORMAT(CreationTime , 'MMMM') MMMM,
  FORMAT(CreationTime , 'YY') YY,--DONT DO THIS 
  FORMAT(CreationTime , 'YYY') YYY,
   FORMAT(CreationTime , 'YYYY') YYYY
   


 FROM Sales.Orders
 

 --que == Day Wed Jan Q1 2025 12:34:56 pm
 SELECT 
 OrderID,
 CreationTime,
 'Day ' +FORMAT(CreationTime , ' ddd MMM ')+'Q' + DATENAME(quarter , CreationTime) +FORMAT(CreationTime , ' hh:mm:ss tt ') CUSTOMFORMAT
 FROM Sales.Orders

 --CONVERT() - Convert a date or time value to a different data type and formats the value
 --syntax = (data_type , value [,style])
 SELECT 
 CONVERT(INT , '123') StringtoINT,
 CONVERT(DATE , '2025-08-20') AS Stringtodate,
 CONVERT(DATE , CreationTime)AS datetimetodate,
 CONVERT(VARCHAR , CreationTime ,32)AS usa,
 CONVERT(VARCHAR , CreationTime , 34)as euro
 FROM Sales.Orders
 */
 --CAST() - Convert a value to a specified data type
 --syntac = CAST(VALUE AS data_type)
 --SELECT
 --CAST('123' AS INT),
 --CAST(123 AS VARCHAR),
 --CAST('2025-08-20' AS datetime2)
 
  --CASTING - CAST - anytype to anytype ,CONVERT-anytype to anytype, FORMAT-anytype to only String
  --FORMATING - CAST- NO formating ,  CONVERT - FORMates only dateandtime ,  FORMAT - format - date and time , nmbers


  -- lets move to CALCULATIONS - DATEADD, DATEDIFF
  --DATEADD()- Add or substract a specific time interval to/from a date
  -- DATEADD(part , interval , date)
  /*
 SELECT
 *,
 Dateadd(day ,-10, OrderDate),
 Dateadd(year ,2 , OrderDate)
 FROM Sales.Orders


 --datediff - diff bt two date
 --datediff (part , start_date , end_date)
 SELECT
 
 *,
 Datediff(month ,OrderDate , ShipDate  ),
 Datediff(day , OrderDate,ShipDate)
 FROM Sales.Orders
  
  
  ---find the avg shipping duration in days of each month
 SELECT
 MONTH(OrderDate),
 AVG( Datediff(day , OrderDate,ShipDate)) AS avgship
 FROM Sales.Orders
 GROUP BY month(OrderDate)

 --fing the number of days bt each order and previous order
 SELECT 
 OrderID,
 OrderDate AS CURR,
 LAG(OrderDate) OVER (ORDER BY OrderDate) AS PREV,
 DATEDIFF(day , LAG(OrderDate) over (order by OrderDate) , OrderDate) as noofdays
 FROM Sales.Orders
 */
 --lets move to validation - ISDATE()- CHeck if a value is a date return one if the value is a valid date
 --ISDATE(value)
 SELECT
 ISDATE('20-4-2025'), -- O  MEANS no treat as string
 ISDATE('2025- 08-20') ,
 ISDATE('2025') ,
 ISDATE('4') 

 --DONE WITH DATE AND TIME FUNCTION - 4 JAN 2026
