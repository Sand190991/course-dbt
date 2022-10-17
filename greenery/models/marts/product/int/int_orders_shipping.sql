{{
  config(
    materialized='table'
  )
}}

 with orders as(select * from {{ref('stg_orders')}}), 
country as (select * from {{ref('stg_addresses')}}),

delivery as (select order_id, datediff('day',DELIVERED_AT,ESTIMATED_DELIVERY_AT) dif_estm_real_deliv,
datediff('day',CREATED_AT,DELIVERED_AT) diff_create_deliv

 from {{ref('stg_orders')}} GROUP BY order_id,CREATED_AT,ESTIMATED_DELIVERY_AT,DELIVERED_AT),


final as (
    SELECT
o.order_id,
o.user_id,
o.created_at,
c.state,
c.country,
o.delivered_at,
o.shipping_cost,
sum(CASE WHEN o.status='ups' then 1 else 0 end) ups,
sum(CASE WHEN o.status='usps' then 1 else 0 end) usps,
sum(CASE WHEN o.status='fedex' then 1 else 0 end) fedex,
sum(CASE WHEN o.status='dhl' then 1 else 0 end) dhl,
del.dif_estm_real_deliv,
del.diff_create_deliv
from orders o left join country c on (o.ADDRESS_ID=c.ADDRESS_ID)
left join delivery del on(o.order_id=del.order_id)
group by 1,2,3,4,5,6,7,12,13)

select * from final