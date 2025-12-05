/* Write your PL/SQL query statement below */


select project_id ,round(sum(EXPERIENCE_YEARS)/count(PROJECT_ID),2) as average_years  from (
select p.PROJECT_ID as project_id  , e.EXPERIENCE_YEARS as EXPERIENCE_YEARS  
from employee e join project p on e.employee_id = p.employee_id order by p.PROJECT_ID
) group by PROJECT_ID order by PROJECT_ID;