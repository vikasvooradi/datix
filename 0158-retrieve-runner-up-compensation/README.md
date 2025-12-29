<h2><a href="">Retrieve Runner-Up Compensation</a></h2><h3>Medium</h3><hr><p>Table: <code>Worker</code></p>

<pre>
+-------------+------+
| Column Name | Type |
+-------------+------+
| workerId    | int  |
| payAmount   | int  |
+-------------+------+
workerId is the primary key (column with unique values) for this table.
Each row of this table contains information about the compensation amount of a worker.
</pre>

<p>&nbsp;</p>

<p>Write a solution to identify the second-largest <strong>distinct</strong> compensation amount from the <code>Worker</code> table. If no second-largest compensation exists, return <code>null</code>.</p>

<p>The result format is in the following example.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> 
Worker table:
+----------+-----------+
| workerId | payAmount |
+----------+-----------+
| 501      | 45000     |
| 502      | 67000     |
| 503      | 89000     |
+----------+-----------+
<strong>Output:</strong> 
+--------------------+
| SecondHighestPay   |
+--------------------+
| 67000              |
+--------------------+
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> 
Worker table:
+----------+-----------+
| workerId | payAmount |
+----------+-----------+
| 501      | 45000     |
+----------+-----------+
<strong>Output:</strong> 
+--------------------+
| SecondHighestPay   |
+--------------------+
| null               |
+--------------------+
</pre>
