SELECT ROUND(SUM(quantity * price)::numeric, 2) AS total_revenue
FROM retail_data
WHERE invoice NOT LIKE 'C%';
