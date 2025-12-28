/* Write your PL/SQL query statement below */

/* Method 1 

SELECT (
    SELECT payamount
    FROM (
        SELECT DISTINCT payamount,
               DENSE_RANK() OVER (ORDER BY payamount DESC) AS rnk
        FROM worker
    )
    WHERE rnk = 2
) AS SecondHighestSalary
FROM dual;

*/

-- Method 2 
SELECT
    MAX(payamount) AS secondhighestsalary
FROM
    worker
WHERE
    payamount < (
        SELECT
            MAX(payamount)
        FROM
            worker
    );
    
