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

NAME	SESSIONS	ORDERS	CVR
Orchid	75	34	0.453333
Ponytail Palm	70	28	0.400000
Pink Anthurium	74	31	0.418919
Bamboo	67	36	0.537313
Spider Plant	59	28	0.474576
Birds Nest Fern	78	33	0.423077
Aloe Vera	65	32	0.492308
Pothos	61	21	0.344262
Ficus	68	29	0.426471
Fiddle Leaf Fig	56	28	0.500000
Calathea Makoyana	53	27	0.509434
Pilea Peperomioides	59	28	0.474576
Boston Fern	63	26	0.412698
Cactus	55	30	0.545455
Rubber Plant	54	28	0.518519
Monstera	49	25	0.510204
Majesty Palm	67	33	0.492537
Jade Plant	46	22	0.478261
Arrow Head	63	35	0.555556
ZZ Plant	63	34	0.539683
Philodendron	62	30	0.483871
Bird of Paradise	60	27	0.450000
Snake Plant	73	29	0.397260
Peace Lily	66	27	0.409091
Alocasia Polly	51	21	0.411765
Devil's Ivy	45	22	0.488889
Money Tree	56	26	0.464286
Angel Wings Begonia	61	24	0.393443
Dragon Tree	62	29	0.467742
String of pearls	64	39	0.609375






 Why might certain products be converting at higher/lower rates than others?
Can be products with discount, or are products with more exposition in the web site. Maybe are season products so the user show more interested.

Run the orders snapshot model using dbt snapshot and query it in snowflake to see how the data has changed since last week. 

Which orders changed from week 2 to week 3? 
8385cfcd-2b3f-443a-a676-9756f7eb5404
e24985f3-2fb3-456e-a1aa-aaf88f490d70
5741e351-3124-4de7-9dff-01a448e7dfd4