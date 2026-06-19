CREATE TABLE airports (
    port_code VARCHAR(10) PRIMARY KEY,
    city_name VARCHAR(100)
);

CREATE TABLE flights (
    flight_id   VARCHAR2(10),
    start_port  VARCHAR2(10),
    end_port    VARCHAR2(10),
    start_time  TIMESTAMP,
    end_time    TIMESTAMP
);

delete from airports;
INSERT INTO airports (port_code, city_name) VALUES
('JFK', 'New York'),
('LGA', 'New York'),
('EWR', 'New York'),
('LAX', 'Los Angeles'),
('ORD', 'Chicago'),
('SFO', 'San Francisco'),
('HND', 'Tokyo'),
('NRT', 'Tokyo'),
('KIX', 'Osaka');

delete from flights;

INSERT INTO flights VALUES (
    1, 'JFK', 'HND',
    TO_TIMESTAMP('2025-06-15 06:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 18:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    2, 'JFK', 'LAX',
    TO_TIMESTAMP('2025-06-15 07:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 10:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    3, 'LAX', 'NRT',
    TO_TIMESTAMP('2025-06-15 10:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 22:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    4, 'JFK', 'LAX',
    TO_TIMESTAMP('2025-06-15 08:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 11:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    5, 'LAX', 'KIX',
    TO_TIMESTAMP('2025-06-15 11:30','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 22:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    6, 'LGA', 'ORD',
    TO_TIMESTAMP('2025-06-15 09:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 12:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    7, 'ORD', 'HND',
    TO_TIMESTAMP('2025-06-15 11:30','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 23:30','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    8, 'EWR', 'SFO',
    TO_TIMESTAMP('2025-06-15 09:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 12:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    9, 'LAX', 'HND',
    TO_TIMESTAMP('2025-06-15 13:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 23:00','YYYY-MM-DD HH24:MI')
);

INSERT INTO flights VALUES (
    10, 'KIX', 'NRT',
    TO_TIMESTAMP('2025-06-15 08:00','YYYY-MM-DD HH24:MI'),
    TO_TIMESTAMP('2025-06-15 10:00','YYYY-MM-DD HH24:MI')
);


WITH flight_details AS (
    SELECT
        f.*,
        s.city_name AS start_city,
        e.city_name AS end_city
    FROM flights f
    JOIN airports s
        ON f.start_port = s.port_code
    JOIN airports e
        ON f.end_port = e.port_code
),
direct AS (
    SELECT
        start_city,
        NULL AS middle_city,
        end_city,
        TO_CHAR(flight_id) AS flight_id,
        (end_time - start_time) * 24 * 60 AS time_taken
    FROM flight_details
    WHERE start_city = 'New York'
      AND end_city = 'Tokyo'
)

SELECT
    a.start_city AS trip_start_city,
    a.end_city AS middle_city,
    b.end_city AS trip_end_city,
    TO_CHAR(a.flight_id) || ',' || TO_CHAR(b.flight_id) AS flight_id,
    (b.end_time - a.start_time) * 24 * 60 AS trip_time
FROM flight_details a
JOIN flight_details b
    ON a.end_city = b.start_city
WHERE a.start_city = 'New York'
  AND b.end_city = 'Tokyo'
  AND b.start_time >= a.end_time

UNION ALL

SELECT
    start_city,
    middle_city,
    end_city,
    flight_id,
    time_taken
FROM direct;