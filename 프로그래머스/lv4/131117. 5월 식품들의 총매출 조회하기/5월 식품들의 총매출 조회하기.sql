SELECT
    fp.product_id,
    fp.product_name,
    sum(fp.price * fo.amount) AS total_sales
FROM food_product fp, food_order fo
WHERE fp.product_id = fo.product_id
AND date_format(fo.produce_date, '%Y%m') = '202205'
GROUP BY fp.product_id
ORDER BY total_sales DESC, fp.product_id