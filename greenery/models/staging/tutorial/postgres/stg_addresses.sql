{{
  config(
    materialized='table'
  )
}}

SELECT ADDRESS
, ADDRESS_ID
,COUNTRY
,STATE
,ZIPCODE
                       FROM raw.public.addresses
                     