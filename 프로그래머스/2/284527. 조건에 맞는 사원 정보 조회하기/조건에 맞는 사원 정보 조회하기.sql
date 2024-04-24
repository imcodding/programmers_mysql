WITH emp_score AS (
    SELECT
        emp_no,
        SUM(score) AS score
    FROM HR_GRADE
    WHERE year = 2022
    GROUP BY emp_no
    ORDER BY score DESC
    LIMIT 1
)
SELECT
    es.score,
    he.emp_no,
    he.emp_name,
    he.position,
    he.email
FROM hr_employees he
JOIN emp_score es
ON he.emp_no = es.emp_no
