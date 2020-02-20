SELECT sku, AVG(unit_price)
FROM line_item
GROUP BY sku;