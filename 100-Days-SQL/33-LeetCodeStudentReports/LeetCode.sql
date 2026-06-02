create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');


commit;


select player_groups, 
max(case when city='Bangalore' then name end)as Bangalore, 
max(case when city='Delhi' then name end) as Delhi,
max(case when city='Mumbai' then name end)as Mumbai from
(select pl.*, row_number() over (partition by city order by name asc ) as player_groups from PLAYERS_LOCATION pl) a
-- order by player_groups
group by player_groups 
;


--- Get into pivot
drop table sales;

CREATE TABLE sales (
    product VARCHAR(20),
    year INT,
    sales INT
);

INSERT INTO sales VALUES
('Laptop',2023,100),
('Laptop',2024,150),
('Mobile',2023,200),
('Mobile',2024,250);

SELECT
    product,
    SUM(CASE WHEN year = 2023 THEN sales END) AS y2023,
    SUM(CASE WHEN year = 2024 THEN sales END) AS y2024
FROM sales
GROUP BY product;

select product,
 sum(case when year =2023 then sales end) as y2023,
 sum(case when year = 2024 then sales end) as y2024
  from sales group by product;

  SELECT *
FROM
(
    SELECT product, year, sales
    FROM sales
) src
PIVOT
(
    SUM(sales)
    FOR year IN ([2023],[2024])
) p;