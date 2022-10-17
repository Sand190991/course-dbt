{{
  config(
    materialized='table'
  )
}}

SELECT ORDER_ID,
PRODUCT_ID,
QUANTITY
                       FROM raw.public.order_items
                       
                     