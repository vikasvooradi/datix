/* Write your PL/SQL query statement below */

select 
    p.firstname as firstname,
    p.lastname as lastname,
    a.city as city,
    a.state as state 
from person p left join address a on p.personid=a.personid;

