<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1>2. Recurring Contact Addresses</h1>
<h3>Level : Easy</h3><hr>
<p>Database Schema</p>
<p>Table: Contact</p>
<pre>
+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| contact_id      | int     |
| address         | varchar |
+-----------------+---------+
</pre>
<p>contact_id serves as the primary key (unique identifier column) for this table.</p>
<p>Every record in this table includes a contact address. All addresses are stored in lowercase format.</p>
<p>Develop a query to identify all contact addresses that appear more than once in the dataset. The address field is guaranteed to contain valid data with no NULL values.</p>
<p>Your result set may be returned in any sequence.</p>
<p>The output structure is demonstrated in the example below.</p>
<h2>Example 1:</h2>
<p>Input: </p>
<p>Contact table:</p>
<pre>
+------------+------------------+
| contact_id | address          |
+------------+------------------+
| 205        | mark@tech.io     |
| 318        | sara@venture.net |
| 429        | mark@tech.io     |
+------------+------------------+
</pre>
<p>Output: </p>
<pre>
+------------------+
| Address          |
+------------------+
| mark@tech.io     |
+------------------+
</pre>
<p>Explanation: The address mark@tech.io occurs in multiple records within the Contact table.</p>
</body>
</html>
