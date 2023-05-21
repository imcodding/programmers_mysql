# 나의 풀이
SELECT
    hours.hour,
    SUM(IF(ao.animal_id IS NULL, 0, 1)) AS `count`
FROM animal_outs ao
RIGHT JOIN
(
    SELECT @row_num:=@row_num+1 AS hour
    FROM animal_outs INNER JOIN (SELECT @row_num:=-1) R
    WHERE @row_num < 23
) hours
ON hour(ao.datetime) = hours.hour
GROUP BY hours.hour;

# 다른 풀이 - WITH RECURSIVE 구문
# 가상 테이블을 생성하면서 가상 테이블 자신의 값을 참조하여 값을 결정할 때 사용
WITH RECURSIVE cte AS (
    SELECT 0 as n
    UNION ALL
    SELECT n + 1 FROM cte WHERE n < 23
)
SELECT 
    cte.n AS hour, 
    COUNT(a.animal_id) AS `count`
FROM cte
LEFT JOIN animal_outs a ON cte.n = HOUR(a.datetime)
GROUP BY cte.n
ORDER BY cte.n;
