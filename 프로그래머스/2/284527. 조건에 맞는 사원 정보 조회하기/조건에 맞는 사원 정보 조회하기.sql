

SELECT 
    SUM(score) AS score, 
    g.emp_no, 
    e.emp_name, 
    e.position,
    e.email
FROM hr_employees e , hr_grade g
WHERE e.emp_no = g.emp_no
GROUP BY emp_no
ORDER BY score DESC
LIMIT 1