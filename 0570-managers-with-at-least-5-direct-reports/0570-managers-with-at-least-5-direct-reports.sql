/* Write your PL/SQL query statement below */

/* Method 1 

with get_count as 
(
    select managerid from employee 
    group by managerid having count(managerid) >= 5 order by managerid 
)
select name from employee where id in (select managerid from get_count) order by id

*/


select e1.name from employee e1 join employee e2 on e1.id = e2.managerid group by e1.id, e1.name having count(e2.managerid) >=5

