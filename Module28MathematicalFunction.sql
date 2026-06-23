
--CEIL()=>This returns the nearest smallest int that is >=num
--FLOOR()=>This returns the largest int value <=num

--Gives output as 5 
SELECT CEILING(4.3) as CEIL_Value;

--Gives output as 4 
SELECT FLOOR(4.3) AS FLOOR_Value;

--RAND()=>Returns a random number between 0 (inclusive) & 1 (Exclusive ) 

--Return a random decimal num >=4 and <10
--4=a & 10=b
--0-(b-a)+a
SELECT RAND()*(10-4)+4;

--Return a random int num >=4 and <=10 
--(b-a+1)+4
SELECT FLOOR(RAND()*(10-4+1))+4;


--random number shows but not changing it remains same 
SELECT  RAND(5);



--ROUND () function 
--Round(number ,Decimals ,operations )

--Gives op as 4567.1900 
SELECT ROUND(4567.1876,2);

--Truncate the vals after decimal others not change any thing 
SELECT ROUND(4567.1876,2,1);


SELECT ROUND(2246.78967,2);

SELECT ROUND(2246.78967,3,1);


--POWER ()
--Returns the value of a number raised to the power of another num 
--POWER(a,b)
--a is base & b is exponent 

SELECT POWER(4,3)as POWER_RESULT;


SELECT * FROM Orderss;

SELECT * , POWER(Amount,2)AS Squared_Amt FROM Orderss; ;


