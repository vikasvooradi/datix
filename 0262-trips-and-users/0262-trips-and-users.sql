/* Write your PL/SQL query statement below */

WITH data AS (
    SELECT 
        a.request_at,
        a.status
    FROM (
        SELECT 
            t.id,
            t.client_id,
            t.driver_id,
            t.status,
            t.request_at,
            u1.banned AS u1_banned
        FROM trips t 
        JOIN users u1 
            ON t.client_id = u1.users_id
    ) a 
    JOIN users u2 
        ON a.driver_id = u2.users_id
    WHERE a.u1_banned = 'No'
      AND u2.banned = 'No'
      AND TO_DATE(a.request_at, 'YYYY-MM-DD')
            BETWEEN DATE '2013-10-01' AND DATE '2013-10-03'
),
calculate AS (
    SELECT 
        request_at, 
        SUM(CASE WHEN status <> 'completed' THEN 1 ELSE 0 END) AS cancelled_count,
        SUM(CASE WHEN status = 'completed' THEN 1 ELSE 0 END) AS completed_count 
    FROM data 
    GROUP BY request_at
)
SELECT 
    request_at AS "Day",
    ROUND(
        cancelled_count * 1.0 
        / (cancelled_count + completed_count),
        2
    ) AS "Cancellation Rate"
FROM calculate
ORDER BY request_at;
