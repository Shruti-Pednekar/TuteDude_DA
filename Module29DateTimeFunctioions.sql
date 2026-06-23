--CURRENT DATE & TIME 

--CURRENT_TIMESTAMP ()-This returns current date & time , in 'YYYY-MM-DD hh:mm:ss:mmm' Format 

--GETDATE()- Returns current database system date & time in  'YYYY-MM-DD hh:mm:ss:mmm' Format 

--GETOUTDATE() - Returns current database system UTC date & time in  'YYYY-MM-DD hh:mm:ss:mmm' Format 

--SYSDATETIME() - Returns date & time of the computer where the SQL server is running 

SELECT CURRENT_TIMESTAMP;

SELECT GETDATE();

--Coordinated Universal Time 
SELECT GETUTCDATE();

SELECT SYSDATETIME() AS SysDateTime;

--DATEDIFF()-Returns the difference between 2 dates as an interger 
--DATEDIFF(interval,date1,date2)
--Interval may be the day / month / year 

SELECT DATEDIFF(year,'2003-09-05',GETDATE()) Age ;

--returns month
SELECT DATEDIFF(month,'2003-09-05',GETDATE()) Month ;

--returns day 
SELECT DATEDIFF(day,'2003-09-05',GETDATE()) Age ;

--return the age difference of 6 
SELECT DATEDIFF(year,'1997-09-07','2003-09-05')Age_Diff;

--Return 10 years diff 
SELECT DATEDIFF(year,'1997-09-07','2007-10-11')Age_Diff;

--Return 4 years diff
SELECT DATEDIFF(year,'2003-09-05','2007-10-11')Age_Diff;



--EXTRACT 
/*
DATEPART()-Returns a specified part of a date .
This function returns the result as an int val
DATEPART(interval,date)
2003-09-05 => This will return 9 if i have set month as an interval in int format 

*/

/*
DATENAME()-Returns a specified part of date 
This function returns the result as a string val 
DATENAME(interval,date)
Here it shows in String format like SEPT 

*/

/*
DAY()-Returns the day of the month (from 1 to 31) for specified date 
DAY(DATE)
it shows the Date 05 
We can do this for monthe and year also 

*/

/*
ISDATE()-Checks an expression & returns 1 if it is a valid date otherwise 0 .
ISDATE(expression)
*/

--This will return month as 9
SELECT DATEPART(MONTH,'2003-09-05')Month;

--This will return 2003 as year 
SELECT DATEPART(Year,'2003-09-05')Year;

--This will return 5 as date
SELECT DATEPART(DAY,'2003-09-05')DAY;

--This will return as September
SELECT DATENAME(MONTH,'2003-09-05')Month;

--Day as 5
SELECT DATENAME(DAY,'2003-09-05')DAY;

--Year as 2003
SELECT DATENAME(Year,'2003-09-05')Year;

--DAY Funtion - returns 25 
SELECT DAY('1997-02-25')DAY;

--Month funtion -returns 2 
SELECT MONTH('1997-02-25')Month;

--Year function - return 2003
SELECT YEAR('1997-02-23')Year;

--ISDATE()-
SELECT ISDATE('1997-02-32');

