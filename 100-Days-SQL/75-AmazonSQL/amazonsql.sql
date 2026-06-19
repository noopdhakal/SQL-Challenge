CREATE TABLE hospital (
    emp_id NUMBER,
    action VARCHAR2(10),
    time TIMESTAMP
);

INSERT ALL
  INTO hospital VALUES (1,'in',TO_TIMESTAMP('2019-12-22 09:00:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (1,'out',TO_TIMESTAMP('2019-12-22 09:15:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (2,'in',TO_TIMESTAMP('2019-12-22 09:00:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (2,'out',TO_TIMESTAMP('2019-12-22 09:15:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (2,'in',TO_TIMESTAMP('2019-12-22 09:30:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (3,'out',TO_TIMESTAMP('2019-12-22 09:00:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (3,'in',TO_TIMESTAMP('2019-12-22 09:15:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (3,'out',TO_TIMESTAMP('2019-12-22 09:30:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (3,'in',TO_TIMESTAMP('2019-12-22 09:45:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (4,'in',TO_TIMESTAMP('2019-12-22 09:45:00','YYYY-MM-DD HH24:MI:SS'))
  INTO hospital VALUES (5,'out',TO_TIMESTAMP('2019-12-22 09:40:00','YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;

commit;

-- SOLUTION 1


With cte as (
select emp_id
, max(case when action='in' then time end) as intime
, max(case when action='out' then time end) as outtime
from hospital
group by emp_id
having max(case when action='in' then time end) > max(case when action='out' then time end)
or max(case when action='out' then time end) is null
)
select * from cte
where intime>outtime or outtime is null;



-- SOLUTION 2


with intime as
(select emp_id,max(time) as latest_in_time
from hospital
where action = 'in'
group by emp_id
),
outtime as
(select emp_id,max(time) as latest_out_time
from hospital
where action = 'out'
group by emp_id
)
select * from intime
left join outtime on intime.emp_id = outtime.emp_id
where latest_in_time > latest_out_time or latest_out_time is null;



-- SOLUTION 3


with latest_time as
(select emp_id , max(time) as max_latest_time from hospital group by emp_id)
, latest_in_time as (select emp_id , max(time) as max_in_time from hospital
where action='in'
group by emp_id)
select *
from latest_time lt
inner join latest_in_time lit on lt.emp_id=lit.emp_id and max_latest_time=max_in_time;