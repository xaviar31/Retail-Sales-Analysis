-- sales_trends.sql
-- trends in sales

-- Monthly sales trends
SELECT 
  MONTH(`Date`) AS month, 
  YEAR(`Date`) AS year, 
  SUM(COALESCE(`Total Amount`, 0)) AS total_sales
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY year, month
ORDER BY year, month;

-- Best selling products by total sales
SELECT `Product Category`, SUM(COALESCE(`Total Amount`, 0)) AS total_sales
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_sales DESC;

-- top selling products by purchase count
SELECT `Product Category`, COUNT(*) AS purchase_count
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Product Category`
ORDER BY purchase_count DESC
LIMIT 5;

-- avg price per unit for products
SELECT `Product Category`, AVG(`Price per Unit`) AS avg_price
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Product Category`
ORDER BY avg_price DESC;
