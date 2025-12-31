<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1>3. Identify Operators with Enhanced Performance Metrics</h1>
<h3>Medium</h3><hr>
<p>Database Schema</p>
<p>Database Schema</p>
<p>Table: operators</p>
<pre>
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| operator_id   | int     |
| operator_name | varchar |
+---------------+---------+
</pre>
<p>operator_id serves as the unique identifier for this table.</p>
<p>Every record provides details about an individual operator.</p>
<p>Table: journeys</p>
<pre>
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| journey_id       | int     |
| operator_id      | int     |
| journey_date     | date    |
| distance_miles   | decimal |
| energy_usage     | decimal |
+------------------+---------+
</pre>
<p>journey_id serves as the unique identifier for this table.</p>
<p>Every record captures a journey completed by an operator, documenting the distance covered and energy consumed during that journey.</p>
<p>Develop a query to identify operators whose performance efficiency has shown improvement when comparing their average performance metrics between the initial six months and the latter six months of the year.</p>
<p>Compute performance efficiency as distance_miles / energy_usage for every journey</p>
<p>Initial period: January through June, Latter period: July through December</p>
<p>Include exclusively operators who have completed journeys in both periods of the year</p>
<p>Determine the efficiency enhancement as (latter_period_avg - initial_period_avg)</p>
<p>Round all numerical values to 2 decimal places</p>
<p>Return the result dataset sorted by efficiency enhancement in descending order, followed by operator name in ascending order.</p>
<p>The output structure is demonstrated in the example below.</p>
<h2>Example:</h2>
<p>Input:</p>
<p>operators table:</p>
<pre>
+-------------+------------------+
| operator_id | operator_name    |
+-------------+------------------+
| 501         | Marcus Chen      |
| 502         | Linda Rodriguez  |
| 503         | James Anderson   |
| 504         | Sarah Martinez   |
| 505         | Robert Kim       |
+-------------+------------------+
</pre>
<p>journeys table:</p>
<pre>
+------------+-------------+--------------+----------------+--------------+
| journey_id | operator_id | journey_date | distance_miles | energy_usage |
+------------+-------------+--------------+----------------+--------------+
| 301        | 501         | 2023-03-08   | 185.7          | 15.8         |
| 302        | 501         | 2023-04-22   | 295.3          | 24.1         |
| 303        | 501         | 2023-09-14   | 220.6          | 16.2         |
| 304        | 501         | 2023-10-28   | 265.4          | 18.3         |
| 305        | 502         | 2023-02-05   | 147.8          | 13.2         |
| 306        | 502         | 2023-05-19   | 368.5          | 32.4         |
| 307        | 502         | 2023-11-07   | 294.7          | 22.1         |
| 308        | 503         | 2023-04-16   | 118.2          | 12.5         |
| 309        | 503         | 2023-06-23   | 132.9          | 13.5         |
| 310        | 504         | 2023-08-26   | 236.1          | 18.9         |
| 311        | 504         | 2023-12-03   | 206.5          | 16.2         |
| 312        | 505         | 2023-03-31   | 162.3          | 16.9         |
+------------+-------------+--------------+----------------+--------------+
</pre>
<p>Output:</p>
<pre>
+-------------+------------------+-------------------+--------------------+---------------------------+
| operator_id | operator_name    | initial_period_avg | latter_period_avg | efficiency_enhancement    |
+-------------+------------------+-------------------+--------------------+---------------------------+
| 501         | Marcus Chen      | 12                | 14.06              | 2.06                      |
| 502         | Linda Rodriguez  | 11.29             | 13.33              | 2.05                      |
+-------------+------------------+-------------------+--------------------+---------------------------+
</pre>

<h2>Explanation</h2>

<h3>Marcus Chen (operator_id = 501)</h3>

<p>
<strong>Initial period journeys (Jan–Jun):</strong><br>
Mar 8: 185.7 ÷ 15.8 = 11.75<br>
Apr 22: 295.3 ÷ 24.1 = 12.25
</p>

<p>
<strong>Initial period average efficiency:</strong><br>
(11.75 + 12.25) ÷ 2 = <strong>12.00</strong>
</p>

<p>
<strong>Latter period journeys (Jul–Dec):</strong><br>
Sep 14: 220.6 ÷ 16.2 = 13.62<br>
Oct 28: 265.4 ÷ 18.3 = 14.50
</p>

<p>
<strong>Latter period average efficiency:</strong><br>
(13.62 + 14.50) ÷ 2 = <strong>14.06</strong>
</p>

<p>
<strong>Efficiency enhancement:</strong><br>
14.06 − 12.00 = <strong>2.06</strong>
</p>

<hr>

<h3>Linda Rodriguez (operator_id = 502)</h3>

<p>
<strong>Initial period journeys:</strong><br>
Feb 5: 147.8 ÷ 13.2 = 11.20<br>
May 19: 368.5 ÷ 32.4 = 11.37
</p>

<p>
<strong>Initial period average efficiency:</strong><br>
(11.20 + 11.37) ÷ 2 = <strong>11.29</strong>
</p>

<p>
<strong>Latter period journeys:</strong><br>
Nov 7: 294.7 ÷ 22.1 = 13.33
</p>

<p>
<strong>Latter period average efficiency:</strong><br>
<strong>13.33</strong>
</p>

<p>
<strong>Efficiency enhancement:</strong><br>
13.33 − 11.29 = <strong>2.05</strong>
</p>

<hr>

<h3>Operators Not Included</h3>
<ul>
    <li>James Anderson (operator_id = 503): Journeys only in the initial period (Apr, Jun)</li>
    <li>Sarah Martinez (operator_id = 504): Journeys only in the latter period (Aug, Dec)</li>
    <li>Robert Kim (operator_id = 505): Journeys only in the initial period (Mar)</li>
</ul>

<p>
The output dataset is arranged by efficiency enhancement in descending order, followed by operator name in ascending order.
</p>

<br>
