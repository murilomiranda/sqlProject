-- What is the day with the highest amount of completed orders (and how many completed orders were placed that day)?
SELECT DAY(created_date), COUNT(*) AS count FROM orders 
WHERE state = "Completed"
GROUP BY DAY(created_date)
ORDER BY count
LIMIT 1;