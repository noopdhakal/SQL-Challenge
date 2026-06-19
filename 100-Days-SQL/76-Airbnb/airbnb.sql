create table airbnb_searches 
(
user_id int,
date_searched date,
filter_room_types varchar(200)
);


delete from airbnb_searches;

INSERT INTO airbnb_searches
VALUES (1, DATE '2022-01-01', 'entire home,private room');

INSERT INTO airbnb_searches
VALUES (2, DATE '2022-01-02', 'entire home,shared room');

INSERT INTO airbnb_searches
VALUES (3, DATE '2022-01-02', 'private room,shared room');

INSERT INTO airbnb_searches
VALUES (4, DATE '2022-01-03', 'private room');

commit;


SELECT
    room_type,
    COUNT(*) AS no_of_searches
FROM (
    SELECT
        TRIM(REGEXP_SUBSTR(filter_room_types, '[^,]+', 1, LEVEL)) AS room_type
    FROM airbnb_searches
    CONNECT BY LEVEL <= REGEXP_COUNT(filter_room_types, ',') + 1
       AND PRIOR user_id = user_id
       AND PRIOR SYS_GUID() IS NOT NULL
)
GROUP BY room_type
ORDER BY no_of_searches DESC;

commit;