SELECT
    food_type,
    rest_id,
    rest_name,
    favorites
FROM rest_info
WHERE (food_type, favorites) IN (
    SELECT
        food_type,
        max(favorites)
    FROM rest_info
    GROUP BY food_type
)
ORDER BY food_type DESC
/* 오답  
GROUP BY 에서 정의한 조건만 SELECT 절에서 그대로 사용 가능. 
=> rest_id, rest_name 값이 정확하지 않을 수 있음

SELECT
    food_type,
    rest_id,
    rest_name,
    max(favorites) AS favorites
FROM rest_info
GROUP BY food_type
ORDER BY food_type DESC
*/