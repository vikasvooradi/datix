<h2><a href="https://leetcode.com/problems/merge-customer-location-data">247. Merge Customer and Location Data</a></h2><h3>Easy</h3><hr><p>Table: <code>Customer</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customerId  | int     |
| surname     | varchar |
| givenName   | varchar |
+-------------+---------+
customerId is the primary key (column with unique values) for this table.
This table contains information about the ID of some customers and their given and surnames.
</pre>
<p>Table: <code>Location</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| locationId  | int     |
| customerId  | int     |
| cityName    | varchar |
| region      | varchar |
+-------------+---------+
locationId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city name and region of one customer with ID = customerId.
</pre>
<p>Write a solution to report the given name, surname, city name, and region of each customer in the <code>Customer</code> table. If the location of a <code>customerId</code> is not present in the <code>Location</code> table, report <code>null</code> instead.</p>
<p>Return the result table in <strong>any order</strong>.</p>
<p>The result format is in the following example.</p>
<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Customer table:
+------------+---------+-----------+
| customerId | surname | givenName |
+------------+---------+-----------+
| 101        | Smith   | James     |
| 102        | Davis   | Emma      |
+------------+---------+-----------+
Location table:
+------------+------------+-------------+----------+
| locationId | customerId | cityName    | region   |
+------------+------------+-------------+----------+
| 5001       | 102        | Los Angeles | Texas    |
| 5002       | 103        | Portland    | Oregon   |
+------------+------------+-------------+----------+
<strong>Output:</strong> 
+-----------+---------+-------------+--------+
| givenName | surname | cityName    | region |
+-----------+---------+-------------+--------+
| James     | Smith   | Null        | Null   |
| Emma      | Davis   | Los Angeles | Texas  |
+-----------+---------+-------------+--------+
<strong>Explanation:</strong> 
There is no location in the location table for the customerId = 101 so we return null in their city name and region.
locationId = 5001 contains information about the location of customerId = 102.
</pre>
