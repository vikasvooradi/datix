/* Write your PL/SQL query statement below */


WITH get_driver_in_both AS (
    SELECT
        driver_id
    FROM
        (
            SELECT DISTINCT
                driver_id,
                CASE
                    WHEN EXTRACT(MONTH FROM trip_date) BETWEEN 1 AND 6 THEN
                        'F'
                    ELSE
                        'S'
                END AS check_half
            FROM
                trips
        )
    WHERE
        check_half = 'F'
    INTERSECT
    SELECT
        driver_id
    FROM
        (
            SELECT DISTINCT
                driver_id,
                CASE
                    WHEN EXTRACT(MONTH FROM trip_date) BETWEEN 1 AND 6 THEN
                        'F'
                    ELSE
                        'S'
                END AS check_half
            FROM
                trips
        )
    WHERE
        check_half = 'S'
), get_fuel_cal_fuel_efficency AS (
    SELECT
        t.driver_id,
        CASE
            WHEN EXTRACT(MONTH FROM t.trip_date) BETWEEN 1 AND 6 THEN
                'F'
            ELSE
                'S'
        END                             AS check_half,
        t.distance_km / t.fuel_consumed AS fuel_cal
    FROM
             trips t
        JOIN get_driver_in_both b ON t.driver_id = b.driver_id
), efficiency_improvement AS (
    SELECT
        driver_id,
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
        driver_id
)
SELECT
    a.driver_id,
    a.driver_name,
    e.first_half_avg,
    e.second_half_avg,
    round(e.efficiency_improvement,2) as efficiency_improvement
FROM
         drivers a
    JOIN efficiency_improvement e ON a.driver_id = e.driver_id
    where e.second_half_avg > e.first_half_avg
ORDER BY
    e.efficiency_improvement DESC,
    a.driver_name ASC;