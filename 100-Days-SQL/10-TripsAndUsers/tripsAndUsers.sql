-- https://leetcode.com/problems/trips-and-users/description/


select * from Trips;

select * from users;


select t.REQUEST_AT, 
    count(case when status in ('cancelled_by_client', 'cancelled_by_driver') then 1 else null end) as cancelled_trip_count,
    count(1) as total_trips,
     count(case when status in ('cancelled_by_client', 'cancelled_by_driver') then 1 else null end)/count(1) * 100 as cancelled_trip_count
 from Trips t
inner join users c on t.CLIENT_ID = c.USERS_ID
inner join users d on t.DRIVER_ID = d.USERS_ID
where c.BANNED='No' and d.BANNED='No'
group by request_at
;

select * from users;