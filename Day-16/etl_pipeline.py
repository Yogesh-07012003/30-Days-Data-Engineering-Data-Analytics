# etl_pipeline.py

import getpass
import pandas as pd
from sqlalchemy import create_engine, URL

# ---------------------------------
# STEP 1: EXTRACT
# ---------------------------------

print("STEP 1: Extracting data from CSV...")

df = pd.read_csv("raw_sales.csv")

print("Raw records:", len(df))
print(df.head())

# ---------------------------------
# STEP 2: TRANSFORM
# ---------------------------------

print("\nSTEP 2: Cleaning and transforming data...")

# Convert columns to the correct data types
df["order_date"] = pd.to_datetime(
    df["order_date"], errors="coerce"
)

df["quantity"] = pd.to_numeric(
    df["quantity"], errors="coerce"
)

df["unit_price"] = pd.to_numeric(
    df["unit_price"], errors="coerce"
)

# Remove rows missing required values
df = df.dropna(
    subset=[
        "order_id",
        "order_date",
        "customer",
        "product",
        "quantity",
        "unit_price"
    ]
).copy()

# Remove duplicate order IDs
df = df.drop_duplicates(
    subset=["order_id"], keep="first"
).copy()

# Remove invalid quantities and negative prices
df = df[
    (df["quantity"] > 0) &
    (df["unit_price"] >= 0)
].copy()

# Convert quantity to an integer
df["quantity"] = df["quantity"].astype(int)

# Calculate total order amount
df["total_amount"] = (
    df["quantity"] * df["unit_price"]
)

# Display the cleaned data
print("Clean records:", len(df))
print(df)

# Save the transformed data as an optional output
df.to_csv("cleaned_sales.csv", index=False)

# ---------------------------------
# STEP 3: LOAD
# ---------------------------------

print("\nSTEP 3: Loading data into MySQL...")

# Enter your MySQL credentials when prompted
mysql_user = input("Enter MySQL username [root]: ").strip()
if not mysql_user:
    mysql_user = "root"

mysql_password = getpass.getpass("Enter MySQL password: ")

# Connect to the existing retail_etl database
database_url = URL.create(
    drivername="mysql+pymysql",
    username=mysql_user,
    password=mysql_password,
    host="localhost",
    port=3306,
    database="retail_etl"
)

engine = create_engine(database_url)

try:
    # For this practice project, replace the table on each run
    df.to_sql(
        name="sales_orders",
        con=engine,
        if_exists="replace",
        index=False
    )

    print("Data loaded successfully into MySQL!")

    # Verify the loaded data
    loaded_df = pd.read_sql(
        "SELECT * FROM sales_orders",
        con=engine
    )

    print("\nData loaded into MySQL:")
    print(loaded_df)

    print("\nTotal records loaded:", len(loaded_df))

finally:
    engine.dispose()

print("\nETL pipeline completed successfully!")
