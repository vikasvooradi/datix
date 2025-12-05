/* Write your PL/SQL query statement below

-- sales_id -> pk -> tbl : salesperson
-- com_id   -> pk -> tbl : company
-- order_id -> pk -> tbl : orders

-- Table relation

company     -> comid(pk) - R - orders -> comid(fk)
salesperson -> sales_id  - R - orders -> sales_id(fk)
ID of company : com_id , ID of salesperson : sales_id , date of order : order_date , amount paid : amount
name , com_id , sales_id , order_date , amount : one order made by salesperson
condition  : who did not have any orders related to the company with the name "RED"
priority : comapnay -> order -> sales
Amy , Mark , Alex : 2 , 3 , 5

*/ -- select * from company c left join orders o on c.com_id = o.com_id left join salesperson s on o.sales_id = s.sales_id


WITH DATA AS (
  SELECT 
    c.com_id AS company_id, 
    c.name AS company_name, 
    o.order_date AS order_date, 
    o.amount AS order_amount, 
    o.sales_id AS sales_id 
  FROM 
    company c 
    LEFT JOIN orders o ON c.com_id = o.com_id
), 
list_all AS (
  SELECT 
    DISTINCT s.name AS sname, 
    d.company_name AS dcname 
  FROM 
    salesperson s 
    LEFT JOIN DATA d ON s.sales_id = d.sales_id 
  ORDER BY 
    d.company_name
), 
ignore_multiple AS (
  SELECT 
    sname ,dcname
  FROM 
    list_all where dcname='RED'
)
SELECT 
  distinct name 
FROM 
  (
    SELECT 
      sname AS name, 
      dcname AS company_name 
    FROM 
      (
        SELECT 
          * 
        FROM 
          list_all 
        WHERE 
          sname NOT IN (
            SELECT 
              sname 
            FROM 
              ignore_multiple
          )
      ) 
    WHERE 
      dcname != 'RED' 
      OR dcname IS NULL
  );