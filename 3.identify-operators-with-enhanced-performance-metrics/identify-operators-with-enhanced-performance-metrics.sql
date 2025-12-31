/* Write your PL/SQL query statement below */


WITH get_driver_in_both AS (
    SELECT
        operator_id
    FROM
        (
            SELECT DISTINCT
                operator_id,
                CASE
                    WHEN EXTRACT(MONTH FROM journey_date) BETWEEN 1 AND 6 THEN
                        'F'
                    ELSE
                        'S'
                END AS check_half
            FROM
                journeys
        )
    WHERE
        check_half = 'F'
    INTERSECT
    SELECT
        operator_id
    FROM
        (
            SELECT DISTINCT
                operator_id,
                CASE
                    WHEN EXTRACT(MONTH FROM journey_date) BETWEEN 1 AND 6 THEN
                        'F'
                    ELSE
                        'S'
                END AS check_half
            FROM
                journeys
        )
    WHERE
        check_half = 'S'
), get_fuel_cal_fuel_efficency AS (
    SELECT
        t.operator_id,
        CASE
            WHEN EXTRACT(MONTH FROM t.journey_date) BETWEEN 1 AND 6 THEN
                'F'
            ELSE
                'S'
        END                             AS check_half,
        t.distance_miles / t.energy_usage AS fuel_cal
    FROM
             journeys t
        JOIN get_driver_in_both b ON t.operator_id = b.operator_id
), efficiency_improvement AS (
    SELECT
        operator_id,
        round(AVG(
            CASE
                WHEN check_half = 'F' THEN
                    fuel_cal
            END
        ),
              2) AS first_half_avg,
        round(AVG(
            CASE
                WHEN check_half = 'S' THEN
                    fuel_cal
            END
        ),
              2) AS second_half_avg,
        AVG(
            CASE
                WHEN check_half = 'S' THEN
                    fuel_cal
            END
        ) - AVG(
            CASE
                WHEN check_half = 'F' THEN
                    fuel_cal
            END
        )      AS efficiency_improvement
    FROM
        get_fuel_cal_fuel_efficency
    GROUP BY
        operator_id
)
SELECT
    a.operator_id,
    a.operator_name,
    e.first_half_avg,
    e.second_half_avg,
    round(e.efficiency_improvement,2) as efficiency_improvement
FROM
         operators a
    JOIN efficiency_improvement e ON a.operator_id = e.operator_id
    where e.second_half_avg > e.first_half_avg
ORDER BY
    e.efficiency_improvement DESC,
    a.operator_name ASC;
