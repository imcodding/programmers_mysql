WITH RECURSIVE ecoli_generation AS (
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
	INNER JOIN ecoli_generation
	ON e.parent_id = ecoli_generation.id
)
SELECT 
	count(id) AS count,
	generation
FROM ecoli_generation 
WHERE id NOT IN (
	SELECT distinct parent_id 
	FROM ecoli_data 
	WHERE parent_id IS NOT NULL 
)
GROUP BY generation 
ORDER BY generation 
