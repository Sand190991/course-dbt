{{
  config(
    materialized='table'
  )
}}

SELECT INVENTORY
,NAME
,PRICE
,PRODUCT_ID
                       FROM {{ source('_postgres__sources', 'products') }}
                     