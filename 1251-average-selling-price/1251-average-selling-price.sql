/* Write your PL/SQL query statement below */

/*
-- Method 1 

SELECT
    p.product_id,
    ROUND(
        NVL(
            SUM(u.units * p.price) 
            / SUM(u.units),
        0),
    2) AS average_price
FROM prices p
LEFT JOIN unitssold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
ORDER BY p.product_id;

*/

-- Method 2 

WITH data AS (
    SELECT 
        p.product_id,
        p.start_date,
        p.end_date,
        p.price,
        u.purchase_date,
        u.units
    FROM prices p
    LEFT JOIN unitssold u
        ON p.product_id = u.product_id
        -- LEFT JOIN:
        -- Keeps all price rows even if there is no matching sale
        -- If no sale exists, purchase_date and units become NULL
),

cal AS (
    SELECT 
        product_id,
        price,
        NVL(units,0) AS units,
        -- Convert NULL units (no sale) to 0

        NVL(price,0) * NVL(units,0) AS sum_cal
        -- Revenue per row = price × units
    FROM data
    WHERE purchase_date BETWEEN start_date AND end_date
       OR purchase_date IS NULL
       -- Keeps only sales that happened within the price period
       -- OR keeps rows with no sales (NULL purchase_date)
),

tprice AS (
    SELECT 
        product_id,
        SUM(sum_cal) AS tprice
        -- Total revenue per product
    FROM cal
    GROUP BY product_id
),

overall_sum AS (
    SELECT 
        product_id,
        SUM(units) AS osum
        -- Total units sold per product
    FROM unitssold
    GROUP BY product_id
)

SELECT 
    p.product_id,

    ROUND(
        NVL(
            t.tprice / NULLIF(o.osum, 0),
            0
        ),
        2
    ) AS average_price
    -- NULLIF avoids division by zero
    -- NVL returns 0 when there are no sales

FROM prices p
LEFT JOIN tprice t
       ON p.product_id = t.product_id
       -- Join revenue per product
LEFT JOIN overall_sum o
       ON p.product_id = o.product_id
       -- Join total units per product
GROUP BY p.product_id, t.tprice, o.osum
       -- Removes duplicates caused by multiple price rows
ORDER BY p.product_id;



