/* Write your PL/SQL query statement below */

/*

Method 1 

SELECT user_id,
       email
  FROM users
 WHERE regexp_like(email, '^[A-Za-z_0-9]+@[A-Za-z]+\.com$')
 ORDER BY user_id;

*/


-- Method 2 
with data as
(
   select user_id, email,regexp_replace(upper(email),'[^@]','') as at_email from users where regexp_replace(upper(email),'[^@]','') is not null
) , at_check as
(
    select user_id , email from data where length(at_email) =1 
), end_check as
(
   select user_id, email from at_check where email  like '%.com'
) , after_before_check as
(
   select user_id, email,start_at_pos,substr(email,start_at_pos+1,(last_dot_pos-start_at_pos)-1) as mid_string from 
   (  
      select user_id,email,instr(email,'@') as start_at_pos , instr(email,'.') as last_dot_pos  from end_check
   ) where regexp_like(substr(email,start_at_pos+1,(last_dot_pos-start_at_pos)-1),'^[a-zA-z]+$')
) , before_at as 
(
    select user_id,email,substr(email,1,start_at_pos-1) from after_before_check where regexp_like(substr(email,1,start_at_pos-1),'^[a-zA-Z0-9_]+$')
)
select user_id,email from before_at order by user_id