select * from entries;

with total_visits as 
(select name, count(1) as total_visits, LISTAGG(distinct resources,',') as resources_used from entries group by name ),
 floor_visit as 
(select name, floor, count(1) no_of_floor_visit,
rank() over (PARTITION by name order by count(1) desc) as rn
from entries group by name, floor)
select fv.name, fv.floor as most_visited_floor, tv.total_visits, tv.resources_used from floor_visit  fv 
INNER join total_visits tv on fv.name = tv.name
where rn = 1;


select name, floor, count(1),
rank() over (partition by name order by count(1) desc ) as rn 
 from entries group by name, floor ;