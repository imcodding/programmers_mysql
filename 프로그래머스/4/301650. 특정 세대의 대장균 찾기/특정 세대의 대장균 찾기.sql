WITH RECURSIVE gen_data AS (
	SELECT 
		id,
		parent_id,
		1 AS gen
	FROM ecoli_data 
	WHERE parent_id IS NULL
	UNION ALL 
	SELECT 
		e.id,
		e.parent_id,
		(gen + 1) AS gen
	FROM ecoli_data e
	INNER JOIN gen_data g ON e.parent_id = g.id
)
SELECT id FROM gen_data
WHERE gen = 3