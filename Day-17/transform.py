import pandas as pd


def transform_data(df):
    print("Transforming data...")

    # Convert columns to correct data types
    df["order_date"] = pd.to_datetime(
        df["order_date"], errors="coerce"
    )

    df["quantity"] = pd.to_numeric(
        df["quantity"], errors="coerce"
    )

    df["unit_price"] = pd.to_numeric(
        df["unit_price"], errors="coerce"
    )

    # Remove rows with missing required values
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
        subset=["order_id"],
        keep="first"
    ).copy()

    # Remove invalid quantities and prices
    df = df[
        (df["quantity"] > 0) &
        (df["unit_price"] >= 0)
    ].copy()

    # Convert quantity to integer
    df["quantity"] = df["quantity"].astype(int)

    # Calculate revenue
    df["revenue"] = (
        df["quantity"] * df["unit_price"]
    )

    print("Clean records:", len(df))

    return df
