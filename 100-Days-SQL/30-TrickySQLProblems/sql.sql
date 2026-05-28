CREATE TABLE students(
    studentid NUMBER,
    studentname VARCHAR2(255),
    subject VARCHAR2(255),
    marks NUMBER,
    testid NUMBER,
    testdate DATE
);

insert into students values (2,'Max Ruin','Subject1',63,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (3,'Arnold','Subject1',95,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (4,'Krish Star','Subject1',61,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (5,'John Mike','Subject1',91,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (4,'Krish Star','Subject2',71,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (3,'Arnold','Subject2',32,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (5,'John Mike','Subject2',61,2,TO_DATE('2022-11-02','YYYY-MM-DD'));

insert into students values (1,'John Deo','Subject2',60,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (2,'Max Ruin','Subject2',84,1,TO_DATE('2022-01-02','YYYY-MM-DD'));

insert into students values (2,'Max Ruin','Subject3',29,3,TO_DATE('2022-01-03','YYYY-MM-DD'));

insert into students values (5,'John Mike','Subject3',98,2,TO_DATE('2022-11-02','YYYY-MM-DD'));

select * from STUDENTS;

-- 1 sql query to get the list of students who scored above the average marks in each subject.

with avg_marks as 
(select subject, avg(MARKS) as avg_marks from STUDENTS GROUP by subject)
select distinct studentname from STUDENTS s 
inner join avg_marks av on s.subject = av.subject where s.MARKS > av.avg_marks;


-- Problem 2

-- write an sql query to get the percentage of students who score more than 90 in any subject amongst the total students\\

select * from STUDENTS;
select 
count(distinct case when marks > 90 then studentid else null end) / count(distinct STUDENTID) as perc from STUDENTS ;


-- Problem 3
--  write an sql query to get the second highest and second lowest marks for each subject

select subject, min(marks), max(marks) from STUDENTS
group by subject;


select subject, 
sum(case when rank_desc = 2 then marks else null end) as second_highest_marks,
sum(case when rank_asc = 2 then marks else null end) as second_lowest_marks
 from  
( select subject, marks,
rank() over (PARTITION by subject order by marks asc) as rank_asc,
rank() over (PARTITION by subject order by marks desc) as rank_desc
 from STUDENTS sc)
 group by subject
 ;

 --- Problem 4