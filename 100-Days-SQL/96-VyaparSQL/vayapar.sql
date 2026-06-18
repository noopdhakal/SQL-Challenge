-- Create tables
CREATE TABLE department (
    dep_id INT,
    dep_name VARCHAR(50)
);

CREATE TABLE empdetails (
    emp_id INT,
    first_name VARCHAR(50),
    gender VARCHAR(1),
    dep_id INT
);

CREATE TABLE client (
    client_id INT,
    client_name VARCHAR(50)
);

CREATE TABLE empsales (
    emp_id INT,
    client_id INT,
    sales INT
);

-- Insert data
INSERT INTO department (dep_id, dep_name) VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing');

INSERT INTO empdetails (emp_id, first_name, gender, dep_id) VALUES
(101, 'Alice', 'F', 1),
(102, 'Bob', 'M', 1),
(103, 'Charlie', 'M', 2),
(104, 'Diana', 'F', 2),
(105, 'Ethan', 'M', 3),
(106, 'Fiona', 'F', 3);

INSERT INTO client (client_id, client_name) VALUES
(1, 'Amazon'),
(2, 'Walmart'),
(3, 'Costco'),
(4, 'Target'),
(5, 'BestBuy');

INSERT INTO empsales (emp_id, client_id, sales) VALUES
(101, 1, 5000),
(101, 2, 3000),
(102, 1, 7000),
(102, 3, 2000),
(103, 2, 4000),
(103, 4, 3000),
(104, 4, 6000),
(105, 5, 8000),
(106, 3, 5000),
(106, 5, 2000);

commit;

select * from empsales;
select * from EMPDETAILS;
select * from DEPARTMENT;
select * from client;


with cte as (
    select s.*, e.dep_id
    from empsales s
    inner join empdetails e on s.emp_id = e.emp_id
)
, emp_client_cte as
(
    select dep_id, emp_id as id, 'emp' as sale_type, SUM(sales) as sales
    from cte
    group by dep_id, emp_id
    union all
    select dep_id, client_id as id, 'client' as sale_type, SUM(sales) as sales
    from cte
    group by dep_id, client_id
)
select dep_id
     , max(case when sale_type = 'client' then id end) as client_id
     , max(case when sale_type = 'emp' then id end) as emp_id
from (
    select ct.*
    , ROW_NUMBER() over(partition by dep_id, sale_type order by sales desc) as rn
    from emp_client_cte ct
) a
where rn = 1
group by dep_id;