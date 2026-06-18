-- Create the table
CREATE TABLE emp_details (
    emp_name VARCHAR(10),
    city VARCHAR(15)
);

-- Insert sample data
INSERT INTO emp_details (emp_name, city) VALUES
('Sam', 'New York'),
('David', 'New York'),
('Peter', 'New York'),
('Chris', 'New York'),
('John', 'New York'),
('Steve', 'San Francisco'),
('Rachel', 'San Francisco'),
('Robert', 'Los Angeles');

commit;


with cte as (
select emp.*, row_number() over (partition by city order by city) as rn from EMP_DETAILS emp), cte2 as (
select ct.*, CEIL(rn/3.0) as team_group from cte ct), cte3 as (
select city, team_group, listagg(emp_name, ',') as team from cte2 group by city, team_group order by city)
select c.*, concat('Team', row_number() over (order by city)) as team_name from cte3 c
;