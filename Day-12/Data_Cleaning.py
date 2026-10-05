# ==========================================
# DAY 12 - CUSTOMER DATA CLEANING
# ==========================================

import pandas as pd


# ------------------------------------------
# 1. READ DATA
# ------------------------------------------

df = pd.read_csv("customers_raw.csv")

print("Original Data:")
print(df)


# ------------------------------------------
# 2. INSPECT DATA
# ------------------------------------------

print("\nDataset Information:")
df.info()

print("\nDataset Shape:")
print(df.shape)

print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())


# ------------------------------------------
# 3. CONVERT AGE TO NUMERIC
# ------------------------------------------

df["age"] = pd.to_numeric(
    df["age"],
    errors="coerce"
)


# ------------------------------------------
# 4. HANDLE MISSING VALUES
# ------------------------------------------

df["age"] = df["age"].fillna(
    df["age"].mean()
)

df["email"] = df["email"].fillna(
    "Not Available"
)

df["phone"] = df["phone"].fillna(
    "Not Available"
)


# ------------------------------------------
# 5. REMOVE DUPLICATES
# ------------------------------------------

df = df.drop_duplicates()


# ------------------------------------------
# 6. REPLACE VALUES
# ------------------------------------------

df["city"] = df["city"].replace({
    "Bangalore": "Bengaluru"
})


# ------------------------------------------
# 7. CHANGE DATA TYPES
# ------------------------------------------

df["customer_id"] = df["customer_id"].astype(int)

df["age"] = df["age"].round().astype(int)


# ------------------------------------------
# 8. CHECK CLEANED DATA
# ------------------------------------------

print("\nCleaned Data:")
print(df)

print("\nMissing Values After Cleaning:")
print(df.isnull().sum())

print("\nDuplicates After Cleaning:")
print(df.duplicated().sum())

print("\nData Types:")
print(df.dtypes)


# ------------------------------------------
# 9. SAVE CLEANED DATA
# ------------------------------------------

df.to_csv(
    "customers_cleaned.csv",
    index=False
)

print("\nCleaned dataset saved successfully!")

# Verify the Cleaned Dataset

cleaned_df = pd.read_csv("customers_cleaned.csv")

print(cleaned_df)

print("\nShape:")
print(cleaned_df.shape)

print("\nMissing Values:")
print(cleaned_df.isnull().sum())
