with

    orders as (

        select * from {{ ref('stg_jaffle_shop__orders') }}

    )

    , payments as (

        select * from {{ ref('stg_stripe__payments') }}
    )

    , orders_with_amount as (

        select
            orders.order_id
            , orders.customer_id
            , payments.amount

        from orders

        left join payments using (order_id)

    )

select * from orders_with_amount
