-- https://datalemur.com/questions/laptop-mobile-viewership

-- using case
SELECT SUM(laptop_views), SUM(mobile_views)
FROM (
  SELECT 
    CASE WHEN LOWER(device_type) = 'laptop' THEN 1 ELSE 0 END AS laptop_views, 
    CASE WHEN LOWER(device_type) IN ('tablet', 'phone') THEN 1 ELSE 0 END AS mobile_views 
  FROM viewership
) as derievedTable;


-- using case (better way of writing above, without using subquery)
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;


-- using filter
SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone'))  AS mobile_views 
FROM viewership;
