-- !! 한 번 더 보기 !!
SELECT
    fp.category,
    fp.price,
    fp.product_name
FROM 
    food_product fp,
    (
        SELECT 
            category, 
            MAX(price) AS max_price 
        FROM food_product 
        GROUP BY category
    ) max_fp
WHERE fp.price = max_fp.max_price
AND fp.category = max_fp.category
AND fp.category IN ('과자','국','김치','식용유')
ORDER BY price DESC