CREATE TABLE seats (
    id INT,
    student VARCHAR(10)
);

INSERT INTO seats VALUES 
(1, 'Amit'),
(2, 'Deepa'),
(3, 'Rohit'),
(4, 'Anjali'),
(5, 'Neha'),
(6, 'Sanjay'),
(7, 'Priya');

commit;

select * from seats;

select s.*, case when id = (select max(id) from seats) and MOD(id, 2)= 1 then id 
    when mod(id, 2) = 0 then id - 1
    else id + 1
end as new_id

 from seats s;


 -- method 2

 select s.*, case
    when mod(id, 2) = 0 then lag(id, 1) over(order by id)
    else lead(id, 1, id) over(order by id)
end as new_id

 from seats s;


-- updated query
--  update seats
-- set seats.id= new_seats.new_id
-- from (select *
-- , case when id = (select MAX(id) from seats) and id%2=1 then id
--   when id%2=0 then id-1
--   else id+1
--   end as new_id
-- from seats ) new_seats
-- where seats.id= new_seats.id

-- select * from seats
-- order by id ;