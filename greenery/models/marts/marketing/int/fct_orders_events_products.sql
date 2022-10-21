{{
  config(
    materialized='table'
  )
}}

with ses as(select * from {{ref('int_macro_sessions')}}),
cat_names as (select * from {{ref('int_macro_orders_product_name')}} ),

final as(select



 * from ses left join cat_names on(ses.order_id=cat_names.order_id))
select * from final

