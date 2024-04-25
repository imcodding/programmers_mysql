SELECT
    COUNT(fish_name) AS fish_count,
    fish_name
FROM fish_info i
JOIN fish_name_info n
ON i.fish_type = n.fish_type
GROUP BY fish_name
ORDER BY fish_count DESC