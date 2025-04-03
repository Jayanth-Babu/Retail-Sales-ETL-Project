SELECT * FROM df_orders;

-- Top 10 highest revenue generating products
SELECT TOP 10 product_id, SUM(sale_price) AS revenue
FROM df_orders
GROUP BY product_id
ORDER BY revenue DESC;

-- TOP 5 highest selling products in each region
SELECT region, product_id, revenue
FROM (SELECT region, product_id, SUM(sale_price) as revenue, RANK() over (partition by region order by SUM(sale_price) DESC) as rnk
FROM df_orders
GROUP BY region, product_id) A
WHERE rnk <= 5;

-- Month over Month growth comparision
WITH prev_yr AS 
(SELECT YEAR(order_date) AS yr ,MONTH(order_date) as mnth, SUM(sale_price) as revenue_2022
FROM df_orders
WHERE YEAR(order_date) = 2022
GROUP BY YEAR(order_date) ,MONTH(order_date)),

curr_yr AS 
(SELECT YEAR(order_date) AS yr ,MONTH(order_date) as mnth, SUM(sale_price) as revenue_2023
FROM df_orders
WHERE YEAR(order_date) = 2023
GROUP BY YEAR(order_date) ,MONTH(order_date))

SELECT p.mnth,p.revenue_2022, c.revenue_2023, ROUND((p.revenue_2022-c.revenue_2023)*100/p.revenue_2022,2) as MoM_growth
FROM prev_yr p
JOIN curr_yr c 
ON p.mnth = c.mnth
order by p.mnth;

-- For each category which month had highest sales
SELECT category, yr, mnth, revenue
FROM (SELECT category, YEAR(order_date) AS yr , DATENAME(MONTH, order_date) as mnth , sum(sale_price) as revenue, rank() over (partition by category order by sum(sale_price) desc) as rnk
FROM df_orders
group by category,YEAR(order_date), DATENAME(MONTH, order_date)) A
WHERE rnk = 1;

-- Sub category with highest growth in 2023 compared to 2022
WITH CTE AS 
(SELECT sub_category, 
sum(case when YEAR(order_date) = 2023 then sale_price else 0 end)as sales_2023,
sum(case when YEAR(order_date) = 2022 then sale_price else 0 end)as sales_2022
FROM df_orders
group by sub_category)

SELECT TOP 1 sub_category, (sales_2023-sales_2022)*100/sales_2022 as growth_per
FROM CTE
ORDER BY growth_per desc;