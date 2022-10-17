{{
  config(
    materialized='table'
  )
}}

SELECT DISCOUNT
,PROMO_ID
,STATUS
                       FROM raw.public.PROMOS
                     