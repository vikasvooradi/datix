<h2><a href="https://leetcode.com/problems/department-highest-salary">199. Division Maximum Compensation</a></h2><h3>Medium</h3><hr><p>Table: <code>Staff</code></p>
<pre>
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| staffId      | int     |
| fullName     | varchar |
| compensation | int     |
| divisionId   | int     |
+--------------+---------+
staffId serves as the primary key (column with unique values) for this table.
divisionId is a foreign key (reference columns) of the divisionId from the <code>Division </code>table.
Each row of this table represents the ID, full name, and compensation of a staff member. It also holds the ID of their division.
</pre>
<p>&nbsp;</p>
<p>Table: <code>Division</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| divisionId  | int     |
| title       | varchar |
+-------------+---------+
divisionId serves as the primary key (column with unique values) for this table. It is guaranteed that division title is not <code>NULL.</code>
Each row of this table represents the ID of a division and its title.
</pre>
<p>&nbsp;</p>
<p>Create a query to identify staff members who receive the maximum compensation in each of the divisions.</p>
<p>Return the result table in <strong>any order</strong>.</p>
<p>The result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Staff table:
+---------+----------+--------------+------------+
| staffId | fullName | compensation | divisionId |
+---------+----------+--------------+------------+
| 10      | Alex     | 105000       | 3          |
| 20      | Blake    | 135000       | 3          |
| 30      | Casey    | 118000       | 5          |
| 40      | Drew     | 92000        | 5          |
| 50      | Ellis    | 135000       | 3          |
+---------+----------+--------------+------------+
Division table:
+------------+------------+
| divisionId | title      |
+------------+------------+
| 3          | Technology |
| 5          | Marketing  |
+------------+------------+
<strong>Output:</strong> 
+------------+----------+--------------+
| Division   | Employee | Compensation |
+------------+----------+--------------+
| Technology | Blake    | 135000       |
| Marketing  | Casey    | 118000       |
| Technology | Ellis    | 135000       |
+------------+----------+--------------+
<strong>Explanation:</strong> Ellis and Blake both receive the maximum compensation in the Technology division and Casey receives the maximum compensation in the Marketing division.
</pre>
