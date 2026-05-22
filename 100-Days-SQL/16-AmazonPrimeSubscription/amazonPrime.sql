select * from users;

select * from events;

select 
-- u.*, e.type, e.access_date,
--  e.ACCESS_DATE - u.JOIN_DATE as no_of_days
 count(distinct u.user_id) as total_users
 , count(distinct case when  e.ACCESS_DATE - u.JOIN_DATE <= 30 then u.user_id end ) 
 , count(distinct case when  e.ACCESS_DATE - u.JOIN_DATE <= 30 then u.user_id end ) / count(distinct u.user_id)
 from USERS u
left join events e on u.user_id = e.user_id and e.type ='P'
where u.user_id in (select user_id from events where type='Music');