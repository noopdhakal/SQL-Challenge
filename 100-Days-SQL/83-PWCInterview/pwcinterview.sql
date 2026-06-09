create table company_revenue 
(
company varchar(100),
year int,
revenue int
);

insert into company_revenue values 
('ABC1',2000,100),('ABC1',2001,110),('ABC1',2002,120),('ABC2',2000,100),('ABC2',2001,90),('ABC2',2002,120)
,('ABC3',2000,500),('ABC3',2001,400),('ABC3',2002,600),('ABC3',2003,800);

commit;

select * from COMPANY_REVENUE;

-- method 1

with cte as (
select cv.*, 
lag(revenue, 1, 0) over (partition by company order by year) as prev_year,
REVENUE - lag(revenue, 1, 0) over (partition by company order by year) as revenue_diff, 
count(1) over (PARTITION by company) as cnt
 from COMPANY_REVENUE cv  order by company, year)
 select company, cnt, count(1) as sales_inc_years
  from cte where revenue_diff > 0 group by company, cnt having cnt = count(1)
 ;

 -- how many days of data for each company = how many year it is increasing

 -- method 2

with cte as (
select cv.*, 
-- lag(revenue, 1, 0) over (partition by company order by year) as prev_year,
REVENUE - lag(revenue, 1, 0) over (partition by company order by year) as revenue_diff, 
count(1) over (PARTITION by company) as cnt
 from COMPANY_REVENUE cv  order by company, year)
 select *
  from cte where company not in (select company from cte where revenue_diff < 0);