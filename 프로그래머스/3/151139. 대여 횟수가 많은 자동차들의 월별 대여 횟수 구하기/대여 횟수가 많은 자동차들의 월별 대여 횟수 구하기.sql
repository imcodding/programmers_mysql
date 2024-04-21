WITH car_cnt AS (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE DATE_FORMAT(start_date, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
    GROUP BY car_id
    HAVING COUNT(car_id) >= 5
)
SELECT
   month(ch.start_date) AS month,
   ch.car_id,
   count(*) AS records
FROM car_rental_company_rental_history ch
JOIN car_cnt c ON ch.car_id = c.car_id
WHERE DATE_FORMAT(start_date, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
GROUP BY month(ch.start_date), ch.car_id
ORDER BY month, ch.car_id DESC
