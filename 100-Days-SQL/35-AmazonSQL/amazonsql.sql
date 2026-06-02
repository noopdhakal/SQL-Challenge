drop table emp;

CREATE TABLE emp (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    salary NUMBER,
    manager_id NUMBER,
    emp_age NUMBER,
    dep_id NUMBER,
    dep_name VARCHAR2(20),
    gender VARCHAR2(10)
);

INSERT INTO emp VALUES (1,'Ankit',14300,4,39,100,'Analytics','Female');
INSERT INTO emp VALUES (2,'Mohit',14000,5,48,200,'IT','Male');
INSERT INTO emp VALUES (3,'Vikas',12100,4,37,100,'Analytics','Female');
INSERT INTO emp VALUES (4,'Rohit',7260,2,16,100,'Analytics','Female');
INSERT INTO emp VALUES (5,'Mudit',15000,6,55,200,'IT','Male');
INSERT INTO emp VALUES (6,'Agam',15600,2,14,200,'IT','Male');
INSERT INTO emp VALUES (7,'Sanjay',12000,2,13,200,'IT','Male');
INSERT INTO emp VALUES (8,'Ashish',7200,2,12,200,'IT','Male');
INSERT INTO emp VALUES (9,'Mukesh',7000,6,51,300,'HR','Male');
INSERT INTO emp VALUES (10,'Rakesh',8000,6,50,300,'HR','Male');
INSERT INTO emp VALUES (11,'Akhil',4000,1,31,500,'Ops','Male');

COMMIT;

with xxx as
(select emp_id, emp_name, salary, dep_id, dep_name,
rank() over (PARTITION by DEP_ID order by salary desc)as rn,
count(1) over (PARTITION by dep_id) as cnt
 from emp rn)
select * from xxx where rn = 3 or (cnt < 3 and rn = cnt)
;

select * from emp;

with cte as
(select emp_id, emp_name, salary, dep_id, dep_name,
rank() over (PARTITION by dep_id order by salary desc) as rn,
count(1) over (PARTITION by dep_id) as cnt
 from emp)
 
 select * from cte where rn = 3 or (cnt < 3 and rn = cnt)
  ;