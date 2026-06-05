CREATE TABLE subscription_history (
    customer_id INT,
    marketplace VARCHAR(10),
    event_date DATE,
    event CHAR(1),
    subscription_period INT
);

INSERT INTO subscription_history VALUES (1, 'India', TO_DATE('2020-01-05','YYYY-MM-DD'), 'S', 6);
INSERT INTO subscription_history VALUES (1, 'India', TO_DATE('2020-12-05','YYYY-MM-DD'), 'R', 1);
INSERT INTO subscription_history VALUES (1, 'India', TO_DATE('2021-02-05','YYYY-MM-DD'), 'C', NULL);

INSERT INTO subscription_history VALUES (2, 'India', TO_DATE('2020-02-15','YYYY-MM-DD'), 'S', 12);
INSERT INTO subscription_history VALUES (2, 'India', TO_DATE('2020-11-20','YYYY-MM-DD'), 'C', NULL);

INSERT INTO subscription_history VALUES (3, 'USA', TO_DATE('2019-12-01','YYYY-MM-DD'), 'S', 12);
INSERT INTO subscription_history VALUES (3, 'USA', TO_DATE('2020-12-01','YYYY-MM-DD'), 'R', 12);

INSERT INTO subscription_history VALUES (4, 'USA', TO_DATE('2020-01-10','YYYY-MM-DD'), 'S', 6);
INSERT INTO subscription_history VALUES (4, 'USA', TO_DATE('2020-09-10','YYYY-MM-DD'), 'R', 3);
INSERT INTO subscription_history VALUES (4, 'USA', TO_DATE('2020-12-25','YYYY-MM-DD'), 'C', NULL);

INSERT INTO subscription_history VALUES (5, 'UK', TO_DATE('2020-06-20','YYYY-MM-DD'), 'S', 12);
INSERT INTO subscription_history VALUES (5, 'UK', TO_DATE('2020-11-20','YYYY-MM-DD'), 'C', NULL);

INSERT INTO subscription_history VALUES (6, 'UK', TO_DATE('2020-07-05','YYYY-MM-DD'), 'S', 6);
INSERT INTO subscription_history VALUES (6, 'UK', TO_DATE('2021-03-05','YYYY-MM-DD'), 'R', 6);

INSERT INTO subscription_history VALUES (7, 'Canada', TO_DATE('2020-08-15','YYYY-MM-DD'), 'S', 12);

INSERT INTO subscription_history VALUES (8, 'Canada', TO_DATE('2020-09-10','YYYY-MM-DD'), 'S', 12);
INSERT INTO subscription_history VALUES (8, 'Canada', TO_DATE('2020-12-10','YYYY-MM-DD'), 'C', NULL);

INSERT INTO subscription_history VALUES (9, 'Canada', TO_DATE('2020-11-10','YYYY-MM-DD'), 'S', 1);

COMMIT;

with cte as(
select a.*,
row_number() over (partition by customer_id order by event_date desc) rn 
 from SUBSCRIPTION_HISTORY a where event_date <= TO_DATE('2020-12-31', 'YYYY-MM-DD'))
 select c.*, ADD_MONTHS(event_date, subscription_period) AS valid_till 
 from cte c where rn = 1 and event <> 'C' and ADD_MONTHS(event_date, subscription_period) >= TO_DATE('2020-12-31', 'YYYY-MM-DD')

 ;
