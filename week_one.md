How many users do we have? 
select count(distinct user_id) from dev_db.dbt_sandravargas.stg_users;

130

On average, how many orders do we receive per hour?
15 ORDERS

WITH HOURS AS (select  
distinct(EXTRACT('HOUR', "CREATED_AT")) AS HOURS,
COUNT(DISTINCT ORDER_ID)  AS ORDERS
 from dev_db.dbt_sandravargas.stg_ORDERS
 GROUP BY 1)
 SELECT AVG(ORDERS) FROM HOURS


On average, how long does an order take from being placed to being delivered?

IN DAYS AVG 3.8 DAYS

WITH DAYS AS(SELECT  ORDER_ID,
DATEDIFF( day, CREATED_AT, DELIVERED_AT ) AS DAYS_LATE
 from dev_db.dbt_sandravargas.stg_ORDERS
 WHERE DELIVERED_AT IS NOT NULL)
 
 SELECT AVG(DAYS_LATE) FROM DAYS



How many users have only made one purchase? Two purchases? Three+ purchases?
1 25 USERS
2 , 28 USERS
3, 71 USERS

 WITH ORDERS AS(SELECT U.USER_ID, COUNT(DISTINCT O.ORDER_ID) AS USER_ORDERS
FROM dev_db.dbt_sandravargas.stg_USERS U LEFT JOIN dev_db.dbt_sandravargas.stg_ORDERS O ON U.USER_ID=O.USER_ID
GROUP BY 1)

SELECT COUNT(DISTINCT USER_ID) FROM ORDERS WHERE USER_ORDERS>=3

On average, how many unique sessions do we have per hour?

39.4 SESSIONS BY HOUR

WITH HOURS AS (select  
distinct(EXTRACT('HOUR', "CREATED_AT")) AS HOURS,
COUNT(DISTINCT SESSION_ID)  AS SESSIONS
 from dev_db.dbt_sandravargas.STG_EVENTS
 GROUP BY 1)
 SELECT AVG(SESSIONS) FROM HOURS;