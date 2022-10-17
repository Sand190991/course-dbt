{{
  config(
    materialized='table'
  )
}}

SELECT INVENTORY
,NAME
,PRICE
,PRODUCT_ID
                       FROM raw.public.PRODUCTS
                     