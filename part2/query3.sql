/* Build a query that outputs the price difference that you just calculated, grouping products by category. 
   Round the result.*/
   
SELECT manual_categories, ROUND(price - unit_price, 2) AS price_diff
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku
ORDER BY manual_categories
LIMIT 8;

SELECT * FROM line_item;
SELECT * FROM products;