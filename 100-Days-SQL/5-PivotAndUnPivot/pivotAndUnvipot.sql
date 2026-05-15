select * from emp_compensation;


-- using pivot function
select * from (select emp_id, salary_component_type, val from EMP_COMPENSATION) sourceTable
pivot (
    sum(val) for salary_component_type in ('salary', 'bonus', 'hike_percent')
)  pivottables;


-- IMP
-- pivot
select *  from emp_compensation;
select 
    emp_id, 
    sum(case when salary_component_type ='salary' then val end )as salary,
    sum(case when salary_component_type ='bonus' then val end ) as bonus, 
    sum(case when salary_component_type ='hike_percent' then val end ) as hike_percent  
 from emp_compensation
 group by emp_id
 ;

 create table emp_compensation_pivot as select 
    emp_id, 
    sum(case when salary_component_type ='salary' then val end )as salary,
    sum(case when salary_component_type ='bonus' then val end ) as bonus, 
    sum(case when salary_component_type ='hike_percent' then val end ) as hike_percent  
 from emp_compensation
 group by emp_id
 ;


select * from (
select emp_id, 'salary' as salary_component_type, salary as val from EMP_COMPENSATION_PIVOT
union all 
select emp_id, 'bonus' as salary_component_type, bonus as val from EMP_COMPENSATION_PIVOT
union all
select emp_id, 'hike_percent' as salary_component_type, hike_percent as val from EMP_COMPENSATION_PIVOT
) order by emp_id;
