drop table products;
create table products
(
product_id varchar(20) ,
cost int
);
insert into products values ('P1',200),('P2',300),('P3',500),('P4',800);

create table customer_budget
(
customer_id int,
budget int
);

insert into customer_budget values (100,400),(200,800),(300,1500);

select * from products;
select * from CUSTOMER_BUDGET;


with running_cost as 
(select p.*, sum(cost) over(order by cost asc) as r_cost from products p)
select customer_id, budget, count(1) as no_of_products, LISTAGG(product_id,',') as list_of_products from CUSTOMER_BUDGET cb 
left join running_cost rc on rc.r_cost < cb.budget
group by customer_id, budget order by 1
;
