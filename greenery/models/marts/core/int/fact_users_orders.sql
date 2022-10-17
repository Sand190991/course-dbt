{{
  config(
    materialized='table'
  )
}}

with user as(select * from {{ref('int_users')}} ),
orders as(select order_id,user_id,order_date,discount,order_total,order_products,shipping_cost from {{ref('fct_orders')}}),
lenght_orders as(select user_id, min(order_date) first_order, max(order_date) last_order from {{ref('fct_orders')}} group by 1),

final as (

    SELECT
    user.user_id,
    user.first_name,
    user.last_name,
    user.email,
    user.created_at as user_since,
    user.country,
    user.state,
    lo.first_order,
    lo.last_order,
    count(DISTINCT orders.order_id) as total_orders,
    sum(orders.ORDER_PRODUCTS) as total_products,
    sum(orders.discount) as total_discount,
    sum(orders.shipping_cost) as total_shipping_cost,
    sum(orders.order_total) as total_revenue,
    sum(orders.order_total)/count(DISTINCT orders.order_id) as atp_by_order,
    sum(orders.order_total)/sum(orders.ORDER_PRODUCTS) as atp_by_product,
    sum(orders.discount)/sum(orders.order_total) as discount_rate

    from user user LEFT JOIN orders on(user.user_id=orders.user_id)
    left join lenght_orders lo on (user.user_id=lo.user_id)
 group by 1,2,3,4,5,6,7,8,9)
    select * from final 
