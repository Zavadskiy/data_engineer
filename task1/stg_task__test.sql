WITH test AS (
    SELECT * FROM {{ ref("base_task__test") }}
)
, test_deduplicated AS (
    SELECT
        *
        , ROW_NUMBER() OVER(PARTITION BY bonus_issue_id ORDER BY updated_at DESC) AS row_n
    FROM (
        SELECT DISTINCT * FROM test
    )
)
SELECT *
    , EXEPT(row_n)
FROM test_deduplicated
WHERE row_n = 1
