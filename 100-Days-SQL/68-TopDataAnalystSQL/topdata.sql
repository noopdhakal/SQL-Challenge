CREATE TABLE events (
    userid NUMBER,
    event_type VARCHAR2(20),
    event_time DATE
);

drop table events;

INSERT ALL
  INTO events VALUES (1, 'click',  TO_TIMESTAMP('2023-09-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (1, 'click',  TO_TIMESTAMP('2023-09-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (1, 'scroll', TO_TIMESTAMP('2023-09-10 10:20:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (1, 'click',  TO_TIMESTAMP('2023-09-10 10:50:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (1, 'scroll', TO_TIMESTAMP('2023-09-10 11:40:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (1, 'click',  TO_TIMESTAMP('2023-09-10 12:40:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (1, 'scroll', TO_TIMESTAMP('2023-09-10 12:50:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (2, 'click',  TO_TIMESTAMP('2023-09-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (2, 'scroll', TO_TIMESTAMP('2023-09-10 09:20:00', 'YYYY-MM-DD HH24:MI:SS'))
  INTO events VALUES (2, 'click',  TO_TIMESTAMP('2023-09-10 10:30:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;

commit;

with cte as (
select e.*, lag(event_time, 1, EVENT_TIME) over (partition by userid order by event_type) as prev_event_time
, ROUND((
           event_time -
           LAG(event_time, 1, event_time)
               OVER (PARTITION BY userid ORDER BY event_time)
       ) * 24 * 60) AS time_diff from events e), cte2 as (
       select c1.*, case when time_diff <= 30 then 0 else 1 end as session_flag, 
       sum(case when time_diff <= 30 then 0 else 1 end) over (PARTITION BY userid ORDER BY event_time)  as session_group
        from cte c1)

        select userid, session_group + 1 as session_id, min(event_time) as session_start_time,
            max(event_time) as session_end_time, count(*) as number_of_events
            , ROUND((MAX(event_time) - MIN(event_time)) * 1440) AS session_duration
         from cte2 group by userid, session_group
;
