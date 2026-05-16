
-- write an sql query to find the winner in each group

-- The winner in each group is the player who scored the maximum total points within the group.GROUP_ID
-- In the case of a tie, the lowest player_id wins.


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