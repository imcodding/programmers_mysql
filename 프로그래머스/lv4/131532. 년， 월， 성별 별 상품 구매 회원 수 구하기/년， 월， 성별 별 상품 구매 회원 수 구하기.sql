-- GROUP BY 전에 데이터 확인해보기!
SELECT
    year(s.sales_date) AS year,
    month(s.sales_date) AS month,
    u.gender,
    count(DISTINCT u.user_id) AS users
FROM user_info u
INNER JOIN online_sale s ON u.user_id = s.user_id
WHERE u.gender IS NOT NULL
GROUP BY year, month, gender
ORDER BY year, month, gender
