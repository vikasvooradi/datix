/* Write your PL/SQL query statement below */

select name as Department  , ename as Employee , salary from (
select d.id,d.name,e.name as ename,e.departmentid,e.salary,dense_rank() over(partition by d.name,e.departmentid order by d.name,e.departmentid,e.salary desc) as rnk
from Department d join Employee e on d.id = e.departmentId  
) where rnk < 4
