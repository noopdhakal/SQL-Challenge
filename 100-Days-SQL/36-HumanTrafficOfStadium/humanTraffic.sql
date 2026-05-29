
drop table stadium;
CREATE TABLE stadium (
    id NUMBER,
    visit_date DATE,
    no_of_people NUMBER
);

INSERT INTO stadium VALUES (1, DATE '2017-07-01', 10);
INSERT INTO stadium VALUES (2, DATE '2017-07-02', 109);
INSERT INTO stadium VALUES (3, DATE '2017-07-03', 150);
INSERT INTO stadium VALUES (4, DATE '2017-07-04', 99);
INSERT INTO stadium VALUES (5, DATE '2017-07-05', 145);
INSERT INTO stadium VALUES (6, DATE '2017-07-06', 1455);
INSERT INTO stadium VALUES (7, DATE '2017-07-07', 199);
INSERT INTO stadium VALUES (8, DATE '2017-07-08', 188);

COMMIT;

select * from STADIUM;

with grp_number as
(select st.*,
row_number() over (order by visit_date) as rn
, id - row_number() over (order by visit_date) as grp
 from stadium st
where NO_OF_PEOPLE >= 100)

select * from grp_number where grp in 
(select grp from grp_number group by grp
 having count(1) >= 3)
;