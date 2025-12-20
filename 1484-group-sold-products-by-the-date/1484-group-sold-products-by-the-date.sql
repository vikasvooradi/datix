/* Write your PL/SQL query statement below */

select 
    to_char(sell_date,'YYYY-MM-DD') as sell_date,
    SUM(COUNT(*)) OVER (PARTITION BY sell_date) AS num_sold,
    LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
from (select distinct a.* from Activities a) group by sell_date order by sell_date