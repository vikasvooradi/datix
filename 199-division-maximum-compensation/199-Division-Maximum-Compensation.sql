/* Write your PL/SQL query statement below */

select Department,Employee,Salary from (
    select Department,Employee,Salary,dense_rank() over(partition by Department order by Salary desc) as rank from 
    (
        select d.name as Department, e.name  as Employee , e.salary as Salary 
        from Department d join Employee e on d.id=e.departmentId
    ) 
) where rank=1;