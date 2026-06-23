
USE DataAnalystCourse


SELECT * FROM Sales 
-- MODULE 18 (IN Operator)
-- it allows to specify multiple values in a WHERE clause 
--it also the shorthand for multiple OR conditions 

--Country wise units sold with sales channel as online/offline
SELECT Country,Units_Sold,Sales_Channel  FROM Sales WHERE Item_Type IN ('Baby Food','Vegetables');



--25 05 2026 
-- BETWEEN operator selects values within a given range. Values can be numbers , texts or dates 
-- Is Inclusive : begin and end values are included 

SELECT column_name(s)
FROM table_name 
WHERE column_name BETWEEN value1 AND value2;

SELECT column_name(s)
FROM table_name 
WHERE column_name NOT BETWEEN value1 AND value2;

SELECT column_name(s)
FROM table_name 
WHERE column_name > value1 AND column_name < value2;

SELECT * FROM SALES 

SELECT * FROM SALES WHERE Units_Sold BETWEEN 500 AND 1000;

SELECT * FROM SALES WHERE Units_Sold NOT BETWEEN 500 AND 1000;

SELECT * FROM SALES WHERE Order_Date BETWEEN '2010-01-01' AND '2015-12-31';

SELECT * FROM SALES WHERE Order_Date > '2010-01-01' AND Order_Date < '2015-12-31';

SELECT Order_Date FROM SALES 


--LIKE Operator 
--Used in a WHERE clause to search for a specified pattern in a column 
-- There are two wildcards often used in conjuction with the LIKE Operator 
-- % represents 0,1 or multiple chars 
-- _ sign represents one , single character 

--start with letter A and after that any character with any range 
SELECT * FROM Sales WHERE Region LIKE 'A%';

--select 4 letters region 
SELECT * FROM Sales WHERE Region LIKE '____';
 
SELECT DISTINCT * FROM Sales WHERE Region LIKE '____';

-- name should having the mention character 
SELECT * FROM Sales WHERE Region LIKE '%i%';

--having 3rd letter b 
SELECT * FROM Sales WHERE Region LIKE '__b%';

SELECT * FROM Sales WHERE Region LIKE 'A%a';



--MODULE 19 - Selection Command Ordering 
/*
Multiline comments 
*/

--Single line comment 

--ORDER BY clause 
SELECT * FROM sales order by Order_Date DESC;

SELECT * FROM sales order by Order_Date ASC,Units_Sold DESC;

SELECT * FROM Sales ORDER BY Region DESC;

INSERT INTO Sales VALUES ('Europe',	'Slovakia','Vegetables','Online','H','2012-10-06',759224212,	
'2012-11-10', 200,	154.059997558594	,90.9300003051758	,26344.259765625	,15549.0302734375	,10795.23046875);

SELECT Units_Sold FROM Sales Order BY Order_Date ASC;



--26 05 2026

SELECT * FROM Sales WHERE Units_Sold > 50 ORDER BY  Units_Sold DESC;

--TOP clause : 
-- Not all dbs support 
--MySQL supports LIMIT clause to select a limited number of records 
-- ORACLE uses FETCH FIRST n ROWS ONLY & ROWNUM 

SELECT TOP 5 PERCENT * FROM Sales

SELECT TOP 5 PERCENT * FROM Sales WHERE Units_Sold >60;

-- AS : Rename cols or table with an alias 
--An alias only exists for the duraiton of query 

SELECT Sales_Channel AS S_Channel FROM Sales;


SELECT * FROM Sales 

--27 05 2026
SELECT Order_Date AS Date_Orders , Region AS Regions , Country , Unit_Price AS Price FROM SALES ;


--count
-- Return number of rows that matches a specified criteria 
-- You can specify cols name instead of the asterix symbol (*),
--IF you specify cols name instead of * NULL values will not be 

SELECT COUNT(*) AS Total_Records FROM Sales


--this is show the whole 23 country in Europe region 
SELECT Count(Country) Country_Count FROM Sales WHERE Region='Europe' ;

--Distinct ITEM Count where region is Asia 
SELECT COUNT (distinct Item_Type) FROM Sales WHERE Region='Asia';


 SELECT Country FROM Sales WHERE Region='Europe' ;

 --SUM() - Returns total sum of numeric column 
 
SELECT SUM(Units_Sold)Total_Units_Sold FROM Sales 
 
 --Total units sold in shri lanka 
SELECT SUM(Units_Sold)Total_Units_Sold FROM Sales WHERE Country='Sri lanka';

SELECT * FROM Sales WHERE Country = 'Sri lanka';

SELECT *  FROM Sales WHERE Country ='Sri lanka';

SELECT * FROM Sales WHERE Region='Asia';


--avg() - Returns average value of numeric column 
--NULL Values are ignored 

SELECT AVG(Units_Sold)Units_Sold_Asia FROM Sales WHERE Item_Type='Fruits';

SELECT AVG(Unit_Price)Units_Price_Europe FROM Sales WHERE Region='Europe';

SELECT * FROM Sales

SELECT AVG(Total_Cost)FROM Sales WHERE Country='Norway';

SELECT * FROM Sales WHERE Country='Norway';

SELECT AVG(Unit_Price*0.1) as commision from Sales WHERE Country='Norway';




--28 05 2026
--MIN n MAX operation 
--MIN()-returns smallest val of the selected column 
--MAX()-returns largest val of the selected cols 


SELECT MAX(Units_Sold)MAX_Units_Sold FROM Sales

SELECT MIN(Units_Sold)MAX_Units_Sold FROM Sales


SELECT Units_Sold,Order_Date FROM Sales WHERE Order_Date>='2015-01-01' AND Order_Date<='2015-12-31' ORDER BY Order_Date ASC;

SELECT Units_Sold FROM Sales

SELECT * FROM Sales 

--01-06-2026

--MAX profit by each Item Type 
SELECT Item_Type,MAX(Total_Profit)AS Max_Profit FROM Sales GROUP BY Item_Type ORDER BY Item_Type;

--avg units sold by regon
SELECT Region ,AVG(Units_Sold)AS AVG_Unit_Sold FROM Sales GROUP BY Region;

--AVG,MAX,MIN in single Query for avg total cost , max total cost , min total cost by region 
SELECT Region,AVG(Total_Cost)Avg_TotalCost,MAX(Total_Cost)Max_TotalCost,MIN(Total_Cost)Min_TotalCost FROM Sales GROUP BY Region ORDER BY Region ASC ;




--HAVING CLAUSE 
--Its added because the WHERE keyword cannot be used with aggregate function
--It is used along with the GROUP BY to restrict rows returned to only those where condition in TRUE
--Used to Filter Grouped results based on the aggregate function 

/*
SELECT Column_Name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY Column_name(s);
*/

SELECT Country,AVG(Units_Sold) AS Avg_Unit_Sold
FROM Sales 
WHERE Order_Date>'2010-02-02'
GROUP BY Country 
HAVING COUNT(Units_Sold)>2;

--Shows only those countries with more than 2 records after 2nd Feb of 2010


SELECT * FROM Sales ORDER BY Order_Date ASC;

SELECT * FROM Sales ;

SELECT TOP 10 Country, Item_Type
FROM Sales
ORDER BY Country DESC; 

SELECT Sales_Channel, AVG(Total_Revenue) AS Avg_Revenue
FROM Sales
WHERE Order_Priority = 'H' -- Filters individual rows BEFORE grouping
GROUP BY Sales_Channel
HAVING AVG(Total_Revenue) > 500000; -- Filters grouped totals AFTER grouping

SELECT Item_Type, SUM(Total_Profit) AS Combined_Profit
FROM Sales
GROUP BY Item_Type
HAVING SUM(Total_Profit) > 1000000;

SELECT Region, SUM(Units_Sold) AS Total_Units_Sold
FROM Sales
GROUP BY Region
HAVING SUM(Units_Sold) > 10000;

SELECT * FROM Sales


--review this it shows error 
SELECT Country,AVG(Units_Sold) AS Average_Units FROM Sales WHERE Order_Date >='2010-05-20' GROUP BY Country HAVING COUNT (Units_Sold)>2;

-- CASE WHEN 
--Conditional Statement
--Handling if/then logic 
--followed by at least one pair of WHEN & THEN statements 
--SQL's equivalent of IF .THEN in SQl 

/*CASE 
	WHEN condition1 THEN result1
	WHEN condition2 THEN result2
	WHEN condition3 THEN result3
END ;*/

SELECT * FROM Sales

SELECT *, CASE 
			WHEN Units_Sold>=8000 THEN 'Tier 1'
			WHEN Units_Sold>=5000 THEN 'Tier 2'
			WHEN Units_Sold>=1000 THEN 'Tier 3'
			else 'DEROGATORY'
			END AS Units_Sold_Tier 

			FROM Sales;


			--MODULES 24
	        --JOINS 
			-- this clause used to combine rows from 2 or more tables , based on related cols between them
			-- In SQL , Subquery can be simply defined as a query within another query .
			-- SUBQuery=Query that is embeded in WHERE clause of another SQL query 


			--View
			--It is a virtual table based on te result set of an SQL statement
			--A view contains rows & columns , just like a real table . 
			--The fields in a view are fields from one or more real tables in the dbs 

			--Indexes 
			--Indexes are used to retrieve data from the dbs more quickly than otherwise .
			--The users cannot see the indexes , they are just used to speed up searches/queries .
		

--Joining & combining data concepts 
--What we need ?
--i)Names of tables to be joined 
--ii)A common column in those tables on basis of which we join them 
--iii)The list of columns from each table 

CREATE TABLE Customers
	(CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(50),
	ContactName  VARCHAR(50),
	Country VARCHAR(20));

INSERT INTO Customers VALUES 
(1,'Yash Thorat','Laxman','India'),
(2,'Mary Jones','Peter','USA'),
(3,'Monalisa Ros','Reeb','BRAZIL');


CREATE TABLE Orders
(OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate Date);

INSERT INTO Orders VALUES 
(2001,2,'2020-04-13'),
(2002,37,'2021-06-09'),
(2003,77,'2022-01-04');

SELECT CustomerName,ContactName FROM Customers INNER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID ;

--Combining queries 
--The UNION ,INTERSECT AND EXCEPT operator used to 
--combine result set of 2 or more SELECT Statement 

--Module 24. 3. Preparing the Data 

--create customer table for practice 
CREATE TABLE Customer(
CustomerID INT PRIMARY KEY,
CustomerName NVARCHAR(100),
ContactNumber NVARCHAR(10),
);

--insert values in Customer table 
INSERT INTO Customer VALUES 
(1,'Hari Sathe','9735274830'),
(2,'Gopal Joshi','8367178402'),
(3,'Nita Pathare','9365148537'),
(4,'Radha Lad','8256379450'),
(5,'Siya Mhatre','9635285184');


--create order table for practice 
CREATE TABLE Orderss 
(OrderID INT PRIMARY KEY,
OrderDate Date,
CustomerID INT,
Amount DECIMAL(10,2)
);

--INSERT the Val
INSERT INTO Orderss VALUES 
(1,'2023-06-01',1,150.22),
(2,'2023-06-03',2,200.00),
(3,'2023-06-05',3,300.00),
(4,'2023-06-07',6,250.00), -- CustomerID 6 does not exist in Customer
(5,'2023-06-09',7,175.00);  -- CustomerID 7 does not exist in Customer

UPDATE  Orderss SET CustomerID=2 WHERE CustomerID=22 ;

--INNER JOIN Example (Display the values same in both table ) 
--Display the customers that only have the place the order 
SELECT 
	Customer.CustomerID,
	Customer.CustomerName,
	Orderss.OrderID,
	Orderss.OrderDate,
	Orderss.Amount
FROM 
	Customer
INNER JOIN 
	Orderss ON Customer.CustomerID=Orderss.CustomerID;


--Also known as LEFT OUTER JOIN
--Retrive the records from the left table (table 1) & the matching records from right table (table2) 
--If there are no matching records in the right table ,NULL values are included for those columns 
--LEFT JOIN (Display the records in table 1 at left and also same present in right )
--Display the customers who has placed the order and also who have not placed any order as null 



SELECT
	Customer.CustomerID,
	Customer.CustomerName,
	Orderss.OrderID,
	Orderss.OrderDate,
	Orderss.Amount
FROM 
	Customer
LEFT JOIN 
	Orderss ON Customer.CustomerID=Orderss.CustomerID;
	  


	
--RIGHT JOIN => Returns the result from the right table (table 2) 
--

SELECT 
	Customer.CustomerID,
	Customer.CustomerName,
	Orderss.OrderID,
	Orderss.OrderDate,
	Orderss.Amount
FROM 
	Customer
RIGHT JOIN 
	Orderss ON Customer.CustomerID=Orderss.CustomerID;



SELECT * FROM Customer;
SELECT * FROM Orderss;

--FULL OUTER JOIN (Returns ALL the records from both the tables match & overlap between them also )
SELECT 
	Customer.CustomerID,
	Customer.CustomerName,
	Orderss.OrderID,
	Orderss.OrderDate,
	Orderss.Amount
FROM 
	Customer
FULL OUTER JOIN 
	Orderss ON Customer.CustomerID=Orderss.CustomerID;


--Demo of taing the customerID
SELECT 
	Orderss.CustomerID,
	Customer.CustomerName,
	Orderss.OrderID,
	Orderss.OrderDate,
	Orderss.Amount
FROM 
	Customer
FULL OUTER JOIN 
	Orderss ON Customer.CustomerID=Orderss.CustomerID;

--CROSS JOIN 
SELECT 
	Orderss.CustomerID,
	Customer.CustomerName,
	Orderss.OrderID,
	Orderss.OrderDate,
	Orderss.Amount
FROM 
	Customer
CROSS JOIN
	Orderss ; 

	 
--Combining Queries Intersect , Union , Except 
--INTERSECT clause in SQL is used to combine 2 SELECT 
--statements but the dataset returned by the INTERSECT statement will be 
--the intersection of the data sets of the 2 SELECT statements 

/*SELECT column FROM table1 
INTERSECT 
SELECT column FROM table2
*/

--First tables for running the examples 

--CREATE table 1 
CREATE TABLE Table1
(
	ID INT PRIMARY KEY,
	NAME NVARCHAR(100),
	Value INT
);

--INSERT the data in Table 1 
INSERT INTO Table1 (ID,Name,Value) VALUES 
(1,'Alice',100),
(2,'Bob',200),
(3,'Charlie',300),
(4,'David',400),
(5,'Eve',500);

--create table 2 
CREATE TABLE Table2(
	ID INT PRIMARY KEY ,
	Name NVARCHAR(100),
	Value INT
);

--insert the values in table 2 
INSERT INTO Table2 (ID,Name,Value) VALUES 
(3,'Charlie',300),
(4,'David',400),
(5,'Eve',500),  
(6,'Frank',600),
(7,'Grace',700);

--Applying the Intersect (return common records )
SELECT ID,Name FROM Table1
INTERSECT
SELECT ID,Name FROM Table2;

--UNION (All records from both tables)
SELECT ID,Name FROM Table1
UNION
SELECT ID,Name FROM Table2;

--UNION ALL (Retrive the records with both table)
SELECT ID,Name FROM Table1
UNION ALL
SELECT ID,Name FROM Table2;

--EXCEPT 
/*Returns those tuples that are returned by the first SELECT operation 
& not returned by the second SELECT operation */

--only gives the records of 1st table 
--get the records of Alice & Bob 
SELECT ID,Name FROM Table1
EXCEPT
SELECT ID,Name FROM Table2;

--SUBQUERY 
--Is a query within another query .
--The outer query is called as main query and inner query is called as subquery 
--Subqueries can reside in WHERE ,FROM or the SELECT clause    

/*SELECT column_name
FROM table_name
WHERE column_name comparison operator 
(SELECT COLUMN_NAME FROM TABLE_NAME WHERE .....
); */

--Query details of custoers who have placed order of amount > 250 

SELECT * FROM Customer WHERE CustomerID IN 
(SELECT CustomerID FROM Orderss WHERE AMOUNT >=150);

--Subquery is a query within another query .
--The outer query is called as main query  & inner query is called as subquery 
--Subqueries can reside in WHERE ,FROM or the SELECT clause 

/*
SELECT column1,column2 FROM 
(SELECT column_x as c1, column_y FROM table WHERE 
PREDICATE_X)
as table2,table1
WHERE PREDICATE;
*/
