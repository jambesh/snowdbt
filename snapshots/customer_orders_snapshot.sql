{{% snapshot snapshot_ppi %}}

{{ 
    config(
    materialized='snapshot',
    unique_key = 'customerid'
    schema =  'raw'
    ) 

}}

select * from analytics.dbt_jm.customer_500;

{{% endsnapshot %}}