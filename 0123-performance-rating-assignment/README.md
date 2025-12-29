<h2><a href="">Performance Rating Assignment</a></h2><h3>Medium</h3><hr><p>Table: <code>Evaluation</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| recordId    | int     |
| rating      | decimal |
+-------------+---------+
recordId is the primary key (column with unique values) for this table.
Each row of this table stores the rating achieved in a performance evaluation. Rating is a floating point value with two decimal places.
</pre>
<p>&nbsp;</p>
<p>Create a query to assign position numbers to the ratings. The position assignment must follow these criteria:</p>
<ul>
	<li>Ratings must be positioned from the highest value to the lowest value.</li>
	<li>When two ratings share the same value, they must receive identical position numbers.</li>
	<li>Following identical ratings, the subsequent position number must be the immediate next integer. This means no gaps should exist in the position sequence.</li>
</ul>
<p>Return the result table ordered by <code>rating</code> in descending order.</p>
<p>The result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Evaluation table:
+----------+--------+
| recordId | rating |
+----------+--------+
| 501      | 7.25   |
| 502      | 8.40   |
| 503      | 9.15   |
| 504      | 7.90   |
| 505      | 9.15   |
| 506      | 8.40   |
+----------+--------+
<strong>Output:</strong> 
+--------+----------+
| rating | position |
+--------+----------+
| 9.15   | 1        |
| 9.15   | 1        |
| 8.40   | 2        |
| 8.40   | 2        |
| 7.90   | 3        |
| 7.25   | 3        |
+--------+----------+

</pre>
