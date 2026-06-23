--Pattern Matching
--This function in SQL Server allow you to search for & manipulate text based on pattern .
--Useful for String searching ,replacing & validating operations 

--LIKE operator is used in a WHERE clause to search for specified pattern in column 
--SELECT cols1,cols2,....FROM table_name WHERE coln LIKE pattern .

--Wildcards :
--% -replaces 0 or more chars 
--_ - represent single char 

--PATINDEX funtion returns starting position of the 1st occurrence of a pattern in  
--specified expression , or zeros if the pattern is not found 

--PATINDEX ('%pattern%,expression)


--CHARINDEX fun returns position of substring in string ,
--unlike PATINDEX , it does not support wildcards 
--CHARINDEX (substring,string ,start_location)

--RIGHT, LEFT fun returns rightmost or leftmost part of a string with specifies number of chars 
--RIGHT(string , number_of_chars)
--LEFT(string,number_of_chars)


--This table present in master db 
SELECT * FROM Sales



SELECT * FROM Sales WHERE customer_name LIKE 'A%' or customer_name LIKE 'F%';

--It gives the names where 2nd letter will be a and 1st letter anyone after the letter a after that any letters 
SELECT * FROM Sales WHERE customer_name LIKE '_a%'


--The table in dataanalyticscourse db 
SELECT * FROM Customer;

--second char is i any number of chars after that 
SELECT * FROM Customer WHERE CustomerName LIKE '_i%';

SELECT * FROM Customer WHERE CustomerName LIKE '_a%';

SELECT * FROM Customer WHERE CustomerName LIKE '___i';

--The customername having first name of last char is a  and last name having 1st name as l
SELECT * FROM Customer WHERE CustomerName LIKE '%a L%';



--PATINDEX => Return index  of pattern 

--at the index 11 it seach for .com
SELECT PATINDEX('%.com%','www.google.com');

--CHARINDEX => Return the char index , choose 1st occurence if not give it manually 

--without occurance it give index 17 , after give the occurance of 20 it starts from 20 and gives index at 25 
SELECT CHARINDEX('sql','I love learning sql, as sql is very interesting',20); 

--RIGHT => Returns chars from right side 
--LEFT => Returns chars from left side 

--It gives Pednekar
SELECT RIGHT ('My name is Shruti Pednekar',8);

--It gives My name
SELECT LEFT ('My name is Shruti Pednekar',8);



--3. Advance Pattern Matching 

--create users table having mails 
CREATE TABLE Users (
	UserID INT PRIMARY KEY IDENTITY (1,1),
	Name NVARCHAR (100),
	Email NVARCHAR(255)
	);

--Insert the data into users table
INSERT INTO Users(Name,Email) VALUES 
	('John Doe','john.doe@example.com'),
	('Jane Smith','jane.smith@domain'),
	('Alice Johnson','alice.johnson@example.org'),
	('Bob Brown','bob.brown@domain.com'),
	('Carol White','carol.white@domain.'),
	('David Black','david.black@domain.c'),
	('Eva Green','eva.green@.com'),
	('Frank Blue','frank.blue@domain.com'),
	('Grace Pink','grace.pink@domain.co.uk'),
	('Henry Yellow','henry.yellow@domaincom');

SELECT * FROM Users;

--The mail mandetory to having @ and after that any number of chars before @ also and after that having . 
SELECT * FROM Users WHERE Email LIKE '%@%.%';


SELECT * FROM Users WHERE Email NOT LIKE '%@%.%';

SELECT * FROM Sales 

--The  name having start in range of [M to S],after that any num of chars & having [TH] after that having H and then any num of chars 
SELECT * FROM Sales 
	WHERE Country LIKE '[M-S]%[TH][H]%';

--Review again 
SELECT * FROM Sales 
	WHERE Item_Type LIKE '[H]%[TAJS]_[r]%';