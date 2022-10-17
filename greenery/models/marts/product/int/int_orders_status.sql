{{
  config(
    materialized='table'
  )
}}

 with orders as( select * from {{ref('stg_orders')}})
,country as (select * from {{ref('stg_addresses')}})
,final as (
    SELECT
o.order_id,
o.user_id,
c.state,
c.country,
sum(CASE WHEN status='preparing' then 1 else 0 end) preparing,
sum(CASE WHEN status='shipped' then 1 else 0 end) shipped,
sum(CASE WHEN status='delivered' then 1 else 0 end) delivered

from orders o left join country c on (o.ADDRESS_ID=c.ADDRESS_ID)

group by 1,2,3,4)

select * from final