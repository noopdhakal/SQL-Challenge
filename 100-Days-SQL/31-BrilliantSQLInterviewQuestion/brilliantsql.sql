CREATE TABLE int_orders (
    order_number    NUMBER NOT NULL,
    order_date      DATE NOT NULL,
    cust_id         NUMBER NOT NULL,
    salesperson_id  NUMBER NOT NULL,
    amount          NUMBER NOT NULL
);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (30, TO_DATE('1995-07-14', 'YYYY-MM-DD'), 9, 1, 460);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (10, TO_DATE('1996-08-02', 'YYYY-MM-DD'), 4, 2, 540);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (40, TO_DATE('1998-01-29', 'YYYY-MM-DD'), 7, 2, 2400);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (50, TO_DATE('1998-02-03', 'YYYY-MM-DD'), 6, 7, 600);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (60, TO_DATE('1998-03-02', 'YYYY-MM-DD'), 6, 7, 720);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (70, TO_DATE('1998-05-06', 'YYYY-MM-DD'), 9, 7, 150);

INSERT INTO int_orders (order_number, order_date, cust_id, salesperson_id, amount)
VALUES (20, TO_DATE('1999-01-30', 'YYYY-MM-DD'), 4, 8, 1800);

COMMIT;

select a.order_number, a.ORDER_DATE, a.CUST_ID, a.SALESPERSON_ID, a.AMOUNT from int_orders a
left join int_orders b on a.salesperson_id=b.salesperson_id
group by a.order_number, a.ORDER_DATE, a.CUST_ID, a.SALESPERSON_ID, a.AMOUNT
having a.amount >= max(b.AMOUNT)
;