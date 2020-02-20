SELECT COUNT(*) FROM orders
WHERE state = 'Cancelled' AND (created_date  BETWEEN '2017-01-04 00:00:00' AND '2017-01-04 23:59:59');