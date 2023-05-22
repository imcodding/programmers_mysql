WITH sum_review AS (
    SELECT 
        member_id,
        SUM(review_score) AS review_score
    FROM rest_review
    GROUP BY member_id, review_date
), reviewer_ids AS (
    SELECT member_id
    FROM sum_review
    WHERE review_score = (SELECT MAX(review_score) FROM sum_review)
)
SELECT
    mem.member_name,
    rv.review_text,
    date_format(rv.review_date, '%Y-%m-%d')
FROM member_profile mem
INNER JOIN rest_review rv
ON mem.member_id = rv.member_id
WHERE mem.member_id IN (SELECT member_id FROM reviewer_ids)
ORDER BY rv.review_date, rv.review_text