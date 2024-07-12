SELECT 
    animal_type,
    IF(name IS NULL, 'No name', name) AS name,
    sex_upon_intake
FROM animal_ins