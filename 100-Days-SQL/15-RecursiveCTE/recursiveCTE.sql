

create table sales1 ( product_id int, period_start date, period_end date, average_daily_sales int ); 
INSERT ALL
    INTO sales1 (product_id, period_start, period_end, average_daily_sales)
    VALUES (1,
            TO_DATE('2019-01-25','YYYY-MM-DD'),
            TO_DATE('2019-02-28','YYYY-MM-DD'),
            100)

    INTO sales1 (product_id, period_start, period_end, average_daily_sales)
    VALUES (2,
            TO_DATE('2018-12-01','YYYY-MM-DD'),
            TO_DATE('2020-01-01','YYYY-MM-DD'),
            10)

    INTO sales1 (product_id, period_start, period_end, average_daily_sales)
    VALUES (3,
            TO_DATE('2019-12-01','YYYY-MM-DD'),
            TO_DATE('2020-01-31','YYYY-MM-DD'),
            1)
SELECT * FROM dual;

select * from sales1;

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

select * from sales1;

with r_cte (dates, max_date) as 
(
    select min(period_start) as dates, max(period_end) as max_date from sales1

    union all 

    select dates + 1, max_date from r_cte
    where dates < max_date
) 

select product_id,  EXTRACT(YEAR FROM dates) AS report_year, sum(average_daily_sales) as total_amount from r_cte
inner join sales1 s on dates between period_start and period_end group by product_id, EXTRACT(YEAR FROM dates)
order by product_id, EXTRACT(YEAR FROM dates)
;