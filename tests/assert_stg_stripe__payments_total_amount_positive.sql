SELECT
    order_id
    , sum(amount) AS total_amount
FROM {{ ref('stg_stripe__payments') }}
GROUP BY order_id
HAVING total_amount < 0
