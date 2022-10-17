WITH USERS_ORDERS AS(SELECT DISTINCT(USER_ID) AS USER_ID,
COUNT(DISTINCT ORDER_ID) AS ORDERS FROM DEV_DB.DBT_SANDRAVARGAS.STG_ORDERS GROUP BY 1),

TWO_ORDERS_USERS AS(
    SELECT USER_ID AS TWO_ORDERS_USERS FROM USERS_ORDERS WHERE ORDERS>=2)
SELECT count( DISTINCT T.TWO_ORDERS_USERS)/COUNT(DISTINCT O.USER_ID) RATE
FROM USERS_ORDERS O LEFT JOIN TWO_ORDERS_USERS T ON(O.USER_ID=T.TWO_ORDERS_USERS)

Repeat Rate = Users who purchased 2 or more times / users who purchased
79%

What are good indicators of a user who will likely purchase again? 
What about indicators of users who are likely NOT to purchase again? 
If you had more data, what features would you want to look into to answer this question?

I would look at the user sessions, how many times they have entered after their first purchase, if they have returned or not, and if they have stayed in any step of the funnel. I would also check in terms of delivery if it was made within the estimated time or if it was made later to understand whether or not your shopping experience was good.

Explain the marts models you added. Why did you organize the models in the way you did?
I tried to organize the data models at the session level and at the user level, being able to see in levels of each variable almost all the available information that I consider interesting such as country, state, order averages, revenue, etc. so that they can be visualized more easily.


What assumptions are you making about each model? (i.e. why are you adding each test?)

Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
I did very simple tests since it was a bit difficult for me to understand the generation of the test. But having the unique id models for users, sessions and orders as well as testing if they were null, I didn't run into any problems.

Which orders changed from week 1 to week 2? 
 select * from dev_db.dbt_sandravargas.snapshot_orders
    where dbt_valid_to is not null

    ORDER_ID
914b8929-e04a-40f8-86ee-357f2be3a2a2
05202733-0e17-4726-97c2-0520c024ab85
939767ac-357a-4bec-91f8-a7b25edd46c9

