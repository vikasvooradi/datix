/* Write your PL/SQL query statement below */

with cal_poor_query_percentage as
(
    select 
    query_name,
    round((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0) / count(*),2) as poor_query_percentage
    from Queries group by query_name
) , cal_quality as
(
    select 
    query_name,
    round(sum(rating/position)/count(*),2) as quality
    from Queries group by query_name
)
select c1.query_name,c1.quality,c2.poor_query_percentage from cal_quality c1 join cal_poor_query_percentage c2
on c1.query_name = c2.query_name order by c1.query_name