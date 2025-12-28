/* Write your PL/SQL query statement below */

SELECT
    p.givenname,
    p.surname,
    a.cityname,
    a.region
FROM customer p
LEFT JOIN location a
    ON p.customerid = a.customerid ORDER BY
    p.givenname;




