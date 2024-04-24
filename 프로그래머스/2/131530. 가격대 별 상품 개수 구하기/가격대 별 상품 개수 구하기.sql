SELECT
    TRUNCATE(price, -4) AS price_group,
    COUNT(1) AS products
FROM product
GROUP BY TRUNCATE(price, -4)
ORDER BY price_group