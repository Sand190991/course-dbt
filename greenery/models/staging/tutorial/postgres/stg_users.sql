{{
  config(
    materialized='table'
  )
}}

SELECT ADDRESS_ID
,CREATED_AT
,EMAIL
,FIRST_NAME
,LAST_NAME
,PHONE_NUMBER
,UPDATED_AT
,USER_ID

FROM raw.public.USERS
                     