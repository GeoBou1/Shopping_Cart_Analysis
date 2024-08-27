-- Check customers.csv primary key

SELECT
	customer_id,
	COUNT(*) as nb
FROM customers
GROUP BY customer_id
HAVING nb>1;

-- Check orders.csv primary key

SELECT
	order_id,
	COUNT(*) as nb
FROM orders
GROUP BY order_id
HAVING nb>1;

-- Check products.csv primary key

SELECT
	product_id,
	COUNT(*) as nb
FROM products
GROUP BY product_id
HAVING nb>1;

-- Check sales.csv primary key

SELECT
	sales_id,
	COUNT(*) as nb
FROM sales
GROUP BY sales_id
HAVING nb>1;

-- Explore the first 10 rows of the customers table

SELECT
	*
FROM customers
LIMIT 10;

-- Check if there's any age outliers 

SELECT 
	MIN(age),
	MAX(age)
FROM customers ;

-- Create age class for cohort analysis

with cre_age_cl AS 
	(SELECT
		*,
		CASE
			WHEN age>=20 AND age<35 THEN "20_to_34" 
			WHEN age>=35 AND age<60 THEN "35_to_59" 
			ELSE "60_and_more"
		END AS Age_Class
	FROM customers)

SELECT
	Age_Class,
	COUNT(*) as NbOfCustomers
FROM cre_age_cl
GROUP BY Age_Class
ORDER BY NbOfCustomers DESC;

-- Explore gender repartition

SELECT
	gender,
	COUNT(*) as Population
FROM customers
GROUP BY gender
ORDER BY Population DESC;

-- Explore country, state & city repartition

SELECT
	country,
	COUNT(*) as nb
FROM customers
GROUP BY country
ORDER BY nb DESC;

SELECT
	state,
	COUNT(*) as nb
FROM customers
GROUP BY state
ORDER BY nb DESC;

SELECT
  city,
  COUNT(*) as nb
FROM customers
GROUP BY country
ORDER BY nb DESC;
