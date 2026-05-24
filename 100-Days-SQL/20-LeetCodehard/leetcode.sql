create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

select * from UserActivity;

ROLLBACK;

INSERT INTO UserActivity 
VALUES ('Alice', 'Travel', TO_DATE('2020-02-12','YYYY-MM-DD'),
                           TO_DATE('2020-02-20','YYYY-MM-DD'));

INSERT INTO UserActivity 
VALUES ('Alice', 'Dancing', TO_DATE('2020-02-21','YYYY-MM-DD'),
                             TO_DATE('2020-02-23','YYYY-MM-DD'));

INSERT INTO UserActivity 
VALUES ('Alice', 'Travel', TO_DATE('2020-02-24','YYYY-MM-DD'),
                           TO_DATE('2020-02-28','YYYY-MM-DD'));

INSERT INTO UserActivity 
VALUES ('Bob', 'Travel', TO_DATE('2020-02-11','YYYY-MM-DD'),
                         TO_DATE('2020-02-18','YYYY-MM-DD'));


-- Get the second most recent activity, if there is only one activity then return that one 

-- if multiple second most recent

with cte as (
select us.*, count(1) over (PARTITION by username) as total_activities, rank() over (PARTITION by USERNAME order by STARTDATE desc) as rnk from USERACTIVITY us )
select * from cte where total_activities = 1 or rnk = 2
;

