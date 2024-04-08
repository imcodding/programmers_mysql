SELECT 
	e.id,
	count(ec.parent_id) AS child_count
FROM ecoli_data e
LEFT JOIN ecoli_data ec ON e.id = ec.parent_id
GROUP BY e.id
;