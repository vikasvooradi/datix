/* Write your PL/SQL query statement below */


WITH data AS (
    SELECT
        employee_id,
        lead_2 - rating AS improvement_score
    FROM
        (
            SELECT
                employee_id,
                review_date,
                rating,
                LEAD(rating, 1)
                OVER(PARTITION BY employee_id
                     ORDER BY
                         review_date
                ) AS lead_1,
                LEAD(rating, 2)
                OVER(PARTITION BY employee_id
                     ORDER BY
                         review_date
                ) AS lead_2
            FROM
                (
                    SELECT
                        employee_id,
                        review_date,
                        rating,
                        ROW_NUMBER()
                        OVER(PARTITION BY employee_id
                             ORDER BY
                                 review_date DESC, rating DESC
                        )                              AS rnk_rvt,
                        COUNT(*)
                        OVER(PARTITION BY employee_id) AS grp_cnt
                    FROM
                        performance_reviews
                )
            WHERE
                    grp_cnt >= 3
                AND rnk_rvt <= 3
        )
    WHERE
        ( rating IS NOT NULL
          AND lead_1 IS NOT NULL
          AND lead_2 IS NOT NULL )
        AND ( lead_2 > lead_1
              AND lead_1 > rating )
)
SELECT
    e.employee_id,
    e.name,
    d.improvement_score
FROM
         data d
    JOIN employees e ON d.employee_id = e.employee_id
ORDER BY
    d.improvement_score DESC,
    e.name ASC;
