<h2><a href="">Kth Largest Score Retrieval</a></h2><h3>Medium</h3><hr><p>Table: <code>Competitor</code></p>
<pre>
+-------------+------+
| Column Name | Type |
+-------------+------+
| playerId    | int  |
| points      | int  |
+-------------+------+
playerId is the primary key (column with unique values) for this table.
Each row of this table represents the total points earned by a competitor.
</pre>
<p>&nbsp;</p>
<p>Develop a query to retrieve the <code>k<sup>th</sup></code> largest <strong>unique</strong> points value from the <code>Competitor</code> table. When fewer than <code>k</code> unique points values exist, the query should return&nbsp;<code>null</code>.</p>
<p>The result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Competitor table:
+----------+--------+
| playerId | points |
+----------+--------+
| 401      | 8500   |
| 402      | 12000  |
| 403      | 15500  |
+----------+--------+
k = 2
<strong>Output:</strong> 
+----------------------+
| getKthLargestScore(2)|
+----------------------+
| 12000                |
+----------------------+
</pre>
<p><strong class="example">Example 2:</strong></p>
<pre>
<strong>Input:</strong> 
Competitor table:
+----------+--------+
| playerId | points |
+----------+--------+
| 401      | 8500   |
+----------+--------+
k = 2
<strong>Output:</strong> 
+----------------------+
| getKthLargestScore(2)|
+----------------------+
| null                 |
+----------------------+
</pre>
