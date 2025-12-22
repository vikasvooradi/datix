/* Write your PL/SQL query statement below */

WITH get_refund_details AS
(
    SELECT
        customer_id AS ref_custid,
        COUNT(*) AS refund_count
    FROM customer_transactions
    WHERE transaction_type = 'refund'
    GROUP BY customer_id
),get_purchase_details AS
(
    SELECT
        customer_id AS pur_custid,
        COUNT(*) AS purchase_count
    FROM customer_transactions
    WHERE transaction_type = 'purchase'
    GROUP BY customer_id
),get_overall_details AS
(
    SELECT
        p.pur_custid,
        p.purchase_count,
        NVL(r.refund_count, 0) AS refund_count,
        (p.purchase_count + NVL(r.refund_count, 0)) AS total_txn
    FROM get_purchase_details p
    LEFT JOIN get_refund_details r
           ON p.pur_custid = r.ref_custid
),cal_refund_rate AS
(
    SELECT
        pur_custid,
        purchase_count,
        refund_count,
        (refund_count * 1.0 / total_txn) AS refund_rate
    FROM get_overall_details
    WHERE purchase_count >= 3               
      AND (refund_count * 1.0 / total_txn) < 0.20   
),get_user_active_30_days AS
(
    SELECT customer_id
    FROM (
        SELECT
            customer_id,
            MAX(transaction_date) - MIN(transaction_date) AS active_days
        FROM customer_transactions
        GROUP BY customer_id
    )
    WHERE active_days >= 30                   
)
SELECT pur_custid AS customer_id
FROM cal_refund_rate
WHERE pur_custid IN (
    SELECT customer_id FROM get_user_active_30_days
) ORDER BY pur_custid;
