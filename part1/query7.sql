/*SELECT COUNT(*) FROM orders 
WHERE YEAR(created_date) = 2017 AND MONTH(created_date) = 1;*/

SELECT * FROM orders
WHERE created_date BETWEEN '2017-01-01 00:00:00' AND '2017-01-31 23:59:59';