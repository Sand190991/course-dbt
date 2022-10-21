{{
  config(
    materialized='table'
  )
}}

with sessions as (select * from {{ref('stg_events')}}),
product_names as(select * from {{ref('stg_products')}}),

final as(SELECT

s.session_id,
s.user_id,
s.order_id,
s.event_type,
p.name 

from sessions s left join product_names p on(s.product_id=p.product_id)

) select * from final