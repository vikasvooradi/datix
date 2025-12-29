/* Write your PL/SQL query statement below */

select distinct num as ConsecutiveNums from (
  select num,lag(num,1) over(order by id) as lag_1,lag(num,2) over(order by id) as lag_2 from logs 
) where num=lag_1 and lag_1=lag_2;
