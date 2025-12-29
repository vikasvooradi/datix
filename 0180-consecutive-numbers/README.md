<h2><a href="https://leetcode.com/problems/consecutive-numbers">180. Repeating Values</a></h2><h3>Medium</h3><hr><p>Table: <code>Readings</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| recordId    | int     |
| value       | varchar |
+-------------+---------+
In SQL, recordId is the primary key for this table.
recordId is an autoincrement column starting from 1.
</pre>
<p>&nbsp;</p>
<p>Identify all values that occur in at least three sequential records.</p>
<p>Return the result table in <strong>any order</strong>.</p>
<p>The&nbsp;result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Readings table:
+----------+-------+
| recordId | value |
+----------+-------+
| 1        | 5     |
| 2        | 5     |
| 3        | 5     |
| 4        | 7     |
| 5        | 5     |
| 6        | 7     |
| 7        | 7     |
+----------+-------+
<strong>Output:</strong> 
+----------------+
| RepeatingValue |
+----------------+
| 5              |
+----------------+
<strong>Explanation:</strong> 5 is the only value that occurs sequentially for at least three times.
</pre>
