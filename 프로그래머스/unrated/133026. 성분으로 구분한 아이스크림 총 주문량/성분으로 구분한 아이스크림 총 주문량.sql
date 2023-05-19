SELECT
    info.ingredient_type,
    SUM(half.total_order) AS total_order
FROM first_half half
INNER JOIN icecream_info info
ON half.flavor = info.flavor
GROUP BY info.ingredient_type
ORDER BY total_order