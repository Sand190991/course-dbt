{{
  config(
    materialized='table'
  )
}}

SELECT ORDER_ID,
PRODUCT_ID,
QUANTITY
                       FROM {{ source('_postgres__sources', 'order_items') }}
                       
                     