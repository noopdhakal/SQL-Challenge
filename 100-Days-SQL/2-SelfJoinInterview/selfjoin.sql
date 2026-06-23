create table pv(emp_id int,emp_name varchar2(10),salary int ,manager_id int);

drop table pv;

insert into pv values(1,'Ankit',10000,4);
insert into pv values(2,'Mohit',15000,5);
insert into pv values(3,'Vikas',10000,4);
insert into pv values(4,'Rohit',5000,2);
insert into pv values(5,'Mudit',12000,6);
insert into pv values(6,'Agam',12000,2);
insert into pv values(7,'Sanjay',9000,2);
insert into pv values(8,'Ashish',5000,2);

select e.emp_id, e.emp_name, m.emp_name as manager_name, e.salary, m.salary as manager_salary
from pv e
inner join pv m on e.manager_id = m.emp_id
where e.salary > m.salary;

commit;




