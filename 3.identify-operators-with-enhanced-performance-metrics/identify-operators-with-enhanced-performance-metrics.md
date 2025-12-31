<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1>3. Identify Operators with Enhanced Performance Metrics</h1>
<h3>Medium</h3><hr>
<h2>SQL Database Definition</h2>
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
| 502         | Linda Rodriguez  | 10.56             | 13.33              | 2.77                      |
| 501         | Marcus Chen      | 11.88             | 13.86              | 1.98                      |
+-------------+------------------+-------------------+--------------------+---------------------------+
</pre>
<p>Explanation:</p>
<h3>Marcus Chen (operator_id = 501):</h3>
<p>Initial period journeys (Jan-Jun): Mar 8 (185.7/15.8 = 11.75), Apr 22 (295.3/24.1 = 12.25)</p>
<p>Initial period average efficiency: (11.75 + 12.25) / 2 = 11.88</p>
<p>Latter period journeys (Jul-Dec): Sep 14 (220.6/16.2 = 13.62), Oct 28 (265.4/18.3 = 14.50)</p>
<p>Latter period average efficiency: (13.62 + 14.50) / 2 = 13.86</p>
<p>Efficiency enhancement: 13.86 - 11.88 = 1.98</p>

<br>  
<h3>Linda Rodriguez (operator_id = 502):</h3>
<p>Initial period journeys: Feb 5 (147.8/13.2 = 11.20), May 19 (368.5/32.4 = 11.37)</p>
<p>Initial period average efficiency: (11.20 + 11.37) / 2 = 10.56</p>
<p>Latter period journeys: Nov 7 (294.7/22.1 = 13.33)</p>
<p>Latter period average efficiency: 13.33</p>
<p>Efficiency enhancement: 13.33 - 10.56 = 2.77 (rounded to 2 decimal places)</p>

<br>
<h3>Operators not included:</h3>
<p>James Anderson (operator_id = 503): Has journeys exclusively in initial period (Apr, Jun)</p>
<p>Sarah Martinez (operator_id = 504): Has journeys exclusively in latter period (Aug, Dec)</p>
<p>Robert Kim (operator_id = 505): Has journeys exclusively in initial period (Mar)</p>
<p>The output dataset is arranged by efficiency enhancement in descending order followed by name in ascending order.</p>
</body>
</html>
