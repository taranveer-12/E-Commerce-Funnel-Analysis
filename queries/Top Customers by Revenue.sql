SELECT customer_id, ROUND(SUM(quantity * price)::numeric, 2) AS total_spent
FROM retail_data
WHERE customer_id IS NOT NULL AND invoice NOT LIKE 'C%'
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
