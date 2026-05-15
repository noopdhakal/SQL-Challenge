

-- Oracle PL/SQL version

-- # write a query to provide the date for nth occurrence of Sunday in future from given data

-- datepart
-- sunday-1
-- monday-2
-- friday-6
-- saturday-7
SELECT NEXT_DAY(DATE '2022-01-01', 'SUNDAY') + (3 - 1) * 7 AS nth_sunday
FROM dual;

-- select dateadd(weeks, @n-1, dateadd(day, 8 - datepart(weekday, @today_date), @today_date))