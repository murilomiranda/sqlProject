-- What's the average price per brand and the average price per category?
SELECT brand, AVG(price) AS avg_price FROM products
GROUP BY brand;

SELECT manual_categories, AVG(price) AS avg_price FROM products
GROUP BY manual_categories;