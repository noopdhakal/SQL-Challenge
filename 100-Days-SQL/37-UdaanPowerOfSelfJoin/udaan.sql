create table business_city (
business_date date,
city_id int
);
delete from business_city;
INSERT ALL
    INTO business_city VALUES (DATE '2020-01-02', 3)
    INTO business_city VALUES (DATE '2020-07-01', 7)
    INTO business_city VALUES (DATE '2021-01-01', 3)
    INTO business_city VALUES (DATE '2021-02-03', 19)
    INTO business_city VALUES (DATE '2022-12-01', 3)
    INTO business_city VALUES (DATE '2022-12-15', 3)
    INTO business_city VALUES (DATE '2022-02-28', 12)
SELECT * FROM dual;

-- wherever null its new for that city

with cte as (
select EXTRACT(year from business_date) as bus_year, city_id from BUSINESS_CITY)
select c1.bus_year, 
count(distinct case when c2.city_id is null then c1.city_id end) as no_of_new_cities
 from cte c1
left join cte c2 on c1.bus_year > c2.bus_year and c1.city_id = c2.city_id
group by c1.bus_year
;

