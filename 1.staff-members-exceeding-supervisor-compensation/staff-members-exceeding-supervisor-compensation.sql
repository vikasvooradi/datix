/* Write your PL/SQL query statement below */

/*

Explanation:

p represents the staff member.
s represents the supervisor of that staff member.
We join the table to itself on supervisorCode = staffCode to link each employee with their supervisor.
The WHERE clause filters only those staff whose payAmount is greater than their supervisor's payAmount.

*/

SELECT
    p.fullname
FROM
         personnel p
    JOIN personnel s ON p.supervisorcode = s.staffcode
WHERE
    p.payamount > s.payamount;



