{{
  config(
    materialized='table'
  )
}}

WITH orders as (select * FROM {{ref('stg_orders')}}),

country as(select * from {{ref('stg_addresses')}}),

promo as(select * FROM {{ref('stg_promos')}}),

items as (SELECT ORDER_ID, SUM(QUANTITY) as order_products
FROM {{ref('stg_orderitems')}} group by 1)

SELECT 

orders.order_id,
orders.user_id,
orders.created_at as order_date,
country.state,
orders.promo_id,
promo.discount,
orders.order_cost,
orders.order_total,
items.order_products,
orders.status from orders 
LEFT JOIN country on(orders.ADDRESS_ID=country.ADDRESS_ID) 
LEFT JOIN promo on(orders.PROMO_ID=promo.PROMO_ID)
LEFT JOIN items on(orders.ORDER_ID=items.ORDER_ID)



