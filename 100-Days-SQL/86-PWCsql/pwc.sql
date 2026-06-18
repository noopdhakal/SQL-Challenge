create table source(id int, name varchar(5));

create table target(id int, name varchar(5));

insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D');

insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');

-- METHOD 1


select coalesce(s.id,t.id) as id
, s.name, t.name
,case when t.name is null then 'new in source' when s.name is null then 'new in target' else 'mismatch' end as comment
from source s
full join target t on s.id=t.id
where s.name != t.name or s.name is null or t.name is null;


-- METHOD 2


WITH cte AS (
    SELECT s.*, 'source' AS table_name
    FROM source s

    UNION ALL

    SELECT t.*, 'target' AS table_name
    FROM target t
)
SELECT
    id,
    COUNT(*) AS cnt,
    CASE
        WHEN MIN(name) <> MAX(name) THEN 'mismatch'
        WHEN MIN(table_name) = 'source' THEN 'new in source'
        ELSE 'new in target'
    END AS remarks
FROM cte
GROUP BY id
HAVING COUNT(*) = 1
    OR (COUNT(*) = 2 AND MIN(name) <> MAX(name));