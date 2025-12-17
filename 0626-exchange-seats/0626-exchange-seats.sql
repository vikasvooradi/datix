/* Write your PL/SQL query statement below */

with set_1 as
(
  select id,student,(id+1) as rnk from Seat  where mod(id,2) = 1
), set_2 as
(
  select id,student,id-1 as rnk from Seat  where mod(id,2) = 0
)
select row_number() over(order by rnk asc) as ID ,STUDENT from (select * from set_1 union select * from set_2) order by rnk