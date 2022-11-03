{{
  config(
    materialized='table'
  )
}}

with sessions as (select * from {{ref('int_session_events_agg')}} ),
product_names as(select * from {{ref('int_sessions_products')}}),
final as(select p.name, 
    sum(PAGE_VIEW) PAGE_VIEW, 
    sum(ADD_TO_CART) ADD_TO_CART, 
    sum(CHECKOUT) CHECKOUT,
    sum(ADD_TO_CART)/sum(PAGE_VIEW) as cvr_add_to_cart,
    sum(CHECKOUT)/sum(ADD_TO_CART)as cvr_checkout from sessions s left join product_names p on(s.SESSION_ID=p.SESSION_ID) group by 1)

select * from final

