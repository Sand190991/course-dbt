{{
  config(
    materialized='table'
  )
}}

select * FROM {{ref('int_users')}}