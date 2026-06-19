CREATE TABLE emp_salary (
    emp_id NUMBER NOT NULL,
    name VARCHAR2(20) NOT NULL,
    salary NUMBER,
    dept_id NUMBER
);

INSERT INTO emp_salary VALUES (101, 'sohan', '3000', 11);
INSERT INTO emp_salary VALUES (102, 'rohan', '4000', 12);
INSERT INTO emp_salary VALUES (103, 'mohan', '5000', 13);
INSERT INTO emp_salary VALUES (104, 'cat', '3000', 11);
INSERT INTO emp_salary VALUES (105, 'suresh', '4000', 12);
INSERT INTO emp_salary VALUES (109, 'mahesh', '7000', 12);
INSERT INTO emp_salary VALUES (108, 'kamal', '8000', 11);

commit;

with sal_dep as (
    select dept_id,salary
    from emp_salary
    group by dept_id,salary
    having count(1)=1
)
select es.* from
emp_salary es
LEFT join sal_dep sd on es.dept_id=sd.dept_id and es.salary=sd.salary
where sd.dept_id is null;