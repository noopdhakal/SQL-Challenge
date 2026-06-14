CREATE TABLE city_population (
    state VARCHAR(50),
    city VARCHAR(50),
    population INT
);

-- Insert the data
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'ambala', 100);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'panipat', 200);
INSERT INTO city_population (state, city, population) VALUES ('haryana', 'gurgaon', 300);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'amritsar', 150);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'ludhiana', 400);
INSERT INTO city_population (state, city, population) VALUES ('punjab', 'jalandhar', 250);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'mumbai', 1000);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'pune', 600);
INSERT INTO city_population (state, city, population) VALUES ('maharashtra', 'nagpur', 300);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'bangalore', 900);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mysore', 400);
INSERT INTO city_population (state, city, population) VALUES ('karnataka', 'mangalore', 200);

commit;

with cte as (
select ct.*, max(population) over (PARTITION by state) as max_population, 
max(population) over (PARTITION by state) as min_population
from CITY_POPULATION ct)
select state, 
max(case when population = max_population then city end) as highest_populated_city,
min(case when population = min_population then city end) as lowest_populated_city
 from cte cte
group by state
;

-- method 2
with cte as (
select ct.*, row_number() over (partition by state order by POPULATION desc) as rn_desc, 
row_number() over (partition by state order by POPULATION asc) as rn_asc
from CITY_POPULATION ct)
select state, 
max(case when rn_desc = 1 then city end) as highest_populated_city,
min(case when rn_asc = 1 then city end) as lowest_populated_city
 from cte cte
group by state
;