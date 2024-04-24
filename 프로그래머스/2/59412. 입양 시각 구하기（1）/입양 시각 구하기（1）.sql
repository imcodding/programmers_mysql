SELECT
    hour(datetime) AS hour,
    COUNT(1) AS `count`
FROM animal_outs
WHERE hour(datetime) >= 9 AND hour(datetime) < 20
GROUP BY hour(datetime)
ORDER BY hour