WITH RECURSIVE gen_data AS (
	SELECT 
		id,
		parent_id,
		1 AS generation
	FROM ecoli_data 
	WHERE parent_id IS NULL
	UNION
	SELECT 
		e.id,
		e.parent_id,
		(generation + 1) AS generation
	FROM ecoli_data e
	INNER JOIN gen_data
	ON e.parent_id = gen_data.id
)
SELECT 
	COUNT(no_child_data.id) AS `count`,
	generation
FROM gen_data
LEFT JOIN (
	SELECT e1.id
	FROM ecoli_data e1
	LEFT JOIN ecoli_data e2
	ON e1.id = e2.parent_id
	WHERE e2.id IS null
) no_child_data
ON gen_data.id = no_child_data.id
GROUP BY generation