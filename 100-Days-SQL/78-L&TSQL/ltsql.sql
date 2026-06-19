create table employee 
(
emp_name varchar(10),
dep_id int,
salary int
);

drop table employee;
delete from employee;
insert into employee values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);

-- APPROACH 1


with cte as (
    select dep_id,min(salary) as min_sal, max(salary) as max_sal
    from employee
    group by dep_id
)
select e.dep_id
,max(case when salary=max_sal then emp_name else null end) as max_sal_emp
,max(case when salary=min_sal then emp_name else null end) as min_sal_emp
from employee e
inner join cte on e.dep_id = cte.dep_id
group by e.dep_id;



-- APPROACH 2



with cte as (
    select e.*
    ,row_number() over(partition by dep_id order by salary desc) as rank_desc
    ,row_number() over(partition by dep_id order by salary ) as rank_asc
    from employee e
)
select dep_id
,min(case when rank_desc=1 then emp_name end) as max_sal_emp
,min(case when rank_asc=1 then emp_name end) as min_sal_emp
from cte
group by dep_id;