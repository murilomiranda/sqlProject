-- What's the name and description of the most expensive product per brand and per category?
SELECT name_en, short_desc_en FROM products
	WHERE price IN 
	(
		SELECT MAX(price) AS price FROM products
		GROUP BY brand
	);
     
SELECT name_en, short_desc_en FROM products
	WHERE price IN
     (
       SELECT MAX(price) AS price FROM products
       GROUP BY manual_categories
     );

SELECT * FROM products;