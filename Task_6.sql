create database common;
use common;
select * from online_sales;
USE sales_analysis;
SHOW TABLES;
SELECT * FROM online_sales LIMIT 25;
SELECT
  product_id,
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM
  online_sales
GROUP BY
  product_id,
  EXTRACT(YEAR FROM order_date),
  EXTRACT(MONTH FROM order_date)
ORDER BY
  EXTRACT(YEAR FROM order_date) DESC,
  EXTRACT(MONTH FROM order_date) DESC,
  total_revenue DESC;
  