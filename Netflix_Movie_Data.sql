create database netflix;

SHOW TABLES;

-- 1. Which movies generated the highest ROI (Return on Investment)?

-- ROI = (Revenue – Budget) / Budget
SELECT 
    title,
    budget,
    revenue,
    ROUND((revenue - budget) / budget, 4) AS ROI
FROM movie
WHERE budget > 0 AND revenue IS NOT NULL
ORDER BY ROI DESC
LIMIT 10;

-- 2. Which directors consistently produce high-rated movies (avg rating > 7)?
SELECT 
    director,
    COUNT(*) AS total_movies,
    ROUND(AVG(vote_average), 2) AS avg_rating
FROM movie
WHERE director IS NOT NULL AND director <> ''
GROUP BY director
HAVING AVG(vote_average) > 7
ORDER BY avg_rating DESC, total_movies DESC
LIMIT 10;

-- 3. Which genres have the highest average revenue in millions)?
SELECT 
    genres,
    ROUND(AVG(revenue)/10000000, 0) AS avg_revenue
FROM movie
WHERE revenue IS NOT NULL
GROUP BY genres
ORDER BY avg_revenue DESC
LIMIT 15;

-- 4. Relationship between popularity and vote_average (correlation-style output).

-- (Not true correlation, but an analytical summary.)

SELECT
    ROUND(AVG(popularity), 3) AS avg_popularity,
    ROUND(AVG(vote_average), 3) AS avg_rating,
    ROUND(AVG(popularity * vote_average), 3) AS popularity_rating_interaction
FROM movie;

-- 5. Which release year produced the highest total revenue?
SELECT 
    release_year,
    SUM(revenue) AS total_revenue
FROM movie
GROUP BY release_year
ORDER BY total_revenue DESC
LIMIT 1;

-- 6. Identify the top countries based on total number of movies.
SELECT 
    country,
    COUNT(*) AS movie_count
FROM movie
WHERE country IS NOT NULL AND country <> ''
GROUP BY country
ORDER BY movie_count DESC
LIMIT 10;

-- 7. Longest movies by duration (top 10).
SELECT 
    title,
    vote_count
FROM movie
WHERE vote_count > '10000'
ORDER BY vote_count DESC;

-- 8.How has the number of movies produced changed over Years? (trend analysis)

SELECT 
    Year,
    COUNT(*) AS movies_released
FROM movie
GROUP BY Year
ORDER BY Year;

-- 9. Find movies with significantly high popularity but low ratings (anomalies).

-- Useful for quality analysis.

SELECT 
    title,
    popularity,
    vote_average
FROM movie
WHERE popularity > (SELECT AVG(popularity) FROM movie)
  AND vote_average < (SELECT AVG(vote_average) FROM movie)
ORDER BY popularity DESC
LIMIT 20;

-- 10. Detect multilingual movies (movies with more than one language listed).

SELECT 
    title,
    language
FROM movie
WHERE language LIKE 'ko'  -- contains multiple languages
ORDER BY title
LIMIT 20;

-- Which factors (budget, popularity, vote_count) most strongly predict high revenue?

SELECT 
    CASE 
        WHEN revenue < 100000000 THEN 'Low Revenue'
        WHEN revenue BETWEEN 100000000 AND 500000000 THEN 'Medium Revenue'
        ELSE 'High Revenue'
    END AS revenue_category,
    ROUND(AVG(budget), 0) AS avg_budget,
    ROUND(AVG(popularity), 2) AS avg_popularity,
    ROUND(AVG(vote_count), 0) AS avg_vote_count,
    ROUND(AVG(vote_average), 2) AS avg_rating
FROM movie
GROUP BY revenue_category
ORDER BY avg_budget DESC;