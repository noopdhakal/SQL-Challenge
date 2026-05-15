-- The Pareto Principle (also called the 80/20 rule) states that:

-- Roughly 80% of the results come from 20% of the causes.

-- In SQL and data analysis, this is commonly used to answer questions like:

-- Which 20% of customers generate 80% of revenue?
-- Which 20% of products contribute 80% of sales?
-- Which 20% of defects cause 80% of production issues?

-- Pareto Analysis in SQL

-- To perform Pareto analysis, you:

-- Aggregate values (sales, profit, defects, etc.).
-- Sort in descending order.
-- Calculate cumulative totals.
-- Calculate cumulative percentages.
-- Identify rows where cumulative percentage ≤ 80%.


-- __ 80% sales comes from 20% of your products or services;

select sum(sales) * 0.8 from orders;
-- 1801723.064


with product_wise_sales as 
(select product_id, sum(sales) as product_sales 
from orders
group by product_id
order by product_sales desc), cal_sales as
(select product_id, product_sales,
    sum(product_sales) over (order by product_sales desc rows between unbounded preceding and 0 preceding) as running_sales
    , 0.8 * sum(product_sales) over () as total_sales
from product_wise_sales)
select * from  cal_sales where running_sales <= total_sales
;


select * from  orders;


