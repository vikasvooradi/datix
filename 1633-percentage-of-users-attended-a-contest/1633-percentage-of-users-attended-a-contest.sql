/* Write your PL/SQL query statement below */


select 
    contest_id,
    round((count(user_id) * 1.0 /(select count(*) from Users)) * 100.0,2) as percentage 
from Register group by contest_id
order by percentage desc , contest_id asc;