/* Write your PL/SQL query statement below */


with get_distinct_order as
(
   select product_id,order_date,unit from orders 
)
select b.product_name as product_name,a.unit as unit from (select p.product_id as product_id ,sum(o.unit) as unit from products p join get_distinct_order o on 
p.product_id=o.product_id where to_char(order_date,'YYYY-MM') ='2020-02'
group by p.product_id having sum(o.unit) >=100
) a join products b on a.product_id = b.product_id order by a.unit