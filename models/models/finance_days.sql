with
    join1 as (
        select
            date_date,
            orders_id,
            revenue,
            quantity,
            purchase_price,
            purchase_cost,
            margin,
            shipping_fee,
            logcost,
            ship_cost
        from {{ ref("int_sales_margin") }}
        left join {{ ref("stg_raw__ship") }} using (orders_id)
    )

select
    date_date,
    count(orders_id) as transactions,
    round(sum(revenue), 2) as total_revenue,
    round(sum(quantity), 2) as total_quantity,
    round(sum(purchase_price), 2) as total_purchase_price,
    round(sum(purchase_cost), 2) as total_purchase_cost,
    round(sum(shipping_fee), 2) as total_shipping_fee,
from join1
group by date_date
