import csv
from collections import defaultdict
from datetime import datetime


# -----------------------------------
# Read Sales Data
# -----------------------------------

sales_data = []

with open("sales_data.csv", "r") as file:
    reader = csv.DictReader(file)

    for row in reader:
        row["quantity"] = int(row["quantity"])
        row["unit_price"] = float(row["unit_price"])

        # Calculate total sales for each order
        row["total_sales"] = row["quantity"] * row["unit_price"]

        sales_data.append(row)


# -----------------------------------
# Total Sales
# -----------------------------------

total_sales = sum(row["total_sales"] for row in sales_data)


# -----------------------------------
# Average Sales
# -----------------------------------

average_sales = total_sales / len(sales_data)


# -----------------------------------
# Top-Selling Product
# -----------------------------------

product_sales = defaultdict(float)

for row in sales_data:
    product_sales[row["product"]] += row["total_sales"]

top_product = max(product_sales, key=product_sales.get)


# -----------------------------------
# Sales by Region
# -----------------------------------

region_sales = defaultdict(float)

for row in sales_data:
    region_sales[row["region"]] += row["total_sales"]


# -----------------------------------
# Monthly Sales
# -----------------------------------

monthly_sales = defaultdict(float)

for row in sales_data:
    date = datetime.strptime(row["date"], "%Y-%m-%d")

    month = date.strftime("%Y-%m")

    monthly_sales[month] += row["total_sales"]


# -----------------------------------
# Display Results
# -----------------------------------

print("=" * 50)
print("           SALES DATA ANALYZER")
print("=" * 50)

print(f"\nTotal Sales      : ₹{total_sales:,.2f}")
print(f"Average Sales    : ₹{average_sales:,.2f}")
print(f"Top-Selling Product: {top_product}")

print("\n--- Sales by Product ---")

for product, sales in product_sales.items():
    print(f"{product:12} : ₹{sales:,.2f}")


print("\n--- Sales by Region ---")

for region, sales in region_sales.items():
    print(f"{region:12} : ₹{sales:,.2f}")


print("\n--- Monthly Sales ---")

for month, sales in sorted(monthly_sales.items()):
    print(f"{month:12} : ₹{sales:,.2f}")

print("\n" + "=" * 50)
