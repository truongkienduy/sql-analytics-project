----- Measures Exploration -----
-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity
FROM gold.fact_sales   

-- Find the average selling price
SELECT AVG(price) AS avg_price
FROM gold.fact_sales

-- Find the Total number of Orders
SELECT COUNT(DISTINCT order_number) as total_orders
FROM gold.fact_sales

-- Find the total number of products
SELECT COUNT(DISTINCT product_key) as total_products
FROM gold.dim_products

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers
FROM gold.dim_customers

-- Find the total number of customers that has place an order
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales 

-- Generate a Reprot that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS total_sales FROM gold.fact_sales
UNION ALL
SELECT 'Total Quanity', SUM(quantity) AS total_quantity FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) AS avg_price FROM gold.fact_sales
UNION ALL
SELECT 'Total No. Orders', COUNT(DISTINCT order_number) as total_orders FROM gold.fact_sales
UNION ALL
SELECT 'Total No. Products', COUNT(DISTINCT product_key) as total_products FROM gold.dim_products
UNION ALL
SELECT 'Total No. Customers', COUNT(customer_key) AS total_customers FROM gold.dim_customers
