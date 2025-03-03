-- final_analysis.sql

-- top spending customers
SELECT `Customer ID`, SUM(`Total Amount`) AS total_spent,
       RANK() OVER (ORDER BY SUM(`Total Amount`) DESC) AS 'rank'
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Customer ID`;

-- running total sales month by month
SELECT 
  MONTH(`Date`) AS month, 
  YEAR(`Date`) AS year, 
  SUM(`Total Amount`) AS total_sales,
  SUM(SUM(`Total Amount`)) OVER (PARTITION BY YEAR(`Date`) ORDER BY MONTH(`Date`)) AS running_total
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY year, month
ORDER BY year, month;

-- total revenue for each catergory every month
SELECT 
  `Product Category`, 
  MONTH(`Date`) AS month, 
  YEAR(`Date`) AS year, 
  SUM(`Total Amount`) AS total_sales
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Product Category`, year, month
ORDER BY year, month, total_sales DESC;
