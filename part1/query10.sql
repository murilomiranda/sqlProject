SELECT MONTH(created_date) AS month, COUNT(*) FROM orders
GROUP BY MONTH(created_date);