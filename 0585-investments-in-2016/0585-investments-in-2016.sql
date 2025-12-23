/* Write your PL/SQL query statement below */

-- Method 1 



WITH insuranc_data_set_tiv_2015 AS (
   
   /* Getting only combination less then 2 

    | PID | TIV_2015 | TIV_2016 | LAT | LON |
    | --- | -------- | -------- | --- | --- |
    | 1   | 10       | 5        | 10  | 10  |
    | 3   | 10       | 30       | 20  | 20  |
    | 4   | 10       | 40       | 40  | 40  |

   */

    SELECT
        *
    FROM
        insurance
    WHERE
        tiv_2015 NOT IN (
            SELECT
                tiv_2015
            FROM
                insurance
            GROUP BY
                tiv_2015
            HAVING
                COUNT(tiv_2015) < 2
        )
    ORDER BY
        pid
), insuranc_data_set_lan_lon AS (

    /* Getting only combination more then 1.
       Make sure you do GROUP BY lat,lon and not (lat||lon) it will return output wrong - this test case fails.

    | PID | TIV_2015 | TIV_2016 | LAT | LON |
    | --- | -------- | -------- | --- | --- |
    | 2   | 20       | 20       | 20  | 20  |
    | 3   | 10       | 30       | 20  | 20  | 
    
    */


    SELECT
        *
    FROM
        insurance
    WHERE
        (lat||lon ) IN (
            SELECT
                (lat||lon)
            FROM
                insurance
            GROUP BY lat,lon
            HAVING
                COUNT((lat||lon)) > 1
        )
    ORDER BY
        pid  
                
), union_both_combination_set AS (
   /* Union both data set with both condition and apply second rule to exclude records where 
      both lat and lon is same. 

      | PID | TIV_2015 | TIV_2016 | LAT | LON |
      | --- | -------- | -------- | --- | --- |
      | 1   | 10       | 5        | 10  | 10  |
      | 2   | 20       | 20       | 20  | 20  |
      | 3   | 10       | 30       | 20  | 20  |
      | 4   | 10       | 40       | 40  | 40  |

      After applying not in with data set :   Insuranc_Data_Set_lan_lon

      | PID | TIV_2015 | TIV_2016 | LAT | LON |
      | --- | -------- | -------- | --- | --- |
      | 1   | 10       | 5        | 10  | 10  |
      | 4   | 10       | 40       | 40  | 40  |

      Now apply sum on TIV_2016 and round of to 2 decimal places 

      | TIV_2016 |
      | -------- |
      | 45       |

   */

    SELECT
        *
    FROM
        (
            SELECT
                *
            FROM
                insuranc_data_set_tiv_2015
            UNION
            SELECT
                *
            FROM
                insuranc_data_set_lan_lon
        )
    WHERE
        ( lat || lon ) NOT IN (
            SELECT DISTINCT
                ( lat
                  || lon )
            FROM
                insuranc_data_set_lan_lon
        ) 
)
SELECT
    round(SUM(tiv_2016),
          2) AS tiv_2016
FROM
    union_both_combination_set;


-- Method 2 
/*

| PID | TIV_2015 | LAT | LON | TIV_2016 | TIV_2015_COUNT1 | LAT_LON_COUNT2 |
| --- | -------- | --- | --- | -------- | --------------- | -------------- |
| 1   | 10       | 10  | 10  | 5        | 3               | 1              |
| 4   | 10       | 40  | 40  | 40       | 3               | 1              |
| 3   | 10       | 20  | 20  | 30       | 3               | 2              |
| 2   | 20       | 20  | 20  | 20       | 1               | 2              |



SELECT
    round(SUM(tiv_2016),
          2) AS tiv_2016
FROM
    (
        SELECT
            pid,
            tiv_2015,
            lat,
            lon,
            tiv_2016,
            COUNT(*) OVER(PARTITION BY tiv_2015) AS tiv_2015_count1,
            COUNT(*) OVER(PARTITION BY lat, lon) AS lat_lon_count2
        FROM
            insurance
        ORDER BY
            tiv_2015
    )
WHERE
        lat_lon_count2 = 1
    AND tiv_2015_count1 > 1;
	
*/