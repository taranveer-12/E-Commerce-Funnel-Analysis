SELECT customer_id, COUNT(DISTINCT invoice) AS invoice_count
FROM retail_data
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY invoice_count DESC
LIMIT 10;
