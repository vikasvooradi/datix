<h2><a href="https://leetcode.com/problems/customers-who-never-order">183. Members Without Reservations</a></h2><h3>Easy</h3><hr><p>Table: <code>Members</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| memberId    | int     |
| fullName    | varchar |
+-------------+---------+
memberId serves as the primary key (column with unique values) for this table.
Each row of this table represents the ID and full name of a member.
</pre>
<p>&nbsp;</p>
<p>Table: <code>Bookings</code></p>
<pre>
+-------------+------+
| Column Name | Type |
+-------------+------+
| bookingId   | int  |
| memberId    | int  |
+-------------+------+
bookingId serves as the primary key (column with unique values) for this table.
memberId is a foreign key (reference columns) of the memberId from the Members table.
Each row of this table represents the ID of a booking and the ID of the member who made it.
</pre>
<p>&nbsp;</p>
<p>Create a query to identify all members who have never made any reservations.</p>
<p>Return the result table in <strong>any order</strong>.</p>
<p>The result format is in the following example.</p>
<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Members table:
+----------+----------+
| memberId | fullName |
+----------+----------+
| 10       | Alex     |
| 20       | Blake    |
| 30       | Casey    |
| 40       | Drew     |
+----------+----------+
Bookings table:
+-----------+----------+
| bookingId | memberId |
+-----------+----------+
| 101       | 30       |
| 102       | 10       |
+-----------+----------+
<strong>Output:</strong> 
+---------+
| Members |
+---------+
| Blake   |
| Drew    |
+---------+
</pre>
