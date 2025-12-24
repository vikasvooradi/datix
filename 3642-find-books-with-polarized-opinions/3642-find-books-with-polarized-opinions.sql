/* Write your PL/SQL query statement below */

WITH 
-- STEP 1: Filter books with 5+ sessions
eligible_books AS (
    SELECT b.BOOK_ID, b.TITLE, b.AUTHOR, b.GENRE, b.PAGES
    FROM books b
    JOIN reading_sessions rs ON b.BOOK_ID = rs.BOOK_ID
    GROUP BY b.BOOK_ID, b.TITLE, b.AUTHOR, b.GENRE, b.PAGES
    HAVING COUNT(*) >= 5
),

-- STEP 2: Calculate all metrics per book
book_stats AS (
    SELECT 
        eb.BOOK_ID, eb.TITLE, eb.AUTHOR, eb.GENRE, eb.PAGES,
        COUNT(*) AS total_sessions,
        MAX(rs.session_rating) AS max_rating,
        MIN(rs.session_rating) AS min_rating,
        COUNT(CASE WHEN rs.session_rating <=2 OR rs.session_rating >=4 THEN 1 END) AS extreme_count
    FROM eligible_books eb
    JOIN reading_sessions rs ON eb.BOOK_ID = rs.BOOK_ID
    GROUP BY eb.BOOK_ID, eb.TITLE, eb.AUTHOR, eb.GENRE, eb.PAGES
)

-- STEP 3: Apply final filters
SELECT 
    BOOK_ID, TITLE, AUTHOR, GENRE, PAGES,
    (max_rating - min_rating) AS rating_spread,
    ROUND(extreme_count * 1.0 / total_sessions, 2) AS polarization_score
FROM book_stats
WHERE max_rating >= 4 
  AND min_rating <= 2 
  AND extreme_count * 1.0 / total_sessions >= 0.6
ORDER BY polarization_score DESC, TITLE DESC;


