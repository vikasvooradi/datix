/* Write your PL/SQL query statement below */

/* Method 1 

with set_1 as
(
  select id,student,(id+1) as rnk from Seat  where mod(id,2) = 1
), set_2 as
(
  select id,student,id-1 as rnk from Seat  where mod(id,2) = 0
)
select row_number() over(order by rnk asc) as ID ,STUDENT from (select * from set_1 union select * from set_2) order by rnk

*/

-- Method 2 

select result as ID , student from (select id,student,nvl((COALESCE(odd_num, even_num)),(select max(id) from seat)) as result from 
(
    select 
    id,student,mod(id,2) as mod_value ,
    case when mod(id,2)=1 and id < (select max(id) from seat) then id+1 end as odd_num ,
    case when mod(id,2)=0 then id-1 end as even_num
    from seat order by id
) ) order by result