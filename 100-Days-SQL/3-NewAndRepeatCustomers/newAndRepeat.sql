CREATE TABLE customer_orders_1 (
    order_id NUMBER,
    customer_id NUMBER,
    order_date DATE,
    order_amount NUMBER
);

INSERT INTO customer_orders_1 VALUES (1,100,TO_DATE('2022-01-01','YYYY-MM-DD'),2000);
INSERT INTO customer_orders_1 VALUES (2,200,TO_DATE('2022-01-01','YYYY-MM-DD'),2500);
INSERT INTO customer_orders_1 VALUES (3,300,TO_DATE('2022-01-01','YYYY-MM-DD'),2100);
INSERT INTO customer_orders_1 VALUES (4,100,TO_DATE('2022-01-02','YYYY-MM-DD'),2000);
INSERT INTO customer_orders_1 VALUES (5,400,TO_DATE('2022-01-02','YYYY-MM-DD'),2200);
INSERT INTO customer_orders_1 VALUES (6,500,TO_DATE('2022-01-02','YYYY-MM-DD'),2700);
INSERT INTO customer_orders_1 VALUES (7,100,TO_DATE('2022-01-03','YYYY-MM-DD'),3000);
INSERT INTO customer_orders_1 VALUES (8,400,TO_DATE('2022-01-03','YYYY-MM-DD'),1000);
INSERT INTO customer_orders_1 VALUES (9,600,TO_DATE('2022-01-03','YYYY-MM-DD'),3000);

COMMIT;

SELECT * FROM customer_orders_1;


-- solution

with first_order_date as (
select customer_id, min(order_date) as first_customer_date from customer_orders_1 group by customer_id)
select co.ORDER_DATE, sum(case when co.order_date = fv.first_customer_date then 1 else 0 end) as new_customer
,sum(case when co.order_date != fv.first_customer_date then 1 else 0 end) as returing_customer
 from customer_orders_1 co inner join first_order_date fv on co.customer_id = fv.customer_id 
group by co.order_date
;
