# Analyze Hacker News Trends
## Data Scientist: Analytics - Codecademy

![Hacker News GIF](https://content.codecademy.com/courses/sql-intensive/hackernews.gif)

Hacker News is a popular website run by Y Combinator. It’s widely known by people in the tech industry as a community site for sharing news, showing off projects, asking questions, among other things.

In this project, you will be working with a table named <code>hacker_news</code> that contains stories from Hacker News since its launch in 2007. It has the following columns:

* <code>title</code>: the title of the story
* <code>user</code>: the user who submitted the story
* <code>score</code>: the score of the story
* <code>timestamp</code>: the time of the story
* <code>url</code>: the link of the story

This data was kindly made publicly available under the MIT license.

### Tasks

#### Understanding the dataset

1. Start by getting a feel for the <code>hacker_news</code> table!

Let’s find the most popular Hacker News stories:

```
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
```

What are the top five stories with the highest <code>score</code>s?

#### Hacker News Moderating

2. Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule). 

<em>Is this true of Hacker News? 

Is a small percentage of Hacker News submitters taking the majority of the points?</em> 

First, find the total <code>score</code> of all the stories.

3. Next, we need to pinpoint the users who have accumulated a lot of points across their stories. 

Find the individual users who have gotten combined scores of more than 200, and their combined <code>score</code>s. 

<code>GROUP BY</code> and <code>HAVING</code> are needed!

4. Then, we want to add these users’ <code>score</code>s together and divide by the total to get the percentage.

Add their scores together and divide it by the total sum. Like so:

```
SELECT (1.0 + 2.0 + 3.0) / 6.0;
```

So, is Hacker News dominated by these users?

5. Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding. 

The <code>url</code> of the video is: https://www.youtube.com/watch?v=dQw4w9WgXcQ. 

<em>How many times has each offending user posted this link?</em> 

#### Which sites feed Hacker News?

6. Hacker News stories are essentially links that take users to other websites. 

<em>Which of these sites feed Hacker News the most:

GitHub, Medium, or New York Times?</em>

First, we want to categorize each story based on their source.

We can do this using a <code>CASE</code> statement:

```
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   -- WHEN statement here
   -- WHEN statement here
   -- ELSE statement here
  END AS 'Source'
FROM hacker_news;
```

Fill in the other WHEN statements and the ELSE statement.

7. Next, build on the previous query:

* Add a column for the number of stories from each URL using <code>COUNT()</code>.
* Also, <code>GROUP BY</code> the <code>CASE</code> statement.

Remember that you can refer to a column in <code>GROUP BY</code> using a number.

#### What's the best time to post a story?

8. Every submitter wants their story to get a high score so that the story makes it to the front page, but…

<em>What’s the best time of the day to post a story on Hacker News?</em>

Before we get started, let’s run this query and take a look at the timestamp column:

```
SELECT timestamp
FROM hacker_news
LIMIT 10;
```

Notice that the values are formatted like:

<code>2018-05-08T12:30:00Z</code>

If you ignore the <code>T</code> and <code>Z</code>, the format is:

<code>YYYY-MM-DD HH:MM:SS</code>

9. SQLite comes with a <code>strftime()</code> function - a very powerful function that allows you to return a formatted date.

It takes two arguments:

<code>strftime(format, column)</code>

Let’s test this function out:

```
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;
```

What do you think this does? Open the hint if you’d like to learn more.

10. Okay, now we understand how <code>strftime()</code> works. Let’s write a query that returns three columns:

* The hours of the <code>timestamp</code>
* The <em>average</em> <code>score</code> for each hour
* The <em>count</em> of stories for each hour

11. Let’s edit a few things in the previous query:

* Round the average <code>score</code>s (<code>ROUND()</code>).
* Rename the columns to make it more readable (AS).
* Add a <code>WHERE</code> clause to filter out the <code>NULL</code> values in <code>timestamp</code>.

Take a look at the result again:

What are the best hours to post a story on Hacker News?