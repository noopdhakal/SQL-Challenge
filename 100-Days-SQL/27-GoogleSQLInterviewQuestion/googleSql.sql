create table company_users 
(
company_id int,
user_id int,
language varchar(20)
);

insert into company_users values (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');

-- ## Find companies who have at least 2 users who speaks English and German both the languages

select * from company_users;

select COMPANY_ID, count(1) from 
(select company_id, user_id, count(1) 
from COMPANY_USERS
where language in ('English', 'German')
group by COMPANY_ID, user_id
having count(1) = 2 ) a
group by company_id having count(1) >= 2
;