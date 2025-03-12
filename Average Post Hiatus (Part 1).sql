SELECT user_id , EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) as DAYS_BETWEEN
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_date) >1