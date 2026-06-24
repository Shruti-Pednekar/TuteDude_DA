
/*
Converting numbers , date to string 

1. CAST :The function converts a value (of any type) into a specified datatype
		Syntax=> CAST(expression AS datatype(length)
		-len is optional one 
2. CONVERT : Same definition as cast but syntax is different 
		Syntax=> CONVERT(data_type(length),expression,style)
		-len and style are optional 
Explore the W3School website advanced function to get more knowledge 
The style contains different codes for different formats 

* Convertnig float to real :
value  Explanation 
0		Max 6 digit (default)
1		8 digits
2		16 digits

* Converting money to char 
Value Explation 
0		No comma delimiters , 2 digits to the right to decimal 
1		comma delimiters , 2 digits to right of decimal
2		No comma delimiters , 4 digits to the right to decimal


*/

--This convert the decimal value into integer value and gives the output as 45 only 
SELECT CAST (45.8765 AS INT );

--Convert the string into date format 
SELECT CAST ('2026-06-24' AS DATETIME)AS DATE_TIME;

--This gives the greater precision
SELECT CAST ('2026-06-24' AS DATETIME2)AS DATE_TIME;

--this gives the date with hour , minutes and seconds 
SELECT CAST ('2026-06-24' AS SMALLDATETIME)AS DATE_TIME;

--This will change the datatype as varchar 
SELECT CAST (75.86 AS VARCHAR)AS CASTED_VALUE;

SELECT CONVERT (DATETIME,'2003-09-05');

--the query  is for converting $120 money into char so varchar is datatype with len 30 and 2 is for after precedence it will show 4 digits 
SELECT CONVERT (VARCHAR(30),$120,2);


DECLARE 
@Mon1 MONEY=$10000
SELECT @Mon1 
SELECT CONVERT(VARCHAR (30),@Mon1,2);


--TODATE funtion not support to ssms 
--the function accepts an arg of a char data type &  convert this val to DATETIME Function 

/*
SELECT customer_num,call_descr 
FROM cust_calls 
WHERE call_dtime = TO_DATE("2008-07-07 10:24",
"%Y-%m-%d %H:%M"
);

*/

--NOTE: Refer the IBM documentation for more info and w3school website .
