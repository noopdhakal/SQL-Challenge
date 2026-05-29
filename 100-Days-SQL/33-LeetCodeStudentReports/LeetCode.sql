create table players_location
(
name varchar(20),
city varchar(20)
);
delete from players_location;
insert into players_location
values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');


commit;


select player_groups, 
max(case when city='Bangalore' then name end)as Bangalore, 
max(case when city='Delhi' then name end) as Delhi,
max(case when city='Mumbai' then name end)as Mumbai from
(select pl.*, row_number() over (partition by city order by name asc ) as player_groups from PLAYERS_LOCATION pl) a
-- order by player_groups
group by player_groups 
;