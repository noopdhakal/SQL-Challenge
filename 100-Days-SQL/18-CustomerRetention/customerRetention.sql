select * from transactions;

-- jan 0
--feb 1, 2, 3 --> customer retention --> count = 3

-- Self join

SELECT EXTRACT(MONTH FROM this_month.order_date) AS month_date,
       COUNT(DISTINCT last_month.cust_id) AS customer_count
FROM transactions this_month
LEFT JOIN transactions last_month
    ON this_month.cust_id = last_month.cust_id
   AND MONTHS_BETWEEN(
           TRUNC(this_month.order_date, 'MM'),
           TRUNC(last_month.order_date, 'MM')
       ) = 1
GROUP BY EXTRACT(MONTH FROM this_month.order_date)
ORDER BY month_date;