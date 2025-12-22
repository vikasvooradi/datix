/* Write your PL/SQL query statement below */

select e.employee_id,e.name,r.reports_count,r.average_age from Employees e join 
(
    select 
        reports_to, 
        count(reports_to) as reports_count,
        round(avg(age))   as average_age
    from Employees where reports_to is not null group by reports_to order by reports_to
) r on e.employee_id=r.reports_to order by employee_id;