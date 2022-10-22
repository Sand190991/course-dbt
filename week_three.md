What is our overall conversion rate?
  with all_data as (select * from  dev_db.dbt_sandravargas.int_macro_sessions)
    
    select count(distinct order_id)/count(distinct session_id),
    sum(checkouts)/count(distinct session_id)from all_data

62.45%
What is our conversion rate by product?

with prod_ses as (select name, count(distinct session_id) sessions from dev_db.dbt_sandravargas.int_macro_sessions  group by 1),
    
    
   orders as( select name, count(distinct order_id) orders from DEV_DB.DBT_SANDRAVARGAS.INT_ORDERS_ITEM_PRODUCT_NAME group by 1)
    
    select s.name, sessions,orders, sum(orders)/sum(sessions) cvr from prod_ses s left join orders o on(s.name=o.name) where s.name is
    not null group by 1,2,3

 Why might certain products be converting at higher/lower rates than others?
Can be products with discount, or are products with more exposition in the web site. Maybe are season products so the user show more interested.

Run the orders snapshot model using dbt snapshot and query it in snowflake to see how the data has changed since last week. 

Which orders changed from week 2 to week 3? 
8385cfcd-2b3f-443a-a676-9756f7eb5404
e24985f3-2fb3-456e-a1aa-aaf88f490d70
5741e351-3124-4de7-9dff-01a448e7dfd4