{{
  config(
    materialized='table'
  )
}}

select
order_id,
  {{ dbt_utils.pivot(
      'name',
      dbt_utils.get_column_values(ref('int_orders_item_product_name'), 'name')
  ) }}
from {{ ref('int_orders_item_product_name') }}
group by order_id
