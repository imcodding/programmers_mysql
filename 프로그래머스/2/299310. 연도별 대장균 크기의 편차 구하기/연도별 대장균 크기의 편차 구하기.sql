-- CTE
WITH max_colony AS (
    SELECT
        year(differentiation_date) AS year,
        max(size_of_colony) AS max_size
    FROM ecoli_data
    GROUP BY year
)
SELECT
    m.year,
    (m.max_size - e.size_of_colony) AS year_dev,
    id
FROM ecoli_data e
JOIN max_colony m ON year(e.differentiation_date) = m.year
ORDER BY year, year_dev

/*
-- window 함수
SELECT
	YEAR(differentiation_date) AS YEAR ,
	MAX(size_of_colony) OVER(PARTITION BY YEAR(differentiation_date)) - size_of_colony AS year_dev ,
	id
FROM ecoli_data
ORDER BY year, year_dev
*/