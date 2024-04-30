SELECT
    user_id,
    nickname,
    CONCAT(city, ' ', street_address1, ' ', street_address2) AS '전체주소',
    CONCAT(SUBSTR(tlno, 1, 3), '-', SUBSTR(tlno, 4, 4), '-', SUBSTR(tlno, 8, 4)) AS '전화번호'
FROM used_goods_user u
JOIN used_goods_board b
ON u.user_id = b.writer_id
GROUP BY u.user_id
HAVING COUNT(u.user_id) >= 3
ORDER BY user_id DESC