🛒 Walmart Sales Data Analysis using SQL
📌 Project Overview
This SQL-based project focuses on analyzing Walmart's retail transaction data to derive insights on product performance, customer behavior, branch-wise sales, and profitability. The goal is to use SQL to answer real-world business questions and support data-driven decision-making.

🎯 Objectives
Identify best-selling products and top-performing branches

Understand customer purchasing behavior by time, gender, and type

Analyze revenue, VAT, and profit trends across months and weekdays

Classify product lines and branches based on performance

🧾 Dataset Summary
The dataset contains 1000 records with sales data from 3 Walmart branches located in Mandalay, Yangon, and Naypyitaw. Each row captures a unique transaction with detailed financial and customer information.

🧱 Columns Included:
Column Name	Description
invoice_id	Unique identifier for each sale
branch	Store code (A, B, or C)
city	City location of the branch
customer_type	Normal or Member
gender	Customer gender
product_line	Product category
unit_price	Price per item
quantity	Number of items sold
VAT	5% tax applied to the purchase
total	Final billed amount (COGS + VAT)
date	Date of transaction
time	Time of transaction
payment_method	Payment type (e.g. Cash, Card, Ewallet)
cogs	Cost of goods sold
gross_margin_percentage	Profit margin %
gross_income	Profit earned on the sale
rating	Customer feedback rating (0–10)

⚙️ Approach & Methodology
#️⃣ 1. Data Preparation
Created a structured table using SQL CREATE TABLE statements

Applied NOT NULL constraints to ensure data completeness

Verified and cleaned data before analysis

#️⃣ 2. Feature Engineering
time_of_day column to analyze sales by Morning, Afternoon, Evening

day_name to understand busiest weekdays

month_name to track monthly trends in sales and profit

#️⃣ 3. Exploratory Data Analysis (EDA)
Executed multiple SQL queries to uncover patterns related to:

Product line performance

Sales trends by time and location

Customer type profitability

Gender-wise purchase behavior

VAT and gross income contributions

💼 Key Business Questions
🏙 Generic
How many unique cities are in the dataset?

Which branches are in which city?

📦 Product-Focused
Most popular product lines

Total monthly revenue

Product line with highest VAT contribution

Average rating by product line

Product line performance classification (Good/Bad)

💰 Sales Trends
Sales distribution by time of day

City with highest VAT collection

Most profitable customer type

👥 Customer Behavior
Most frequent customer type

Gender distribution across branches

Time and day when customers give the most ratings

🧮 Revenue & Profit Calculations
text
Copy
Edit
COGS = unit_price × quantity  
VAT = 5% of COGS  
Total (gross sales) = COGS + VAT  
Gross Income = Total - COGS  
Gross Margin % = (Gross Income ÷ Total)
Example:
Unit Price = ₹45.79, Quantity = 7

COGS = 45.79 × 7 = ₹320.53

VAT = 5% of 320.53 = ₹16.0265

Total = ₹336.56

Gross Margin = 16.0265 / 336.56 ≈ 4.76%

📂 Sample SQL Query
sql
Copy
Edit
-- Revenue by product line
SELECT product_line, SUM(total) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue DESC;
🛠 Tools Used
SQL (MySQL or PostgreSQL)

Kaggle Dataset

GitHub for version control

🔗 Project Repository
Check the full SQL code and queries here:
👉 SQL_queries.sql

✅ Conclusion
Through this project, SQL was used to transform retail transaction data into valuable business insights. The analysis supports better understanding of customer preferences, revenue drivers, and operational patterns—making it an ideal starting point for retail data analytics.
