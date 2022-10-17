{{
  config(
    materialized='table'
  )
}}


ELECT
USER_ID,
EVENT_ID,
sum(CASE WHEN EVENT_TYPE='page_view' then 1 else 0 end) page_view,
sum(CASE WHEN EVENT_TYPE='add_to_cart' then 1 else 0 end) add_to_cart,
sum(CASE WHEN EVENT_TYPE='checkout' then 1 else 0 end) checkout,
sum(CASE WHEN EVENT_TYPE='package_shipped' then  1 else 0 end) package_shipped

from {{('stg_events')}}

group by 1,2S