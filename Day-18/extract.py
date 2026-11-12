import requests
import json
from pathlib import Path


def extract_data():
    print("Extracting data from API...")

    api_url = "https://jsonplaceholder.typicode.com/posts"

    response = requests.get(api_url, timeout=30)

    # Raise an error for unsuccessful HTTP responses
    response.raise_for_status()

    # Convert API response into Python data
    posts = response.json()

    # Save raw JSON response
    output_path = Path("data/raw_posts.json")
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with output_path.open("w", encoding="utf-8") as file:
        json.dump(posts, file, indent=4)

    print("API records extracted:", len(posts))
    print("Raw JSON saved successfully!")

    return posts
