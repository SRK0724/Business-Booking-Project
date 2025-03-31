
-- Retrieve all data from the bookings table  
SELECT * FROM bookings;

-- Total Bookings by Type  
-- Counting total bookings for each type and sorting by highest count  
SELECT Booking_Type, COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Booking_Type
ORDER BY Total_Bookings DESC;

-- Total & Average Revenue  
-- Calculating total and average booking price (rounded down using FLOOR)  
SELECT 
    FLOOR(SUM(Price)) AS Total_Revenue,
    FLOOR(AVG(Price)) AS Avg_Booking_Price
FROM bookings;

-- Most Popular Booking Type (Highest Revenue)  
-- Identifying the booking type that generates the most revenue  
SELECT Booking_Type, FLOOR(SUM(Price)) AS Total_Revenue
FROM bookings
GROUP BY Booking_Type
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Top 5 Repeat Customers  
-- Finding the customers who booked the most times  
SELECT Customer_Name, COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Customer_Name
ORDER BY Total_Bookings DESC
LIMIT 5;

-- Booking Trends by Time Slot  
-- Counting bookings for each time slot to identify peak hours  
SELECT Time_Slot, COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY Time_Slot
ORDER BY Total_Bookings DESC;

-- Find Missing Phone Numbers  
-- Selecting records where customer phone numbers are missing or empty  
SELECT * FROM bookings
WHERE customer_phone IS NULL OR Customer_Phone = '';

-- Monthly Revenue Trend  
-- Summing revenue per month to analyze monthly trends  
SELECT 
    DATE_FORMAT(Booking_Date, '%m') AS Month,
    SUM(Price) AS Total_Revenue
FROM bookings
GROUP BY Month
ORDER BY Month;

-- Average Booking Duration by Type  
-- Finding the average duration of each booking type  
SELECT Booking_Type, AVG(Duration) AS Avg_Duration
FROM bookings
WHERE Duration IS NOT NULL
GROUP BY Booking_Type
ORDER BY Avg_Duration DESC;

-- Customers with the Highest Spending  
-- Identifying the top 10 customers based on total amount spent  
SELECT Customer_Name, SUM(Price) AS Total_Spending
FROM bookings
GROUP BY Customer_Name
ORDER BY Total_Spending DESC
LIMIT 10;

-- Average Revenue Per Customer  
-- Calculating the average amount each customer spends per booking  
SELECT Customer_Name, AVG(Price) AS Avg_Spending
FROM bookings
GROUP BY Customer_Name
ORDER BY Avg_Spending DESC;
