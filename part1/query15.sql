-- What is the day with the highest amount paid (and how much was paid that day)?
SELECT DAY(created_date) AS day_date, SUM(total_paid) AS sum_paid FROM orders
GROUP BY day_date
ORDER BY sum_paid DESC
LIMIT 1;