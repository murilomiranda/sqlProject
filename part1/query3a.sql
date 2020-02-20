SELECT sku, AVG(unit_price) AS avg_price
FROM line_item
GROUP BY sku
ORDER BY avg_price DESC;