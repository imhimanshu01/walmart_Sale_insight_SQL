# 🛒 Walmart Sales Data Analysis using SQL

## 📘 Introduction

This project uses SQL to analyze Walmart's retail sales data with the goal of uncovering patterns in customer behavior, sales trends, and product performance. The analysis was performed on a structured dataset representing transactions from three different branches.

## 🎯 Project Goals

- Analyze sales trends across branches and products
- Identify high-performing categories and customer segments
- Evaluate VAT, revenue, and gross income across different time periods
- Support data-driven decisions using clear and efficient SQL queries

## 🧾 Dataset Summary

The dataset contains 1000 transaction records from three Walmart branches in **Yangon**, **Mandalay**, and **Naypyitaw**. Each entry provides detailed information about a customer purchase.

### 🧱 Key Columns

| Column Name             | Description                                |
|-------------------------|--------------------------------------------|
| `invoice_id`            | Unique transaction ID                      |
| `branch`                | Store code (A, B, or C)                    |
| `city`                  | Location of the store                      |
| `customer_type`         | Member or Normal customer                  |
| `gender`                | Customer’s gender                          |
| `product_line`          | Product category                           |
| `unit_price`            | Price per unit                             |
| `quantity`              | Number of items sold                       |
| `VAT`                   | 5% tax on COGS                             |
| `total`                 | Total amount paid (COGS + VAT)             |
| `date`                  | Date of transaction                        |
| `time`                  | Time of transaction                        |
| `payment_method`        | Payment method (e.g., Cash, Card)          |
| `cogs`                  | Cost of goods sold                         |
| `gross_margin_percentage` | Profit margin (%)                        |
| `gross_income`          | Total profit                               |
| `rating`                | Customer satisfaction rating (0–10)        |

## ⚙️ Process Overview

### 1️⃣ Data Preparation

- Created database and table using SQL  
- Inserted and validated 1000 rows of transaction data  
- Ensured data types and constraints (e.g., NOT NULL) for quality

### 2️⃣ Feature Engineering

- `time_of_day`: Categorized into Morning, Afternoon, Evening  
- `day_name`: Extracted day of the week from `date`  
- `month_name`: Extracted month from `date`  

### 3️⃣ Data Analysis Using SQL

Used SQL queries to explore:
- Revenue by product line and city  
- Customer preferences by gender and type  
- Time-based sales patterns  
- Average rating distribution across branches  

## ❓ Business Questions Answered

### 📍 General
- How many cities are represented in the dataset?  
- Which branches are in which cities?

### 📦 Products
- Which product line generates the most revenue?  
- Which category has the highest VAT?  
- Which product line performs best by gender?  
- Are product lines performing above or below average?

### 💰 Sales
- Which month had the highest total sales and COGS?  
- Which time of day brings in the most sales?  
- What is the most used payment method?

### 👥 Customers
- Which customer type (Normal or Member) brings more profit?  
- Gender-wise and time-wise distribution of ratings  
- Most common customer segment and behavior

## 💸 Revenue & Profit Calculation

```text
COGS = unit_price × quantity  
VAT = 5% × COGS  
Total = COGS + VAT  
Gross Income = Total - COGS  
Gross Margin % = Gross Income ÷ Total
