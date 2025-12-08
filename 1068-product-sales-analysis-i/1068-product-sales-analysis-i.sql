/* Write your PL/SQL query statement below */

select product_name,year,price from product p join Sales s on p.product_id=s.product_id  