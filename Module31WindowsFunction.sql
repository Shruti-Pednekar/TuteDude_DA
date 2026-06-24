SELECT * FROM Saleswindow;

CREATE TABLE Saleswindow 
(SalesID INT PRIMARY KEY,
SalesDate Date ,
Amount INT );

INSERT INTO Saleswindow VALUES 
(1,'2026-01-01',100),
(2,'2026-01-02',200),
(3,'2026-01-03',150),
(4,'2026-01-04',300),
(5,'2026-01-05',250);

--This will add the amounts by dates
--windows function we use example 
SELECT SalesID,SalesDate,Amount,
SUM (Amount) OVER (ORDER BY SalesDate) AS RunningTotal FROM Saleswindow;

--ROW_NUMBER function 
/*
Windows funtion that assigns a sequential int to each row within the 
partition of a result set .
The row num starts with 1 for the 1st row in each partition 

*/
CREATE TABLE Saleswindow1 
(SalesID INT PRIMARY KEY,
SalesDate Date ,
Amount INT );

INSERT INTO Saleswindow1 VALUES 
(1,'2026-01-01',100),
(2,'2026-01-01',200),
(3,'2026-01-02',150),
(4,'2026-01-02',300),
(5,'2026-01-03',250),
(6,'2026-01-03',350),
(7,'2026-01-03',450);

SELECT
	SalesID,
	SalesDate,
	Amount,
	ROW_NUMBER() OVER (PARTITION BY SalesDate ORDER BY SalesID)
AS RowNum
FROM 
	Saleswindow1;


--Create Employee1 table for dense and ra
CREATE TABLE Employee1(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(100),
Department VARCHAR(50),
Salary DECIMAL(10,2)
);

SELECT * FROM Employee1;


INSERT INTO Employee1 (EmployeeID,EmployeeName,Department,Salary) VALUES 
(1,'John','HR',50000),
(2,'Jane','HR',55000),
(3,'Bob','IT',70000),
(4,'Alice','IT',75000),
(5,'Charlie','IT',72000),
(6,'Dave','Sales',60000),
(7,'Eve','Sales',65000),
(8,'Frank','Sales',62000),
(9,'Grace','HR',53000),
(10,'Heidi','IT',68000),
(11,'Harsh','IT',70000);


SELECT * FROM Employee;


--Identified the top paid employee in each department 
SELECT * FROM (
SELECT EmployeeID,EmployeeName,Department,Salary ,
ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Row_Num  
FROM Employee1) AS subquery

WHERE Row_Num=1;


SELECT * FROM Employee  ;

--rank skipped the number if 2 double records found
SELECT * , rank() OVER (PARTITION BY Department ORDER BY Salary DESC ) FROM Employee1;

--This will not skipped any number ... if the number has been repeated it starts from that next num 
SELECT * , dense_rank() OVER (PARTITION BY Department ORDER BY Salary DESC ) FROM Employee1;


--5. NTILE() 
-- This is the function in SQL server is used to distribute rows of an ordered position into a specific num of approximately equal grps or buckets .
SELECT EmployeeID,EmployeeName,Salary ,NTILE (3) OVER (PARTITION BY Department ORDER BY Salary ) AS NTILE_Groups FROM Employee1;


--6. Avg () function 
-- Returns average (Arithmetic mean ) of the input expression values .
--It works with numeric values and ignores NULL values . 
/*
Syntax :
AVG() OVER (
	[PARTITION BY partition_expresssion,...]
	ORDER BY sort_expression[ASC|DESC],...
	)
*/

SELECT * ,FLOOR( AVG(Salary) OVER (PARTITION BY Department))avg_salary FROM Employee1;


--7.COUNT()-Gives count of values in each window
/* COUNT() OVER (
		[PARTITION BY partition_expression,...]
		ORDER BY sort_expression[ASC |DESC],...
		)
*/

SELECT * , COUNT(EmployeeID) OVER (PARTITION BY Department)dept_count FROM Employee1;


--8.SUM()-funtion in SQL server is used to find sum of values within a window frame 
/*
Syntax : 
SUM(expression)OVER(PARTITION BY partition_expression)
*/

--It make the partition by the department and get sum of the total salary by dept 
SELECT * , SUM(Salary) OVER (PARTITION BY Department)Total_Sal FROM Employee1;


--9.Running Total
--To calculate the cumulative total of salaries for each dept using sum() 
--You can partition by dept &  then order rows within each partition 

SELECT EmployeeID,EmployeeName,Salary,Department ,
SUM(Salary) OVER (PARTITION BY Department ORDER BY Salary DESC)
AS Cumulative_Total FROM Employee1 
ORDER BY Department,Salary DESC;


--check the vedio for doing the table and solve example 
--CREATE TABLE SampleEmpCheck (


--10. LAG & LEAD 
--LEAD() & LAG() used to get preceding & succeding value of any row within its partition .
--This functions are termed as nonaggregate window fun 
/* 
LEAD(expr,N,default)
OVER (Window_specification | window_name)

LAG(expr,N,default)
OVER (Window_specification | window_name)

Para used :
expr: It can be cols or any built - in function 
N:It is positive val which determine number of rows preceding/succeeding the current row . If it is omitted in query then its default value is 1 .
Default: Returns in case no row precedes /succdes the current row by N rows . If it is missing then it is by default NULL
*/

--The query will be return the result with lag or lead with 2 and having null values as 0 with using Floor function for the int val
SELECT *, FLOOR(LAG(Salary,2,0) OVER (PARTITION BY Department ORDER BY Salary DESC)) Previous_Salary,
FLOOR(LEAD(Salary,2,0) OVER (PARTITION BY Department ORDER BY Salary DESC)) Next_Salary  
FROM Employee1; 