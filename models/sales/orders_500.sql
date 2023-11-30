/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

with source_data as (

    select o_orderkey as  order_key, o_custkey as customerid, o_orderstatus as orderstatus,o_totalprice as ordertotal,o_orderdate as order_date,
    o_orderpriority as order_priority
    from snowflake_sample_data.tpch_sf10.orders limit 500

)

select *
from source_data


