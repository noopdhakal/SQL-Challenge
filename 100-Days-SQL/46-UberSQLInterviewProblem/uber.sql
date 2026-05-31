
CREATE TABLE drivers(
    id         VARCHAR2(10),
    start_time TIMESTAMP,
    end_time   TIMESTAMP,
    start_loc  VARCHAR2(10),
    end_loc    VARCHAR2(10)
);

INSERT ALL
  INTO drivers VALUES ('dri_1', TO_DATE('09:00','HH24:MI'), TO_DATE('09:30','HH24:MI'), 'a', 'b')
  INTO drivers VALUES ('dri_1', TO_DATE('09:30','HH24:MI'), TO_DATE('10:30','HH24:MI'), 'b', 'c')
  INTO drivers VALUES ('dri_1', TO_DATE('11:00','HH24:MI'), TO_DATE('11:30','HH24:MI'), 'd', 'e')
SELECT * FROM dual;

INSERT ALL
  INTO drivers VALUES ('dri_1', TO_DATE('12:00','HH24:MI'), TO_DATE('12:30','HH24:MI'), 'f', 'g')
  INTO drivers VALUES ('dri_1', TO_DATE('13:30','HH24:MI'), TO_DATE('14:30','HH24:MI'), 'c', 'h')
SELECT * FROM dual;

INSERT ALL
  INTO drivers VALUES ('dri_2', TO_DATE('12:15','HH24:MI'), TO_DATE('12:30','HH24:MI'), 'f', 'g')
  INTO drivers VALUES ('dri_2', TO_DATE('13:30','HH24:MI'), TO_DATE('14:30','HH24:MI'), 'c', 'h')
SELECT * FROM dual;

ROLLBACK;

select * from DRIVERS;

-- methods 
-- lead function window
-- self join

select id, count(1) as total_rides, 
sum(case when end_loc = next_start_location then 1 else 0 end ) as profit_rides
from (
select d.*, 
lead(START_LOC, 1) over (PARTITION by id order by start_time asc) as next_start_location from drivers d)
group by id;

-- using self join

