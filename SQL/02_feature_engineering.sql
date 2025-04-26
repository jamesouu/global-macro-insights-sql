-- 02_feature_engineering.sql 

CREATE TABLE inflation_features AS
SELECT
    country,
    date,
    inflation_rate,

    -- Month-over-Month % change
    CASE 
        WHEN LAG(inflation_rate) OVER (PARTITION BY country ORDER BY date) IS NOT NULL
             AND LAG(inflation_rate) OVER (PARTITION BY country ORDER BY date) != 0
        THEN (inflation_rate - LAG(inflation_rate) OVER (PARTITION BY country ORDER BY date)) 
             / LAG(inflation_rate) OVER (PARTITION BY country ORDER BY date) * 100
        ELSE NULL
    END AS mom_change,

    -- Year-over-Year % change
    CASE 
        WHEN LAG(inflation_rate, 12) OVER (PARTITION BY country ORDER BY date) IS NOT NULL
             AND LAG(inflation_rate, 12) OVER (PARTITION BY country ORDER BY date) != 0
        THEN (inflation_rate - LAG(inflation_rate, 12) OVER (PARTITION BY country ORDER BY date)) 
             / LAG(inflation_rate, 12) OVER (PARTITION BY country ORDER BY date) * 100
        ELSE NULL
    END AS yoy_change,

    -- 3-month moving average
    AVG(inflation_rate) OVER (PARTITION BY country ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS ma_3m,

    -- 12-month rolling standard deviation
    STDDEV(inflation_rate) OVER (PARTITION BY country ORDER BY date ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS stddev_12m

FROM inflation_clean;
