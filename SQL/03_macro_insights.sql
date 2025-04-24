-- 03_macro_insights.sql

-- Average YoY inflation by country (2000–2025)
SELECT
    country,
    ROUND(AVG(yoy_change), 2) AS avg_yoy_inflation
FROM inflation_features
WHERE date BETWEEN '2000-01-01' AND '2025-03-01'
GROUP BY country
ORDER BY avg_yoy_inflation DESC;

-- Identify inflation spikes (>2 std dev from 3-month moving average)
SELECT *
FROM inflation_features
WHERE ABS(yoy_change - ma_3m) > 2 * stddev_12m;

-- Compare last 12-month YoY inflation across countries
SELECT country, date, yoy_change
FROM inflation_features
WHERE date >= (SELECT MAX(date) - INTERVAL '12 months' FROM inflation_features);
