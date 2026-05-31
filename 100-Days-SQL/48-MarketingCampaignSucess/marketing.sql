CREATE TABLE marketing_campaign (
    user_id     NUMBER,
    created_at  DATE,
    product_id  NUMBER,
    quantity    NUMBER,
    price       NUMBER
);
INSERT ALL
INTO marketing_campaign VALUES (10, TO_DATE('2019-01-01','YYYY-MM-DD'), 101, 3, 55)
INTO marketing_campaign VALUES (10, TO_DATE('2019-01-02','YYYY-MM-DD'), 119, 5, 29)
INTO marketing_campaign VALUES (10, TO_DATE('2019-03-31','YYYY-MM-DD'), 111, 2, 149)
INTO marketing_campaign VALUES (11, TO_DATE('2019-01-02','YYYY-MM-DD'), 105, 3, 234)
INTO marketing_campaign VALUES (11, TO_DATE('2019-03-31','YYYY-MM-DD'), 120, 3, 99)
INTO marketing_campaign VALUES (12, TO_DATE('2019-01-02','YYYY-MM-DD'), 112, 2, 200)
INTO marketing_campaign VALUES (12, TO_DATE('2019-03-31','YYYY-MM-DD'), 110, 2, 299)
INTO marketing_campaign VALUES (13, TO_DATE('2019-01-05','YYYY-MM-DD'), 113, 1, 67)
INTO marketing_campaign VALUES (13, TO_DATE('2019-03-31','YYYY-MM-DD'), 118, 3, 35)
INTO marketing_campaign VALUES (14, TO_DATE('2019-01-06','YYYY-MM-DD'), 109, 5, 199)
INTO marketing_campaign VALUES (14, TO_DATE('2019-01-06','YYYY-MM-DD'), 107, 2, 27)
INTO marketing_campaign VALUES (14, TO_DATE('2019-03-31','YYYY-MM-DD'), 112, 3, 200)
INTO marketing_campaign VALUES (15, TO_DATE('2019-01-08','YYYY-MM-DD'), 105, 4, 234)
INTO marketing_campaign VALUES (15, TO_DATE('2019-01-09','YYYY-MM-DD'), 110, 4, 299)
INTO marketing_campaign VALUES (15, TO_DATE('2019-03-31','YYYY-MM-DD'), 116, 2, 499)
INTO marketing_campaign VALUES (16, TO_DATE('2019-01-10','YYYY-MM-DD'), 113, 2, 67)
INTO marketing_campaign VALUES (16, TO_DATE('2019-03-31','YYYY-MM-DD'), 107, 4, 27)
INTO marketing_campaign VALUES (17, TO_DATE('2019-01-11','YYYY-MM-DD'), 116, 2, 499)
INTO marketing_campaign VALUES (17, TO_DATE('2019-03-31','YYYY-MM-DD'), 104, 1, 154)
INTO marketing_campaign VALUES (18, TO_DATE('2019-01-12','YYYY-MM-DD'), 114, 2, 248)
INTO marketing_campaign VALUES (18, TO_DATE('2019-01-12','YYYY-MM-DD'), 113, 4, 67)
INTO marketing_campaign VALUES (19, TO_DATE('2019-01-12','YYYY-MM-DD'), 114, 3, 248)
INTO marketing_campaign VALUES (20, TO_DATE('2019-01-15','YYYY-MM-DD'), 117, 2, 999)
INTO marketing_campaign VALUES (21, TO_DATE('2019-01-16','YYYY-MM-DD'), 105, 3, 234)
INTO marketing_campaign VALUES (21, TO_DATE('2019-01-17','YYYY-MM-DD'), 114, 4, 248)
INTO marketing_campaign VALUES (22, TO_DATE('2019-01-18','YYYY-MM-DD'), 113, 3, 67)
INTO marketing_campaign VALUES (22, TO_DATE('2019-01-19','YYYY-MM-DD'), 118, 4, 35)
INTO marketing_campaign VALUES (23, TO_DATE('2019-01-20','YYYY-MM-DD'), 119, 3, 29)
INTO marketing_campaign VALUES (24, TO_DATE('2019-01-21','YYYY-MM-DD'), 114, 2, 248)
INTO marketing_campaign VALUES (25, TO_DATE('2019-01-22','YYYY-MM-DD'), 114, 2, 248)
INTO marketing_campaign VALUES (25, TO_DATE('2019-01-22','YYYY-MM-DD'), 115, 2, 72)
INTO marketing_campaign VALUES (25, TO_DATE('2019-01-24','YYYY-MM-DD'), 114, 5, 248)
INTO marketing_campaign VALUES (25, TO_DATE('2019-01-27','YYYY-MM-DD'), 115, 1, 72)
INTO marketing_campaign VALUES (26, TO_DATE('2019-01-25','YYYY-MM-DD'), 115, 1, 72)
INTO marketing_campaign VALUES (27, TO_DATE('2019-01-26','YYYY-MM-DD'), 104, 3, 154)
INTO marketing_campaign VALUES (28, TO_DATE('2019-01-27','YYYY-MM-DD'), 101, 4, 55)
INTO marketing_campaign VALUES (29, TO_DATE('2019-01-27','YYYY-MM-DD'), 111, 3, 149)
INTO marketing_campaign VALUES (30, TO_DATE('2019-01-29','YYYY-MM-DD'), 111, 1, 149)
INTO marketing_campaign VALUES (31, TO_DATE('2019-01-30','YYYY-MM-DD'), 104, 3, 154)
INTO marketing_campaign VALUES (32, TO_DATE('2019-01-31','YYYY-MM-DD'), 117, 1, 999)
INTO marketing_campaign VALUES (33, TO_DATE('2019-01-31','YYYY-MM-DD'), 117, 2, 999)
INTO marketing_campaign VALUES (34, TO_DATE('2019-01-31','YYYY-MM-DD'), 110, 3, 299)
INTO marketing_campaign VALUES (35, TO_DATE('2019-02-03','YYYY-MM-DD'), 117, 2, 999)
INTO marketing_campaign VALUES (36, TO_DATE('2019-02-04','YYYY-MM-DD'), 102, 4, 82)
INTO marketing_campaign VALUES (37, TO_DATE('2019-02-05','YYYY-MM-DD'), 102, 2, 82)
INTO marketing_campaign VALUES (38, TO_DATE('2019-02-06','YYYY-MM-DD'), 113, 2, 67)
INTO marketing_campaign VALUES (39, TO_DATE('2019-02-07','YYYY-MM-DD'), 120, 5, 99)
INTO marketing_campaign VALUES (40, TO_DATE('2019-02-08','YYYY-MM-DD'), 115, 2, 72)
INTO marketing_campaign VALUES (41, TO_DATE('2019-02-08','YYYY-MM-DD'), 114, 1, 248)
INTO marketing_campaign VALUES (42, TO_DATE('2019-02-10','YYYY-MM-DD'), 105, 5, 234)
INTO marketing_campaign VALUES (43, TO_DATE('2019-02-11','YYYY-MM-DD'), 102, 1, 82)
INTO marketing_campaign VALUES (43, TO_DATE('2019-03-05','YYYY-MM-DD'), 104, 3, 154)
INTO marketing_campaign VALUES (44, TO_DATE('2019-02-12','YYYY-MM-DD'), 105, 3, 234)
INTO marketing_campaign VALUES (44, TO_DATE('2019-03-05','YYYY-MM-DD'), 102, 4, 82)
SELECT * FROM dual;

commit;
WITH rnk_data AS (
    SELECT mc.*,
           RANK() OVER (
               PARTITION BY user_id
               ORDER BY created_at
           ) AS rn
    FROM marketing_campaign mc
),
first_app_purchases AS (
    SELECT *
    FROM rnk_data
    WHERE rn = 1
),
except_first_app_purchases AS (
    SELECT *
    FROM rnk_data
    WHERE rn > 1
)
SELECT DISTINCT a.user_id
FROM except_first_app_purchases a
LEFT JOIN first_app_purchases b
       ON a.user_id = b.user_id
      AND a.product_id = b.product_id
WHERE b.product_id IS NULL;