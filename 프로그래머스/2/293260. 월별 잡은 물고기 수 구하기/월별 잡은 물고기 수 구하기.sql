SELECT
    COUNT(1) AS fish_count,
    month(time) AS month
FROM fish_info
GROUP BY month(time)
ORDER BY month