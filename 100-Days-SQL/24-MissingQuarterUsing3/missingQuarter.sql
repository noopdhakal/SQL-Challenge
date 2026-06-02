
drop table sales;

CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);

select * from STORES;

-- Quarters which is missing

select store, 'Q' || cast(10-sum(to_number(SUBSTR(QUARTER, -1))) as varchar2(2)) as q_no  from stores group by store;
commit;


-- 10-sum(quarters)

select store, 'Q' || cast(10 - sum(cast(substr(quarter, -1) as number)) as varchar(10)) as missing_quarter from stores group by store;

-- Method 2 - Recusive CTE

with cte (store, q_no) as (
    select distinct store, 1 as q_no from stores
    union all 

    select store, q_no + 1 as q_no from cte 
    where q_no < 4
),  q as ( select store, 'Q' || cast(q_no as varchar(10)) as q_no from cte) 
select q.store, q.q_no from q 
left join stores s on q.store=s.store and q.q_no = s.quarter where s.store is null
;

-- Third Method cross join method

with cte as (
     select distinct s1.store, s2.quarter
     from stores s1, stores s2
)

select q.* from  cte q 
left join stores s on 
q.store = s.store and q.quarter = s.quarter
where s.store is null
;
