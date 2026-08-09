# Customer Purchase Behavior Analysis

## Overview

This project analyzes 1,994 retail orders across 2023 and 2024 to identify revenue drivers, profitability trends, customer behavior, regional performance, and potential data-quality issues. The project follows an end-to-end analytics workflow using Excel, SQL Server, Python, and Power BI.

## Business Problem

The objective of this project was to analyze customer and sales data to identify key revenue and profitability drivers, uncover underperforming products and customers, and provide actionable recommendations to support business decisions.

## Dataset

The original dataset contained 2,010 records across 15 columns. After removing 10 intentional duplicate records and 6 invalid zero-quantity transactions, 1,994 orders remained for analysis.

The dataset includes:

* Order ID
* Order Date
* Customer ID
* Customer Name
* Region
* State
* Category
* Sub-Category
* Product Name
* Quantity
* Unit Price
* Sales
* Profit
* Payment Method
* Segment

## Tools Used

* Excel
* SQL Server (SSMS)
* Python (pandas, matplotlib)
* Power BI

## Data Cleaning

The original dataset was cleaned and validated in Excel before analysis.

Key cleaning steps included:

* Removed 10 duplicate records to prevent double-counting.
* Removed 6 transactions with a quantity of zero because they represented invalid orders.
* Standardized inconsistent Region values such as "WEST", "west", and "West".
* Trimmed extra spaces from Category values.
* Replaced missing Customer Names with "Unknown Customer".
* Replaced missing Payment Methods with "Unknown".
* Verified date and numeric data types before analysis.
* Identified five $15,000 Sales values as potential data-quality errors after comparing Sales against Quantity × Unit Price.
* Retained missing Profit values rather than assuming they represented zero profit.

Missing numerical values were not automatically replaced with zero to avoid introducing unsupported assumptions. The 20 records with missing Profit values were excluded from profit-specific calculations while remaining available for other sales analyses.

## Analysis Workflow

### 1. Excel — Data Cleaning

Cleaned, standardized, and validated the raw dataset before analysis.

### 2. SQL Server — Data Analysis

Used SQL Server to calculate business metrics and analyze customer, product, regional, and profitability trends using:

* JOINs
* GROUP BY
* CASE WHEN
* Aggregate functions
* CTEs
* Subqueries
* Window functions

### 3. Python — Exploratory Data Analysis

Used pandas and matplotlib to explore:

* Revenue trends
* Profitability
* Customer behavior
* Product performance
* Regional performance
* Outliers and data-quality issues

### 4. Power BI — Visualization

Built an interactive dashboard to communicate key performance indicators, revenue trends, profitability, regional performance, and product-level insights.

## Dashboard

<img width="1024" height="592" alt="Customer_Purchase_Behavior_Analysis_BI" src="https://github.com/user-attachments/assets/c0dd2afb-52a0-4d74-babf-18c150437df8" />

## Executive Summary

* **$5.48M Total Revenue:** Generated across 1,994 orders between 2023 and 2024.
* **6.8% Revenue Growth:** Revenue increased from $2.65M in 2023 to $2.83M in 2024.
* **10.3% AOV Growth:** Average Order Value increased from $2,613.45 to $2,882.82.
* **$671.5K Net Profit:** Overall profit margin was 12.26%.
* **Profit Leakage:** 448 orders (22.47%) generated negative profit, resulting in $60,419.93 in total losses.

## Key Findings

### Category & Product Performance

* **Technology** generated the highest category revenue at $1.89M while maintaining the strongest category profit margin at 13.20%.
* **Keyboards and Monitors** were strong margin contributors. The Samsung View monitor achieved an 18.28% profit margin, while the Keychron K2 generated $28,439 in profit.
* **Paper** was the leading Office Supplies category by sales volume, generating $532.8K in sales and approximately $60K in profit.
* **2-inch Binders** had the lowest profit margin at 6.45%, with 19 of 44 orders generating negative profit.
* **Brother HL Printers** and **Logitech M185 Mice** also showed below-average margins of 9.17% and 8.12%, respectively.

### Regional & Customer Performance

* **East ($1.45M)** and **West ($1.42M)** generated the highest regional revenue.
* **South** achieved the highest regional profit margin at 12.80%, indicating stronger margin efficiency despite lower total revenue.
* **CUST1145** was the highest-spending customer at $48,455.42 across 13 orders but generated a net loss of $36.99, highlighting a potential pricing or discounting issue.

### Payment Method Performance

* **PayPal** generated the highest profit margin at 13.34%, compared with Credit Card (12.09%), Debit Card (12.06%), and Cash (11.63%).

## Data Quality Findings

Five orders contained a Sales value of exactly $15,000 that conflicted with their Quantity × Unit Price calculation:

* 100330
* 100817
* 101258
* 101262
* 101312

For example, Order 100330 contained one unit of Gel Pens at $15.99 but reported $15,000 in Sales.

These records were identified as potential data-quality errors and should be investigated before using the data for financial reporting or predictive modeling.

Additionally:

* 20 records had missing Profit values.
* 10 records had an Unknown Payment Method.

## Recommendations

### Reduce Unprofitable Orders

Audit discounting and pricing practices for Binders, Printers, and low-margin peripherals to reduce the $60.4K in losses generated by negative-profit orders.

### Review High-Value Customer Pricing

Review pricing and discount structures for high-volume customers such as CUST1145 to ensure high sales volume translates into positive contribution margins.

### Prioritize High-Margin Technology Products

Increase marketing and promotional focus on high-margin sub-categories such as Keyboards and Monitors, which consistently produced stronger margins.

### Strengthen Data Quality Controls

Investigate the five $15,000 Sales anomalies and establish validation checks comparing Sales against Quantity × Unit Price before future analysis or reporting.

## Files

* `data/sales_data_raw.csv` — Original dataset
* `data/sales_data_cleaned.csv` — Cleaned dataset
* `sql/analysis_queries.sql` — SQL analysis queries
* `python/eda_analysis.py` — Python exploratory analysis
* `powerbi/customer_sales_dashboard.pbix` — Power BI dashboard
* `screenshots/dashboard.png` — Dashboard screenshot
