SELECT description, COUNT(*) AS return_count
FROM retail_data
WHERE quantity < 0
GROUP BY description
ORDER BY return_count DESC
LIMIT 10;
