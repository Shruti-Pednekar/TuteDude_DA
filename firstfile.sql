Use DataAnalystCourse

CREATE TABLE Department
( DeptID nvarchar(20) PRIMARY KEY ,
DeptName nvarchar(20) NOT NULL);


-- create table in database
CREATE TABLE Professor (
PID nvarchar(20) PRIMARY KEY ,
Fullname nvarchar(20) NOT NULL,
Age INT,
DeptID nvarchar(20)
);

CREATE TABLE Professors ( PID nvarchar(20) PRIMARY KEY , DeptID nvarchar(20) , Firstname nvarchar(20),Lastname nvarchar(20));

SELECT * FROM Department;

-- Only return distinct record 
SELECT * FROM  [Professors];

SELECT DeptID,DeptName FROM Department

INSERT INTO Department VALUES ('D1','Computer Science');

-- insert multiple cols in tables 
INSERT INTO Department VALUES ('D2','English'),('D3','Statistics'),('D4','Geography');

INSERT INTO Professors (PID,DeptID,Firstname,Lastname) VALUES ('P8','D2','shruti','Vengurlekar ');



INSERT INTO Professors (PID,DeptID,Firstname,Lastname,EmailID,AGE) VALUES
('P1','D4','Rutuja','Dhuri','d1dept@gmail.com',27),
('P2','D1','Erica','Sharma','d2dept@gmail.com',20),
('P3','D1','Cole','David','d3dept@gmail.com',24),
('P4','D3','Yash','Sharma','d4dept@gmail.com',26),
('P5','D4','Tarini','Mittal','d5dept@gmail.com',25),
('P6','D3','Riya','Kapoor','d6dept@gmail.com',28);


Alter Table Professor Drop Column Fullname ;

Alter table Professor Add Lastname nvarchar(20);

-- modify the cols as change the position of the cols 
-- ALTER TABLE Professor MODIFY DeptID nvarchar(20) AFTER Lastname;

INSERT INTO Professor VALUES ('P1','Jyoti Gawade',27,'HR');

INSERT INTO Professor VALUES (3,'Priti Rane',25,'Brand');

DROP TABLE Professor;

TRUNCATE TABLE Professor;





-- Querries :
-- 1. get unique records 
SELECT DISTINCT DeptID FROM Professors

SELECT * FROM Professors

SELECT DISTINCT DeptID,Firstname FROM Professors

-- Gives all the records coz its having the PRIMARY KEY  
SELECT DISTINCT * FROM Professors

-- Using WHERE Clause 
SELECT Firstname FROM Professors WHERE DeptID='D1' ; 

-- Distinct with where clause 
SELECT DISTINCT DeptID, Firstname FROM Professors WHERE Lastname = 'Vengurlekar';

--Select data from whole table 
SELECT DISTINCT * FROM Professors WHERE Lastname = 'Vengurlekar';

-- The AND & OR operators are used to combined multiple conditions, to filter accordinglyl.
--These are called conjunctive operator 

-- Example of AND  & OR 

--gives only 1 record where name is TOM having deptid is d2 
SELECT * FROM Professors WHERE Firstname='Tom' AND DeptID='D2'

-- gives 5 record first Tom one and other one is having D2 department and lastname having Sharma  
SELECT * FROM Professors WHERE Firstname='Tom' OR DeptID='D2' OR Lastname='Sharma'



--NOT OPERATOR : used in combination with other operators to give opposit result also called negative result 
SELECT * FROM Professors WHERE NOT DeptID = 'D2';


--UPDATE 
ALTER TABLE Professors ADD EmailID nvarchar(20);
SELECT * FROM Professors;
UPDATE Professors SET EmailID='d1dept@gmail.com' WHERE DeptID='D1';
UPDATE Professors SET EmailID ='d2dept@gmail.com' WHERE DeptID='D2' AND PID='P7' 

--update 2 cols once 
UPDATE Professors SET EmailID = 'd3dept@gmail.com',Lastname='Vengurlekar' WHERE DeptID='D3' AND PID='P4'

--DELETE 
DELETE FROM Professors WHERE PID='P8';

DELETE FROM Professors WHERE Firstname is NOT NULL;

--ALTER: Changes the structure of  a table 
--USED TO ADD,DELETE OR MODIFY COLUMNS IN AN EXISTING TABLE 
-- ALSO USED TO ADD AND DROP VARIOUS CONSTRAINTS ON AN EXISTING TABLE 

--ALTER TABLE TABLE_NAME[ACTIONS];

--actions:
--Columns : Add , Delete (drop),modify or rename 
--Constraints : Add, Drop 
--Index : Add , Drop

ALTER TABLE Professors 
ADD AGE1 INT;

ALTER TABLE Professors 
DROP COLUMN AGE;

--ALTER TABLE RENAME COLUMN 
ALTER TABLE Professors 
RENAME COLUMN Firstname to FirstName


-- RENAME in sms
EXEC  sp_rename 'Professors.Lastname','LName','COLUMN';

--Alert table - alter/modify datatype 
--refresh the cols in table 
ALTER TABLE Professors 
ALTER COLUMN Age1 nvarchar(30) 

--Date 19 05 2026 
SELECT * FROM Professors

--Add not null constraint 
ALTER TABLE Professors ALTER COLUMN DeptID nvarchar(20) NOT NULL;

--columns should not have null values so we cant have assign the primary key contraints 
ALTER TABLE Professors ADD CONSTRAINT PK_Professors PRIMARY KEY (EmailID)
--pid

-- DROP the constraints 
ALTER TABLE Professors DROP CONSTRAINT PK_Professors 

--
ALTER TABLE Professors 
ADD CONSTRAINT FK_Professors 
	FOREIGN KEY (DeptID) REFERENCES Department(DeptID)

ALTER TABLE Professors 
ADD CHECK (Age>=18)

SELECT * FROM Department

-- 
SELECT * FROM [DataAnalystCourse].[Department]

SELECT * FROM [db_accessadmin].[Professors]

SELECT * FROM [DataAnalystCourse].[DepartmentProfessorHistory]



SELECT * FROM zepto_v2