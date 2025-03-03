-- initial_query.sql
-- Data Exploration

-- view basic information from the dataset
SELECT * FROM `retail-sales-analysis`.retail_sales_dataset;

-- check distinct product categories
SELECT DISTINCT 'Product Category' FROM `retail-sales-analysis`.retail_sales_dataset;

-- count total transactions
SELECT COUNT(*) AS total_transactions FROM `retail-sales-analysis`.retail_sales_dataset;

-- total revenue
SELECT SUM(COALESCE(`Total Amount`, 0)) AS total_revenue FROM `retail-sales-analysis`.retail_sales_dataset;
