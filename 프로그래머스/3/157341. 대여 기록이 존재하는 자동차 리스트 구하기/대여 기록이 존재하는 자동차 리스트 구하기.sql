SELECT 
    c.car_id
FROM car_rental_company_car c
JOIN (
    SELECT
        car_id,
        MAX(start_date) AS start_date
    FROM car_rental_company_rental_history
    GROUP BY car_id
) h
ON c.car_id = h.car_id
WHERE c.car_type = '세단' AND MONTH(h.start_date) = 10
ORDER BY c.car_id DESC