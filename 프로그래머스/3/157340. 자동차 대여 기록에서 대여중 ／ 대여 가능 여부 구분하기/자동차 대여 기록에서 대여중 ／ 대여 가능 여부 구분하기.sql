SELECT
    car.car_id,
    IF(rental_car.car_id IS NULL, '대여 가능', '대여중') AS availability
FROM (
    SELECT car_id
    FROM car_rental_company_rental_history rc
    GROUP BY car_id
) car 
LEFT JOIN (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE '2022-10-16' BETWEEN date_format(start_date, '%Y-%m-%d')
    AND date_format(end_date, '%Y-%m-%d')
) rental_car ON rental_car.car_id = car.car_id
ORDER BY car_id DESC