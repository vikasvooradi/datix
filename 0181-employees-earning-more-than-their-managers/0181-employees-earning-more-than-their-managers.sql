/* Write your PL/SQL query statement below */

select m.name as employee from employee m join employee e on m.managerid = e.id where m.salary > e.salary
