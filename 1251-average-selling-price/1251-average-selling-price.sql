/* Write your PL/SQL query statement below */

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

/* Method 2 

WITH data AS (
    SELECT 
        p.product_id,
        p.start_date,
        p.end_date,
        p.price,
        u.purchase_date,
        u.units
    FROM prices p
    LEFT JOIN unitssold u                 -- FIX 1: LEFT JOIN keeps products even if UnitsSold is empty
        ON p.product_id = u.product_id
),

cal AS (
    SELECT 
        product_id,
        price,
        NVL(units,0) AS units,            -- FIX 2: convert NULL units to 0
        NVL(price,0) * NVL(units,0) 
            AS sum_cal
    FROM data
    WHERE purchase_date BETWEEN start_date AND end_date
       OR purchase_date IS NULL           -- FIX 3: prevents row loss when UnitsSold is empty
),

tprice AS (
    SELECT 
        product_id,
        SUM(sum_cal) AS tprice
    FROM cal
    GROUP BY product_id
),

overall_sum AS (
    SELECT 
        product_id,
        SUM(units) AS osum
    FROM unitssold
    GROUP BY product_id
)

SELECT 
    p.product_id,
    ROUND(
        NVL(t.tprice,0) / NVL(o.osum,1),  -- FIX 4: avoid NULL / NULL → return 0 instead
        2
    ) AS average_price
FROM prices p
LEFT JOIN tprice t                       -- FIX 5: LEFT JOIN ensures all products appear
       ON p.product_id = t.product_id
LEFT JOIN overall_sum o                  -- FIX 6: LEFT JOIN keeps rows when no sales exist
       ON p.product_id = o.product_id
ORDER BY p.product_id;

*/