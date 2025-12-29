<h2><a href="https://leetcode.com/problems/rising-temperature">197. Increasing Temperature</a></h2><h3>Easy</h3><hr><p>Dataset: <code>DailyTemps</code></p>

<pre>
+---------------+----------+
| Attribute     | DataType |
+---------------+----------+
| stationId     | integer  |
| measurementDt | date     |
| tempValue     | integer  |
+---------------+----------+
Each 'stationId' is distinct across records.
measurementDt values are unique - no repeats.
Records daily temperature measurements.
</pre>

<p>&nbsp;</p>

<p>Build SQL query to extract 'stationId' records where current temp exceeds prior day's reading.</p>

<p>Display output in <strong>random order</strong>.</p>

<p>Match this result pattern:</p>

<p>&nbsp;</p>
<p><strong class="example">Sample Case:</strong></p>

<pre>
<strong>Input Data:</strong> 
DailyTemps dataset:
+----------+--------------+-----------+
| stationId| measurementDt| tempValue |
+----------+--------------+-----------+
| 101      | 2015-01-01   | 10        |
| 102      | 2015-01-02   | 25        |
| 103      | 2015-01-03   | 20        |
| 104      | 2015-01-04   | 30        |
+----------+--------------+-----------+
<strong>Expected:</strong> 
+----------+
| stationId|
+----------+
| 102      |
| 104      |
+----------+
<strong>Reasoning:</strong> 
measurementDt 2015-01-02: temp climbed (10→25).
measurementDt 2015-01-04: temp climbed (20→30).
</pre>