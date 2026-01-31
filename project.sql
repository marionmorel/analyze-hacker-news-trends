-- Task 1
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Task 2
SELECT SUM(score)
FROM hacker_news;