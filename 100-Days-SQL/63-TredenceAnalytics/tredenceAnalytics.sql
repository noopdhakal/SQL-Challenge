CREATE TABLE cinema (
    seat_id INT PRIMARY KEY,
    free int
);
delete from cinema;
INSERT INTO cinema (seat_id, free) VALUES (1, 1);
INSERT INTO cinema (seat_id, free) VALUES (2, 0);
INSERT INTO cinema (seat_id, free) VALUES (3, 1);
INSERT INTO cinema (seat_id, free) VALUES (4, 1);
INSERT INTO cinema (seat_id, free) VALUES (5, 1);
INSERT INTO cinema (seat_id, free) VALUES (6, 0);
INSERT INTO cinema (seat_id, free) VALUES (7, 1);
INSERT INTO cinema (seat_id, free) VALUES (8, 1);
INSERT INTO cinema (seat_id, free) VALUES (9, 0);
INSERT INTO cinema (seat_id, free) VALUES (10, 1);
INSERT INTO cinema (seat_id, free) VALUES (11, 0);
INSERT INTO cinema (seat_id, free) VALUES (12, 1);
INSERT INTO cinema (seat_id, free) VALUES (13, 0);
INSERT INTO cinema (seat_id, free) VALUES (14, 1);
INSERT INTO cinema (seat_id, free) VALUES (15, 1);
INSERT INTO cinema (seat_id, free) VALUES (16, 0);
INSERT INTO cinema (seat_id, free) VALUES (17, 1);
INSERT INTO cinema (seat_id, free) VALUES (18, 1);
INSERT INTO cinema (seat_id, free) VALUES (19, 1);
INSERT INTO cinema (seat_id, free) VALUES (20, 1);

commit;

-- all the consecutive availabe seats


-- method 1 

with  cte as (
select cm.*, 
row_number() over (order by seat_id) as rn, 
seat_id - row_number() over (order by seat_id) as grp
from cinema cm where free = 1)

select * from (
select ct.*, 
count(*) over (partition by grp)
 as cnt from cte ct ) where cnt > 1
;

-- method 2 

with cte as (
select c1.seat_id as s1, c2.seat_id as s2 from cinema c1 inner join cinema c2 on 
c1.seat_id + 1 = c2.SEAT_ID
where c1.free = 1 and c2.free = 1)

select s1 from cte 
union 
select s2 from cte
order by 1
 ;

 -- method 3
SELECT * FROM (
 select C.* , lag(free, 1) over (order by seat_id) as prev_Free, 
  LEAD(free, 1) over (order by seat_id) as NEXT_Free
  from cinema C) a
  WHERE FREE = 1 AND (prev_Free = 1 OR NEXT_Free = 1)
  ;