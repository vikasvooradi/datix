/* Write your PL/SQL query statement below */

-- Method 1
SELECT
    machine_id,
    round(abs(SUM((timestamp - lag_activity_type)) / COUNT(machine_id)),
          3) AS processing_time
FROM
    (
        SELECT
            machine_id,
            process_id,
            activity_type,
            timestamp,
            LAG(timestamp, 1, NULL)
            OVER(PARTITION BY machine_id, process_id
                 ORDER BY
                     machine_id, process_id,
                     activity_type DESC
            ) AS lag_activity_type
        FROM
            activity
    )
WHERE
    lag_activity_type IS NOT NULL
GROUP BY
    machine_id;


/*

-- Method 2
select machine_id ,  round(sum(case when activity_type='end' then timestamp
else -timestamp end)/count(distinct process_id), 3) as processing_time
from activity group by machine_id;

*/