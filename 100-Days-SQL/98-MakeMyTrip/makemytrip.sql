create table booking_table (
    booking_id varchar(10),
    booking_date date,
    user_id varchar(10),
    line_of_business varchar(20)
);

INSERT ALL
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b1',  DATE '2022-03-23', 'u1', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b2',  DATE '2022-03-27', 'u2', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b3',  DATE '2022-03-28', 'u1', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b4',  DATE '2022-03-31', 'u4', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b5',  DATE '2022-04-02', 'u1', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b6',  DATE '2022-04-02', 'u2', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b7',  DATE '2022-04-06', 'u5', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b8',  DATE '2022-04-06', 'u6', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b9',  DATE '2022-04-06', 'u2', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b10', DATE '2022-04-10', 'u1', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b11', DATE '2022-04-12', 'u4', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b12', DATE '2022-04-16', 'u1', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b13', DATE '2022-04-19', 'u2', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b14', DATE '2022-04-20', 'u5', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b15', DATE '2022-04-22', 'u6', 'Flight')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b16', DATE '2022-04-26', 'u4', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b17', DATE '2022-04-28', 'u2', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b18', DATE '2022-04-30', 'u1', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b19', DATE '2022-05-04', 'u4', 'Hotel')
    INTO booking_table (booking_id, booking_date, user_id, line_of_business) VALUES ('b20', DATE '2022-05-06', 'u1', 'Flight')
SELECT * FROM dual;

commit;

create table user_table (
    user_id varchar(10),
    segment varchar(10)
);

insert into user_table (user_id, segment) values
('u1', 's1'),
('u2', 's1'),
('u3', 's1'),
('u4', 's2'),
('u5', 's2'),
('u6', 's3'),
('u7', 's3'),
('u8', 's3'),
('u9', 's3'),
('u10', 's3');

commit;

select * from booking_table;
select * from user_table;


select u.segment, count(distinct u.user_id) as total_users
, count(case when b.BOOKING_DATE between date '2022-04-01' and date '2022-04-30' then  u.USER_ID else null end) as total_apr_users 
 from user_table u 
left join booking_table b on u.user_id = b.user_id
group by u.segment
;