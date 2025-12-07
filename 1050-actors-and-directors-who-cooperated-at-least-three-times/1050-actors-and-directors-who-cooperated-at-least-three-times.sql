/* Write your PL/SQL query statement below */

/*

Method 1 
select actor_id,director_id from 
(
    select actor_id , director_id , count(actor_id) as cooperated from ActorDirector  group by actor_id , director_id 
    order by count(actor_id)  desc
) where cooperated >=3

*/

-- Method 2 
select actor_id , director_id from ActorDirector group by actor_id , director_id having count(actor_id) >=3;
