from getpass import getpass

from src.extract import extract_data
from src.transform import transform_data
from src.load import load_data


def main():
    print("========== PYTHON ETL PIPELINE ==========")

    try:
        # Extract
        raw_data = extract_data("data/sales.csv")

        # Transform
        cleaned_data = transform_data(raw_data)

        if cleaned_data.empty:
            print("No valid records found. Loading cancelled.")
            return

        # Load
        username = input("MySQL username [root]: ").strip() or "root"
        password = getpass("MySQL password: ")

        load_data(cleaned_data, username, password)

        print("\n========== ETL COMPLETED ==========")
        print("Total records loaded:", len(cleaned_data))
        print(cleaned_data.head())

    except Exception as error:
        print("ETL pipeline failed:", error)


if __name__ == "__main__":
    main()
