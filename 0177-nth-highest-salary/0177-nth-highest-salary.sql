CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */

    BEGIN
        select (SELECT salary
        FROM (
            select salary , row_number() over(order by salary desc) as rn from (select distinct salary from employee)
        )
        WHERE rn = N) into result from dual;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            result := NULL;  
    END;

     RETURN result;
END; 

