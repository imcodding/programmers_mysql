WITH ecoli_per_grp AS (
  SELECT 
      id,
      ntile(4) OVER (ORDER BY size_of_colony DESC) AS size_per
  FROM 
      ecoli_data
)
SELECT 
	id,
	CASE 
		WHEN size_per = 1 THEN 'CRITICAL'
		WHEN size_per = 2 THEN 'HIGH'
		WHEN size_per = 3 THEN 'MEDIUM'
		WHEN size_per = 4 THEN 'LOW'
	END AS colony_name
FROM ecoli_per_grp
ORDER BY id

/*
순위함수 
결과에 순번, 순위를 매기는 함수

비집계함수 중 RANK, NTILE, DENSE_RANK, ROW_NUMBER 등이 해당된다.

PARTITION BY : 동일 그룹으로 묶어줄 칼럼 명 지정
ORDER BY : Partition 정의에 지정된 컬럼에 대한 정렬 수행

SELECT
<순위함수이름> (arguments)
OVER ([PARTITION BY <partion_by_list>]
ORDER BY <order_by_list>)
FROM 테이블명;
*/