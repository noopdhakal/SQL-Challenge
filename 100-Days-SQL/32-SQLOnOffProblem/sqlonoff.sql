create table event_status
(
event_time varchar(10),
status varchar(10)
);
insert into event_status 
values
('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
,('10:11','on'),('10:12','off');


select * from EVENT_STATUS;

with groupK as (
select 
A.*, 
sum(case when status='on' and prv_status='off' then 1 else 0 end) over(order by A.event_time) as group_key
from 
(select a.*, lag(status, 1, STATUS) over (order by event_time asc) as prv_status
from EVENT_STATUS a) A)

select min(event_time) as login, 
max(event_time) as logout, count(1) - 1 as on_count
from groupk group by group_key 
;