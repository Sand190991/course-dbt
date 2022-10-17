{{
  config(
    materialized='table'
  )
}}



with core as( select * from {{ref('int_core_orders')}}),
status as(select * from {{ref('int_orders_status')}}),
shipping as(select * from {{ref('int_orders_shipping')}}),

final as(SELECT c.order_id,
c.user_id,
c.order_date,
s.country,
s.state,
s.preparing,
s.shipped,
s.delivered,
c.discount,
c.order_cost,
c.order_total,
c.order_products,
sp.shipping_cost,
sp.ups,
sp.usps,
sp.fedex,
sp.dhl,
sp.DIF_ESTM_REAL_DELIV,
sp.DIFF_CREATE_DELIV,
sum(c.order_total)/sum(c.order_products)  atp_product_price
from core c
LEFT JOIN status s on(c.order_id=s.order_id)
LEFT JOIN shipping sp on(c.order_id=sp.order_id) group by 1,2,3,4,5,6,7,8,9,10,
11,12,13,14,15,16,17,18,19)

select * from final