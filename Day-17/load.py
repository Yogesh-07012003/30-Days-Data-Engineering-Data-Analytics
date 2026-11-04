from sqlalchemy import create_engine, URL


def load_data(df, username, password):
    print("Loading data into MySQL...")

    database_url = URL.create(
        drivername="mysql+pymysql",
        username=username,
        password=password,
        host="localhost",
        port=3306,
        database="sales_db"
    )

    engine = create_engine(database_url)

    try:
        df.to_sql(
            name="sales_data",
            con=engine,
            if_exists="replace",
            index=False
        )

        print("Data loaded successfully!")

    finally:
        engine.dispose()
