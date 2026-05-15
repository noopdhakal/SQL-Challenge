
select * from person;
select * from friend;

-- write a query to find personID, Name, number of friend, sum of marks of 
-- a person who have friends with total score greater than 100

with friends_number as 
( select personid, name, score, b.fid as friend_id  from person a
left join friend b on a.personID = b.pid order by 2)

;

select * from person;



select b.pid, b.total_score, a.name from score_value b left join person a on a.personID = b.pid;


select * from person;
select * from friend;

with final_score as
(select a.pid, sum(b.score) as score_person from friend a 
inner join person b
on a.fid = b.personID 
group by a.pid having score_person > 100)

select a.pid, a.score_person, b.name from final_score a left join person b on a.pid=b.personID
;