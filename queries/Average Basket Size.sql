SELECT ROUND(SUM(quantity)::NUMERIC / COUNT(DISTINCT invoice), 2) AS avg_basket_size
FROM retail_data
WHERE invoice NOT LIKE 'C%';
