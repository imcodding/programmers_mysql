SELECT
    dr_name,
    dr_id,
    mcdp_cd,
    DATE_FORMAT(hire_ymd, '%Y-%m-%d') AS hire_ymd
FROM doctor
WHERE MCDP_CD IN ('CS', 'GS')
ORDER BY hire_ymd DESC, dr_name