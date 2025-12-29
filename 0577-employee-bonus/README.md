<h2><a href="https://leetcode.com/problems/employee-bonus">577. Performance Reward Analysis</a></h2><h3>Easy</h3><hr><p>Table: <code>TeamMembers</code></p>

<pre>
+-------------+----------+
| Column      | DataType |
+-------------+----------+
| memberCode  | integer  |
| displayName | varchar  |
| leadId      | integer  |
| baseSalary  | integer  |
+-------------+----------+
memberCode uniquely identifies each team member.
Each record shows member info, pay rate, and team lead reference.
</pre>

<p>&nbsp;</p>

<p>Table: <code>Rewards</code></p>

<pre>
+-------------+----------+
| Column      | DataType |
+-------------+----------+
| memberCode  | integer  |
| rewardValue | integer  |
+-------------+----------+
memberCode is unique per reward entry.
Links to TeamMembers via memberCode reference.
Tracks performance-based reward allocations.
</pre>

<p>&nbsp;</p>

<p>Create query to list member names and rewards meeting these criteria:</p>

<ul>
<li>Reward value <strong>under</strong> <code>1000</code>.</li>
<li>No reward assigned.</li>
</ul>

<p>Results in <strong>any order</strong>.</p>

<p>Output format matches sample below.</p>

<p>&nbsp;</p>
<p><strong class="example">Test Case:</strong></p>

<pre>
<strong>Input Data:</strong> 
TeamMembers table:
+-----------+-------------+----------+------------+
| memberCode| displayName | leadId   | baseSalary |
+-----------+-------------+----------+------------+
| 13        | Alex        | null     | 4500       |
| 7         | Mike        | 13       | 1200       |
| 9         | Chris       | 13       | 1800       |
| 15        | Sarah       | 13       | 4200       |
+-----------+-------------+----------+------------+
Rewards table:
+-----------+--------------+
| memberCode| rewardValue  |
+-----------+--------------+
| 9         | 450          |
| 15        | 1800         |
+-----------+--------------+
<strong>Output:</strong> 
+-------------+--------------+
| displayName | rewardValue  |
+-------------+--------------+
| Alex        | null         |
| Mike        | null         |
| Chris       | 450          |
+-------------+--------------+
</pre>