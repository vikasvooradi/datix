/* Write your PL/SQL query statement below */

select 
    to_char(transaction_date,'YYYY-MM-DD') as transaction_date,
    nvl(sum(case when mod(amount,2)=1 then amount else 0 end),0) as odd_sum,
    nvl(sum(case when mod(amount,2)=0 then amount else 0 end),0) as even_sum
from transactions group by transaction_date order by transaction_date;