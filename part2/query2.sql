/* You might notice that the unit_price from the line_item table and the price from the product table is not the same. 
   Let's investigate that! Extend your previous query by adding a column with the difference in price. 
   Name that column price_difference.*/

SELECT a.sku, product_quantity, date, unit_price, name_en, price, price - unit_price AS price_diff
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku
LIMIT 8;