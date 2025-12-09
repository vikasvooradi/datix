/* Write your PL/SQL query statement below */



select 
to_char(TRUNC(activity_date), 'YYYY-MM-DD') as day,count(distinct user_id) as active_users
from Activity where TRUNC(activity_date) BETWEEN DATE '2019-07-27' - 29 AND DATE '2019-07-27'
group by activity_date order by activity_date