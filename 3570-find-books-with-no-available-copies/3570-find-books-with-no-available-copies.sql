/* Write your PL/SQL query statement below */

WITH not_return AS (
    SELECT
        book_id,
        SUM(COUNT(*))
        OVER(PARTITION BY book_id) AS current_borrowers
    FROM
        borrowing_records
    WHERE
        return_date IS NULL
    GROUP BY
        book_id
    ORDER BY
        book_id
)
SELECT
    l.book_id,
    l.title,
    l.author,
    l.genre,
    l.publication_year,
    n.current_borrowers
FROM
         library_books l
    JOIN not_return n ON l.book_id = n.book_id
                         AND l.total_copies = n.current_borrowers
ORDER BY
    n.current_borrowers DESC,
    l.title ASC;