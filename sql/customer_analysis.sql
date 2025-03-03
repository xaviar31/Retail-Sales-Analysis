-- customer_analysis.sql
-- customer behavior analysis

-- gender based spending
SELECT `Gender`, SUM(COALESCE(`Total Amount`, 0)) AS total_spent
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY `Gender`
ORDER BY total_spent DESC;

-- spending trends by Age
SELECT 
  CASE 
    WHEN `Age` BETWEEN 18 AND 25 THEN '18-25'
    WHEN `Age` BETWEEN 26 AND 35 THEN '26-35'
    WHEN `Age` BETWEEN 36 AND 50 THEN '36-50'
    ELSE '50+' 
  END AS age_group, SUM(COALESCE(`Total Amount`, 0)) AS total_spent
FROM `retail-sales-analysis`.retail_sales_dataset
GROUP BY age_group
ORDER BY total_spent DESC;

