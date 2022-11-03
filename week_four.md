Part 1. dbt Snapshots

Which orders changed from week 3 to week 4? 
38c516e8-b23a-493a-8a5c-bf7b2b9ea995
d1020671-7cdf-493c-b008-c48535415611
aafb9fbd-56e1-4dcc-b6b2-a3fd91381bb6

Part 2. Modeling challenge
How are our users moving through the product funnel?
Only 19% our users in page views and the purchases.
The 52% our users proceed to the add to cart after page views. 
And 36% hour users proceed to the next purchase stage from add to cart to check out .

 select 

    sum(PAGE_VIEW) PAGE_VIEW, 
    sum(ADD_TO_CART) ADD_TO_CART, 
    sum(CHECKOUT) CHECKOUT,
    sum(ADD_TO_CART)/sum(PAGE_VIEW) as cvr_add_to_cart,
    sum(CHECKOUT)/sum(ADD_TO_CART)as cvr_checkout,
    sum(CHECKOUT)/sum(PAGE_VIEW) as checkout_vs_pageviews
    from dev_db.dbt_sandravargas.INT_SESSION_EVENTS_AGG 

Which steps in the funnel have largest drop off points?
The Add to cart

If your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?

It seems complicated but in the end the use of the platform for data modeling is very friendly. The modeling generation processes are very agile, as well as for. new processes such as for joins as well as deleting information. and the fact that it uses SQL makes it even better.


if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?
 i believe that the most important thing is to keep the data clean and organized in such a way that it improves the query conditions for one or more users and is a friendly recognition of what each table contains and where the information is located. With this course I think that this organization, of nomenclatures, data types of data, etc. is important to share as one of the best practices for my team. Also always try to simplify data models to be understood by various internal customers.


if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

The first time I opened the terminal I thought it was very confusing and I thought it would be very difficult to understand how to use it. Today with practice I feel more familiar with the uses and declarations within the terminal. It helped me a lot to learn with trial and error, I consider that this is very relevant in the first steps to later begin to model the data with greater agility and from there begin the generation of models given the different needs.