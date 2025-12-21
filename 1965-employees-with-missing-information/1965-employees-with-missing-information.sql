/* Write your PL/SQL query statement below */

select 
    nvl(e1.employee_id,0) + nvl(s1.employee_id,0) as employee_id 
from Employees e1 full outer join Salaries s1 
on e1.employee_id = s1.employee_id
where s1.salary is null or e1.name is null 
order by nvl(e1.employee_id,0) + nvl(s1.employee_id,0) asc;
