create table Ameriprise_LLC
(
teamID varchar(2),
memberID varchar(10),
Criteria1 varchar(1),
Criteria2 varchar(1)
);
insert into Ameriprise_LLC values 
('T1','T1_mbr1','Y','Y'),
('T1','T1_mbr2','Y','Y'),
('T1','T1_mbr3','Y','Y'),
('T1','T1_mbr4','Y','Y'),
('T1','T1_mbr5','Y','N'),
('T2','T2_mbr1','Y','Y'),
('T2','T2_mbr2','Y','N'),
('T2','T2_mbr3','N','Y'),
('T2','T2_mbr4','N','N'),
('T2','T2_mbr5','N','N'),
('T3','T3_mbr1','Y','Y'),
('T3','T3_mbr2','Y','Y'),
('T3','T3_mbr3','N','Y'),
('T3','T3_mbr4','N','Y'),
('T3','T3_mbr5','Y','N');

-- method 1

with qualified_team as (
select teamid, count(1) as no_of_eligibile_members 
from AMERIPRISE_LLC where Criteria1='Y' and criteria2='Y' group by TEAMID
having count(1) >= 2 )

select al.*, qt.*, 
case when Criteria1='Y' and criteria2='Y' and qt.teamid is not null then 'Y' else 'N' end as qualified_flag
 from AMERIPRISE_LLC  al
left join qualified_team qt on al.teamid = qt.teamid order by 1
;


-- method 2

select al.*,  
sum(case when Criteria1='Y' and criteria2='Y' then 1 else 0 end) over (partition by teamid) as eligible_member_cnt, 
case when Criteria1='Y' and criteria2='Y' and
sum(case when Criteria1='Y' and criteria2='Y' then 1 else 0 end) over (partition by teamid) then 'Y' else 'N' end as qualified_flag
 from AMERIPRISE_LLC  al;