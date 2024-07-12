SELECT 
    ROUND(AVG(IF(length IS NULL, 10, length)),2) AS average_length
FROM fish_info


