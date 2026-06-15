CREATE TABLE subscribers (
  customer_id INT,
  subscription_date DATE,
  plan_value INT
);

INSERT ALL
    INTO subscribers VALUES (1, DATE '2023-03-02', 799)
    INTO subscribers VALUES (1, DATE '2023-04-01', 599)
    INTO subscribers VALUES (1, DATE '2023-05-01', 499)
    INTO subscribers VALUES (2, DATE '2023-04-02', 799)
    INTO subscribers VALUES (2, DATE '2023-07-01', 599)
    INTO subscribers VALUES (2, DATE '2023-09-01', 499)
    INTO subscribers VALUES (3, DATE '2023-01-01', 499)
    INTO subscribers VALUES (3, DATE '2023-04-01', 599)
    INTO subscribers VALUES (3, DATE '2023-07-02', 799)
    INTO subscribers VALUES (4, DATE '2023-04-01', 499)
    INTO subscribers VALUES (4, DATE '2023-09-01', 599)
    INTO subscribers VALUES (4, DATE '2023-10-02', 499)
    INTO subscribers VALUES (4, DATE '2023-11-02', 799)
    INTO subscribers VALUES (5, DATE '2023-10-02', 799)
    INTO subscribers VALUES (5, DATE '2023-11-02', 799)
    INTO subscribers VALUES (6, DATE '2023-03-01', 499)
SELECT * FROM dual;

commit;

-- 1. Number of Unique customers
select count(distinct customer_id) from subscribers;

--2 For each customer calculate the min and max spend
select customer_id, min(PLAN_VALUE) as min_value, max(plan_value) as max_value from subscribers
group by customer_id
;


--3
with cte as (
select s.*, lag(plan_value, 1, plan_value) over (partition by customer_id order by subscription_date) as prev_plan_value
from subscribers s
)
select customer_id, 
case when max(case when plan_value > prev_plan_value then 1 else 0 end) = 1 then 'yes' else 'no' end as has_upgraded,
case when max(case when plan_value < prev_plan_value then 1 else 0 end) = 1 then 'yes' else 'no' end as down_upgraded  
from cte ct
group by customer_id
;