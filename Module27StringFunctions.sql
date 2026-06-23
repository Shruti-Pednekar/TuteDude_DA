USE DataAnalystCourse

--LEN()function returns the length of the string 
--NOTE : Trailing spaces at the end of the string is not included when calculating the length .
--However , leading spaces at the start of the string is included when calculating the length
--LEN(string) 


SELECT * FROM Customer;

--Returns length of count of each customer name
SELECT LEN(CustomerName) FROM Customer ORDER BY LEN(CustomerName);

--It gets the spaces (we have take 4 spaces )
SELECT LEN('    SHRUTI');


--LOWER(string)=>Converts a string to lower case 
--UPPER(string)=>Converts a string to upper-case .

SELECT UPPER(CustomerName)UpperCase_Name FROM Customer;

SELECT LOWER(CustomerName)LowerCase_Name FROM Customer;

SELECT * FROM Customer;



--REPLACE 
--Create the countries table 
CREATE TABLE Countries (
	CountryCode CHAR(3),
	CountryName NVARCHAR(100)
);

--Insert data into the countries table 
INSERT INTO Countries (CountryCode,CountryName) VALUES 
('USA','United States'),
('CAN','Canada'),
('MEX','Mexico'),
('GBR','United Kingdom'),
('FRA','FRANCE'),
('DEU','Germany'),
('JPN','Japan'),
('CHN','China'),
('IND','INDIA'),
('BRA','Brazil');

SELECT * FROM Countries;

--USE REPLACE 
SELECT CountryCode,replace(CountryName,'United States','United States of America ')new_name FROM Countries;

--TRIM Function =>Removes the space character OR other specified chars from start or end of a string 
--Removes leading & trainling spaces from a string 
--TRIM ([Characters FROM]string)

--LTRIM()=>Removes leading spaces from a string 
--RTRIM()=>Removes trailing  spaces from a string 
--LTRIM(String)
--RTRIM(String )


SELECT TRIM('$' FROM '$#Instafood') AS TrimedString;

SELECT LTRIM('    I am Shruti Pednekar.') AS TrimedString;

SELECT RTRIM('I am Shruti Pednekar.'        ) AS TrimedString;


--CONCAT
--CONCAT()=>Adds 2 or more strings together 
--CONCAT(string1,string2,...,string_n)
--+ Operator allow you to add 2 or more strings together 
--string1 + string2 + string_n

SELECT CONCAT('Shruti ','Abhimanyu ','Pednekar')AS Concatenated ;

SELECT ('1'+'4') AS Concatenated;

SELECT CONCAT_WS('@','Shruti','Pednekar')concatenated;

SELECT CONCAT_WS('.','www','google','com')concatenated;


--SUBSTRING
--substring()=>extracts some chars from the string 
--SUBSTRING(string,start,length)

SELECT * , SUBSTRING(ContactNumber,1,2) CountryCode FROM Customer;

SELECT SUBSTRING('writing a query in SQL is easy',11,12);


--List Aggregation 
--SQL STRING_AGG() function is an aggregation function that is used to concatenate the string values 
-- It accepts 2 para str & seperator  concatenates the values of string expresiions & places seperator values between them 
--It returns a new concatenated string with the specified seperator 
--STRING_AGG(Exp,seperator)


SELECT * FROM Sales;

SELECT Country,STRING_AGG(Order_Date,',') Order_date_list FROM Sales GROUP BY Country;
