/* Write your PL/SQL query statement below */


select u.name,b.balance from Users u join 
(select account,balance from (select account, sum(amount) as balance from Transactions group by account order by account) where balance > 10000) b 
on u.account = b.account;