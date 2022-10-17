
{% snapshot snapshot_orders %}

{{
  config(
    target_database = target.database,
    target_schema = target.schema,
    strategy='check',
    unique_key='order_id',
    check_cols=['status'],
   )
}}

select * from {{ source('_postgres__sources','orders') }}

{% endsnapshot %}