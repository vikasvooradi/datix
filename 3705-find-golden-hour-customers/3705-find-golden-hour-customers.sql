/* Write your PL/SQL query statement below */


WITH get_total_orders AS (
    -- ✔ filters customers who made at least 3 orders
    SELECT
        customer_id AS custid,
        total_orders
    FROM (
        SELECT
            customer_id,
            COUNT(order_timestamp) AS total_orders
        FROM restaurant_orders
        GROUP BY customer_id
    )
    WHERE total_orders >= 3
),

filter_peak_hours_data_set AS (
    -- ✔ Peak hour filtering logic (unchanged)
    SELECT *
    FROM restaurant_orders
    WHERE to_char(order_timestamp, 'HH24:MI') BETWEEN '11:00' AND '14:00'
       OR to_char(order_timestamp, 'HH24:MI') BETWEEN '18:00' AND '21:00'
),

cal_peak_hrs_cnt AS (
    -- ✔ Counts peak-hour orders per customer
    SELECT
        customer_id,
        COUNT(*) AS peak_hr_cnt
    FROM filter_peak_hours_data_set
    GROUP BY customer_id
),

final_peak_data AS (
    SELECT
        g.custid AS customer_id,
        NVL(p.peak_hr_cnt, 0) AS peak_hr_cnt,
        g.total_orders,

        -- 🔧 FIX: round to INTEGER percentage (expected output)
        ROUND(NVL(p.peak_hr_cnt, 0) * 100 / g.total_orders) AS peak_percentage

    FROM get_total_orders g
    LEFT JOIN cal_peak_hrs_cnt p
        ON g.custid = p.customer_id

    -- 🔧 FIX: correct 60% logic
    WHERE NVL(p.peak_hr_cnt, 0) / g.total_orders >= 0.6
),

cal_rating_avg AS (
    SELECT
        r.customer_id,

        -- 🔧 FIX: average only on rated orders
        AVG(r.order_rating) AS avg_order_rating,

        -- 🔧 FIX: needed to check 50% rule
        COUNT(r.order_rating) AS rated_orders,
        COUNT(*) AS total_orders

    FROM restaurant_orders r
    GROUP BY r.customer_id

    HAVING
        -- 🔧 FIX: >= instead of >
        AVG(r.order_rating) >= 4.0

        -- 🔧 FIX: rated orders must be at least 50%
        AND COUNT(r.order_rating) >= COUNT(*) * 0.5
)

SELECT
    a.customer_id,
    a.total_orders,
    a.peak_percentage AS peak_hour_percentage,
    ROUND(b.avg_order_rating, 2) AS average_rating
FROM final_peak_data a
JOIN cal_rating_avg b
    ON a.customer_id = b.customer_id
ORDER BY
    ROUND(b.avg_order_rating, 2) DESC,
    a.customer_id DESC;


/*

WITH order_stats AS (

    SELECT 

        customer_id,

        COUNT(*) AS total_orders,

        SUM(

            CASE 

                WHEN 

                    (TO_CHAR(order_timestamp,'HH24:MI:SS') BETWEEN '11:00:00' AND '14:00:00')

                    OR (TO_CHAR(order_timestamp,'HH24:MI:SS') BETWEEN '18:00:00' AND '21:00:00')

                THEN 1 ELSE 0 

            END

        ) AS peak_orders,

        SUM(CASE WHEN order_rating IS NOT NULL THEN 1 ELSE 0 END) AS rated_orders,

        AVG(CASE WHEN order_rating IS NOT NULL THEN order_rating END) AS avg_rating

    FROM restaurant_orders

    GROUP BY customer_id

),

qualified AS (

    SELECT

        customer_id,

        total_orders,

        ROUND(peak_orders * 100.0 / total_orders, 0) AS peak_hour_percentage,

        ROUND(avg_rating, 2) AS average_rating,

        rated_orders

    FROM order_stats

    WHERE 

        total_orders >= 3

        AND peak_orders * 1.0 / total_orders >= 0.60

        AND rated_orders * 1.0 / total_orders >= 0.50

        AND avg_rating >= 4.0

)

SELECT

    customer_id,

    total_orders,

    peak_hour_percentage,

    average_rating

FROM qualified

ORDER BY average_rating DESC, customer_id DESC;

*/


