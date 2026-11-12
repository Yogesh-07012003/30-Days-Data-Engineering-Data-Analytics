import pandas as pd


def transform_data(posts):
    print("Transforming API data...")

    # Convert JSON records into DataFrame
    df = pd.DataFrame(posts)

    # Select required columns
    df = df[["userId", "id", "title", "body"]].copy()

    # Rename columns
    df = df.rename(columns={
        "userId": "user_id",
        "id": "post_id"
    })

    # Remove missing values
    df = df.dropna(
        subset=["user_id", "post_id", "title", "body"]
    )

    # Remove duplicate post IDs
    df = df.drop_duplicates(subset=["post_id"])

    # Clean text fields
    df["title"] = df["title"].astype(str).str.strip()
    df["body"] = df["body"].astype(str).str.strip()

    # Remove empty titles and bodies
    df = df[
        (df["title"] != "") &
        (df["body"] != "")
    ].copy()

    # Convert ID columns to integers
    df["user_id"] = df["user_id"].astype(int)
    df["post_id"] = df["post_id"].astype(int)

    print("Transformed records:", len(df))

    return df
