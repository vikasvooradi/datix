<!DOCTYPE html>
<html>
<head>
    <title>1. Staff Members Exceeding Supervisor Compensation</title>
</head>
<body>

<h1>1. Staff Members Exceeding Supervisor Compensation</h1>
<h3>Easy</h3><hr>
<p>Database Schema</p>
<p>Table: Personnel</p>

<pre>
+------------------+---------+
| Field            | Format  |
+------------------+---------+
| staffCode        | int     |
| fullName         | varchar |
| payAmount        | int     |
| supervisorCode   | int     |
+------------------+---------+
</pre>

<p>staffCode serves as the primary key (unique identifier field) for this table.</p>
<p>Every record in this table represents a staff member's unique code, complete name, compensation amount, and the unique code of their direct supervisor.</p>

<p>Develop a query to retrieve all personnel whose compensation exceeds that of their direct supervisors.</p>

<p>The output dataset may be arranged in any sequence.</p>

<p>The output structure follows the pattern illustrated in the demonstration below.</p>

<h2>Demonstration:</h2>

<p>Input Dataset:</p>
<p>Personnel table:</p>

<pre>
+-----------+----------+-----------+----------------+
| staffCode | fullName | payAmount | supervisorCode |
+-----------+----------+-----------+----------------+
| 105       | Marcus   | 95000     | 203            |
| 147       | Diana    | 72000     | 318            |
| 203       | Rachel   | 88000     | Null           |
| 318       | Kevin    | 110000    | Null           |
+-----------+----------+-----------+----------------+
</pre>

<p>Expected Output:</p>

<pre>
+--------------+
| StaffMember  |
+--------------+
| Marcus       |
+--------------+
</pre>

<p>Explanation: Marcus is the only staff member whose compensation surpasses that of their supervisor.</p>

</body>
</html>