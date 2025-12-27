/* Write your PL/SQL query statement below */


WITH weekly_meetings AS (
    /* Step 1: Calculate total meeting hours per employee per week (Mon–Sun) */
    SELECT
        m.employee_id,
        TRUNC(m.meeting_date, 'IW') AS week_start_date,
        SUM(m.duration_hours) AS weekly_meeting_hours
    FROM meetings m
    GROUP BY
        m.employee_id,
        TRUNC(m.meeting_date, 'IW')
),
heavy_weeks AS (
    /* Step 2: Keep only weeks where meeting hours > 20 (50% of 40 hours) */
    SELECT
        employee_id,
        week_start_date
    FROM weekly_meetings
    WHERE weekly_meeting_hours > 20
),
heavy_week_counts AS (
    /* Step 3: Count how many heavy weeks each employee has */
    SELECT
        employee_id,
        COUNT(*) AS meeting_heavy_weeks
    FROM heavy_weeks
    GROUP BY employee_id
    HAVING COUNT(*) >= 2
)
SELECT
    e.employee_id,
    e.employee_name,
    e.department,
    h.meeting_heavy_weeks
FROM heavy_week_counts h
JOIN employees e
    ON e.employee_id = h.employee_id
ORDER BY
    h.meeting_heavy_weeks DESC,
    e.employee_name ASC;
