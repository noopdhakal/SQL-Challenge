CREATE TABLE orders (
    Order_id VARCHAR2(20),
    Customer_code VARCHAR2(20),
    Placed_at TIMESTAMP,
    Restaurant_id VARCHAR2(10),
    Cuisine VARCHAR2(20),
    Order_status VARCHAR2(20),
    Promo_code_Name VARCHAR2(20)
);
commit;
drop table orders;
-- Insert data with multiple restaurants per cuisine
INSERT INTO orders VALUES ('OF1900191801','UFDDN1991918XUY1',TO_DATE('2025-01-01 15:30:20', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','Tasty50');
INSERT INTO orders VALUES ('OF1900191802','UFDDN1991918XUY1',TO_DATE('2025-01-02 12:15:45', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191803','UFDDN1991918XUY1',TO_DATE('2025-01-10 18:45:30', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Cancelled','HUNGRY20');
INSERT INTO orders VALUES ('OF1900191804','UFDDN1991918XUY1',TO_DATE('2025-01-15 19:20:15', 'YYYY-MM-DD HH24:MI:SS'),'ITALIAN2','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191805','UFDDN1991918XUY1',TO_DATE('2025-01-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191806','ABC1234567890XYZ',TO_DATE('2025-01-01 08:45:00', 'YYYY-MM-DD HH24:MI:SS'),'AMERICAN2','American','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191807','ABC1234567890XYZ',TO_DATE('2025-01-05 13:20:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191808','DEF9876543210XYZ',TO_DATE('2025-01-02 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),'MEXICAN2','Mexican','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191809','GHI5678901234XYZ',TO_DATE('2025-01-03 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),'SUSHI456','Japanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191810','JKL3456789012XYZ',TO_DATE('2025-01-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),'JAPANESE2','Japanese','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191811','MNO7890123456XYZ',TO_DATE('2025-01-05 19:45:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191812','PQR1234567890ABC',TO_DATE('2025-01-06 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191813','STU9876543210ABC',TO_DATE('2025-01-07 13:15:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191814','VWX5678901234ABC',TO_DATE('2025-01-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),'ITALIAN2','Italian','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191815','YZA3456789012ABC',TO_DATE('2025-01-09 12:45:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191816','BCD7890123456ABC',TO_DATE('2025-01-10 20:15:00', 'YYYY-MM-DD HH24:MI:SS'),'AMERICAN2','American','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191817','EFG1234567890DEF',TO_DATE('2025-01-11 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191818','HIJ9876543210DEF',TO_DATE('2025-01-12 14:45:00', 'YYYY-MM-DD HH24:MI:SS'),'MEXICAN2','Mexican','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191819','KLM5678901234DEF',TO_DATE('2025-01-13 17:30:00', 'YYYY-MM-DD HH24:MI:SS'),'SUSHI456','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191820','NOP3456789012DEF',TO_DATE('2025-01-14 12:15:00', 'YYYY-MM-DD HH24:MI:SS'),'JAPANESE2','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191821','QRS7890123456DEF',TO_DATE('2025-01-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191822','TUV1234567890GHI',TO_DATE('2025-01-16 10:45:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191823','WXY9876543210GHI',TO_DATE('2025-01-17 15:30:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191824','ZAB5678901234GHI',TO_DATE('2025-01-18 18:15:00', 'YYYY-MM-DD HH24:MI:SS'),'ITALIAN2','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191825','CDE3456789012GHI',TO_DATE('2025-01-19 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191826','FGH7890123456GHI',TO_DATE('2025-01-20 20:45:00', 'YYYY-MM-DD HH24:MI:SS'),'AMERICAN2','American','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191827','IJK1234567890JKL',TO_DATE('2025-01-21 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191828','LMN9876543210JKL',TO_DATE('2025-01-22 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),'MEXICAN2','Mexican','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191829','OPQ5678901234JKL',TO_DATE('2025-01-23 17:45:00', 'YYYY-MM-DD HH24:MI:SS'),'SUSHI456','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191830','RST3456789012JKL',TO_DATE('2025-01-24 12:30:00', 'YYYY-MM-DD HH24:MI:SS'),'JAPANESE2','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191831','UVW7890123456JKL',TO_DATE('2025-01-25 19:15:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191832','XYZ1234567890MNO',TO_DATE('2025-01-26 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191833','ABC9876543210MNO',TO_DATE('2025-01-27 15:15:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191834','DEF5678901234MNO',TO_DATE('2025-01-28 18:30:00', 'YYYY-MM-DD HH24:MI:SS'),'ITALIAN2','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191835','GHI3456789012MNO',TO_DATE('2025-01-29 11:45:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191836','JKL7890123456MNO',TO_DATE('2025-01-30 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),'AMERICAN2','American','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191837','MNO1234567890PQR',TO_DATE('2025-01-31 09:45:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191838','PQR9876543210PQR',TO_DATE('2025-01-31 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),'MEXICAN2','Mexican','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191839','STU5678901234PQR',TO_DATE('2025-01-31 17:15:00', 'YYYY-MM-DD HH24:MI:SS'),'SUSHI456','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191840','VWX3456789012PQR',TO_DATE('2025-01-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),'JAPANESE2','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191841','JAN_ONLY_ORDER1',TO_DATE('2025-01-15 13:30:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191842','JAN_ONLY_ORDER2',TO_DATE('2025-01-20 18:45:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191843','NO_ORDER_LAST7_1',TO_DATE('2025-02-01 12:15:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191844','NO_ORDER_LAST7_2',TO_DATE('2025-02-05 19:30:00', 'YYYY-MM-DD HH24:MI:SS'),'ITALIAN2','Italian','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191845','THIRD_ORDER_CUST1',TO_DATE('2025-01-05 11:45:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191846','THIRD_ORDER_CUST1',TO_DATE('2025-01-10 14:15:00', 'YYYY-MM-DD HH24:MI:SS'),'AMERICAN2','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191847','THIRD_ORDER_CUST1',TO_DATE('2025-01-15 17:45:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191848','THIRD_ORDER_CUST2',TO_DATE('2025-01-10 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191849','THIRD_ORDER_CUST2',TO_DATE('2025-01-15 13:45:00', 'YYYY-MM-DD HH24:MI:SS'),'MEXICAN2','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191850','THIRD_ORDER_CUST2',TO_DATE('2025-01-20 16:30:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191851','MULTI_CUISINE_CUST',TO_DATE('2025-01-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191852','MULTI_CUISINE_CUST',TO_DATE('2025-01-10 15:30:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191853','MULTI_CUISINE_CUST',TO_DATE('2025-01-15 18:45:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191854','MULTI_CUISINE_CUST',TO_DATE('2025-01-20 11:15:00', 'YYYY-MM-DD HH24:MI:SS'),'ITALIAN2','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191855','MULTI_CUISINE_CUST',TO_DATE('2025-01-25 14:45:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191856','SINGLE_ORDER_JAN',TO_DATE('2025-01-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),'AMERICAN2','American','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191857','NO_ORDER_RECENT',TO_DATE('2025-02-10 12:30:00', 'YYYY-MM-DD HH24:MI:SS'),'TACO789','Mexican','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191858','NO_ORDER_RECENT',TO_DATE('2025-02-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),'MEXICAN2','Mexican','Delivered',null);
INSERT INTO orders VALUES ('OF1900191859','PROMO_FIRST_ONLY',TO_DATE('2025-02-01 11:45:00', 'YYYY-MM-DD HH24:MI:SS'),'SUSHI456','Japanese','Delivered','WELCOME50');
INSERT INTO orders VALUES ('OF1900191860','PROMO_FIRST_ONLY',TO_DATE('2025-02-05 14:15:00', 'YYYY-MM-DD HH24:MI:SS'),'JAPANESE2','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191861','PROMO_FIRST_ONLY',TO_DATE('2025-02-10 17:30:00', 'YYYY-MM-DD HH24:MI:SS'),'SUSHI456','Japanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191862','LAST_ORDER_7DAYS',TO_DATE('2025-03-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','FIRSTORDER');
INSERT INTO orders VALUES ('OF1900191863','LAST_ORDER_7DAYS',TO_DATE('2025-03-25 13:15:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191864','LAST_ORDER_7DAYS',TO_DATE('2025-03-31 16:30:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191865','ABC9876543210MNO',TO_DATE('2025-02-27 15:15:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191866','CDE3456789012GHI',TO_DATE('2025-03-27 15:15:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191867','ABC9876543210MNO',TO_DATE('2025-03-15 15:15:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered',null);
INSERT INTO orders VALUES ('OF1900191868','ZZZ9876543210MNO',TO_DATE('2025-03-20 15:15:00', 'YYYY-MM-DD HH24:MI:SS'),'LEBANESE2','Lebanese','Delivered','NEWUSER');
INSERT INTO orders VALUES ('OF1900191869','UFDDN1991918XUY1',TO_DATE('2025-03-28 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),'BURGER99','American','Delivered',null);
INSERT INTO orders VALUES ('OF1900191870','MULTI_CUISINE_CUST',TO_DATE('2025-03-31 14:45:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered',null);
INSERT INTO orders VALUES ('OF1900191871','DEF9876543210XYZ',TO_DATE('2025-03-02 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','TASTY50');
INSERT INTO orders VALUES ('OF1900191872','UVW7890123456JKL',TO_DATE('2025-02-25 19:15:00', 'YYYY-MM-DD HH24:MI:SS'),'KMKMH6787','Lebanese','Delivered','TASTY25');
INSERT INTO orders VALUES ('OF1900191873','UVW7890123456JKL',TO_DATE('2025-03-25 19:15:00', 'YYYY-MM-DD HH24:MI:SS'),'PIZZA123','Italian','Delivered','TASTY50');

commit;

select * from orders;

-- Top 3 outlets by cuisine type without using limit and top function

with cte as (
select cuisine, RESTAURANT_ID, count(*) as no_of_orders from orders o group by cuisine, RESTAURANT_ID 
order by 1, 2 )

select * from (
select c.*, row_number() over (partition by cuisine order by no_of_orders desc) rn from cte c ) where rn <= 3
;

-- 2-- find the daily new customer count from lunch date (everyday how many new customers are we acquiring.)

with cte as (
select customer_code, TRUNC(MIN(placed_at)) as first_order_date from orders group by customer_code)
select first_order_date, count(*) as no_of_new_customers from cte group by first_order_date
order by first_order_date
;

-- 3 Count of all the users who were acquired in Jan 2025 and only placed one order in Jan and did
-- not place any other order

select customer_code, count(*) as no_of_orders from orders where  EXTRACT(MONTH FROM placed_at) = 1 and  EXTRACT(YEAR FROM placed_at) = 2025
and customer_code not in (select distinct customer_code from orders where not EXTRACT(MONTH FROM placed_at) = 1 and  EXTRACT(YEAR FROM placed_at) = 2025)
group by customer_code
having count(*) = 1
;


select distinct customer_code from orders where not EXTRACT(MONTH FROM placed_at) = 1 and  EXTRACT(YEAR FROM placed_at) = 2025;

-- 4 List all the customers with no order in the last 7 days but were acquired one month ago with their first order on promo.

WITH cte AS (
    SELECT
        customer_code,
        MIN(placed_at) AS first_order_date,
        MAX(placed_at) AS latest_order_date
    FROM orders
    GROUP BY customer_code
)
SELECT
    cte.*,
    o.promo_code_name AS first_order_promo
FROM cte
JOIN orders o
    ON cte.customer_code = o.customer_code
   AND cte.first_order_date = o.placed_at
WHERE cte.latest_order_date < SYSDATE - 7
  AND cte.first_order_date < ADD_MONTHS(SYSDATE, -1)
  AND o.promo_code_name IS NOT NULL;

  -- 5. Growth team is planning to create a trigger that will target customer after their every
  -- third order with a personbalized communication and they have asked you to create a query for this

WITH cte AS (
    SELECT o.*,
           ROW_NUMBER() OVER(PARTITION BY customer_code ORDER BY placed_at) AS order_number
    FROM orders o
)
SELECT *
FROM cte
WHERE MOD(order_number, 3) = 0
  AND TRUNC(placed_at) = (
      SELECT TRUNC(MAX(placed_at))
      FROM orders
  );

  -- 6 list customers who placed more than 1 order and all their orders on a promo only. 
SELECT customer_code,
       COUNT(*) AS no_of_orders,
       COUNT(promo_code_name) AS promo_orders
FROM orders
GROUP BY customer_code
HAVING COUNT(*) > 1
   AND COUNT(*) = COUNT(promo_code_name);

   --7 what percent of customers were organically aquired in jan 2025, (placed their first order without promo code)

   WITH cte AS (
    SELECT o.*,
           ROW_NUMBER() OVER(PARTITION BY customer_code ORDER BY placed_at) AS rn
    FROM orders o
    WHERE placed_at >= DATE '2025-01-01'
      AND placed_at < DATE '2025-02-01'
)
SELECT
    ROUND(
        COUNT(CASE
                  WHEN rn = 1
                   AND promo_code_name IS NULL
                  THEN customer_code
              END) * 100.0
        / COUNT(DISTINCT customer_code),
        2
    ) AS percentage
FROM cte;
