import os
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import psycopg2

# 🗂 Step 1: Make sure /charts/ folder exists
output_dir = "charts"
os.makedirs(output_dir, exist_ok=True)

# 🔌 Step 2: Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="Inflation_analysis",
    user="jamesou",
    password="020707",
    host="127.0.0.1",
    port="5432"
)

# 📥 Step 3: Fetch data
query = "SELECT * FROM inflation_features;"
df = pd.read_sql(query, conn)

# Step 4: Data cleanup
df['date'] = pd.to_datetime(df['date'])
df = df.sort_values(['country', 'date'])

# 📈 Step 5: Plot 1 - YoY Inflation Comparison
plt.figure(figsize=(14, 6))
sns.lineplot(data=df, x='date', y='yoy_change', hue='country')
plt.title("Year-over-Year Inflation Comparison")
plt.xlabel("Date")
plt.ylabel("YoY Inflation (%)")
plt.grid(True)
plt.legend(title="Country")
plt.tight_layout()
plt.savefig(f"{output_dir}/yoy_inflation_comparison.png")
plt.show()

# 📈 Step 6: Plot 2 - MoM Inflation Momentum
plt.figure(figsize=(14, 6))
sns.lineplot(data=df, x='date', y='mom_change', hue='country')
plt.title("Month-over-Month Inflation Momentum")
plt.xlabel("Date")
plt.ylabel("MoM Change (%)")
plt.grid(True)
plt.legend(title="Country")
plt.tight_layout()
plt.savefig(f"{output_dir}/mom_inflation_momentum.png")
plt.show()

# 📈 Step 7: Plot 3 - Inflation vs 3-Month MA (One chart per country)
countries = df['country'].unique()

for country in countries:
    country_df = df[df['country'] == country]
    plt.figure(figsize=(12, 5))
    plt.plot(country_df['date'], country_df['inflation_rate'], label='Inflation Rate')
    plt.plot(country_df['date'], country_df['ma_3m'], label='3-Month MA')
    plt.title(f"{country} - Inflation Rate vs 3-Month Moving Average")
    plt.xlabel("Date")
    plt.ylabel("Inflation Index")
    plt.legend()
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(f"{output_dir}/{country.lower().replace(' ', '_')}_inflation_vs_ma.png")
    plt.show()

# 📈 Step 8: Plot 4 - Inflation Volatility (12M Std Dev)
plt.figure(figsize=(14, 6))
sns.lineplot(data=df, x='date', y='stddev_12m', hue='country')
plt.title("12-Month Rolling Inflation Volatility")
plt.xlabel("Date")
plt.ylabel("12M Std Dev of Inflation")
plt.grid(True)
plt.legend(title="Country")
plt.tight_layout()
plt.savefig(f"{output_dir}/inflation_volatility_12m.png")
plt.show()

print("✅ All charts saved in the /charts/ folder!")