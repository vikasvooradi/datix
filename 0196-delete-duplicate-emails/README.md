<h2><a href="https://leetcode.com/problems/delete-duplicate-emails">196. Remove Recurring Contact Addresses</a></h2><h3>Easy</h3><hr><p>Table: <code>Contact</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| recordId    | int     |
| address     | varchar |
+-------------+---------+
recordId serves as the primary key (column with unique values) for this table.
Each row of this table holds a contact address. The addresses will not include uppercase letters.
</pre>

<p>Create a query to<strong> remove</strong> all recurring contact addresses, retaining only one distinct address with the lowest <code>recordId</code>.</p>
<p>If you are working with SQL, be sure to use a <code>DELETE</code> statement instead of a <code>SELECT</code> query.</p>

<p>The result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Contact table:
+----------+-------------------+
| recordId | address           |
+----------+-------------------+
| 5        | alice@domain.com  |
| 8        | brian@domain.com  |
| 12       | alice@domain.com  |
+----------+-------------------+
<strong>Output:</strong> 
+----------+-------------------+
| recordId | address           |
+----------+-------------------+
| 5        | alice@domain.com  |
| 8        | brian@domain.com  |
+----------+-------------------+
<strong>Explanation:</strong> alice@domain.com appears two times. We retain the row with the lowest recordId = 5.
</pre>
