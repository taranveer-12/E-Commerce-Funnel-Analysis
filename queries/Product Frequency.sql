SELECT description, SUM(quantity) AS total_units_sold
FROM retail_data
WHERE quantity > 0 AND invoice NOT LIKE 'C%'
GROUP BY description
ORDER BY total_units_sold DESC
LIMIT 10;
