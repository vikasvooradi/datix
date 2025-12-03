/* Write your PL/SQL query statement below */

/* Write your PL/SQL query statement below */


    select id from (
    select
        id,
        recordDate,
        temperature,
        lag(temperature,1) over(order by recordDate) as previous_tmp,
        lag(recordDate,1) over(order by recordDate) as prev_date
    from weather
    ) where prev_date is not null and (recordDate - prev_date) = 1 and temperature > previous_tmp