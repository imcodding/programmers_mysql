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

