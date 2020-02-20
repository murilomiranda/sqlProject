/*Let's keep working on the same query: now we want to keep only Cancelled orders. 
  Modify this query to group the results from the previous query, first by category and then by brand, 
  adding in both cases a count so we know which categories and which brands are most times present in Cancelled orders.*/

SELECT brand, manual_categories, COUNT(*) FROM line_item a
RIGHT JOIN orders b
ON a.id_order = b.id_order
INNER JOIN products c
ON b.sku = c.sku
WHERE state = "Cancelled"
GROUP BY manual_categories, brand;