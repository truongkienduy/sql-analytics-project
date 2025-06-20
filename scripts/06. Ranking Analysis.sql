 ----- Ranking Analysis -----
 -- Which 5 products generate the highest revenue?
SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) AS total_revenue
 FROM gold.fact_sales f
 LEFT JOIN gold.dim_products p
 ON p.product_key = f.product_key
 GROUP BY p.product_name
 ORDER BY total_revenue DESC

SELECT *
FROM (
	SELECT
		p.product_name,
		SUM(f.sales_amount) AS total_revenue,
		ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY p.product_name) t
WHERE rank_products <= 5

 -- What are the 5 worst-performing products in terms of sales?
 SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) AS total_revenue
 FROM gold.fact_sales f
 LEFT JOIN gold.dim_products p
 ON p.product_key = f.product_key
 GROUP BY p.product_name
 ORDER BY total_revenue ASC

-- Which 5 subcategory generate the highest revenue?
SELECT TOP 5
	p.subcategory,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC

-- Find the Top-10 customers who have generated the highest revenue And 3 customer with the fewest orders placed
  SELECT TOP 10
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT f.order_number) AS total_orders
 FROM gold.fact_sales f
 LEFT JOIN gold.dim_customers c
 ON c.customer_key = f.customer_key
 GROUP BY
	c.customer_key,
	c.first_name,
	last_name
ORDER BY total_orders
