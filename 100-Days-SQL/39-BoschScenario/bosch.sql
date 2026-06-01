create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

insert into call_details
values ('OUT','181868',13),('OUT','2159010',8)
,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);

commit;

select * from call_details;

-- cte and filter clause

with cte as
(select call_number,
sum(case when call_type='OUT' then call_duration else null end) as out_duration
, sum(case when call_type='INC' then call_duration else null end) as inc_duration
 from call_details
group by call_number)
select call_number from cte
where out_duration is not null and inc_duration is not null and out_duration > inc_duration
;


--using having clause

with cte as
(select call_number,
sum(case when call_type in ('OUT') then CALL_DURATION else null end) as out_duration, 
sum(case when call_type in ('INC') then CALL_DURATION else null end) as in_duration
 from call_details
 group by call_number)
 select call_number from cte where out_duration is not null and in_duration is not null and out_duration > in_duration;
 ;

 -- Having condition 

 select call_number from call_details 
 group by call_number
 having 
 sum(case when call_type in ('OUT') then CALL_DURATION else null end) > 0 
 and sum(case when call_type in ('INC') then CALL_DURATION else null end) > 0
 and sum(case when call_type in ('OUT') then CALL_DURATION else null end) > sum(case when call_type in ('INC') then CALL_DURATION else null end);


 --- Join condition 

select * from call_details;
 
 
 with cte_out as (

    select call_number, sum(call_duration) as duration from call_details 
    where call_type = 'OUT'
    group by call_number 
 ), cte_in as (
select call_number, sum(call_duration) as duration from call_details 
    where call_type = 'INC'
    group by call_number 
 )
 select a.call_number from cte_in a inner join cte_out b on a.call_number = b.call_number
 where a.duration < b.duration
 ;