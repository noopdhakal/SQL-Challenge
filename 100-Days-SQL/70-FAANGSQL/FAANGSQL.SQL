CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    amount NUMBER,
    tran_date TIMESTAMP
);

drop table transactions;

DELETE FROM transactions;

INSERT ALL
    INTO transactions VALUES (1, 101, 500, TO_TIMESTAMP('2025-01-01 10:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (2, 201, 500, TO_TIMESTAMP('2025-01-01 10:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (3, 102, 300, TO_TIMESTAMP('2025-01-02 00:50:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (4, 202, 300, TO_TIMESTAMP('2025-01-02 00:50:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (5, 101, 700, TO_TIMESTAMP('2025-01-03 06:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (6, 202, 700, TO_TIMESTAMP('2025-01-03 06:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (7, 103, 200, TO_TIMESTAMP('2025-01-04 03:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (8, 203, 200, TO_TIMESTAMP('2025-01-04 03:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (9, 101, 400, TO_TIMESTAMP('2025-01-05 00:10:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (10, 201, 400, TO_TIMESTAMP('2025-01-05 00:10:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (11, 101, 500, TO_TIMESTAMP('2025-01-07 10:10:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (12, 201, 500, TO_TIMESTAMP('2025-01-07 10:10:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (13, 102, 200, TO_TIMESTAMP('2025-01-03 10:50:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (14, 202, 200, TO_TIMESTAMP('2025-01-03 10:50:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (15, 103, 500, TO_TIMESTAMP('2025-01-01 11:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (16, 101, 500, TO_TIMESTAMP('2025-01-01 11:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (17, 203, 200, TO_TIMESTAMP('2025-11-01 11:00:01','YYYY-MM-DD HH24:MI:SS'))
    INTO transactions VALUES (18, 201, 200, TO_TIMESTAMP('2025-11-01 11:00:01','YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;

COMMIT;

with cte as (
select transaction_id,customer_id as seller_id,amount,tran_date
,LEAD(customer_id,1) over(order by transaction_id) as buyer_id
from transactions
),
cte_combinations as
(select seller_id,buyer_id,COUNT(*) as no_of_transactions
from cte
where transaction_id % 2 = 1
group by seller_id,buyer_id
),
fraud_customers as (
select seller_id as frauds from cte_combinations
intersect
select buyer_id from cte_combinations
)
select * from cte_combinations
where seller_id not in (select frauds from fraud_customers)
and buyer_id not in (select frauds from fraud_customers)