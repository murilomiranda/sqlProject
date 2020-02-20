SELECT MONTH(created_date), COUNT(*) FROM orders
GROUP BY MONTH(created_date);