/* Write your PL/SQL query statement below */

/* 
   ============================================================
   ORACLE PIVOT – WORKING EXAMPLES WITH CORRECT OUTPUTS
   ============================================================


-- Verify raw data first (8 rows expected)
SELECT * FROM sales_data ORDER BY emp_name, month;

RAW DATA OUTPUT:
EMP_NAME | REGION | MONTH | AMOUNT
---------------------------------
Amit     | NORTH  | JAN   | 1000
Amit     | NORTH  | FEB   | 1500
Amit     | NORTH  | MAR   | 1200
Neha     | WEST   | JAN   | 1100
Neha     | WEST   | FEB   | 1300
Ravi     | SOUTH  | JAN   | 800
Ravi     | SOUTH  | FEB   | 900
Ravi     | SOUTH  | MAR   | 1000


========================================================
   EXAMPLE 1: BASIC PIVOT (SUM) - MOST COMMON USE CASE
======================================================== 
   
SELECT * FROM (
    SELECT emp_name, region, month, amount FROM sales_data
)
PIVOT (
    SUM(amount)
    FOR month IN ('JAN', 'FEB', 'MAR')
) ORDER BY emp_name;

 ✅ CORRECT OUTPUT:
EMP_NAME | REGION | JAN  | FEB  | MAR
------------------------------------
Amit     | NORTH  | 1000 | 1500 | 1200
Neha     | WEST   | 1100 | 1300 | NULL
Ravi     | SOUTH  | 800  | 900  | 1000


 ========================================================
   EXAMPLE 2: COLUMN ALIASES (READABLE OUTPUT)
   ======================================================== 
SELECT * FROM (
    SELECT emp_name, region, month, amount FROM sales_data
)
PIVOT (  
    SUM(amount)
    FOR month IN ('JAN' AS JANUARY, 'FEB' AS FEBURARY, 'MAR' AS MARCH)
) ORDER BY emp_name;



 ✅ CORRECT OUTPUT:
EMP_NAME | REGION | JANUARY | FEBURARY | MARCH
-------------------------------------------
Amit     | NORTH  | 1000    | 1500     | 1200
Neha     | WEST   | 1100    | 1300     | NULL
Ravi     | SOUTH  | 800     | 900      | 1000


 ========================================================
   EXAMPLE 3: USING COUNT (Transaction Count)
   ======================================================== 
SELECT * FROM (
    SELECT emp_name, region, month FROM sales_data 
)
PIVOT (
    COUNT(month)
    FOR month IN ('JAN' AS JANUARY, 'FEB' AS FEBURARY, 'MAR' AS MARCH)
) ORDER BY emp_name;



 ✅ CORRECT OUTPUT:
EMP_NAME | REGION | JANUARY | FEBURARY | MARCH
-------------------------------------------
Amit     | NORTH  | 1       | 1        | 1
Neha     | WEST   | 1       | 1        | 0
Ravi     | SOUTH  | 1       | 1        | 1


 ========================================================
   EXAMPLE 4: MAX on MONTH (Pivot Value Itself)
   ======================================================== 
SELECT * FROM (
    SELECT emp_name, region, month FROM sales_data 
)
PIVOT (  
    MAX(month)
    FOR month IN ('JAN' AS JANUARY, 'FEB' AS FEBURARY, 'MAR' AS MARCH)
) ORDER BY emp_name;

 ✅ CORRECT OUTPUT:
EMP_NAME | REGION | JANUARY | FEBURARY | MARCH
-------------------------------------------
Amit     | NORTH  | JAN     | FEB      | MAR
Neha     | WEST   | JAN     | FEB      | NULL
Ravi     | SOUTH  | JAN     | FEB      | MAR




 ========================================================
   EXAMPLE 5: MAX on AMOUNT (Highest Sale per Month)
   ======================================================== 
SELECT * FROM (
    SELECT emp_name, region, month, amount FROM sales_data 
)
PIVOT (  
    MAX(amount)
    FOR month IN ('JAN' AS JANUARY, 'FEB' AS FEBURARY, 'MAR' AS MARCH)
) ORDER BY emp_name;

 ✅ CORRECT OUTPUT:
EMP_NAME | REGION | JANUARY | FEBURARY | MARCH
-------------------------------------------
Amit     | NORTH  | 1000    | 1500     | 1200
Neha     | WEST   | 1100    | 1300     | NULL
Ravi     | SOUTH  | 800     | 900      | 1000


 ========================================================
   EXAMPLE 6: MULTIPLE AGGREGATES (✅ CORRECT SYNTAX)
   ======================================================== 
SELECT * FROM (
    SELECT emp_name, region, month, amount FROM sales_data 
)
PIVOT ( 
    COUNT(amount) AS cnt,
    SUM(amount)   AS sum_amt,
    MAX(amount)   AS max_amt,
    MIN(amount)   AS min_amt,
    AVG(amount)   AS avg_amt
    FOR month IN ('JAN' AS JANUARY, 'FEB' AS FEBURARY, 'MAR' AS MARCH)
) ORDER BY emp_name;


 ✅ CORRECT OUTPUT (13 Columns Total):
EMP_NAME | REGION | JANUARY_CNT | JANUARY_SUM_AMT | JANUARY_MAX_AMT | JANUARY_MIN_AMT | JANUARY_AVG_AMT | FEBURARY_CNT | ...
-----------------------------------------------------------------------------------------------------------
Amit     | NORTH  | 1           | 1000            | 1000            | 1000            | 1000            | 1            | ...
Neha     | WEST   | 1           | 1100            | 1100            | 1100            | 1100            | 1            | ...
Ravi     | SOUTH  | 1           | 800             | 800             | 800             | 800             | 1            | ...



 ============================================================
   ✅ COMPLETE QUERY: PIVOT + NULL → 0 
   ============================================================ 

SELECT 
    emp_name,
    region,
    
    -- JANUARY COLUMNS (All NULL → 0)
    NVL(JANUARY_CNT, 0) AS JANUARY_CNT,
    NVL(JANUARY_SUM_AMT, 0) AS JANUARY_SUM_AMT,
    NVL(JANUARY_MAX_AMT, 0) AS JANUARY_MAX_AMT,
    NVL(JANUARY_MIN_AMT, 0) AS JANUARY_MIN_AMT,
    NVL(JANUARY_AVG_AMT, 0) AS JANUARY_AVG_AMT,
    
    -- FEBRUARY COLUMNS (All NULL → 0)
    NVL(FEBURARY_CNT, 0) AS FEBURARY_CNT,
    NVL(FEBURARY_SUM_AMT, 0) AS FEBURARY_SUM_AMT,
    NVL(FEBURARY_MAX_AMT, 0) AS FEBURARY_MAX_AMT,
    NVL(FEBURARY_MIN_AMT, 0) AS FEBURARY_MIN_AMT,
    NVL(FEBURARY_AVG_AMT, 0) AS FEBURARY_AVG_AMT,
    
    -- MARCH COLUMNS (All NULL → 0)
    NVL(MARCH_CNT, 0) AS MARCH_CNT,
    NVL(MARCH_SUM_AMT, 0) AS MARCH_SUM_AMT,
    NVL(MARCH_MAX_AMT, 0) AS MARCH_MAX_AMT,
    NVL(MARCH_MIN_AMT, 0) AS MARCH_MIN_AMT,
    NVL(MARCH_AVG_AMT, 0) AS MARCH_AVG_AMT

FROM (
    SELECT emp_name, region, month, amount FROM sales_data 
)
PIVOT ( 
    COUNT(amount) AS cnt,
    SUM(amount)   AS sum_amt,
    MAX(amount)   AS max_amt,
    MIN(amount)   AS min_amt,
    AVG(amount)   AS avg_amt  
    FOR month IN ('JAN' AS JANUARY, 'FEB' AS FEBURARY, 'MAR' AS MARCH)
) 
ORDER BY emp_name;

 ============================================================
   ✅ PERFECT OUTPUT (NO NULLS - All 0s):
   ============================================================
   EMP_NAME | REGION | JAN_CNT | JAN_SUM | ... | MAR_CNT | MAR_SUM | ...
   ---------------------------------------------------------------
   Amit     | NORTH  | 1       | 1000    | ... | 1       | 1200    | ...
   Neha     | WEST   | 1       | 1100    | ... | 0       | 0       | ✅ FIXED!
   Ravi     | SOUTH  | 1       | 800     | ... | 1       | 1000    | ...
   ============================================================ 

*/





select * from 
(
    select id,revenue,month from Department
) 
PIVOT (
    SUM(revenue)
    FOR month IN (
        'Jan' AS Jan_Revenue,
        'Feb' AS Feb_Revenue,
        'Mar' AS Mar_Revenue,
        'Apr' AS Apr_Revenue,
        'May' AS May_Revenue,
        'Jun' AS Jun_Revenue,
        'Jul' AS Jul_Revenue,
        'Aug' AS Aug_Revenue,
        'Sep' AS Sep_Revenue,
        'Oct' AS Oct_Revenue,
        'Nov' AS Nov_Revenue,
        'Dec' AS Dec_Revenue
    )
)
order by id;