CREATE TABLE purchase_history (
    userid       NUMBER,
    productid    NUMBER,
    purchasedate DATE
);

INSERT ALL
    INTO purchase_history VALUES (1,1,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (1,2,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (1,3,TO_DATE('25-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (2,1,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (2,2,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (2,2,TO_DATE('25-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (2,4,TO_DATE('25-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (3,4,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (3,1,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (4,1,TO_DATE('23-01-2012','DD-MM-YYYY'))
    INTO purchase_history VALUES (4,2,TO_DATE('25-01-2012','DD-MM-YYYY'))
SELECT * FROM dual;


select * from PURCHASE_HISTORY;

with cte as
(select userid, count(distinct PURCHASEDATE) as no_of_dates 
, count(productid) as cnt_product, count(distinct productid) as count_dit_product from PURCHASE_HISTORY
group by userid)

select userid from cte where no_of_dates > 1 and cnt_product = count_dit_product;