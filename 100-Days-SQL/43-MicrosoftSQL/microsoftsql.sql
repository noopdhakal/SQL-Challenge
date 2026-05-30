create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);


with total_sal as
(select c.*, sum(salary) over(PARTITION by experience order by salary asc rows between unbounded preceding and current row) as running_sal FROM   candidates c), seniors as
(select * from total_sal 
where experience ='Senior' and running_sal <= 70000)

select * from total_sal 
where experience ='Junior' and running_sal <= 70000 - (select sum(SALARY) from seniors)
union all select * from seniors
;