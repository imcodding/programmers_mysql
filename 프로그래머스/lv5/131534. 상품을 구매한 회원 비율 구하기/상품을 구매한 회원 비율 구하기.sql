SELECT
    year(o.sales_date) AS year,
    month(o.sales_date) AS month,
    COUNT(DISTINCT o.user_id) AS puchased_user,
    ROUND(COUNT(DISTINCT o.user_id) / (
        SELECT COUNT(*) FROM user_info 
        WHERE year(joined) = 2021
    ), 1) AS puchased_ratio
FROM user_info u
INNER JOIN online_sale o ON u.user_id = o.user_id
WHERE year(u.joined) = 2021
GROUP BY year, month
ORDER BY year, month