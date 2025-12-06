/* Write your PL/SQL query statement below */


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