create table numbers (n int);
insert into numbers values (1),(2),(3),(4),(5);
insert into numbers values (9);

commit; 

select * from numbers;

with cte (n, num_counter) as (

    select n, 1 as num_counter from numbers

    union ALL
    
    select n, num_counter + 1 as num_counter from cte 
    where num_counter + 1 <= n
)
select * from cte order by 1, 2;


-- without recursive cte -- cross join 

select n1.n, n2.n from numbers n1 
inner join numbers n2 
on n1.n > = n2.n 
order by n1.n, n2.n
;

with cte(n) as (
select Max(n) as n from numbers
union all 
select n-1 from cte 
where n-1 >= 1
)
select n1.n, n2.n from numbers n1 
inner join cte n2 
on n1.n > = n2.n 
order by n1.n, n2.n

;

-- method 3

with cte as (
SELECT ROW_NUMBER() OVER (ORDER BY NULL) AS n
FROM sys.ALL_TAB_COLUMNS)
select * From cte where n <= (select max(n) from numbers);