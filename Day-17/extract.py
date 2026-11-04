import pandas as pd


def extract_data(file_path):
    print("Extracting data from CSV...")

    df = pd.read_csv(file_path)

    print("Raw records:", len(df))

    return df
