WITH test AS (
    SELECT * FROM {{ sourse("sandbox_test", "test") }}
)

, base_task__test AS (
    SELECT
        bonus_issue_id
        , operation
        , user_id
        , stage
        , title
        , currency
        , created_at
        , activatable_until
        , valid_until
        , amount_cents
        , amount_wager_cents
        , strategy
        , payment_id
        , freespin_id
        , version
        , api_version
        , account_id
        , updated_at
        , export_timestamp
        , finished_at
        , activated_at
    FROM test
)
SELECT *
FROM base_task__test
