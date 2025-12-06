/* Write your PL/SQL query statement below */

/* Method 1 

SELECT (
    SELECT salary
    FROM (
        SELECT DISTINCT salary,
               DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM employee
    )
    WHERE rnk = 2
) AS SecondHighestSalary
FROM dual;

*/

-- Method 2 
select max(salary) as SecondHighestSalary
from Employee
where salary < (select max(salary) from Employee)




