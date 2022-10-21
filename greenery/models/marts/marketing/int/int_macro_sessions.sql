{{
  config(
    materialized='table'
  )
}}

{% 
    set event_types = dbt_utils.get_column_values
    (
        table=ref('stg_events') 
        ,column='event_type'
        ,order_by='event_type asc'
       )
%}

select 
user_id,
session_id,
order_id,
e.product_id,
p.name
{% for event_type in event_types %}
,sum(case when event_type ='{{event_type}}' then 1 else 0 end) as {{event_type}}s
{% endfor %}

from {{ref('stg_events')}} e LEFT JOIN {{ref('stg_products')}} p on(e.product_id=p.product_id)
 group by 1,2,3,4,5