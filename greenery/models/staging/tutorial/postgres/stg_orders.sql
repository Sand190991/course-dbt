
SELECT ORDER_ID
                            , CREATED_AT
                            , ESTIMATED_DELIVERY_AT
                            , DELIVERED_AT
                            , STATUS
                            , USER_ID
                            , TRACKING_ID
                            , ADDRESS_ID
                            , PROMO_ID
                            , SHIPPING_SERVICE
                            , ORDER_COST
                            , SHIPPING_COST
                            , ORDER_TOTAL
                       FROM raw.public.orders
                     