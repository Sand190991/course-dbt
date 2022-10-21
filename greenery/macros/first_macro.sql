


select
    session_id,
    
    MAX(case when event_type = 'page_view' then 1 else 0 end) as page_view_present,
    
    MAX(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_cart_present,
    
    MAX(case when event_type = 'checkout' then 1 else 0 end) as checkout_present,
    
    product_id
from dev_db.dbt_sandravargas.stg_events
group by session_id,product_id