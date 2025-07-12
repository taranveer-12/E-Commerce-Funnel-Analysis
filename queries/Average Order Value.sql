SELECT ROUND(SUM(quantity * price)::numeric / COUNT(DISTINCT invoice)::numeric, 2) AS average_order_value
FROM retail_data
WHERE invoice NOT LIKE 'C%';
