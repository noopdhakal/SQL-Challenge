create table namaste_python (
file_name varchar(25),
content varchar(200)
);

delete from namaste_python;
insert into namaste_python values ('python bootcamp1.txt','python for data analytics 0 to hero bootcamp starting on Jan 6th')
,('python bootcamp2.txt','classes will be held on weekends from 11am to 1 pm for 5-6 weeks')
,('python bootcamp3.txt','use code NY2024 to get 33 percent off. You can register from namaste sql website. Link in pinned comment');

select * from NAMASTE_PYTHON;

select * from string_split('python bootcamp1.txt','python for data analytics 0 to hero bootcamp starting on Jan 6th', ' ');

SELECT word,
       COUNT(*) AS cnt_of_word
FROM (
    SELECT REGEXP_SUBSTR(content, '[^ ]+', 1, LEVEL) AS word
    FROM namaste_python
    CONNECT BY REGEXP_SUBSTR(content, '[^ ]+', 1, LEVEL) IS NOT NULL
           AND PRIOR file_name = file_name
           AND PRIOR SYS_GUID() IS NOT NULL
)
GROUP BY word
HAVING COUNT(*) > 1
ORDER BY cnt_of_word DESC;