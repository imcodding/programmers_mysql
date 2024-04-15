SELECT
    pt_name,
    pt_no,
    gend_cd,
    age,
    ifnull(tlno, 'NONE') AS tlno
FROM patient
WHERE age <= 12 AND gend_cd = 'W'
ORDER BY age DESC, pt_name