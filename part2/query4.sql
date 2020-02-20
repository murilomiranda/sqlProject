/* Create the same query as before (calculating the price difference between the line_item and the products tables, 
but now grouping by brands instead of categories.*/

SELECT brand, CAST(price - unit_price AS DECIMAL(10, 2)) AS price_diff 
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku
ORDER BY brand
LIMIT 8;