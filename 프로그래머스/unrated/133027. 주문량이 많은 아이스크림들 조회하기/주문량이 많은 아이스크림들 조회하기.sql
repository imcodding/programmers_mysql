SELECT
    flavor
FROM (
    SELECT 
        fh.flavor,
        SUM(fh.total_order + j.total_order) AS total_order
    FROM first_half fh
    INNER JOIN july j ON fh.flavor = j.flavor
    GROUP BY fh.flavor
) res
ORDER BY total_order DESC
LIMIT 3