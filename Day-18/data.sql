USE api_etl_db;

-- View the records
SELECT * FROM posts;

-- Count total posts
SELECT COUNT(*) AS total_posts
FROM posts;

-- Count posts by user
SELECT
    user_id,
    COUNT(*) AS total_posts
FROM posts
GROUP BY user_id
ORDER BY user_id;

-- Find posts containing a particular word
SELECT *
FROM posts
WHERE title LIKE '%qui%';
