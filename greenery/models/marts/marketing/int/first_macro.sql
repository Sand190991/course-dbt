{{
  config(
    materialized='table'
  )
}}
{% set event_types = ["page_view","add_to_cart","checkout"] %}

select
    session_id,
    {% for event_type in event_types %}
    MAX(case when event_type = '{{event_type}}' then 1 else 0 end) as {{event_type}}_present,
    {% endfor %}
    product_id
from {{ref('stg_events')}}
group by session_id,product_id