<h2><a href="https://leetcode.com/problems/department-top-three-salaries">185. Division Leading Three Compensations</a></h2><h3>Hard</h3><hr><p>Table: <code>Staff</code></p>
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
divisionId is a foreign key (reference column) of the divisionId from the <code>Division </code>table.
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
divisionId serves as the primary key (column with unique values) for this table.
Each row of this table represents the ID of a division and its title.
</pre>
<p>&nbsp;</p>
<p>An organization&#39;s leadership team is interested in identifying who receives the highest compensation in each of the organization&#39;s divisions. A <strong>top earner</strong> in a division is a staff member who has a compensation in the <strong>top three distinct</strong> compensation levels for that division.</p>
<p>Create a query to identify the staff members who are <strong>top earners</strong> in each of the divisions.</p>
<p>Return the result table <strong>in any order</strong>.</p>
<p>The&nbsp;result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Staff table:
+---------+----------+--------------+------------+
| staffId | fullName | compensation | divisionId |
+---------+----------+--------------+------------+
| 101     | Alex     | 125000       | 5          |
| 102     | Blake    | 118000       | 7          |
| 103     | Casey    | 95000        | 7          |
| 104     | Drew     | 135000       | 5          |
| 105     | Ellis    | 102000       | 5          |
| 106     | Finley   | 125000       | 5          |
| 107     | Gray     | 108000       | 5          |
+---------+----------+--------------+------------+
Division table:
+------------+------------+
| divisionId | title      |
+------------+------------+
| 5          | Technology |
| 7          | Marketing  |
+------------+------------+
<strong>Output:</strong> 
+------------+----------+--------------+
| Division   | Employee | Compensation |
+------------+----------+--------------+
| Technology | Drew     | 135000       |
| Technology | Alex     | 125000       |
| Technology | Finley   | 125000       |
| Technology | Gray     | 108000       |
| Marketing  | Blake    | 118000       |
| Marketing  | Casey    | 95000        |
+------------+----------+--------------+
<strong>Explanation:</strong> 
In the Technology division:
- Drew receives the highest distinct compensation
- Both Finley and Alex receive the second-highest distinct compensation
- Gray receives the third-highest distinct compensation
In the Marketing division:
- Blake receives the highest compensation
- Casey receives the second-highest compensation
- There is no third-highest compensation as there are only two staff members
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>
<ul>
	<li>There are no staff members with the <strong>exact</strong> same full name, compensation <em>and</em> division.</li>
</ul>
