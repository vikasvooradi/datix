/* Write your PL/SQL query statement below */

CREATE FUNCTION getKthLargestScore(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */

    BEGIN
        select (SELECT points
        FROM (
            select points , row_number() over(order by points desc) as rn from (select distinct points from competitor)
        )
        WHERE rn = N) into result from dual;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            result := NULL;  
    END;

     RETURN result;
END; 

-- Calling 
select getKthLargestScore(2) from dual;

