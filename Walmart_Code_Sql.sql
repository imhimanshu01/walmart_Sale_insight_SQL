-- Active: 1750260525800@@127.0.0.1@3306@walmart
Create database CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create table
CREATE TABLE IF NOT EXISTS sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_pct FLOAT(11, 9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- Data cleaning
SELECT * FROM sales;

---------------------------------------------------------------------------------------
-- Add the time_of_day column
SELECT time, (
        CASE
            WHEN `time` BETWEEN "00:00:00" AND "12:00:00"  THEN "Morning"
            WHEN `time` BETWEEN "12:01:00" AND "16:00:00"  THEN "Afternoon"
            ELSE "Evening"
        END
    ) AS time_of_day
FROM sales;

---Add Table Column
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET
    time_of_day = (
        CASE
            WHEN `time` BETWEEN "00:00:00" AND "12:00:00"  THEN "Morning"
            WHEN `time` BETWEEN "12:01:00" AND "16:00:00"  THEN "Afternoon"
            ELSE "Evening"
        END
    );

-- Add day_name column
SELECT date, DAYNAME(date) FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales SET day_name = DAYNAME(date);

-- Add month_name column
SELECT date, MONTHNAME(date) FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales SET month_name = MONTHNAME(date);

----------------------------------------------------------------------------------------
------------------------------------------Normal----------------------------------------
----------------------------------------------------------------------------------------
-- 1.How many unique cities does the data have?
SELECT DISTINCT city FROM sales;

-----------------------------------------------------------------------------------------
-- 2.In which city is each branch?

SELECT DISTINCT city, branch FROM sales;

----------------------------------------------------------------------------------------
-------------------------------------------- Product -----------------------------------
----------------------------------------------------------------------------------------
-- 3.How many unique product lines does the data have?

SELECT DISTINCT product_line FROM sales;

-----------------------------------------------------------------------------------------
-- 4.What is the most selling product line?

SELECT SUM(quantity) as qty, product_line
FROM sales
GROUP BY
    product_line
ORDER BY qty DESC;

----------------------------------------------------------------------------------------
-- 5.What is the total revenue by month?

SELECT month_name AS month, SUM(total) AS total_revenue
FROM sales
GROUP BY
    month_name
ORDER BY total_revenue;

-----------------------------------------------------------------------------------------
-- 6.What month had the largest COGS?
SELECT month_name AS month, SUM(cogs) AS cogs
FROM sales
GROUP BY
    month_name
ORDER BY cogs;

------------------------------------------------------------------------------------------
-- 7.What product line had the largest revenue?

SELECT product_line, SUM(total) as total_revenue
FROM sales
GROUP BY
    product_line
ORDER BY total_revenue DESC;

-----------------------------------------------------------------------------------------
-- 8.What is the city with the largest revenue?

SELECT branch, city, SUM(total) AS total_revenue
FROM sales
GROUP BY
    city,
    branch
ORDER BY total_revenue;

--------------------------------------------------------------------------------------
-- 9.What product line had the largest VAT?
SELECT product_line, AVG(tax_pct) as avg_tax
FROM sales
GROUP BY
    product_line
ORDER BY avg_tax DESC;

--------------------------------------------------------------------------------------
----- 10.product_line Shows "Good" And "Bad" If Greater Then Avg Sales

Select
    Product_line,
    avg(quantity) as Avg_,
    case
        When Avg(quantity) > 6 THEN "Good"
        Else "BAd"
    End As Remark
from walmart.sales
Group By
    product_line

--------------------------------------------------------------------------------------
-- 11.Which branch sold more products than average product sold?

SELECT Branch, avg(quantity) as avg_qty
from walmart.sales
GROUP BY
    branch
Having
    sum(quantity) > (
        SELECT avg(quantity)
        from walmart.sales
    )

-----------------------------------------------------------------------------------
-- 12.What is the most common product line by gender?

Select Gender, Product_line, Count(*) As COUNT
From walmart.sales
GROUP BY
    Gender,
    product_line
ORDER BY Count DESC;

-----------------------------------------------------------------------------------
-- 13.What is the average rating of each product line?

SELECT product_line, ROUND(avg(rating), 2) as Avg_rating
From walmart.sales
GROUP BY
    product_line
ORDER BY avg_rating DESC;

-----------------------------------------------------------------------------------
-----------------------------Coustomer Type Questions------------------------------
------------------------------------------------------------------------------------
-- 14.How many unique customer types does the data have?

SELECT DISTINCT customer_type From walmart.sales;

------------------------------------------------------------------------------------
-- 15.How many unique payment methods does the data have?

SELECT DISTINCT Payment From walmart.sales;

------------------------------------------------------------------------------------
-- 16.What is the most common customer type?

SELECT Customer_type, Count(*) As COUNT
From walmart.sales
GROUP BY
    customer_type
Order by Count DESC;

------------------------------------------------------------------------------------
-- 17.What is the gender of most of the customers?

SELECT gender, Count(*) as COUNT
From walmart.sales
GROUP BY
    gender
ORDER BY Count DESC

------------------------------------------------------------------------------------
-- 18.What is the gender distribution per branch?

SELECT gender, COUNT(*) as COUNT, Branch
From walmart.sales
WHERE
    branch = "A"
GROUP BY
    gender
ORDER BY COUNT DESC

----------------------------------------------------------------------------------------
-- 19.Which time of the day do customers give most ratings?

SELECT time_of_day, avg(rating) as avg_rat
FROM sales
GROUP BY
    time_of_day
ORDER BY avg_rat DESC;

----------------------------------------------------------------------------------------
-- 20.Which time of the day do customers give most ratings per branch?

SELECT branch, time_of_day, avg(rating) as avg_rat
From sales
where
    branch = "a"
GROUP BY
    Time_of_day,
    branch
ORDER BY avg_rat DESC;

----------------------------------------------------------------------------------------
-- 21.Which day fo the week has the best avg ratings?

SELECT day_name, AVG(rating) AS avg_rating
FROM sales
GROUP BY
    day_name
ORDER BY avg_rating DESC;

--------------------------------------------------------------------------------------
-- 22.Which day of the week has the best average ratings per branch?

SELECT day_name, branch, COUNT(day_name) total_sales
FROM sales
WHERE
    branch = "C"
GROUP BY
    day_name
ORDER BY total_sales DESC;

---------------------------------------------------------------------------------------
------------------------------- Sales -------------------------------------------------
---------------------------------------------------------------------------------------

-- 23.Number of sales made in each time of the day per weekday

SELECT
    time_of_day,
    Day_name,
    COUNT(*) AS total_sales
FROM sales
WHERE
    day_name = "Monday"
GROUP BY
    time_of_day
ORDER BY total_sales DESC;

----------------------------------------------------------------------------------------
-- 24.Which of the customer types brings the most revenue?

SELECT customer_type, SUM(total) AS total_revenue
FROM sales
GROUP BY
    customer_type
ORDER BY total_revenue;

----------------------------------------------------------------------------------------
-- 25.Which city has the largest tax/VAT percent?

SELECT city, ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY
    city
ORDER BY avg_tax_pct DESC;

----------------------------------------------------------------------------------------
-- 26.Which customer type pays the most in VAT?

SELECT customer_type, ROUND(AVG(tax_pct), 3) AS total_tax
FROM sales
GROUP BY
    customer_type
ORDER BY total_tax;