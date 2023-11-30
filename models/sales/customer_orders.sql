/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with customer_view as (

   /* select o_orderkey as  order_key, o_custkey as customerid, o_orderstatus as orderstatus,o_totalprice as ordertotal,o_orderdate as order_date,
    o_orderpriority as order_priority
    from snowflake_sample_data.tpch_sf10.orders limit 500
    */
    select * from {{ref('customer_500')}}

),

order_view as  (
    select * from {{ref('orders_500')}}
)

select cv.customer,ov.order_key
from customer_view cv  
full join order_view ov on cv.customerid = ov.customerid


