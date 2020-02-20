-- How many products per brand & products per category?
SELECT brand, COUNT(DISTINCT ProductId) AS num_prod FROM products
GROUP BY brand;

SELECT manual_categories, COUNT(DISTINCT ProductId) FROM products
GROUP BY manual_categories;