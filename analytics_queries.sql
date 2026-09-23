CREATE DATABASE IF NOT EXISTS ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE IF NOT EXISTS sales (
 order_id VARCHAR(20) PRIMARY KEY,
 order_date DATE,
 customer_id VARCHAR(20),
 product VARCHAR(100),
 category VARCHAR(50),
 region VARCHAR(30),
 city VARCHAR(60),
 quantity INT,
 unit_price DECIMAL(12,2),
 discount DECIMAL(5,2),
 payment_method VARCHAR(40),
 order_status VARCHAR(30),
 gross_sales DECIMAL(14,2),
 discount_amount DECIMAL(14,2),
 net_sales DECIMAL(14,2),
 estimated_cost DECIMAL(14,2),
 profit DECIMAL(14,2),
 order_month VARCHAR(7)
);

-- Import clean_ecommerce_sales.csv into sales using MySQL Workbench.

SELECT ROUND(SUM(net_sales),2) AS total_sales,
       ROUND(SUM(profit),2) AS total_profit,
       COUNT(DISTINCT order_id) AS total_orders,
       SUM(quantity) AS units_sold
FROM sales WHERE order_status <> 'Cancelled';

SELECT category, ROUND(SUM(net_sales),2) AS sales
FROM sales WHERE order_status <> 'Cancelled'
GROUP BY category ORDER BY sales DESC;

SELECT order_month, ROUND(SUM(net_sales),2) AS sales
FROM sales WHERE order_status <> 'Cancelled'
GROUP BY order_month ORDER BY order_month;

SELECT product, SUM(quantity) AS units_sold, ROUND(SUM(net_sales),2) AS sales
FROM sales WHERE order_status <> 'Cancelled'
GROUP BY product ORDER BY sales DESC LIMIT 10;

SELECT region, ROUND(SUM(net_sales),2) AS sales, ROUND(SUM(profit),2) AS profit
FROM sales WHERE order_status <> 'Cancelled'
GROUP BY region ORDER BY sales DESC;

SELECT payment_method, COUNT(*) AS orders, ROUND(SUM(net_sales),2) AS sales
FROM sales WHERE order_status <> 'Cancelled'
GROUP BY payment_method ORDER BY orders DESC;
