select * from sales;

WITH cte_numbers (num) AS 
( 
    SELECT 1 AS num 
    FROM dual   -- anchor query

    UNION ALL

    SELECT num + 1
    FROM cte_numbers
    WHERE num < 6
) 
SELECT * 
FROM cte_numbers;

-- Total sales by year

select * from sales;

with r_cte (dates, max_date) as 
(
    select min(period_start) as dates, max(period_end) as max_date from sales

    union all 

    select dates + 1, max_date from r_cte
    where dates < max_date
) select product_id,  EXTRACT(YEAR FROM dates) AS report_year, sum(average_daily_sales) as total_amount from r_cte
inner join sales s on dates between period_start and period_end group by product_id, EXTRACT(YEAR FROM dates)
order by product_id, EXTRACT(YEAR FROM dates)
;