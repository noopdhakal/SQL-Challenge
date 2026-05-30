
drop TABLE students;
drop table exams;
create table students
(
student_id int,
student_name varchar(20)
);
insert into students values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

create table exams
(
exam_id int,
student_id int,
score int);

insert into exams values
(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
,(40,2,70),(40,4,80);

commit;

select * from students;
select * from exams;

with all_scores as (
select exam_id, min(score) as min_score, max(score) as max_score from exams group by exam_id)
select e.STUDENT_ID, 
-- min_score, max_score
max(case when score=min_score or score=max_score then 1 else 0 end) as redflag
from exams e
inner join all_scores on e.exam_id = all_scores.exam_id
group by e.STUDENT_ID having 
max(case when score=min_score or score=max_score then 1 else 0 end) = 0
;