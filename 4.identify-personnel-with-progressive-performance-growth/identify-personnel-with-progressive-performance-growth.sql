/* Write your PL/SQL query statement below */

WITH data AS (
    SELECT
        *
    FROM
        (
            SELECT
                staff_id,
                assessment_date,
                score,
                ROW_NUMBER()
                OVER(PARTITION BY staff_id
                     ORDER BY
                         assessment_date DESC, score DESC
                ) AS rnk_ass_rt,
                COUNT(*)
                OVER(PARTITION BY staff_id
                     ORDER BY
                         staff_id
                ) AS cnt_rd
            FROM
                evaluation_records
        )
    WHERE
            cnt_rd >= 3
        AND rnk_ass_rt <= 3
)
SELECT
    a.staff_id,
    p.full_name,
    score - lead_2 AS growth_metric
FROM
         (
        SELECT
            *
        FROM
            (
                SELECT
                    staff_id,
                    score,
                    LEAD(score, 1)
                    OVER(PARTITION BY staff_id
                         ORDER BY
                             assessment_date DESC
                    ) AS lead_1,
                    LEAD(score, 2)
                    OVER(PARTITION BY staff_id
                         ORDER BY
                             assessment_date DESC
                    ) AS lead_2
                FROM
                    data
            )
        WHERE
            ( score IS NOT NULL
              AND lead_1 IS NOT NULL
              AND lead_2 IS NOT NULL )
            AND ( score > lead_1
                  AND lead_1 > lead_2 )
    ) a
    JOIN personnel p ON a.staff_id = p.staff_id
ORDER BY
    ( score - lead_2 ) DESC,
    p.full_name ASC;
