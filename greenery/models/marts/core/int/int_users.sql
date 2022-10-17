{{
  config(
    materialized='table'
  )
}}

with users as(select * from {{('stg_users')}})
,

country as ( select * from {{('stg_addresses')}})

select 
u.user_id,
u.created_at,
u.first_name,
u.last_name,
u.email,
c.state,
c.country,
c.zipcode

from users u left join country c on (u.ADDRESS_ID=c.ADDRESS_ID)

