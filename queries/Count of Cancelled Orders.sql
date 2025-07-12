SELECT COUNT(DISTINCT invoice) AS cancelled_orders
FROM retail_data
WHERE invoice LIKE 'C%';
