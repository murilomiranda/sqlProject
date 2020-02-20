-- the oldest order
SELECT * FROM orders
ORDER BY created_date 
LIMIT 1;

-- the newest order
SELECT * FROM orders
ORDER BY created_date DESC
LIMIT 1;