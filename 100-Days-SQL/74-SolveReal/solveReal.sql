drop table tickets;

create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);

delete from tickets;

INSERT ALL
    INTO tickets VALUES (1, DATE '2022-08-01', DATE '2022-08-03')
    INTO tickets VALUES (2, DATE '2022-08-01', DATE '2022-08-12')
    INTO tickets VALUES (3, DATE '2022-08-01', DATE '2022-08-16')
SELECT * FROM dual;


create table holidays
(
holiday_date date
,reason varchar(100)
);


delete from holidays;


INSERT INTO holidays
VALUES (
    DATE '2022-08-11',
    'Rakhi'
);

INSERT INTO holidays
VALUES (
    DATE '2022-08-15',
    'Independence day'
);

commit;

WITH all_dates AS (
    SELECT
        t.ticket_id,
        t.create_date + LEVEL - 1 AS dt
    FROM tickets t
    CONNECT BY LEVEL <= (t.resolved_date - t.create_date + 1)
       AND PRIOR ticket_id = ticket_id
       AND PRIOR SYS_GUID() IS NOT NULL
)
SELECT
    ticket_id,
    COUNT(*) AS business_days
FROM all_dates d
WHERE TO_CHAR(dt, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
      NOT IN ('SAT', 'SUN')
  AND NOT EXISTS (
        SELECT 1
        FROM holidays h
        WHERE h.holiday_date = d.dt
      )
GROUP BY ticket_id;