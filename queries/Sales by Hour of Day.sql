SELECT EXTRACT(HOUR FROM invoice_date::timestamp) AS hour,
       ROUND(SUM(quantity * price)::numeric, 2) AS revenue
FROM retail_data
WHERE invoice NOT LIKE 'C%'
GROUP BY hour
ORDER BY hour;
