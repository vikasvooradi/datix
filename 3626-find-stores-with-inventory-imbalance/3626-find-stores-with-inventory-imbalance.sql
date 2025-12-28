/* Write your PL/SQL query statement below */


WITH product_cnt AS (
    SELECT store_id
    FROM inventory
    GROUP BY store_id
    HAVING COUNT(DISTINCT product_name) >= 3
),
ranked AS (
    SELECT
        i.store_id,
        i.product_name,
        i.quantity,
        i.price,
        ROW_NUMBER() OVER (PARTITION BY i.store_id ORDER BY i.price DESC) AS rn_exp,
        ROW_NUMBER() OVER (PARTITION BY i.store_id ORDER BY i.price ASC)  AS rn_cheap
    FROM inventory i JOIN product_cnt p ON i.store_id = p.store_id
),
expensive AS (
    SELECT store_id, product_name, quantity
    FROM ranked
    WHERE rn_exp = 1
),
cheapest AS (
    SELECT store_id, product_name, quantity
    FROM ranked
    WHERE rn_cheap = 1
)
SELECT
    s.store_id,
    s.store_name,
    s.location,
    e.product_name AS most_exp_product,
    c.product_name AS cheapest_product,
    ROUND(c.quantity / e.quantity, 2) AS imbalance_ratio
FROM expensive e
JOIN cheapest c
  ON e.store_id = c.store_id
JOIN stores s
  ON s.store_id = e.store_id
WHERE e.quantity < c.quantity
ORDER BY imbalance_ratio DESC, s.store_name ASC;