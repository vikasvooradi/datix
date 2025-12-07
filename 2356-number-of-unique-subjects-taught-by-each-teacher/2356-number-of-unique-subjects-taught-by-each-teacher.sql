/* Write your PL/SQL query statement below */

select teacher_id,count(subject_id) as cnt from (select distinct teacher_id,subject_id from Teacher ) group by teacher_id order by teacher_id