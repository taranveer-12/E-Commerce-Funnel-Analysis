SELECT description, ROUND(SUM(quantity * price)::numeric, 2) AS revenue
FROM retail_data
WHERE invoice NOT LIKE 'C%' AND quantity > 0
GROUP BY description
ORDER BY revenue DESC
LIMIT 10;
