

-- method 1 median using row number

select * from emp;

with cte as
(select e.* 
, row_number() over (order by emp_age asc) as rn_asc
, row_number() over (order by emp_age desc) as rn_desc
from emp e --where emp_id < 10
order by emp_age)

select avg(emp_age) from cte 
where abs(rn_asc - rn_desc) <= 1
order by emp_age 
;


-- # method #2: median using precentile count

select e.*, 
PERCENTILE_CONT(0.5) within group (order by emp_age) over () as median
from emp e;