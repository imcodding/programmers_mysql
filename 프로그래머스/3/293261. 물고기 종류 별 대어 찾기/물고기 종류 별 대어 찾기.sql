SELECT 
        n.fish_name,
        max(LENGTH) length
    FROM fish_info i 
    INNER JOIN fish_name_info n ON i.fish_type = n.fish_type
    GROUP BY n.fish_name