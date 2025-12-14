/* Write your PL/SQL query statement below */

select 
id , 
CASE
    when p_id is null then 'Root'
    when id in (select p_id from tree) then 'Inner'
    else 'Leaf' end as type 
from tree;



