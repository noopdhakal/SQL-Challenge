CREATE TABLE hall_events
(
    hall_id    NUMBER,
    start_date DATE,
    end_date   DATE
);

DELETE FROM hall_events;

INSERT ALL
    INTO hall_events VALUES (1, DATE '2023-01-13', DATE '2023-01-14')
    INTO hall_events VALUES (1, DATE '2023-01-14', DATE '2023-01-17')
    INTO hall_events VALUES (1, DATE '2023-01-15', DATE '2023-01-17')
    INTO hall_events VALUES (1, DATE '2023-01-18', DATE '2023-01-25')
    INTO hall_events VALUES (2, DATE '2022-12-09', DATE '2022-12-23')
    INTO hall_events VALUES (2, DATE '2022-12-13', DATE '2022-12-17')
    INTO hall_events VALUES (3, DATE '2022-12-01', DATE '2023-01-30')
SELECT * FROM dual;

COMMIT;

select * from HALL_EVENTS he;

WITH cte AS
(
    SELECT h.*,
           ROW_NUMBER() OVER (ORDER BY hall_id, start_date) AS event_id
    FROM hall_events h
),
r_cte
(
    hall_id,
    start_date,
    end_date,
    event_id,
    flag
) AS
(
    -- Anchor member
    SELECT hall_id,
           start_date,
           end_date,
           event_id,
           1 AS flag
    FROM cte
    WHERE event_id = 1

    UNION ALL

    -- Recursive member
    SELECT c.hall_id,
           c.start_date,
           c.end_date,
           c.event_id,
           CASE
               WHEN c.hall_id = r.hall_id
                AND (
                     c.start_date BETWEEN r.start_date AND r.end_date
                     OR r.start_date BETWEEN c.start_date AND c.end_date
                    )
               THEN r.flag
               ELSE r.flag + 1
           END AS flag
    FROM r_cte r
    JOIN cte c
      ON c.event_id = r.event_id + 1
)
SEARCH DEPTH FIRST BY event_id SET order_col
SELECT hall_id,
       flag,
       MIN(start_date) AS start_date,
       MAX(end_date)   AS end_date
FROM r_cte
GROUP BY hall_id, flag
ORDER BY hall_id, start_date;