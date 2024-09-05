-- Join customers and orders to create a number of orders (nb_of_orders) column exported as a new table join_customers_order

SELECT
	a.customer_id,
	a.customer_name,
	a.gender,
	a.age,
	a.city,
	a.state,
	a.country,
	COUNT(b.order_id) AS nb_of_orders
FROM customers a
LEFT JOIN orders b
ON a.customer_id=b.customer_id
GROUP BY a.customer_id,
	a.customer_name,
	a.gender,
	a.age,
	a.city,
	a.state,
	a.country;

-- Join customers and sales to create a total spent by customers (total_spent) column exported as a new table int_join_sales

SELECT 
  c.customer_id, 
  c.customer_name,
	c.gender,
	c.age,
	c.city,
	c.state,
	c.country,
	c.nb_of_orders,
	c.Age_Class,
    SUM(s.total_price) AS total_spent
FROM 
    int_customers_order c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
LEFT JOIN 
    sales s ON o.order_id = s.order_id
GROUP BY 
  c.customer_id, 
  c.customer_name,
	c.gender,
	c.age,
	c.city,
	c.state,
	c.country,
	c.nb_of_orders,
	c.Age_Class
ORDER BY 
    total_spent DESC;

-- Filter the int_join_sales on active customers exported as a new table active_clients

SELECT 
  *
FROM int_join_sales
WHERE
  nb_of_orders>0;

