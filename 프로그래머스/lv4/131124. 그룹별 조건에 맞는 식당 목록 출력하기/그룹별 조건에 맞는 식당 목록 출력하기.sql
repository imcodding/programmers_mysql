WITH review_cnt AS (
	SELECT
		member_id,
		count(member_id) AS cnt
	FROM rest_review rr 
	GROUP BY member_id
), reviewer_max AS (
	SELECT member_id 
	FROM review_cnt 
	WHERE cnt = (SELECT max(cnt) FROM review_cnt)
)
SELECT
	member_name,
	review_text,
	date_format(review_date, '%Y-%m-%d') AS review_date
FROM member_profile m, rest_review rr
WHERE m.member_id = rr.member_id
AND rr.member_id IN (SELECT member_id FROM reviewer_max)
ORDER BY review_date, review_text
