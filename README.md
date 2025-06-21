#🛍 Walmart Sales Data Insights using SQL
📘 Overview
This project is focused on analyzing Walmart retail sales data using SQL to uncover patterns in product performance, customer behavior, and branch-level sales trends. By performing feature engineering and answering key business questions, the goal is to deliver data-driven insights that can help shape effective sales and marketing strategies.

The dataset simulates transaction-level data from Walmart branches located in three different cities and includes a variety of features like invoice details, product lines, customer types, VAT, total cost, and ratings.

🎯 Objectives
Identify high-performing branches and products

Understand customer behavior by type, time, and payment method

Analyze trends in revenue, profit, and taxes over time

Segment performance based on gender, city, and product lines

Perform profit margin calculations and rating insights

📊 Dataset Description
The dataset contains 1000 sales records with the following fields:

Field Name	Description
invoice_id	Unique identifier for each transaction
branch	Branch code where transaction occurred
city	City location of the branch
customer_type	Member or Normal customer
gender	Gender of the buyer
product_line	Category of the product purchased
unit_price	Price per item
quantity	Quantity purchased
VAT	Value-added tax on the purchase
total	Final billed amount (with VAT)
date	Date of transaction
time	Time of purchase
payment_method	Mode of payment (Cash, Card, etc.)
cogs	Cost of goods sold (before tax)
gross_margin_percentage	Profit margin as % of total
gross_income	Total profit earned
rating	Customer rating out of 10

⚙️ Approach
1. 🔍 Data Preparation
Created database and structured tables with NOT NULL constraints to maintain data integrity

Inserted sample data and verified for completeness (no null values)

2. 🛠 Feature Engineering
To enhance analysis:

Extracted time_of_day (Morning, Afternoon, Evening) from the timestamp

Added day_name (Mon–Sun) to understand weekly patterns

Added month_name to monitor monthly trends

3. 📈 Business Insights
Used SQL queries to answer real-world business questions:

✅ General
Count of unique cities and branch locations

📦 Product
Most popular product line by revenue

VAT contribution per product

Sales classification ("Good" or "Bad") based on average performance

Gender preference by product line

💰 Sales
Revenue trends by month, branch, and time of day

Branch-wise and city-wise tax collection

Time slots with highest purchase frequency

👥 Customers
Distribution of customer types

Gender breakdown per branch

Which customers generate more revenue and higher VAT

Ratings trend based on time and day

💡 Revenue & Profit Calculations
Key financial metrics were computed as follows:

COGS = unit_price × quantity

VAT = 5% × COGS

total = COGS + VAT

gross_income = total - COGS

gross_margin % = gross_income ÷ total

🧾 Sample SQL Snippet
sql
Copy
Edit
-- Get top-selling product lines by revenue
SELECT product_line, SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
For full SQL logic and detailed queries:
📂 View SQL Code on GitHub

🧠 Tools & Tech
SQL (MySQL/PostgreSQL)

Data extracted from Kaggle

GitHub for version control and collaboration

📌 Conclusion
By applying SQL for detailed EDA, this project demonstrates how structured query logic can transform raw transactional data into meaningful business insights — helping stakeholders make informed decisions in retail environments.
