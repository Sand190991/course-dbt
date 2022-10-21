{{
  config(
    materialized='table'
  )
}}


with order_items as (select * from {{ref('stg_orderitems')}}),
names_cat as(select * from {{ref('stg_products')}}),

final as 
(select 
o.order_id,
n.name from order_items o left join names_cat n on (o.product_id=n.order_id)
) select * from final