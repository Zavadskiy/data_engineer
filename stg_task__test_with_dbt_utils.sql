WITH base_task__test AS (
    SELECT * FROM {{ ref('base_task__test') }}
)
, task__test_deduplicated AS (
    {{
        dbt_utils.deduplicate(
            relation='base_task__test',
            partition_by='user_id',
            order_by='updated_at desc'
        )
    }}
)
, stg_task__test AS (
    SELECT * FROM task__test_deduplicated
)