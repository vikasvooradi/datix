/* Write your PL/SQL query statement below */

/*

📊 STEP 1: eligible_books CTE executes first
Input: books (5 rows) + reading_sessions (20 rows)
JOIN → GROUP BY book_id → HAVING COUNT(*) >= 5
Output: 3 rows (Books 1,2,3)
└── Book 1: "The Great Gatsby" ✓
└── Book 2: "To Kill a Mockingbird" ✓  
└── Book 3: "1984" ✓
    └── Books 4,5 eliminated (<5 sessions)

📊 STEP 2: book_stats CTE executes second  
Input: eligible_books (3 rows) + reading_sessions (16 rows for books 1,2,3)
JOIN → GROUP BY book_id → Calculate metrics
Output: 3 rows with metrics:
└── Book 1: total=5, max=5, min=1, extreme=5
└── Book 2: total=5, max=5, min=4, extreme=5  
└── Book 3: total=6, max=5, min=1, extreme=6

📊 STEP 3: Final SELECT executes last
Input: book_stats (3 rows)
WHERE filters:
└── Book 1: 5>=4 ✓, 1<=2 ✓, 5/5=1.0>=0.6 ✓ → KEEP
└── Book 2: 5>=4 ✓, 4<=2 ✗ → ELIMINATE  
└── Book 3: 5>=4 ✓, 1<=2 ✓, 6/6=1.0>=0.6 ✓ → KEEP
ORDER BY: polarization_score DESC, TITLE DESC
Final Output: 2 rows (Books 1,3) ✓


*/


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


