/* Write your PL/SQL query statement below */

SELECT
    address
FROM
    contact
GROUP BY
    address
HAVING
    COUNT(address) > 1;
