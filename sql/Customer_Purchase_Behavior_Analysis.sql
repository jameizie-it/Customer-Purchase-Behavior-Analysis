-------------------------------------------------------------------------------
-- Portfolio Project: Customer Purchase Behavior Analysis
-- Database Engine: Microsoft SQL Server
-- Author: Jameizie Guzman
-- Description: Exploratory data analysis assessing regional revenue, customer 
--              concentration, category contribution, and transaction metrics.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Query 1: Regional Sales Distribution
-- Business Purpose: Identify highest-performing sales territories to evaluate
--                   regional resource allocation.
-------------------------------------------------------------------------------
select
	Region,
	sum(sales) as Total_Sales
from sales_data_cleaned
group by Region
order by Total_Sales desc;


-------------------------------------------------------------------------------
-- Query 2: Top 10 High-Value Customers
-- Business Purpose: Isolate top-tier customers for targeted retention 
--                   and VIP loyalty programs.
-------------------------------------------------------------------------------
select top 10
	Customer_Name,
	sum(sales) as Total_Sales
from sales_data_cleaned
group by Customer_Name
order by Total_Sales desc;


-------------------------------------------------------------------------------
-- Query 3: Product Category Revenue Contribution
-- Business Purpose: Compare revenue output across product categories to guide
--                   inventory prioritization.
-------------------------------------------------------------------------------
select 
	Category,
	sum(sales) as Total_Sales
from sales_data_cleaned
group by Category
order by Total_Sales desc;


-------------------------------------------------------------------------------
-- Query 4: Monthly Revenue Growth & Seasonality
-- Business Purpose: Track revenue performance over time to detect seasonal 
--                   trends and historical growth.
-------------------------------------------------------------------------------
select
	year(order_date) as OrderYear,
	month(order_date) as OrderMonth,
	sum(sales) as Total_Sales
from sales_data_cleaned
group by 
	year(order_date),
	month(order_date)
order by
	OrderYear,
	OrderMonth;


-------------------------------------------------------------------------------
-- Query 5: Core Financial Metric — Average Order Value (AOV)
-- Business Purpose: Establish overall mean basket size per order.
-------------------------------------------------------------------------------
select
	avg(sales) as AverageOrderValue
from sales_data_cleaned;