create table brands 
(
category varchar(20),
brand_name varchar(20)
);
insert into brands values
('chocolates','5-star')
,(null,'dairy milk')
,(null,'perk')
,(null,'eclair')
,('Biscuits','britannia')
,(null,'good day')
,(null,'boost');

commit; 
select * from brands;

-- write a sql to populate category values values to the last not null value.ALTER

with cte1 as (
select br.*, 
row_number() over (order by (select null)) as rn
from brands br)
, cte2 as
(select ct1.*, lead(rn, 1, 9999) over (order by rn) as next_rn from cte1 ct1 where category is not null)
select cte2.category, cte1.brand_name from cte1 inner join cte2 on cte1.rn >= cte2.rn and cte1.rn >=next_rn - 1
;


--correct
with cte1 as
(select br.*, row_number() over (order by (select null)) as rn from brands br), cte2 as
(select ct1.*, lead(rn, 1, 9999) over (order by rn) as next_rn from cte1 ct1 
where category is not null)
select cte2.category, cte1.brand_name from cte1 
inner join cte2
on cte1.rn >= cte2.rn and cte1.rn < cte2.next_rn
;