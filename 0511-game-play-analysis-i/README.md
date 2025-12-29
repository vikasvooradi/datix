<h2><a href="https://leetcode.com/problems/game-play-analysis-i">1179. Player First Session Analysis</a></h2><h3>Easy</h3><hr><p>Dataset: <code>UserSessions</code></p>

<pre>
+---------------+----------+
| Field Name    | DataType |
+---------------+----------+
| user_id       | integer  |
| session_id    | integer  |
| login_date    | date     |
| session_count | integer  |
+---------------+----------+
(user_id, login_date) forms the unique identifier for each record.
This dataset captures user gaming sessions across devices.
Each entry represents a user's login session with games played (could be zero).
</pre>

<p>&nbsp;</p>

<p>Construct a query to determine the <strong>earliest login date</strong> for every user.</p>

<p>Show results in <strong>any sequence</strong>.</p>

<p>Follow this output template:</p>

<p>&nbsp;</p>
<p><strong class="example">Sample Case:</strong></p>

<pre>
<strong>Source Data:</strong> 
UserSessions dataset:
+---------+------------+------------+---------------+
| user_id | session_id | login_date | session_count |
+---------+------------+------------+---------------+
| 1       | 2          | 2016-03-01 | 5             |
| 1       | 2          | 2016-05-02 | 6             |
| 2       | 3          | 2017-06-25 | 1             |
| 3       | 1          | 2016-03-02 | 0             |
| 3       | 4          | 2018-07-03 | 5             |
+---------+------------+------------+---------------+
<strong>Expected Output:</strong> 
+---------+---------------+
| user_id | initial_login |
+---------+---------------+
| 1       | 2016-03-01    |
| 2       | 2017-06-25    |
| 3       | 2016-03-02    |
+---------+---------------+
</pre>