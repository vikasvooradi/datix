/* Write your PL/SQL query statement below */

/*
SELECT
    stock_name,
    SUM(
        CASE
            WHEN operation = 'Sell' THEN price
            WHEN operation = 'Buy'  THEN -price
        END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;

*/

SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END) - SUM(CASE WHEN operation = 'Buy'  THEN price ELSE 0 END)
    AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;

