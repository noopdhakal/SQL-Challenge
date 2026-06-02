create table covid(
    city varchar2(50),
    days date,
    cases int
);

delete from covid;

insert into covid values('DELHI',TO_DATE('2022-01-01','YYYY-MM-DD'),100);
insert into covid values('DELHI',TO_DATE('2022-01-02','YYYY-MM-DD'),200);
insert into covid values('DELHI',TO_DATE('2022-01-03','YYYY-MM-DD'),300);

insert into covid values('MUMBAI',TO_DATE('2022-01-01','YYYY-MM-DD'),100);
insert into covid values('MUMBAI',TO_DATE('2022-01-02','YYYY-MM-DD'),100);
insert into covid values('MUMBAI',TO_DATE('2022-01-03','YYYY-MM-DD'),300);

insert into covid values('CHENNAI',TO_DATE('2022-01-01','YYYY-MM-DD'),100);
insert into covid values('CHENNAI',TO_DATE('2022-01-02','YYYY-MM-DD'),200);
insert into covid values('CHENNAI',TO_DATE('2022-01-03','YYYY-MM-DD'),150);

insert into covid values('BANGALORE',TO_DATE('2022-01-01','YYYY-MM-DD'),100);
insert into covid values('BANGALORE',TO_DATE('2022-01-02','YYYY-MM-DD'),300);
insert into covid values('BANGALORE',TO_DATE('2022-01-03','YYYY-MM-DD'),200);
insert into covid values('BANGALORE',TO_DATE('2022-01-04','YYYY-MM-DD'),400);

select * from covid;

with xxx as (
select co.*, 
-- rank() over (PARTITION by city order by days asc) as rn_days
-- , rank() over (PARTITION by city order by cases asc) as rn_cases ,

rank() over (PARTITION by city order by days asc) - rank() over (PARTITION by city order by cases asc)  as diff
 from covid co)

 select city from xxx group by city
 having count(distinct diff) = 1 and avg(diff) = 0 
;
