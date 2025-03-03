-- https://datalemur.com/questions/sql-histogram-tweets

-- soln # 1
SELECT num_tweets as tweet_bucket, COUNT(user_id) as users_num
FROM 
(
  SELECT COUNT(*) AS NUM_TWEETS, user_id
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date)=2022
  GROUP BY user_id
) as derievedTable
GROUP BY num_tweets;



-- soln # 2
SELECT num_tweets as tweet_bucket, COUNT(user_id) as users_num
FROM 
(
  SELECT COUNT(*) AS NUM_TWEETS, user_id
  FROM tweets
  GROUP BY user_id , EXTRACT(YEAR FROM tweet_date)
  HAVING EXTRACT(YEAR FROM tweet_date)=2022
) as derievedTable
GROUP BY num_tweets;