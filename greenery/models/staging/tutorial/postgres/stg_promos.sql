{{
  config(
    materialized='table'
  )
}}

SELECT DISCOUNT
,PROMO_ID
,STATUS
                       FROM {{ source('_postgres__sources', 'promos') }}
                     