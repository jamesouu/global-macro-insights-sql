-- 01_data_cleaning.sql

-- Step 1: Create raw import table (if not done via GUI)
CREATE TABLE raw_inflation_data (
    country_code TEXT,
    country_name TEXT,
    indicator TEXT,
    subject TEXT,
    measure TEXT,
    frequency TEXT,
    time_period TEXT,
    value NUMERIC,
    flags TEXT
);

-- Step 2: Clean and standardize
CREATE TABLE inflation_clean AS
SELECT
    country_name AS country,
    TO_DATE(time_period, 'YYYY-MM') AS date,
    value::NUMERIC AS inflation_rate
FROM raw_inflation_data
WHERE
    indicator = 'CPI'
    AND subject = 'TOT'
    AND measure = 'IX'
    AND frequency = 'M'
    AND country_name IN ('United States', 'United Kingdom', 'Euro Area', 'Japan', 'China');
