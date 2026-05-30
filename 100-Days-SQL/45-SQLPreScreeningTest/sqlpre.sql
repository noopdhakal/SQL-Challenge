create table tbl_orders (
order_id integer,
order_date date
);
INSERT ALL
  INTO tbl_orders VALUES (1, DATE '2022-10-21')
  INTO tbl_orders VALUES (2, DATE '2022-10-22')
  INTO tbl_orders VALUES (3, DATE '2022-10-25')
  INTO tbl_orders VALUES (4, DATE '2022-10-25')
SELECT * FROM dual;


delete from TBL_ORDERS;


-- select * into tbl_orders_copy from  tbl_orders;


select * from TBL_ORDERS;

CREATE TABLE tbl_orders_copy AS
SELECT *
FROM tbl_orders;

--select * from tbl_orders;

-- after the copy taken
INSERT ALL
    INTO tbl_orders VALUES (5, DATE '2022-10-26')
    INTO tbl_orders VALUES (6, DATE '2022-10-26')
SELECT * FROM dual;

delete from TBL_ORDERS where order_id = 1;

select * from TBL_ORDERS;
select * from tbl_orders_copy;


-- output, order_id, flag

-- 1, 'D'
-- 5, 'I'
-- 6, 'I'

-- use full outer join 

select coalesce(o.order_id, c.order_id) as order_id, 
case when c.ORDER_ID is null then 'I'
 when o.ORDER_ID is null then 'D' end as flag
 from TBL_ORDERS o 
full outer join tbl_orders_copy c 
on o.order_id = c.order_id
where c.order_id is null or o.order_id is null
;


commit;