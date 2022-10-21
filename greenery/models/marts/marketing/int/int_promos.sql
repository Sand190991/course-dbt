{{
  config(
    materialized='table'
  )
}}

with promos as(select * from {{ref('stg_promos')}}),
orders as (select * FROM {{ref('stg_orders')}}), 

final as(

SELECT DISTINCT(P.DISCOUNT) AS DISCOUNT
,(P.STATUS) STATUS_PROMO
,COUNT(DISTINCT O.USER_ID) AS USER_IN_PROMO
,COUNT(DISTINCT O.ORDER_ID) AS ORDERS_IN_PROMO
,SUM(O.ORDER_TOTAL) AS PROMO_REVENUE
,COUNT(DISTINCT O.ORDER_ID)/COUNT(DISTINCT O.USER_ID) AVG_ORDER_BY_USER
    , SUM(O.ORDER_TOTAL)/COUNT(DISTINCT O.USER_ID) ATP
FROM promos P LEFT JOIN orders O ON (P.PROMO_ID=O.PROMO_ID)
    GROUP BY 1 ,2)

    select * from final