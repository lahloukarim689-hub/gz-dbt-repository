with source as (
    select * 
    from {{ source('raw', 'sales') }}
),

renamed as (
    select
        s.date_date,
        s.orders_id,
        s.pdt_id as products_id,
        quantity,
        s.revenue                   
    from {{ source('raw', 'sales') }} s
    left join {{ source('raw', 'product') }} p
        on s.pdt_id = p.products_id
)

select * 
from renamed
