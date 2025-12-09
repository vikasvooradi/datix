/* Write your PL/SQL query statement below */

select distinct p.product_id,p.product_name from Product p join Sales s on p.product_id = s.product_id 
where trunc(sale_date) between date '2019-01-01' and date '2019-03-31'
and p.product_id not in (
   select product_id from sales where trunc(sale_date) not between date '2019-01-01' and date '2019-03-31'
);
