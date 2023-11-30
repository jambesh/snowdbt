/******

Customer Order model combine data from the customer raw table and order raw table 
based on customer id.
Version : 2.0

******/

with customer_orders as (
    select
        id as customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(user_id) as number_of_customers

    from raw.jaffle_shop.orders 

    group by 1
)

select
    customers.id as customer_id,
    customers.first_name,
    customers.last_name,
    ord.first_order_date,
    ord.most_recent_order_date,
    coalesce(ord.number_of_customers, 0) as number_of_customers
from raw.jaffle_shop.customers customers
left join customer_orders  ord on  customers.id = ord.customer_id