/* Write your PL/SQL query statement below */

SELECT *
FROM products
WHERE REGEXP_LIKE(description, '(^|[^A-Z0-9])SN[0-9]{4}-[0-9]{4}([^0-9]|$)');
order by product_id