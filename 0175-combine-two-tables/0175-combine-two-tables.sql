/* Write your PL/SQL query statement below */

SELECT
    p.givenname AS givenname,
    p.surname   AS surname,
    a.cityname  AS cityname,
    a.region    AS region
FROM
    customer p
    LEFT JOIN location a ON p.customerid = a.customerid
ORDER BY
    p.givenname;

