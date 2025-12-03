/* Write your PL/SQL query statement below */

select player_id,to_char(first_login,'YYYY-MM-DD') as first_login from (select player_id, min(event_date) as first_login  from Activity group by player_id)