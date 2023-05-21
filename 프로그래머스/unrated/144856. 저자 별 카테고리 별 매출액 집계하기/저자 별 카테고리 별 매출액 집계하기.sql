SELECT
    bk.author_id,
    au.author_name,
    bk.category,
    sum(bk.price * bs.sales) AS total_sales
FROM book bk
INNER JOIN book_sales bs ON bk.book_id = bs.book_id
INNER JOIN author au ON bk.author_id = au.author_id
WHERE date_format(bs.sales_date, '%Y%m') = '202201'
GROUP BY bk.author_id, bk.category
ORDER BY bk.author_id, bk.category DESC