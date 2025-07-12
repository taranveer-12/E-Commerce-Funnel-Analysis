SELECT DATE(invoice_date::timestamp) AS day,
       ROUND(SUM(quantity * price)::numeric, 2) AS revenue
FROM retail_data
WHERE invoice NOT LIKE 'C%'
GROUP BY day
ORDER BY day;
