<h2><a href="https://leetcode.com/problems/merge-customer-and-location-data">Merge Customer and Location Data</a></h2><h3>Easy</h3><hr><p>You are given two database tables containing customer and location information.</p>

<h3>Table Schema</h3>

<p>Table: <code>Customer</code></p>
<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customerId  | int     |
| surname     | varchar |
| givenName   | varchar |
+-------------+---------+
customerId serves as the primary key (unique identifier) for this table.
This table stores the unique identifier and full name details for various customers.
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
locationId serves as the primary key (unique identifier) for this table.
Each record in this table contains the city and region information for a customer identified by customerId.
</pre>

<h3>Task</h3>
<p>Create a query that retrieves the given name, surname, city name, and region for every customer in the <code>Customer</code> table. When a customer's location data is missing from the <code>Location</code> table, display <code>null</code> for the city and region fields.</p>

<p>The output can be returned in <strong>any sequence</strong>.</p>

<p>The expected output format is demonstrated below.</p>

<p><strong class="example">Example 1:</strong></p>
<pre>
<strong>Input:</strong> 
Customer table:
+------------+---------+-----------+
| customerId | surname | givenName |
+------------+---------+-----------+
| 101        | Smith   | James     |
| 102        | Johnson | Maria     |
+------------+---------+-----------+
Location table:
+------------+------------+-------------+--------+
| locationId | customerId | cityName    | region |
+------------+------------+-------------+--------+
| 5001       | 102        | Los Angeles | Texas  |
| 5002       | 103        | Portland    | Oregon |
+------------+------------+-------------+--------+
<strong>Output:</strong> 
+-----------+---------+-------------+--------+
| givenName | surname | cityName    | region |
+-----------+---------+-------------+--------+
| James     | Smith   | Null        | Null   |
| Maria     | Johnson | Los Angeles | Texas  |
+-----------+---------+-------------+--------+
<strong>Explanation:</strong> 
Customer with customerId = 101 has no corresponding entry in the Location table, therefore null values are returned for their cityName and region columns. The record with locationId = 5001 provides the location details for customerId = 102.
</pre>
