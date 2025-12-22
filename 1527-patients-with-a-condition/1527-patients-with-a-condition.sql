/* Write your PL/SQL query statement below */


select * from Patients where conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';

/*
SELECT patient_id,patient_name,conditions
FROM Patients
WHERE REGEXP_LIKE(conditions, '(^| )DIAB1');
*/