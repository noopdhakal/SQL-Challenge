select * from ACTIVITY;

INSERT INTO activity VALUES
(1,'app-installed', TO_DATE('2022-01-01','YYYY-MM-DD'),'India'),
(1,'app-purchase',  TO_DATE('2022-01-02','YYYY-MM-DD'),'India'),
(2,'app-installed', TO_DATE('2022-01-01','YYYY-MM-DD'),'USA'),
(3,'app-installed', TO_DATE('2022-01-01','YYYY-MM-DD'),'USA'),
(3,'app-purchase',  TO_DATE('2022-01-03','YYYY-MM-DD'),'USA'),
(4,'app-installed', TO_DATE('2022-01-03','YYYY-MM-DD'),'India'),
(4,'app-purchase',  TO_DATE('2022-01-03','YYYY-MM-DD'),'India'),
(5,'app-installed', TO_DATE('2022-01-03','YYYY-MM-DD'),'SL'),
(5,'app-purchase',  TO_DATE('2022-01-03','YYYY-MM-DD'),'SL'),
(6,'app-installed', TO_DATE('2022-01-04','YYYY-MM-DD'),'Pakistan'),
(6,'app-purchase',  TO_DATE('2022-01-04','YYYY-MM-DD'),'Pakistan');

-- 1 either installed or purchase the app

select   event_date, count(distinct user_id) from activity
group by EVENT_DATE
;

-- question 2: find the total active users each week

SELECT a.*, TO_CHAR(EVENT_DATE, 'IW') from ACTIVITY a;

select   TO_CHAR(EVENT_DATE, 'IW'), count(distinct user_id) from activity
group by TO_CHAR(EVENT_DATE, 'IW')
;