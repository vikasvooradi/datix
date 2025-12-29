<h2><a href="https://leetcode.com/problems/managers-with-at-least-5-direct-reports">570. Supervisors Managing 5+ Team Members</a></h2><h3>Medium</h3><hr><p>Dataset: <code>Staff</code></p>

<pre>
+--------------+----------+
| Attribute    | DataType |
+--------------+----------+
| emp_id       | integer  |
| emp_name     | text     |
| division     | text     |
| supervisor_id| integer  |
+--------------+----------+
emp_id serves as the unique identifier for each record.
Each entry lists an employee's details, their work unit, and supervisor reference.
Null supervisor_id indicates no oversight. Self-supervision doesn't occur.
</pre>

<p>&nbsp;</p>

<p>Develop a query to identify supervisors overseeing <strong>minimum five direct subordinates</strong>.</p>

<p>Present findings in <strong>any arrangement</strong>.</p>

<p>Adhere to this result layout:</p>

<p>&nbsp;</p>
<p><strong class="example">Sample Scenario:</strong></p>

<pre>
<strong>Source Records:</strong> 
Staff dataset:
+-------+----------+-----------+---------------+
| emp_id| emp_name | division  | supervisor_id |
+-------+----------+-----------+---------------+
| 101   | John     | A         | null          |
| 102   | Dan      | A         | 101           |
| 103   | James    | A         | 101           |
| 104   | Amy      | A         | 101           |
| 105   | Anne     | A         | 101           |
| 106   | Ron      | B         | 101           |
+-------+----------+-----------+---------------+
<strong>Result Set:</strong> 
+----------+
| emp_name |
+----------+
| John     |
+----------+
</pre>