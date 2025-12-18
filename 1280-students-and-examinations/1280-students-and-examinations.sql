/* Write your PL/SQL query statement below */WITH data AS (
    SELECT
        examinations.student_id,
        subjects.subject_name
    FROM
             subjects right
        JOIN examinations ON subjects.subject_name = examinations.subject_name
    ORDER BY
        examinations.student_id
), cross_data AS (
    SELECT
        student_id,
        subject_name,
        0 AS attended_exams
    FROM
        students,
        subjects
    WHERE
        student_id || subject_name NOT IN (
            SELECT
                student_id || subject_name
            FROM
                examinations
        )
    ORDER BY
        student_id
), combine_data AS (
    SELECT
        student_id,
        subject_name,
        attended_exams
    FROM
        (
            SELECT
                student_id,
                subject_name,
                COUNT(*) AS attended_exams
            FROM
                data
            GROUP BY
                student_id,
                subject_name
            ORDER BY
                student_id
        )
    UNION
    SELECT
        student_id,
        subject_name,
        attended_exams
    FROM
        cross_data
)
SELECT
    combine_data.student_id,
    student_name,
    subject_name,
    attended_exams
FROM
         combine_data
    JOIN students ON combine_data.student_id = students.student_id
ORDER BY
    combine_data.student_id,
    subject_name