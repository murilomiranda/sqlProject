-- 1. Select the entire line_item table
SELECT * 
FROM line_item;

-- 1.1. Select only the first 10 rows from the line_item table
SELECT * 
FROM line_item
LIMIT 10;

-- 1.2 Select only the columns sku, unit_price and date from the line_item table (and only the first 10 rows)
SELECT sku, unit_price, date
FROM line_item
LIMIT 10;

-- 2. Count the total number of rows of the line_item table
SELECT COUNT(*) 
FROM line_item;

-- 2.1. Count the total number of unique "sku" from the line_item table
SELECT COUNT(DISTINCT sku)
FROM line_item;

-- 3. Generate a table with the average price of each sku
SELECT sku, AVG(unit_price)
FROM line_item
GROUP BY sku
ORDER BY sku;

-- 3.1.  …now name the column of the previous query with the average price "avg_price", 
-- and sort the list that you by that column (bigger to smaller price)
SELECT sku, AVG(unit_price) AS avg_price
FROM line_item
GROUP BY sku
ORDER BY avg_price DESC;

-- 4. Which products were bought in largest quantities? Select the “stock keeping unit” (sku) 
-- and product_quantity of the 100 products with the biggest "product quantity"
SELECT sku, product_quantity 
FROM line_item
ORDER BY product_quantity DESC
LIMIT 100;

-- 5. How many orders were placed in total?
SELECT COUNT(*) FROM orders;

-- 6. Make a count of orders by their state
SELECT state, COUNT(*) FROM orders
GROUP BY state;

-- 7. Select all the orders placed in January of 2017
SELECT *
FROM orders
WHERE created_date BETWEEN '2017-01-01 00:00:00' AND '2017-01-31 23:59:59';

-- 8. Count the number of orders of your previous select query (i.e. How many orders were placed in January of 2017?) 
SELECT COUNT(*) 
FROM orders
WHERE created_date BETWEEN '2017-01-01 00:00:00' AND '2017-01-31 23:59:59';

-- 9. How many orders were cancelled on January 4th 2017?
SELECT COUNT(*) 
FROM orders
WHERE state = 'Cancelled' AND (created_date  BETWEEN '2017-01-04 00:00:00' AND '2017-01-04 23:59:59');

-- 10. How many orders have been placed each month of the year?
SELECT MONTH(created_date) AS month, COUNT(*) 
FROM orders
GROUP BY month
ORDER BY month;

-- 11. What is the total amount paid in all the orders?
SELECT SUM(total_paid) FROM orders;

-- 12. What is the average amount paid per order?
SELECT AVG(total_paid) FROM orders;

-- 12.1 Give a result to the previous question with only 2 decimals
SELECT CAST(AVG(total_paid) AS DECIMAL(10, 2)) AS avg_paid FROM orders;

-- 13. What is the date of the newest order? And the oldest?
SELECT DATE(created_date) FROM orders ORDER BY created_date DESC
LIMIT 1;

SELECT DATE(created_date) FROM orders ORDER BY created_date 
LIMIT 1;

-- What is the day with the highest amount of completed orders (and how many completed orders were placed that day)?
SELECT DAY(created_date) AS day_date, COUNT(*) AS count 
FROM orders 
WHERE state = "Completed"
GROUP BY day
ORDER BY count
LIMIT 1;

-- What is the day with the highest amount paid (and how much was paid that day)?
SELECT DAY(created_date) AS day_date, SUM(total_paid) AS sum_paid FROM orders
GROUP BY day_date
ORDER BY sum_paid DESC
LIMIT 1;

-- How many products are there?
SELECT COUNT(DISTINCT ProductId) FROM products;

-- How many brands?
SELECT COUNT(DISTINCT brand) FROM products;

-- How many categories?
SELECT COUNT(DISTINCT manual_categories) FROM products;

-- How many products per brand & products per category?
SELECT brand, COUNT(DISTINCT ProductId) AS num_prod FROM products
GROUP BY brand;

SELECT manual_categories, COUNT(DISTINCT ProductId) FROM products
GROUP BY manual_categories;

-- What's the average price per brand and the average price per category?
SELECT brand, AVG(price) AS avg_price FROM products
GROUP BY brand;

SELECT manual_categories, AVG(price) AS avg_price FROM products
GROUP BY manual_categories;

-- What's the name and description of the most expensive product per brand and per category?
SELECT a.name_en, a.short_desc_en FROM products AS a
INNER JOIN (
    SELECT brand, MAX(price) AS price
    FROM products
    GROUP BY brand
) AS b 
ON a.brand = b.brand AND a.price = b.price;

SELECT name_en, short_desc_en  FROM products AS a
INNER JOIN  (
		SELECT manual_categories, MAX(price) AS price 
        FROM products
		GROUP BY manual_categories
) AS b 
ON a.manual_categories = b.manual_categories AND a.price = b.price;
