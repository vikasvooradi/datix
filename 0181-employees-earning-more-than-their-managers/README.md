<h2><a href="https://leetcode.com/problems/employees-earning-more-than-their-managers">181. Staff Earning More Than Supervisors</a></h2><h3>Easy</h3><hr><p>Table: <code>Staff</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| fullName    | varchar |
| compensation| int     |
| supervisorId| int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a staff member, their full name, compensation, and the ID of their supervisor.
</pre>
<p>&nbsp;</p>
<p>Write a solution&nbsp;to find the staff members who earn more than their supervisors.</p>
<p>Return the result table in <strong>any order</strong>.</p>
<p>The result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Staff table:
+----+----------+--------------+--------------+
| id | fullName | compensation | supervisorId |
+----+----------+--------------+--------------+
| 1  | Alex     | 95000        | 3            |
| 2  | Blake    | 105000       | 4            |
| 3  | Casey    | 85000        | Null         |
| 4  | Drew     | 120000       | Null         |
+----+----------+--------------+--------------+
<strong>Output:</strong> 
+----------+
| Staff    |
+----------+
| Alex     |
+----------+
<strong>Explanation:</strong> Alex is the only staff member who earns more than his supervisor.
</pre>
