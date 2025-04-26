import pandas as pd

# Load your IMF file
df = pd.read_csv('IMF_inflation_original_data.csv')

# Select only the countries you want
countries_of_interest = [
    'Germany',
    'United States',
    "China, People's Republic of",
    'United Kingdom',
    'Japan'
]

df = df[df['COUNTRY'].isin(countries_of_interest)]

# Melt the file (turn columns into rows)
value_columns = [col for col in df.columns if '-' in col]
df_melted = df.melt(id_vars=['COUNTRY'], value_vars=value_columns,
                    var_name='date', value_name='inflation_rate')

# Fix the date format
df_melted['date'] = pd.to_datetime(df_melted['date'], format='%Y-M%m', errors='coerce')

# Standardize country names
df_melted['country'] = df_melted['COUNTRY'].replace({
    "China, People's Republic of": "China",
    "United States": "United States",
    "Germany": "Germany",
    "United Kingdom": "United Kingdom",
    "Japan": "Japan"
})

# Final columns
df_final = df_melted[['country', 'date', 'inflation_rate']].dropna()

# Save as a clean CSV
df_final.to_csv('inflation_clean.csv', index=False)

print("✅ inflation_clean.csv ready!")
