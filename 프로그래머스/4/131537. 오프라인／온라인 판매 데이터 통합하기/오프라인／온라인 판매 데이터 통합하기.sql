WITH product_sale AS (
	SELECT 
		sales_date ,
		product_id ,
		user_id ,
		sales_amount 
	FROM online_sale
	UNION 
	SELECT 
		sales_date ,
		product_id ,
		NULL AS user_id,
		sales_amount 
	FROM offline_sale
) 
SELECT 
	date_format(sales_date, '%Y-%m-%d') AS sales_date,
	product_id,
	user_id,
	sum(sales_amount) AS sales_amount
FROM product_sale 
WHERE YEAR(sales_date)= 2022 AND MONTH(sales_date) = 3
GROUP BY sales_date, product_id, user_id
ORDER BY sales_date, product_id, user_id
;
