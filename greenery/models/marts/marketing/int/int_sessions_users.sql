{{
  config(
    materialized='table'
  )
}}

with events as(select * from {{ref('stg_events')}}),
users as(select * from {{ref('stg_users')}}),
final as(


SELECT
U.USER_ID
,U.CREATED_AT
,U.EMAIL
,E.SESSION_ID,
sum(CASE WHEN E.EVENT_TYPE='page_view' then 1 else 0 end) page_view,
sum(CASE WHEN E.EVENT_TYPE='add_to_cart' then 1 else 0 end) add_to_cart,
sum(CASE WHEN E.EVENT_TYPE='checkout' then 1 else 0 end) checkout,
sum(CASE WHEN E.EVENT_TYPE='package_shipped' then  1 else 0 end) package_shipped

from users U LEFT JOIN events E on(U.USER_ID=E.USER_ID)

group by 1,2,3,4) 

SELECT * from final