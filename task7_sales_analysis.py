# Task 7: Sales Trend Analysis using SQLite in Python

import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Connect to the SQLite database
conn = sqlite3.connect("sales_data.db")

# SQL Query for product-wise summary
query = '''
SELECT 
    product,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
'''

df = pd.read_sql_query(query, conn)

print("=== SALES SUMMARY ===")
print(df)

# Plotting
plt.figure(figsize=(6,4))
plt.bar(df['product'], df['total_revenue'])
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.title("Revenue by Product")
plt.tight_layout()
plt.savefig("task7_sales_chart.png")

conn.close()
