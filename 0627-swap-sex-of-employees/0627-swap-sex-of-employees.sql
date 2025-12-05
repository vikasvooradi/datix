/* Write your PL/SQL query statement below */

update salary set sex = CASE sex WHEN 'm' THEN 'f' else 'm' END;