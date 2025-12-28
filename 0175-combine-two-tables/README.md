<div class="problem-statement">
  <h2 class="problem-title">Merge Customer and Location Data</h2>
  <span class="difficulty-badge">Easy</span>
  
  <div class="problem-description">
    <p>You are given two database tables containing customer and location information.</p>
    
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
    
    <h3>Example 1</h3>
    <div class="example">
      <strong>Input:</strong>
      
      <p>Customer table:</p>
      <pre>
+------------+---------+-----------+
| customerId | surname | givenName |
+------------+---------+-----------+
| 101        | Smith   | James     |
| 102        | Johnson | Maria     |
+------------+---------+-----------+
      </pre>
      
      <p>Location table:</p>
      <pre>
+------------+------------+-------------+----------+
| locationId | customerId | cityName    | region   |
+------------+------------+-------------+----------+
| 5001       | 102        | Los Angeles | Texas    |
| 5002       | 103        | Portland    | Oregon   |
+------------+------------+-------------+----------+
      </pre>
      
      <strong>Output:</strong>
      <pre>
+-----------+---------+-------------+--------+
| givenName | surname | cityName    | region |
+-----------+---------+-------------+--------+
| James     | Smith   | Null        | Null   |
| Maria     | Johnson | Los Angeles | Texas  |
+-----------+---------+-------------+--------+
      </pre>
      
      <strong>Explanation:</strong>
      <p>Customer with customerId = 101 has no corresponding entry in the Location table, therefore null values are returned for their cityName and region columns. The record with locationId = 5001 provides the location details for customerId = 102.</p>
    </div>
  </div>
</div>
