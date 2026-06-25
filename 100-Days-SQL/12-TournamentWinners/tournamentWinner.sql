
drop table players;

create table players
(player_id int,
group_id int);

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

drop table matches;

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int);

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);


-- write an sql query to find the winner in each group

-- The winner in each group is the player who scored the maximum total points within the group.GROUP_ID
-- In the case of a tie, the lowest player_id wins.

commit;

select * from players;

select * from matches;

with player_score as 
(select first_player as player_id, first_score as score from matches
union all 
select second_player as player_id, second_score as score from matches), final_scores as
(select p.group_id, ps.player_id, sum(score) as score from player_score ps
inner join players p on p.PLAYER_ID = ps.player_id
group by ps.player_id, p.GROUP_ID), final_ranking as
(select fs.*, rank() over (PARTITION by group_id order by score desc, player_id asc) rn from final_scores fs)
select * from final_ranking where rn = 1
;

select * from matches a 
inner join players b on a.match_id = b.GROUP_ID;


select * from players;