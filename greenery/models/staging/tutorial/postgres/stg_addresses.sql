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
                       
                        FROM {{ source('_postgres__sources', 'addresses') }}                    