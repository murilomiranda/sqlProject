/* Let's explore Cancelled orders now. 
   We will try to find relationships between the state of the orders and the category & brand of the products in those orders.
   First, we will connect each product (sku) from the line_item table to the orders table. 
   We only want sku that have been in any order. This table will contain duplicates, and we're ok with that. 
   We will group and count this information later. */

SELECT * FROM line_item a
RIGHT JOIN orders b
ON a.id_order = b.id_order;
