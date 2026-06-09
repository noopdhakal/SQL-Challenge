create table polls
(
user_id varchar(4),
poll_id varchar(3),
poll_option_id varchar(3),
amount int,
created_date date
);
-- Insert sample data into the investments table
INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id1', 'p1', 'A', 200, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id2', 'p1', 'C', 250, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id3', 'p1', 'A', 200, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id4', 'p1', 'B', 500, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id5', 'p1', 'C', 50, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id6', 'p1', 'D', 500, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id7', 'p1', 'C', 200, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id8', 'p1', 'A', 100, DATE '2021-12-01');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id9', 'p2', 'A', 300, DATE '2023-01-10');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id10', 'p2', 'C', 400, DATE '2023-01-11');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id11', 'p2', 'B', 250, DATE '2023-01-12');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id12', 'p2', 'D', 600, DATE '2023-01-13');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id13', 'p2', 'C', 150, DATE '2023-01-14');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id14', 'p2', 'A', 100, DATE '2023-01-15');

INSERT INTO polls (user_id, poll_id, poll_option_id, amount, created_date)
VALUES ('id15', 'p2', 'C', 200, DATE '2023-01-16');

COMMIT;

create table poll_answers
(
poll_id varchar(3),
correct_option_id varchar(3)
);

-- Insert sample data into the poll_answers table
INSERT INTO poll_answers (poll_id, correct_option_id) VALUES
('p1', 'C'),('p2', 'A');

commit;

select * from POLL_ANSWERS;

with cte1 as(
select p.poll_id, sum(amount) as amount_tobe_distributed from polls p
inner join POLL_ANSWERS pa on p.poll_id = pa.poll_id
where p.poll_option_id <> pa.correct_option_id
group by p.poll_id
), cte2 as (

select p.poll_id, user_id, 
amount /  sum(amount) over (partition by p.poll_id) as proportion
 from polls p
inner join POLL_ANSWERS pa on p.poll_id = pa.poll_id
where p.poll_option_id = pa.correct_option_id
)
-- group by p.poll_id

select cte2.*, cte2.proportion * cte1.amount_tobe_distributed as winning_amount from cte2 inner join cte1 on cte1.poll_id = cte2.poll_id
;
