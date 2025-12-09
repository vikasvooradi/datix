/* Write your PL/SQL query statement below */
 
-- Method 1  
-- select author_id as id from Views where author_id=viewer_id group by author_id having count(VIEWER_ID) >=1 order by author_id;

-- Method 2
SELECT DISTINCT author_id as id from Views where author_id = viewer_id ORDER BY id;