/* Now, add to the previous query the brand and the category from the products table to this query. */

SELECT a.id_order, created_date, state, total_paid, sku, unit_price, brand, manual_categories FROM line_item a
RIGHT JOIN orders b
ON a.id_order = b.id_order
INNER JOIN products c
ON b.sku = c.sku;