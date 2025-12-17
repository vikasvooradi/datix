/* Write your PL/SQL query statement below */

select CUSTOMER_ID from (select CUSTOMER_ID,count(CPRDT_KEY) as cnt_prd from 
(
    select distinct 
    a.CUSTOMER_ID as CUSTOMER_ID,
    a.PRODUCT_KEY as CPRDT_KEY
    from customer a  
    join product p on a.PRODUCT_KEY = p.PRODUCT_KEY 
) group by CUSTOMER_ID
) where  cnt_prd = (select count(*) as cnt from product) order by CUSTOMER_ID