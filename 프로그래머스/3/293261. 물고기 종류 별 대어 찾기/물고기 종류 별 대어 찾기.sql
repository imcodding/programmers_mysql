SELECT
    i.id,
    n.fish_name,
    i.length
FROM fish_info i
JOIN fish_name_info n ON i.fish_type = n.fish_type
WHERE (i.fish_type, i.length) IN (
    SELECT
        fish_type,
        MAX(length) AS length
    FROM fish_info
    GROUP BY fish_type
)