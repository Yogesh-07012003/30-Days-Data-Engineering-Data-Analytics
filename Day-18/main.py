from getpass import getpass

from src.extract import extract_data
from src.transform import transform_data
from src.load import load_data


def main():
    print("========== API TO MYSQL ETL PIPELINE ==========")

    try:
        # STEP 1: EXTRACT
        posts = extract_data()

        # STEP 2: TRANSFORM
        cleaned_data = transform_data(posts)

        if cleaned_data.empty:
            print("No valid records found. Loading cancelled.")
            return

        # STEP 3: LOAD
        username = input("MySQL username [root]: ").strip() or "root"
        password = getpass("MySQL password: ")

        load_data(cleaned_data, username, password)

        print("\nETL PIPELINE COMPLETED!")
        print("Total records:", len(cleaned_data))
        print(cleaned_data.head())

    except Exception as error:
        print("\nETL pipeline failed:", error)


if __name__ == "__main__":
    main()
