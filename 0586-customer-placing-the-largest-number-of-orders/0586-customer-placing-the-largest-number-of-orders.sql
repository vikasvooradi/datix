/* Write your PL/SQL query statement below */

-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.

select customer_number from (select customer_number from orders 
group by customer_number order by count(customer_number) desc) where rownum=1;