WITH car_plan AS (
    SELECT
        duration_type,
        1-(discount_rate * 0.01) AS discounted_rate
    FROM car_rental_company_discount_plan
    WHERE car_type = '트럭'
)
SELECT
    history_id,
    ROUND((
    daily_fee *
    CASE
        WHEN (TIMESTAMPDIFF(DAY, start_date, end_date)+1) >= 90
            THEN (SELECT discounted_rate FROM car_plan WHERE duration_type = '90일 이상')
        WHEN (TIMESTAMPDIFF(DAY, start_date, end_date)+1) >= 30
            THEN (SELECT discounted_rate FROM car_plan WHERE duration_type = '30일 이상')
        WHEN (TIMESTAMPDIFF(DAY, start_date, end_date)+1) >= 7
            THEN (SELECT discounted_rate FROM car_plan WHERE duration_type = '7일 이상')
        ELSE 1
    END
    * (TIMESTAMPDIFF(DAY, start_date, end_date)+1)
    ),0) AS fee
FROM car_rental_company_car c
JOIN car_rental_company_rental_history h
ON c.car_id = h.car_id
WHERE c.car_type = '트럭'
ORDER BY fee DESC, history_id DESC