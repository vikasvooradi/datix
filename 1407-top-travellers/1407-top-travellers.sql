/* Write your PL/SQL query statement below */


select name , travelled_distance from (
    select u.id,u.name as name , nvl(sum(r.distance),0) as travelled_distance from Users u left join Rides r on u.id = r.user_id 
    group by u.id,u.name  order by nvl(sum(r.distance),0) desc , u.name asc
);
