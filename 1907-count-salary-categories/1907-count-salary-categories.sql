/* Write your PL/SQL query statement below */WITH category AS (
    SELECT
        'Low Salary' AS category,
        0            AS accounts_count
    FROM
        dual
    UNION
    SELECT
        'Average Salary' AS category,
        0                AS accounts_count
    FROM
        dual
    UNION
    SELECT
        'High Salary' AS category,
        0             AS accounts_count
    FROM
        dual
), data AS (
    SELECT
        CASE
            WHEN income < 20000                 THEN
                'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN
                'Average Salary'
            ELSE
                'High Salary'
        END               AS category,
        COUNT(account_id) AS accounts_count
    FROM
        accounts
    GROUP BY (
        CASE
            WHEN income < 20000                 THEN
                'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN
                'Average Salary'
            ELSE
                'High Salary'
        END
    )
)
SELECT
    category,
    accounts_count
FROM
    category
WHERE
    category NOT IN (
        SELECT DISTINCT
            category
        FROM
            data
    )
UNION
SELECT
    category,
    accounts_count
FROM
    data