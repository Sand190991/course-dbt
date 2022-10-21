{% 
    set product_names = dbt_utils.get_column_values
    (
        table=ref('int_sessions_products') 
        ,column='name'
        ,order_by='name asc'
       )
%}

select 
user_id,
session_id,
order_id
{% for name in product_names %}
,sum(case when name ='{{name}}' then 1 else 0 end) as {{name}}
{% endfor %}
from {{ref('int_sessions_products')}}
 group by 1,2,3 