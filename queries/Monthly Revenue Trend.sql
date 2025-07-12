SELECT DATE_TRUNC('month', invoice_date::timestamp) AS month,
       ROUND(SUM(quantity * price)::numeric, 2) AS revenue
FROM retail_data
WHERE invoice NOT LIKE 'C%'
GROUP BY month
ORDER BY month;
