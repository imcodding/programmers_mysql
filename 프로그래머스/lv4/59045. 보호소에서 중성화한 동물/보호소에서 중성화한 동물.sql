SELECT 
    ins.animal_id,
    ins.animal_type,
    ins.name
FROM animal_ins ins
INNER JOIN animal_outs outs
ON ins.animal_id = outs.animal_id
WHERE ins.sex_upon_intake != outs.sex_upon_outcome