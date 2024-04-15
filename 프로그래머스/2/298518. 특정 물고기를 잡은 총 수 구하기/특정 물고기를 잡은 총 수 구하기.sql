SELECT count(1) AS fish_count
FROM fish_info
WHERE fish_type IN (
    SELECT fish_type 
    FROM FISH_NAME_INFO 
    WHERE fish_name IN ('BASS', 'SNAPPER')
)