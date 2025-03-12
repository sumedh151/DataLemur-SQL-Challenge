SELECT COUNT (duplicates) AS duplicate_companies
FROM (
  SELECT 
  COUNT(job_id) AS duplicates
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1
) AS derievedTable;