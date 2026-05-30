CREATE TABLE phonelog (
    callerid    NUMBER,
    recipientid NUMBER,
    datecalled  TIMESTAMP
);

INSERT ALL
INTO phonelog VALUES (1,2,TO_TIMESTAMP('2019-01-01 09:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (1,3,TO_TIMESTAMP('2019-01-01 17:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (1,4,TO_TIMESTAMP('2019-01-01 23:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,5,TO_TIMESTAMP('2019-07-05 09:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,3,TO_TIMESTAMP('2019-07-05 17:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,3,TO_TIMESTAMP('2019-07-05 17:20:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,5,TO_TIMESTAMP('2019-07-05 23:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,3,TO_TIMESTAMP('2019-08-01 09:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,3,TO_TIMESTAMP('2019-08-01 17:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,5,TO_TIMESTAMP('2019-08-01 19:30:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,4,TO_TIMESTAMP('2019-08-02 09:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,5,TO_TIMESTAMP('2019-08-02 10:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,5,TO_TIMESTAMP('2019-08-02 10:45:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
INTO phonelog VALUES (2,4,TO_TIMESTAMP('2019-08-02 11:00:00.000','YYYY-MM-DD HH24:MI:SS.FF3'))
SELECT * FROM dual;


with calls as 
(select callerid,  TRUNC(datecalled) AS called_date, min(DATECALLED) as first_call, max(DATECALLED) as last_call from phonelog
group by CALLERID,  TRUNC(datecalled))
select c.*, p1.RECIPIENTID as first_recept, p2.RECIPIENTID as last_rec from calls c
inner join phonelog p1 on c.callerid = p1.callerid
and c.first_call = p1.datecalled
inner join phonelog p2 on c.callerid = p2.callerid
and c.last_call = p2.datecalled

where p1.RECIPIENTID = p2.RECIPIENTID
;

select * from phonelog;