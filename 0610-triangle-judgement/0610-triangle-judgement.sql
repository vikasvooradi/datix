/* Write your PL/SQL query statement below */

-- To decide x , y , z values are called as triangle if it meets the formula : m < (x+y+z-m) 
-- m : maximum value amongst x y z 

select x,y,z,case when m < calulated_value then 'Yes' else 'No' end as triangle from 
(
    select x,y,z,greatest(x,y,z) as m , x+y+z-greatest(x,y,z) as calulated_value from Triangle 
);