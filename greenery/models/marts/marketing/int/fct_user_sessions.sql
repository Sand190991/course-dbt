{{
  config(
    materialized='table'
  )
}}


with ses_length as (
    select session_id, 
min(CREATED_AT) as first_event,
max(CREATED_AT) as last_event

from {{ ref('stg_events')}}
group by 1)
,

session_events_agg as(
    select * from {{ref('int_session_events_agg')}} 
)
,
users as (select * from {{ref('stg_users')}} 
)

SELECT 
session_events_agg.SESSION_ID,
session_events_agg.USER_ID,
users.FIRST_NAME,
users.LAST_NAME,
users.EMAIL,
session_events_agg.PAGE_VIEW,
session_events_agg.ADD_TO_CART,
session_events_agg.CHECKOUT,
session_events_agg.PACKAGE_SHIPPED,
ses_length.first_event AS first_session_event,
ses_length.last_event AS last_session_event,
datediff('minute',ses_length.first_event,ses_length.last_event) as session_length_minutes

from session_events_agg 
    left JOIN users on (session_events_agg.USER_ID=users.USER_ID)
    LEFT JOIN ses_length on (session_events_agg.SESSION_ID=ses_length.SESSION_ID)