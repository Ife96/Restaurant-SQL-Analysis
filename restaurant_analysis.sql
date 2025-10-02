-- Question 1 : Exploring the data

SELECT * FROM menu_items;

SELECT * FROM order_details;

SELECT COUNT(DISTINCT item_name) 
FROM menu_items; 

-- (i) 32 unique menu items

SELECT COUNT(DISTINCT category)
FROM menu_items; 

-- (ii) 4 unique menu_items category

-- Question 2: For each item, count the number of orders made

SELECT 
      menu_items.item_name, 
	  COUNT(order_details.item_id) No_of_times_ordered
FROM menu_items 
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
GROUP BY menu_items.item_name
ORDER BY No_of_times_ordered DESC
LIMIT 5;


-- Top 5 Most popular menu items are : Hamburger, Edamame, Korean Beef Bowl, Cheeseburger and French Fries

SELECT 
      menu_items.item_name, 
	  COUNT(order_details.item_id) No_of_times_ordered
FROM menu_items 
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
GROUP BY menu_items.item_name
ORDER BY No_of_times_ordered ASC
LIMIT 5;

-- Top 5 Least popular menu items are : Chicken Tacos



SELECT menu_items.*,
       order_details.*
FROM menu_items
LEFT JOIN order_details
ON menu_items.menu_item_id = order_details.item_id;

-- Top customers based on how much was spent on an order
SELECT order_details.order_id,
       SUM(menu_items.price) AS Amount_Spent
FROM menu_items
INNER JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
GROUP BY order_details.order_id
ORDER BY Amount_Spent DESC
LIMIT 5;

-- 440, 2075, 1957, 330, 2675

SELECT menu_items.item_name, 
       menu_items.category,
	   COUNT(menu_items.category) AS top_customer_cat
FROM menu_items 
INNER JOIN order_details
ON menu_items.menu_item_id = order_details.item_id
WHERE order_details.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 2,1
ORDER BY top_customer_cat DESC;



