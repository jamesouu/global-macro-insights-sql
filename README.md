# 🌍 Global Macro Insights Dashboard (SQL-Powered)

This project provides a structured SQL-powered dashboard for analyzing long-term inflation trends across five key economies: the **United States**, **United Kingdom**, **Euro Area**, **Japan**, and **China** (2000–2025). Built as a data-driven macroeconomic insight tool, the project applies real-world hedge fund logic to understand inflation cycles and their implications across geographies.

## 📈 Project Motivation

Inflation plays a central role in global macro investing. Understanding its long-term patterns, volatility, and cross-country divergences provides insight into central bank actions, interest rate cycles, currency movements, and asset pricing. This project is designed to:
- Demonstrate SQL skills in a real-world hedge fund context
- Highlight the importance of inflation data in macro strategy
- Serve as a foundation for future multi-asset dashboard development

## 🧰 Tech Stack
- **SQL** (PostgreSQL, pgAdmin)
- **OECD data** (CSV import and transformation)
- **GitHub** (for version control, visibility, and collaboration)
- *(Optional extensions planned)*: Python/Streamlit or Tableau for visualization

## 🗂️ Project Structure
├── data/
│   ├── raw/                    # Original OECD inflation CSVs
│   └── cleaned/                # Cleaned and standardized tables
├── sql/
│   ├── 01_data_cleaning.sql    # Scripts to clean and import OECD data
│   ├── 02_feature_engineering.sql # Calculating YoY/MoM, moving averages, z-scores
│   └── 03_macro_insights.sql   # Key queries for macro insights & visualizations
├── outputs/
│   └── inflation_summary.csv   # Example query output tables
└── README.md

## 🔍 Key Analytical Features
- **Inflation Comparison**: YoY/MoM rates across countries
- **Trend Analysis**: Moving averages and inflation regimes
- **Volatility Insight**: Standard deviation over time
- **Macro Interpretation**: Cross-country divergence and convergence

## 📅 Coverage
- **Timeframe**: 2000–03 to 2025–03
- **Frequency**: Monthly CPI data
- **Countries**: US, UK, Euro Area, Japan, China

## 🔮 Future Roadmap
- 📊 Add visualization layer (Streamlit / Tableau)
- 🌐 Expand to FX, rates, and commodity datasets
- 📈 Create macro dashboards for real-time policy and asset-class insight

## 🤝 Why It Matters (For Hedge Funds)
- Enables systematic **macro trend detection**
- Supports **rate cycle timing**, **currency valuation**, and **positioning**
- Forms a core part of a **global macro strategy toolkit**
