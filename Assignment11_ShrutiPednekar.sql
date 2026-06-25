CREATE DATABASE Assignment11;

--Create Orders table that contains OrderID , Date or Order and amount that is price of the order 
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
OrderDate DATE,
Amount DECIMAL(10,2)
);

--Insert the 
INSERT INTO Orders (OrderID, OrderDate, Amount) VALUES
(1, '2024-11-01', 250.50),
(2, '2024-11-02', 300.75),
(3, '2024-11-03', 150.25);


--1.a) Amount to String: Convert the Amount column to a textual string.
SELECT CAST(Amount AS CHAR(10)) AS AmountText FROM Orders;

--The query will change the data type from int to char and gives output as AmountText column name 
/*
This will help in business analytics as : 
It allows analysts to bucket transactions by structural patterns
using LIKE filters, such as scanning for rounded fraud indicators 
(e.g., values ending exactly in .00) or analyzing the psychological 
conversion rates of retail ending strategies (e.g., pricing ending in .99).

It enables clean behavioral text-matching, letting you easily group 
and segment orders into categorical text tags (like "High Value" vs "Low Value") 
to feed directly into automated customer loyalty
and marketing analytics funnels.
*/

--2.b) Date to String: Format OrderDate as a string (e.g., 'YYYY-MM-DD').
SELECT FORMAT(OrderDate, 'yyyy-MM-dd') AS OrderDateText FROM Orders;

 /* 
 This query standardizes each purchase date into a uniform Year-Month-Day text format (like 2024-11-01)
 while stripping away hidden time stamps. This ensures clean, reliable data that external reporting tools
 like Excel or Power BI can easily read without formatting errors.
  
 It allows analysts to group and count sales by standardized calendar text blocks (like Year or Month) 
 to track seasonal revenue growth and historical sales trends.
 
It standardizes mixed date formats into one clean layout, 
 preventing errors when merging transaction files with external 
 business tools like Tableau, Power BI
 */

 --3. c) String to Date: Convert literal '2024-11-05' into a DATE type.
 SELECT CAST('2024-11-05' AS DATE) AS ConvertedDate;

 /*
 This query transforms a plain text string ('2024-11-05') into an official 
 SQL DATE data type so the database can safely use it for chronological sorting,
 calendar math, and time-based filtering.

It unlocks time-based business metrics by turning text into live dates, 
allowing analysts to calculate customer delivery speeds, order lead times, 
and employee performance windows.

It enables precise cohort analysis and seasonal 
revenue filtering, ensuring the system can accurately
compare current sales performance against fixed historical business milestones.
*/


--4. d) Extract Year: Retrieve the year component from OrderDate.
SELECT YEAR(OrderDate) AS OrderYear FROM Orders;

/*
It will useful for get the analysis based on the year

It allows analysts to calculate year-over-year (YoY) revenue growth and 
evaluate long-term business scaling by grouping historical sales performance into annual blocks.

It helps executives identify macro-level market trends, establish annual budget baselines, 
and measure the long-term success of multi-year corporate strategy shifts.
*/

--The query gives the error that its not getting the built in funtion date format 
-- 5. e) Concatenate Fields: Combine OrderDate and Amount into one string.
--SELECT CONCAT(DATE_FORMAT(OrderDate, '%Y-%m-%d'), ' - $', Amount) AS Summary FROM Orders;



-- 5. e) Concatenate Fields: Combine OrderDate and Amount into one string.
SELECT CONCAT(FORMAT(OrderDate, 'yyyy-MM-dd'), ' - $', Amount) AS Summary FROM Orders;

/*
This will be helpful for making summary by the proper data that we want 

This query simplifies reporting by turning messy raw timestamps and numbers into clean,
human-readable text strings.

It merges the date and currency into a single column, 
making the data instantly ready for business dashboards or user notifications.
 
 */


 --ID & Amount Concatenation
 -- Combines the OrderID and Amount into a clear reference label
SELECT CONCAT('Order', OrderID,' | Price: $', Amount) AS OrderLabel FROM Orders;

-- Converts the date and amount into a complete readable business sentence
SELECT CONCAT('On ', FORMAT(OrderDate, 'MMMM dd, yyyy'), ', an order of $', Amount, ' was placed.') AS GetSummary FROM Orders;

-- Creates a compact system code using the day number and the order ID
--The code having date and order ID in concatenation
SELECT CONCAT(FORMAT(OrderDate, 'ddMMyy'), '-', OrderID) AS SystemCode FROM Orders;

-- Formats the day name and appends the dollar value for tracking weekday sales
SELECT CONCAT(FORMAT(OrderDate, 'dddd'), ' Sales: $', Amount) AS DayWiseSummary FROM Orders;

-- Extracts and converts the month name to capital letters alongside the order number
SELECT CONCAT('ORD-', OrderID, ' [', UPPER(FORMAT(OrderDate, 'MMM')), ']') AS MonthlyReference FROM Orders;


