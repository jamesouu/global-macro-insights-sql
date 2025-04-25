-- 02_feature_engineering.sql (Updated)

CREATE TABLE inflation_features AS
SELECT
    country,
    date,
    inflation_rate,

    -- Month-over-month % change
    (inflation_rate - LAG(inflation_rate) OVER (PARTITION BY country ORDER BY date)) 
        / LAG(inflation_rate) OVER (PARTITION BY country ORDER BY date) * 100 AS mom_change,

    -- Year-over-year % change
    (inflation_rate - LAG(inflation_rate, 12) OVER (PARTITION BY country ORDER BY date)) 
        / LAG(inflation_rate, 12) OVER (PARTITION BY country ORDER BY date) * 100 AS yoy_change,

    -- 3-month moving average
    AVG(inflation_rate) OVER (PARTITION BY country ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS ma_3m,

    -- 12-month rolling standard deviation
    STDDEV(inflation_rate) OVER (PARTITION BY country ORDER BY date ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS stddev_12m

FROM inflation_clean;
