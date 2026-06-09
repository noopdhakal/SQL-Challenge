-- METHOD 1


select experience
,sum(case when (case when sql IS null or sql=100 then 1 else 0 end +
case when algo IS null or algo=100 then 1 else 0 end +
case when bug_fixing IS null or bug_fixing=100 then 1 else 0 end)=3 then 1 else 0 end) as max_score_flag
,COUNT(*) as total_condidates
from assessments
group by experience



-- METHOD 2


with cte as (
select id,experience, sql as score , 'sql' as subject
from assessments
union all
select id,experience, algo as score , 'algo' as subject
from assessments
union all
select id,experience, bug_fixing as score , 'bug_fixing' as subject
from assessments
)
select experience, SUM(perfect_score_flag) max_score_students,COUNT(*) as total_students
from (
select id, experience
,case when sum(case when score is null or score = 100 then 1 else 0 end) = (select COUNT(distinct subject) from cte) then 1 else 0 end as perfect_score_flag
from cte
group by id, experience) a
group by experience;