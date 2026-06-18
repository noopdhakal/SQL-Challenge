CREATE TABLE call_start_logs
(
    phone_number VARCHAR2(10),
    start_time   DATE
);

INSERT INTO call_start_logs
VALUES ('PN1', TO_DATE('2022-01-01 10:20:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO call_start_logs
VALUES ('PN1', TO_DATE('2022-01-01 16:25:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO call_start_logs
VALUES ('PN2', TO_DATE('2022-01-01 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO call_start_logs
VALUES ('PN3', TO_DATE('2022-01-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO call_start_logs
VALUES ('PN3', TO_DATE('2022-01-02 12:30:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO call_start_logs
VALUES ('PN3', TO_DATE('2022-01-03 09:20:00', 'YYYY-MM-DD HH24:MI:SS'));

COMMIT;


CREATE TABLE call_end_logs
(
    phone_number VARCHAR2(10),
    end_time     DATE
);


INSERT ALL
    INTO call_end_logs VALUES ('PN1', TO_DATE('2022-01-01 10:45:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO call_end_logs VALUES ('PN1', TO_DATE('2022-01-01 17:05:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO call_end_logs VALUES ('PN2', TO_DATE('2022-01-01 12:55:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO call_end_logs VALUES ('PN3', TO_DATE('2022-01-02 10:20:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO call_end_logs VALUES ('PN3', TO_DATE('2022-01-02 12:50:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO call_end_logs VALUES ('PN3', TO_DATE('2022-01-03 09:40:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;

COMMIT;

select * from call_start_logs;
select * from CALL_END_LOGS;

-- SOLUTION 1


SELECT
    a.phone_number,
    a.rn,
    a.start_time,
    b.end_time,
    (b.end_time - a.start_time) * 24 * 60 AS duration
FROM
(
    SELECT c.*,
           ROW_NUMBER() OVER (
               PARTITION BY phone_number
               ORDER BY start_time
           ) AS rn
    FROM call_start_logs c
) a
INNER JOIN
(
    SELECT c.*,
           ROW_NUMBER() OVER (
               PARTITION BY phone_number
               ORDER BY end_time
           ) AS rn
    FROM call_end_logs c
) b
ON a.phone_number = b.phone_number
AND a.rn = b.rn;


-- SOLUTION 2


SELECT
    phone_number,
    rn,
    MIN(call_time) AS start_time,
    MAX(call_time) AS end_time,
    ROUND((MAX(call_time) - MIN(call_time)) * 24 * 60) AS duration
FROM
(
    SELECT
        phone_number,
        start_time AS call_time,
        ROW_NUMBER() OVER (
            PARTITION BY phone_number
            ORDER BY start_time
        ) AS rn
    FROM call_start_logs

    UNION ALL

    SELECT
        phone_number,
        end_time AS call_time,
        ROW_NUMBER() OVER (
            PARTITION BY phone_number
            ORDER BY end_time
        ) AS rn
    FROM call_end_logs
) a
GROUP BY phone_number, rn
ORDER BY phone_number, rn;