CREATE TABLE subscriber (
 sms_date date ,
 sender varchar(20) ,
 receiver varchar(20) ,
 sms_no int
);
-- insert some values
INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Avinash', 'Vibhor',10);

INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Vibhor', 'Avinash',20);

INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Avinash', 'Pawan',30);

INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Pawan', 'Avinash',20);

INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Vibhor', 'Pawan',5);

INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Pawan', 'Vibhor',8);

INSERT INTO subscriber 
VALUES (TO_DATE('2020-04-01','YYYY-MM-DD'), 'Vibhor', 'Deepak',50);

commit;

-- Find the total number of messages exchanged between each person per day

select sms_date, p1, p2, sum(sms_no) as total_sms from 
(select sms_date,
case when sender < receiver then sender else receiver end as p1
, case when sender > receiver then sender else receiver end as p2,
sms_no
 from subscriber s)
 GROUP by sms_date, p1, p2
 ;

select * from subscriber;

with cte as 
 (select sms_date, case when sender < receiver then sender else receiver end as p1,
 case when sender > receiver then sender else receiver end as p2 , sms_no
  from subscriber)
  select sms_date, p1, p2, sum(sms_no) from cte group by sms_date, p1, p2
  ;