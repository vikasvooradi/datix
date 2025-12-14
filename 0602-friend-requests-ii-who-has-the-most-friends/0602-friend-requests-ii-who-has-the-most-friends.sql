/* Write your PL/SQL query statement below */

-- Method 1

SELECT id, num
FROM (
    SELECT id, COUNT(*) AS num
    FROM (
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    ) all_ids
    GROUP BY id
    ORDER BY COUNT(*) DESC
)
WHERE ROWNUM = 1;


/* 

-- Method 2 

with data as 
(
    select id,count(*) as num from 
    (
        select requester_id as id from RequestAccepted
        union all 
        select accepter_id as id from RequestAccepted 
    ) group by id order by id
), get_max as
(
  select max(num) as max_num from data 
)
select * from data where  num = (select max_num from get_max)

*/