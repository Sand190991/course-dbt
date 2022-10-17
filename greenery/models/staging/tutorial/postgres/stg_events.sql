{{
  config(
    materialized='table'
  )
}}

SELECT CREATED_AT
,EVENT_ID
,EVENT_TYPE
,ORDER_ID
,PAGE_URL
,PRODUCT_ID
,SESSION_ID
,USER_ID
                       FROM {{ source('_postgres__sources', 'events') }}
                     