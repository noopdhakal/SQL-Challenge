create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);
delete from billings;
insert into billings values
('Sachin','01-JAN-1990',25)
,('Sehwag' ,'01-JAN-1989', 15)
,('Dhoni' ,'01-JAN-1989', 20)
,('Sachin' ,'05-Feb-1991', 30)
;

drop table HoursWorked;
create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '01-JUL-1990' ,3)
,('Sachin', '01-AUG-1990', 5)
,('Sehwag','01-JUL-1990', 2)
,('Sachin','01-JUL-1991', 4);

commit;

select * from billings;
select * from HOURSWORKED;


select a.emp_name, a.BILL_DATE, b.WORK_DATE , extract(year from a.BILL_DATE), EXTRACT(year from b.WORK_DATE) from billings a 
inner join HOURSWORKED b 
on a.EMP_NAME = b.EMP_NAME order by a.BILL_DATE; 


with date_range as 
(select b.*, lead(BILL_DATE - 1, 1, to_date('9999-12-31','yyyy-mm-dd')) over (partition by emp_name order by BILL_DATE asc) as bill_date_end from  BILLINGS b)

select hw.EMP_NAME, sum(dr.bill_rate * hw.BILL_HRS) from date_range dr 
inner join HOURSWORKED hw on hw.EMP_NAME = dr.emp_name 
and hw.WORK_DATE between dr.bill_date and dr.bill_date_end
group by hw.EMP_NAME
;


select * from billings;
select * from HOURSWORKED;