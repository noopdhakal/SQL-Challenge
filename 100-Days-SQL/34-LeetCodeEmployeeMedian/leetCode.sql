create table employee 
(
emp_id int,
company varchar(10),
salary int
);

INSERT INTO employee VALUES (1, 'A', 2341);
INSERT INTO employee VALUES (2, 'A', 341);
INSERT INTO employee VALUES (3, 'A', 15);
INSERT INTO employee VALUES (4, 'A', 15314);
INSERT INTO employee VALUES (5, 'A', 451);
INSERT INTO employee VALUES (6, 'A', 513);

INSERT INTO employee VALUES (7, 'B', 15);
INSERT INTO employee VALUES (8, 'B', 13);
INSERT INTO employee VALUES (9, 'B', 1154);
INSERT INTO employee VALUES (10, 'B', 1345);
INSERT INTO employee VALUES (11, 'B', 1221);
INSERT INTO employee VALUES (12, 'B', 234);

INSERT INTO employee VALUES (13, 'C', 2345);
INSERT INTO employee VALUES (14, 'C', 2645);
INSERT INTO employee VALUES (15, 'C', 2645);
INSERT INTO employee VALUES (16, 'C', 2652);
INSERT INTO employee VALUES (17, 'C', 65);

COMMIT;


-- 2 5 7 8 9 -- 7


select company, avg(salary) from 
-- , total_cnt / 2, total_cnt/2 + 1 from
(select emp.*, 
row_number() over (partition by company order by salary) as rn
, count(1) over(PARTITION by company) as total_cnt
 from employee emp ) a
-- order by company, salary
where rn between total_cnt / 2 and  total_cnt/2 + 1 
group by company
;