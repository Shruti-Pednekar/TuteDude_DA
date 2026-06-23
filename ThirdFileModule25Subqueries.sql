
USE DataAnalystCourse

SELECT * FROM Customer;
SELECT * FROM Orderss;

--Query 
/*
Calculate the total amount for each customer and then 
join this result with the Customers table to get the customer's name 
& contact number 
*/

--Subquery IN Form 
--Main query to get the customer details along with their total order amount 
SELECT 
	c.CustomerID,
	c.CustomerName,
	c.ContactNumber,
	COALESCE (o.TotalAmount , 0 ) AS TotalOrderAmount
FROM 
	Customer c 
LEFT JOIN 
	(SELECT 
		CustomerID,
		SUM(Amount) AS TotalAmount 
	FROM 
		Orderss 
	GROUP BY
		CustomerID) o
ON
	c.CustomerID=o.CustomerID;


--Subqueries in SELECT Clause 

SELECT 
	c.CustomerID,
	c.CustomerName,
	c.ContactNumber,
	--Subquery to count te number of orders for each customer 
	(SELECT COUNT(*) 
	FROM Orderss o
	WHERE o.CustomerID=c.CustomerID) AS TotalOrders ,
	--Subquery to sum of the order amounts for each customer 
	(SELECT COALESCE(SUM(o.Amount),0) 
	FROM Orderss o
	WHERE o.CustomerID=c.CustomerID) AS TotalAmountSpent 
FROM 
	Customer c;

-- VIEWS & INDEXES 
--In SQL,a view is a virtual table based on the result set of an SQL statement 
--A view contains roes & columns , just like a real table ,
-- The fields in a view are fields from one or more real tables in the database
--Views provides : Ease of use , Space saving & security 
--IT does not have any real identity 

/*
CREATE VIEW view_name AS 
SELECT cols1,cols2,.....
From table_name 
WHERE condition ;
*/

CREATE OR ALTER  VIEW OrderSummary AS 
SELECT 
	c.CustomerID,
	c.CustomerName,
	c.ContactNumber,
	--Subquery to count the total number of orders for eachc customer 
	(SELECT COUNT(*)
	FROM Orderss o
	WHERE o.CustomerID=c.CustomerID) AS TotalOrders ,
	--Subquery to sum the total amount spent by the each customer 
	(SELECT COALESCE (SUM(o.Amount),0)
	FROM Orderss o
	WHERE o.CustomerID=c.CustomerID) AS TotalAmountSpent ,
	--Subquery to calculate the average amount for the each customer 
	(SELECT COALESCE(AVG(o.Amount),0)
	FROM Orderss o
	WHERE o.CustomerID=c.CustomerID) AS AverageOrderAmount,
	--Subquery to get the date of the last order for each customer 
	(SELECT MAX(o.OrderDate)
	FROM Orderss o
	WHERE o.CustomerID=c.CustomerID) AS LastOrderDate
FROM 
	Customer c; 

SELECT * FROM OrderSummary;

SELECT CustomerID,CustomerName,TotalOrders FROM OrderSummary;

--It's drop the OrderSummary View 
DROP VIEW OrderSummary;

--wHen can a view be updateD ?
/*
1. It is defined based on one and only one table 
2.Must include the PRIMARY KEY of the table based upon which the view has been creted 
3.The view should not have any field made out of aggregate function 
4.Must not have any DISTINCT clause in its definition 
5.Must not have any GROUP BY or HAVING clause in its definition 
6.The view must not have any subqueries  in its definition 
7.If the view you want to update is based upon another view ,later should be updatable 
8.Any of the selected output fields (of the view ) must not use constants , strings or value expressions .

UPDATE <view_name>
SET<column>=<value1>,<column2>=<value2>,....
WHERE <condition>;

/*
CREATE INDEX index_name 
ON table_name(cols1,cols2,....);

DROP INDEX table_name.index_name;

ALTER TABLE table_name
DROP INDEX index_name;

*/





--INDEX 
--CREATE INDEX  statement is used to create indexes in tables 
--Indexes are used to retrieve data from the dbs more quickly than otherwise 
--The users can not see the indexes , they are just used to speed up searches /queries -Performance Tuning 

--NOTE : Updating a table with indexes takes more time than updating a tbale 
without(because the indexes also need an update). So only create indexes on columns that will be frequently searched against 




*/

