<h2>Table: customer_transactions</h2>

<table>
  <tr>
    <th>Column Name</th>
    <th>Type</th>
  </tr>
  <tr>
    <td>transaction_id</td>
    <td>int</td>
  </tr>
  <tr>
    <td>customer_id</td>
    <td>int</td>
  </tr>
  <tr>
    <td>transaction_date</td>
    <td>date</td>
  </tr>
  <tr>
    <td>amount</td>
    <td>decimal</td>
  </tr>
  <tr>
    <td>transaction_type</td>
    <td>varchar</td>
  </tr>
</table>

<p>transaction_id is the unique identifier for this table.</p>
<p>transaction_type can be either 'purchase' or 'refund'.</p>

<h3>Task</h3>
<p>
Find loyal customers. A customer is considered loyal if they satisfy all of the following:
</p>
<ul>
  <li>They have at least 3 purchase transactions.</li>
  <li>Their activity period (from first to last transaction) is at least 30 days.</li>
  <li>Their refund rate is less than 20%.</li>
</ul>

<p>
Refund rate is the number of refund transactions divided by the total number of transactions
(purchases plus refunds).
</p>
<p>
Return the result with customer_id sorted in ascending order.
</p>

<h3>Example Input</h3>

<table>
  <tr>
    <th>transaction_id</th>
    <th>customer_id</th>
    <th>transaction_date</th>
    <th>amount</th>
    <th>transaction_type</th>
  </tr>
  <tr><td>1</td><td>101</td><td>2024-01-05</td><td>150.00</td><td>purchase</td></tr>
  <tr><td>2</td><td>101</td><td>2024-01-15</td><td>200.00</td><td>purchase</td></tr>
  <tr><td>3</td><td>101</td><td>2024-02-10</td><td>180.00</td><td>purchase</td></tr>
  <tr><td>4</td><td>101</td><td>2024-02-20</td><td>250.00</td><td>purchase</td></tr>
  <tr><td>5</td><td>102</td><td>2024-01-10</td><td>100.00</td><td>purchase</td></tr>
  <tr><td>6</td><td>102</td><td>2024-01-12</td><td>120.00</td><td>purchase</td></tr>
  <tr><td>7</td><td>102</td><td>2024-01-15</td><td>80.00</td><td>refund</td></tr>
  <tr><td>8</td><td>102</td><td>2024-01-18</td><td>90.00</td><td>refund</td></tr>
  <tr><td>9</td><td>102</td><td>2024-02-15</td><td>130.00</td><td>purchase</td></tr>
  <tr><td>10</td><td>103</td><td>2024-01-01</td><td>500.00</td><td>purchase</td></tr>
  <tr><td>11</td><td>103</td><td>2024-01-02</td><td>450.00</td><td>purchase</td></tr>
  <tr><td>12</td><td>103</td><td>2024-01-03</td><td>400.00</td><td>purchase</td></tr>
  <tr><td>13</td><td>104</td><td>2024-01-01</td><td>200.00</td><td>purchase</td></tr>
  <tr><td>14</td><td>104</td><td>2024-02-01</td><td>250.00</td><td>purchase</td></tr>
  <tr><td>15</td><td>104</td><td>2024-02-15</td><td>300.00</td><td>purchase</td></tr>
  <tr><td>16</td><td>104</td><td>2024-03-01</td><td>350.00</td><td>purchase</td></tr>
  <tr><td>17</td><td>104</td><td>2024-03-10</td><td>280.00</td><td>purchase</td></tr>
  <tr><td>18</td><td>104</td><td>2024-03-15</td><td>100.00</td><td>refund</td></tr>
</table>

<h3>Example Output</h3>

<table>
  <tr>
    <th>customer_id</th>
  </tr>
  <tr><td>101</td></tr>
  <tr><td>104</td></tr>
</table>

<h3>Explanation</h3>
<ul>
  <li>Customer 101: 4 purchases, 0 refunds, refund rate 0%, active from 2024-01-05 to 2024-02-20 (46 days) → loyal.</li>
  <li>Customer 102: 3 purchases, 2 refunds, refund rate 40% → not loyal.</li>
  <li>Customer 103: 3 purchases, 0 refunds, active from 2024-01-01 to 2024-01-03 (2 days) → not loyal.</li>
  <li>Customer 104: 5 purchases, 1 refund, refund rate about 16.67%, active from 2024-01-01 to 2024-03-15 (73 days) → loyal.</li>
</ul>
