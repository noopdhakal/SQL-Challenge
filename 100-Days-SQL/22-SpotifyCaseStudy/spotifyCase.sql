select * from ACTIVITY;


-- 1 either installed or purchase the app

select   event_date, count(distinct user_id) from activity
group by EVENT_DATE
;

-- question 2: find the total active users each week

SELECT a.*, TO_CHAR(EVENT_DATE, 'IW') from ACTIVITY a;

select   TO_CHAR(EVENT_DATE, 'IW'), count(distinct user_id) from activity
group by TO_CHAR(EVENT_DATE, 'IW')
;