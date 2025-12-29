/* Write your PL/SQL query statement below */

SELECT
    rating,
    DENSE_RANK() OVER (ORDER BY rating DESC) AS position
FROM evaluation
ORDER BY rating DESC;
