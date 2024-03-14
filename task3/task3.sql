WITH task3 AS (
    SELECT * FROM {{ ref('task3') }} -- user_id, deposit_date(start and end), amount
)
, information_deposit AS (
    SELECT
        DATE_TRUNC(deposit_date_start, "MONTH") AS month_start
        , DATE_TRUNC(deposit_date_end, "MONTH") AS month_end
        , count(distinct user_id) AS n_users
        , sum(amount) AS all_amount_in_month
    FROM task3
    {{ dbt_utils.group_by(2) }}
)
SELECT *
FROM information_deposit
