with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        Cast ( ship_cost as FLOAT64) AS ship_cost

    from source


)

select * from renamed
