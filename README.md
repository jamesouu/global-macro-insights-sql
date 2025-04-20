# Global Macro Insights Dashboard (SQL-Powered)

This project explores long-term inflation trends across key global economies using SQL.

## 🌍 Countries Covered
- United Kingdom
- United States
- Euro Area
- Japan
- China

## 📅 Time Period
January 2000 – March 2025

## 📦 Dataset
Source: [OECD Inflation (CPI)](https://data-explorer.oecd.org/)

File: `data/inflation_oecd_2000_2025.csv`

## 🧠 Project Objectives
- Build inflation time series using SQL
- Identify periods of inflation shocks
- Compare cross-country trends
- Create an SQL-driven macro dashboard

## 🛠️ SQL Scripts
- `create_inflation_table.sql`: Define and load the dataset
- `explore_trends.sql`: Visualize and rank inflation periods
- `monthly_summary.sql`: Aggregate data for dashboarding

## 📊 Sample Insight
> "Euro Area inflation peaked in October 2022 at 10.6%, while Japan remained below 4%. China experienced the softest inflation shock post-COVID."

## 🔍 Analysis Highlights
- Monthly inflation trend comparisons
- Top-3 inflation spikes per country
- Inflation convergence/divergence heatmap potential

## 📈 Technologies
- PostgreSQL
- SQL analytics
- Pandas (optional visualization)
