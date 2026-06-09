create table people
(id int primary key not null,
 name varchar(20),
 gender char(2));

create table relations
(
    c_id int,
    p_id int,
    FOREIGN KEY (c_id) REFERENCES people(id),
    foreign key (p_id) references people(id)
);

insert into people (id, name, gender)
values
    (107,'Days','F'),
    (145,'Hawbaker','M'),
    (155,'Hansel','F'),
    (202,'Blackston','M'),
    (227,'Criss','F'),
    (278,'Keffer','M'),
    (305,'Canty','M'),
    (329,'Mozingo','M'),
    (425,'Nolf','M'),
    (534,'Waugh','M'),
    (586,'Tong','M'),
    (618,'Dimartino','M'),
    (747,'Beane','M'),
    (878,'Chatmon','F'),
    (904,'Hansard','F');

insert into relations(c_id, p_id)
values
    (145, 202),
    (145, 107),
    (278,305),
    (278,155),
    (329, 425),
    (329,227),
    (534,586),
    (534,878),
    (618,747),
    (618,904);

    commit;

    select * from people;
    select * from relations;


    with m as (
    select r.C_ID, p.NAME as mother_name from RELATIONS r
    inner join people p on r.P_ID = p.id and gender = 'F'), f as 
    (
    select r.C_ID, p.NAME as father_name from RELATIONS r
    inner join people p on r.P_ID = p.id and gender = 'M')
    select f.c_id as child_id, p.NAME as child_name,  m.mother_name, 
        f.father_name
     from f inner join m on f.C_ID = m.C_ID
     inner join people p on p.ID = f.C_ID
    ;

    -- method 2

    select r.C_ID, max(m.name) as mother_name, max(f.name) as father_name from relations r 
    left join people m on r.P_ID = m.ID and m.gender='F'
    left join people f on r.P_ID = f.ID and f.gender='M'
    group by r.C_ID
    ;

    -- method 3

     select r.C_ID as child_id, 
     max(case when p.GENDER='F' then name end) as mother_name,
     max(case when p.GENDER='M' then name end) as father_name
      from relations r
    left join people p on r.P_ID = p.id
    group by r.C_ID

    ;
