SELECT
  derivedTable.unique_queries, 
  COUNT(employee_id)
FROM (
  SELECT 
    employee_id,
    COUNT(DISTINCT query_id) as unique_queries
  FROM queries
  WHERE 
    query_starttime >= '07-01-2023' 
    AND
    query_starttime < '10-01-2023'
  GROUP BY employee_id
) as derivedTable
GROUP BY derivedTable.unique_queries
ORDER BY unique_queries;