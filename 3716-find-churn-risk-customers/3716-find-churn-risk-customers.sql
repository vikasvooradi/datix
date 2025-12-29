/* Write your PL/SQL query statement below */

-- Have been a subscriber for at least 60 days.
-- Have performed at least one downgrade in their subscription history.
-- Currently have an active subscription (their last event is not cancel).
-- Their current plan revenue is less than 50% of their historical maximum plan revenue. : 9.9 < 0.5 * 29.9


WITH get_least_60_days AS
(
  SELECT user_id,
         MAX(event_date) - MIN(event_date) AS days_as_subscriber
  FROM subscription_events
  GROUP BY user_id
  HAVING MAX(event_date) - MIN(event_date) >= 60
),
at_least_one_downgrade AS
(
   SELECT user_id
   FROM subscription_events
   WHERE event_type = 'downgrade'
   GROUP BY user_id
   HAVING COUNT(*) >= 1
),
as_active_plan AS
(
   SELECT user_id,
          plan_name,
          monthly_amount
   FROM (
        SELECT user_id,
               event_date,
               event_type,          -- FIX: include event_type to correctly detect cancellation
               plan_name,
               monthly_amount,      -- FIX: include monthly_amount to get current revenue
               ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date DESC) AS dt_rnk
        FROM subscription_events
   )
   WHERE dt_rnk = 1
     AND event_type <> 'cancel'     -- FIX: check active subscription using event_type, not plan_name
),
join_data AS
(
    SELECT a.user_id,
           c.plan_name AS current_plan,
           c.monthly_amount AS current_monthly_amount,  -- FIX: current revenue from latest event
           a.days_as_subscriber
    FROM get_least_60_days a
    JOIN at_least_one_downgrade b ON a.user_id = b.user_id
    JOIN as_active_plan c ON b.user_id = c.user_id
),
partial_data AS
(
    SELECT a.user_id,
           b.current_monthly_amount,      -- FIX: stop using MIN(monthly_amount) as current revenue
           MAX(a.monthly_amount) AS max_historical_amount
    FROM subscription_events a
    JOIN join_data b ON a.user_id = b.user_id
    GROUP BY a.user_id, b.current_monthly_amount
    HAVING b.current_monthly_amount < 0.5 * MAX(a.monthly_amount) -- FIX: compare current vs max
)
SELECT a.user_id,
       a.current_plan,
       b.current_monthly_amount,
       b.max_historical_amount,
       a.days_as_subscriber
FROM join_data a
JOIN partial_data b ON a.user_id = b.user_id
ORDER BY a.days_as_subscriber DESC, a.user_id ASC;