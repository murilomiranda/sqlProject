/* Let's focus on the brands with a big price difference: run the same query as before, 
   but now limiting the results to only brands with an avg_price_dif of more than 50000. 
   Order the results by avg_price_dif (bigger to smaller).*/

SELECT brand, AVG(price - unit_price) AS avg_price_dif
FROM line_item a 
INNER JOIN products b ON a.sku = b.sku
GROUP BY brand
HAVING avg_price_dif > 50000
ORDER BY avg_price_dif DESC;
