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