# global-macro-insights-sql
SQL-powered dashboard project for analyzing macroeconomic indicators across countries

# 🌍 Global Macro Insights Dashboard (SQL-Powered)

## 📊 Project Description

This project showcases a SQL-powered approach to extracting actionable macroeconomic insights from large-scale international data. The goal is to simulate how macro hedge funds would query, analyze, and visualize data to support investment decisions.

## 🚀 Core Features

- Compare inflation and interest rates across countries and time
- Analyze GDP growth trends and recession warnings
- Rank countries by risk signals (high inflation, negative growth, etc.)
- Time-series aggregation with SQL (using `date_trunc`, `window functions`)
- Use of `CASE WHEN`, `JOIN`, `GROUP BY CUBE/ROLLUP` for financial storytelling

## 🔍 Example Queries

1. **Year-over-Year Inflation Trends**

```sql
SELECT country, EXTRACT(YEAR FROM date) AS year,
       ROUND(AVG(inflation_rate), 2) AS avg_inflation
  FROM macro_data
 WHERE indicator = 'Inflation'
 GROUP BY country, year
 ORDER BY avg_inflation DESC;

