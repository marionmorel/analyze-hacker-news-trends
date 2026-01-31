-- Task 1
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Task 2
SELECT SUM(score)
FROM hacker_news;

-- Task 3
SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

-- Task 4
SELECT (517 + 309 + 304 + 282) / 6366.0;

-- Task 5
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY user
ORDER BY COUNT(*) DESC;