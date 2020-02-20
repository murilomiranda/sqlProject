/* Our first query should return the "sku", "product_quantity", "date" and "unit_price" from the line_item table 
   together with the "name" and the "price" of each product from the "products" table. 
   We want only products present in both tables. */
   
SELECT a.sku, product_quantity, date, unit_price, name_en, price 
FROM line_item a
INNER JOIN products b
ON a.sku = b.sku 
LIMIT 8;


SELECT * FROM products
LIMIT 10;