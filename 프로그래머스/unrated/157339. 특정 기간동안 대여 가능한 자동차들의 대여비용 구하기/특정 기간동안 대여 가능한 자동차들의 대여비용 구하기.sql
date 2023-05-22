SELECT
    car.car_id,
    car.car_type,
    ROUND((car.daily_fee * (100 - plan.discount_rate) * 0.01 * 30),0) AS fee
FROM car_rental_company_car car
INNER JOIN (
    SELECT 
        car_id,
        max(end_date) AS max_end_date
    FROM car_rental_company_rental_history 
    GROUP BY car_id
    HAVING max_end_date < '2022-11-01'
) hist ON car.car_id =  hist.car_id
INNER JOIN car_rental_company_discount_plan plan 
ON car.car_type = plan.car_type
WHERE car.car_type IN ('세단', 'SUV')
AND plan.duration_type = '30일 이상'
AND (car.daily_fee * (100 - plan.discount_rate) * 0.01 * 30) BETWEEN 500000 AND 2000000