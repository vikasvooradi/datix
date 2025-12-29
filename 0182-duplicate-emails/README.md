<h2><a href="https://leetcode.com/problems/duplicate-emails">182. Recurring Contact Addresses</a></h2><h3>Easy</h3><hr><p>Table: <code>Contact</code></p>
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
<p>&nbsp;</p>
<p>Create a query to identify all the recurring contact addresses. Note that it&#39;s guaranteed that the address&nbsp;field is not NULL.</p>
<p>Return the result table in <strong>any order</strong>.</p>
<p>The&nbsp;result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Contact table:
+----------+---------+
| recordId | address |
+----------+---------+
| 5        | x@y.com |
| 7        | m@n.com |
| 9        | x@y.com |
+----------+---------+
<strong>Output:</strong> 
+---------+
| Address |
+---------+
| x@y.com |
+---------+
<strong>Explanation:</strong> x@y.com appears two times in the records.
</pre>
