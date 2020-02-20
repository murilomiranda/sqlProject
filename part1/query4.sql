SELECT sku, product_quantity 
FROM line_item
ORDER BY product_quantity DESC
LIMIT 100;