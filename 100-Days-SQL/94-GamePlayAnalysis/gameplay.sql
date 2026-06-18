create table activity (

 player_id     int     ,
 device_id     int     ,
 event_date    date    ,
 games_played  int
 );

 drop table activity;

INSERT ALL
    INTO activity VALUES (1, 2, DATE '2016-03-01', 5)
    INTO activity VALUES (1, 2, DATE '2016-03-02', 6)
    INTO activity VALUES (2, 3, DATE '2017-06-25', 1)
    INTO activity VALUES (3, 1, DATE '2016-03-02', 0)
    INTO activity VALUES (3, 4, DATE '2018-07-03', 5)
SELECT * FROM dual;

commit;

 select * from activity;

 -- 1 

 select player_id, min(event_date) as first_time_login from ACTIVITY group by player_id;

 ---2 
select * from 
 (select a.*, rank() over (PARTITION by PLAYER_ID order by event_date) as rn from ACTIVITY a)
 where rn = 1
 ;

 --3 
select a.*, sum(games_played) over (PARTITION by PLAYER_ID order by event_date) as total_played from ACTIVITY a;

--4 

with min_date as (
    select player_id, min(event_date) as first_date from ACTIVITY GROUP by player_id
)
select a.*, first_date from activity a inner join min_date md on a.player_id = md.player_id
where a.EVENT_DATE - first_date  = 1
;