SELECT country, ROUND(SUM(quantity * price)::numeric, 2) AS revenue
FROM retail_data
WHERE invoice NOT LIKE 'C%'
GROUP BY country
ORDER BY revenue DESC;
