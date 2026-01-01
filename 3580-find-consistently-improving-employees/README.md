<!DOCTYPE html>
<html>
<head>
</head>
<body>

<h1>7294. Identify Personnel with Progressive Performance Growth</h1>

<h3>Medium</h3><hr>
<p>SQL Schema</p>

<h2>Table: personnel</h2>

<pre>
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| staff_id    | int     |
| full_name   | varchar |
+-------------+---------+
</pre>

<p>staff_id serves as the primary key for this table.</p>
<p>Each record contains details about a staff member.</p>

<h2>Table: evaluation_records</h2>

<pre>
+------------------+------+
| Column Name      | Type |
+------------------+------+
| evaluation_id    | int  |
| staff_id         | int  |
| assessment_date  | date |
| score            | int  |
+------------------+------+
</pre>

<p>evaluation_id serves as the primary key for this table.</p>
<p>Each record captures a performance evaluation for a staff member. Scores range from 1 to 5, with 5 representing outstanding performance and 1 indicating underperformance.</p>

<p>Compose a query to identify staff members whose performance has demonstrated continuous upward progression across their three most recent evaluations.</p>

<p>A staff member must possess a minimum of 3 evaluations to qualify for consideration</p>
<p>The three most recent evaluations must exhibit strictly ascending scores (each subsequent assessment exceeding the prior one)</p>
<p>Utilize the three latest evaluations determined by assessment_date for each staff member</p>
<p>Compute the growth_metric as the numerical difference between the most recent score and the oldest score within the latest 3 evaluations</p>

<p>Present the result set sorted by growth_metric in descending sequence, followed by full_name in ascending sequence.</p>

<p>The result format is demonstrated in the example below.</p>

<h2>Example:</h2>

<p>Input:</p>

<p>personnel table:</p>

<pre>
+----------+-------------------+
| staff_id | full_name         |
+----------+-------------------+
| 203      | Marcus Chen       |
| 417      | Sofia Rodriguez   |
| 528      | Liam O'Connor     |
| 635      | Priya Patel       |
| 749      | James Anderson    |
+----------+-------------------+
</pre>

<p>evaluation_records table:</p>

<pre>
+---------------+----------+-----------------+-------+
| evaluation_id | staff_id | assessment_date | score |
+---------------+----------+-----------------+-------+
| 891           | 203      | 2023-02-08      | 1     |
| 892           | 203      | 2023-05-12      | 2     |
| 893           | 203      | 2023-08-19      | 3     |
| 894           | 203      | 2023-11-23      | 4     |
| 895           | 417      | 2023-03-14      | 2     |
| 896           | 417      | 2023-06-18      | 1     |
| 897           | 417      | 2023-09-22      | 3     |
| 898           | 417      | 2023-12-05      | 4     |
| 899           | 528      | 2023-01-25      | 2     |
| 900           | 528      | 2023-04-29      | 3     |
| 901           | 528      | 2023-07-31      | 4     |
| 902           | 528      | 2023-10-28      | 5     |
| 903           | 635      | 2023-02-17      | 3     |
| 904           | 635      | 2023-05-21      | 3     |
| 905           | 635      | 2023-08-24      | 3     |
| 906           | 749      | 2023-03-06      | 4     |
| 907           | 749      | 2023-06-09      | 3     |
+---------------+----------+-----------------+-------+
</pre>

<p>Output:</p>

<pre>
+----------+-------------------+---------------+
| staff_id | full_name         | growth_metric |
+----------+-------------------+---------------+
| 417      | Sofia Rodriguez   | 3             |
| 528      | Liam O'Connor     | 2             |
| 203      | Marcus Chen       | 2             |
+----------+-------------------+---------------+
</pre>

<p>Explanation:</p>

<p><strong>Marcus Chen (staff_id = 203):</strong></p>
<ul>
<li>Total evaluations: 4</li>
<li>All evaluation dates and scores:
  <ul>
    <li>2023-02-08: score = 1</li>
    <li>2023-05-12: score = 2</li>
    <li>2023-08-19: score = 3</li>
    <li>2023-11-23: score = 4</li>
  </ul>
</li>
<li>Latest 3 evaluations (by assessment_date):
  <ul>
    <li>1st oldest: 2023-05-12 with score = 2</li>
    <li>2nd: 2023-08-19 with score = 3</li>
    <li>3rd most recent: 2023-11-23 with score = 4</li>
  </ul>
</li>
<li>Checking strict progression: 2 < 3 < 4 ✓ (strictly increasing)</li>
<li>Growth metric calculation: 4 - 2 = 2</li>
<li><strong>Result: INCLUDED</strong></li>
</ul>

<p><strong>Sofia Rodriguez (staff_id = 417):</strong></p>
<ul>
<li>Total evaluations: 4</li>
<li>All evaluation dates and scores:
  <ul>
    <li>2023-03-14: score = 2</li>
    <li>2023-06-18: score = 1</li>
    <li>2023-09-22: score = 3</li>
    <li>2023-12-05: score = 4</li>
  </ul>
</li>
<li>Latest 3 evaluations (by assessment_date):
  <ul>
    <li>1st oldest: 2023-06-18 with score = 1</li>
    <li>2nd: 2023-09-22 with score = 3</li>
    <li>3rd most recent: 2023-12-05 with score = 4</li>
  </ul>
</li>
<li>Checking strict progression: 1 < 3 < 4 ✓ (strictly increasing)</li>
<li>Growth metric calculation: 4 - 1 = 3</li>
<li><strong>Result: INCLUDED</strong></li>
</ul>

<p><strong>Liam O'Connor (staff_id = 528):</strong></p>
<ul>
<li>Total evaluations: 4</li>
<li>All evaluation dates and scores:
  <ul>
    <li>2023-01-25: score = 2</li>
    <li>2023-04-29: score = 3</li>
    <li>2023-07-31: score = 4</li>
    <li>2023-10-28: score = 5</li>
  </ul>
</li>
<li>Latest 3 evaluations (by assessment_date):
  <ul>
    <li>1st oldest: 2023-04-29 with score = 3</li>
    <li>2nd: 2023-07-31 with score = 4</li>
    <li>3rd most recent: 2023-10-28 with score = 5</li>
  </ul>
</li>
<li>Checking strict progression: 3 < 4 < 5 ✓ (strictly increasing)</li>
<li>Growth metric calculation: 5 - 3 = 2</li>
<li><strong>Result: INCLUDED</strong></li>
</ul>

<p><strong>Priya Patel (staff_id = 635):</strong></p>
<ul>
<li>Total evaluations: 3</li>
<li>All evaluation dates and scores:
  <ul>
    <li>2023-02-17: score = 3</li>
    <li>2023-05-21: score = 3</li>
    <li>2023-08-24: score = 3</li>
  </ul>
</li>
<li>Latest 3 evaluations (by assessment_date):
  <ul>
    <li>1st oldest: 2023-02-17 with score = 3</li>
    <li>2nd: 2023-05-21 with score = 3</li>
    <li>3rd most recent: 2023-08-24 with score = 3</li>
  </ul>
</li>
<li>Checking strict progression: 3 = 3 = 3 ✗ (NOT strictly increasing, no progression)</li>
<li><strong>Result: EXCLUDED (scores are equal, not increasing)</strong></li>
</ul>

<p><strong>James Anderson (staff_id = 749):</strong></p>
<ul>
<li>Total evaluations: 2</li>
<li>All evaluation dates and scores:
  <ul>
    <li>2023-03-06: score = 4</li>
    <li>2023-06-09: score = 3</li>
  </ul>
</li>
<li>Has only 2 evaluations, but requirement is minimum of 3 evaluations</li>
<li><strong>Result: EXCLUDED (insufficient evaluation records)</strong></li>
</ul>

<p><strong>Final Result Ordering:</strong></p>
<ul>
<li>Sort by growth_metric descending: Sofia Rodriguez (3), then Liam O'Connor (2) and Marcus Chen (2)</li>
<li>For tied growth_metric values (both 2), sort by full_name ascending: "Liam O'Connor" comes before "Marcus Chen" alphabetically</li>
<li>Final order: Sofia Rodriguez (3), Liam O'Connor (2), Marcus Chen (2)</li>
</ul>

</body>
</html>
