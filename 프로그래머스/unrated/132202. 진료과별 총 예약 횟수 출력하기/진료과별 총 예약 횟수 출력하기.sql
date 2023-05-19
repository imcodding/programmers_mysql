SELECT
    mcdp_cd AS '진료과코드',
    COUNT(mcdp_cd) AS '5월예약건수'
FROM appointment
WHERE date_format(apnt_ymd, '%Y%m') = '202205'
GROUP BY mcdp_cd
ORDER BY COUNT(mcdp_cd), mcdp_cd
;