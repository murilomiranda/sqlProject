/* Our first query should return the "sku", "product_quantity", "date" and "unit_price" from the line_item table 
   together with the "name" and the "price" of each product from the "products" table. 
   We want only products present in both tables. */
   
SELECT a.sku, product_quantity, date, unit_price, name_en, price 
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku;


/* You might notice that the unit_price from the line_item table and the price from the product table is not the same. 
   Let's investigate that! Extend your previous query by adding a column with the difference in price. 
   Name that column price_difference.*/

SELECT a.sku, product_quantity, date, unit_price, name_en, price, price - unit_price AS price_diff
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku;


/* Build a query that outputs the price difference that you just calculated, grouping products by category. 
   Round the result.*/
   
SELECT manual_categories, ROUND(SUM(price - unit_price), 2) AS sum_price_diff
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku
GROUP BY manual_categories;


/* Create the same query as before (calculating the price difference between the line_item and the products tables, 
but now grouping by brands instead of categories.*/

SELECT brand, CAST(SUM(price - unit_price) AS DECIMAL(10, 2)) AS sum_price_diff 
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku
GROUP BY brand;


/* Let's focus on the brands with a big price difference: run the same query as before, 
   but now limiting the results to only brands with an avg_price_dif of more than 50000. 
   Order the results by avg_price_dif (bigger to smaller).*/

SELECT brand, AVG(ABS(price - unit_price)) AS avg_price_dif
FROM line_item a 
INNER JOIN products b ON a.sku = b.sku
GROUP BY brand
HAVING avg_price_dif > 50000
ORDER BY avg_price_dif DESC;


/* Let's explore Cancelled orders now. 
   We will try to find relationships between the state of the orders and the category & brand of the products in those orders.
   First, we will connect each product (sku) from the line_item table to the orders table. 
   We only want sku that have been in any order. This table will contain duplicates, and we're ok with that. 
   We will group and count this information later. */

SELECT * FROM line_item a
RIGHT JOIN orders b
ON a.id_order = b.id_order;
 
 
/* Now, add to the previous query the brand and the category from the products table to this query. */

SELECT a.id_order, created_date, state, total_paid, a.sku, unit_price, brand, manual_categories FROM line_item a
RIGHT JOIN orders b
ON a.id_order = b.id_order
INNER JOIN products c
ON a.sku = c.sku;


/*Let's keep working on the same query: now we want to keep only Cancelled orders. 
  Modify this query to group the results from the previous query, first by category and then by brand, 
  adding in both cases a count so we know which categories and which brands are most times present in Cancelled orders.*/

SELECT manual_categories, brand, COUNT(*) FROM line_item a
RIGHT JOIN orders b
ON a.id_order = b.id_order
INNER JOIN products c
ON a.sku = c.sku
WHERE state = "Cancelled"
GROUP BY manual_categories, brand;


SELECT manual_categories, brand, COUNT(*) FROM line_item a
INNER JOIN orders b
ON a.id_order = b.id_order
INNER JOIN products c
ON a.sku = c.sku
WHERE state = 'Cancelled'
GROUP BY manual_categories, brand;