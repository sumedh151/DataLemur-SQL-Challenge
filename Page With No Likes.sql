-- https://datalemur.com/questions/sql-page-with-no-likes

-- using except
SELECT page_id FROM pages
EXCEPT
SELECT page_id FROM page_likes;


-- using not in
SELECT page_id FROM pages
WHERE page_id NOT IN (SELECT page_id FROM page_likes);


-- using left
SELECT pages.page_id
FROM pages
LEFT JOIN page_likes AS likes
  ON pages.page_id = likes.page_id
WHERE likes.page_id IS NULL;


-- using not exists
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
);