-- final_analysis.sql

-- top spending customers
SELECT `Customer ID`, SUM(`Total Amount`) AS total_spent,
       ROW_NUMBER() OVER (ORDER BY SUM(`Total Amount`) DESC) AS 'rank'
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Customer ID`;

-- customer spending distribution
SELECT total_spent, COUNT(*) AS customer_count
FROM (
    SELECT `Customer ID`, SUM(`Total Amount`) AS total_spent
    FROM `retail-sales-analysis`.retail_sales_dataset
    GROUP BY `Customer ID`
) AS spending
GROUP BY total_spent
ORDER BY total_spent DESC;

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
