# Day 15 — Retail Sales Analysis

## Project Overview

This project analyzes retail sales data using Python, Pandas, and Matplotlib. The goal is to understand business performance by examining revenue, profit, product sales, customer spending, regional performance, and monthly trends.

## Tools Used

* Python
* Pandas
* Matplotlib
* Jupyter Notebook

## Project Structure

```text
Day15_Retail_Sales_Analysis/
├── retail_sales.csv
├── retail_sales_analysis.ipynb
└── README.md
```

## Key Business Questions

1. What is the total revenue?
2. What is the total profit?
3. Which products generate the highest revenue?
4. Which customers spend the most?
5. Which region generates the most revenue?
6. How does revenue change each month?
7. Which product category performs best?

## Key Performance Indicators (KPIs)

* Total Revenue = Sum of quantity × unit price
* Total Cost = Sum of quantity × cost price
* Total Profit = Total Revenue − Total Cost
* Profit Margin = Total Profit ÷ Total Revenue × 100
* Total Orders = Number of unique order IDs
* Total Customers = Number of unique customer IDs

## Visualizations

* Monthly revenue trend — line chart
* Revenue by region — bar chart
* Revenue by product — bar chart
* Profit by category — bar chart
* Top customers by spending — bar chart
* Revenue share by category — pie chart

## How to Run

1. Install Python and Jupyter Notebook.
2. Install the required libraries:
   `pip install pandas matplotlib jupyter`
3. Keep `retail_sales.csv` and `retail_sales_analysis.ipynb` in the same folder.
4. Open the notebook and run all cells.

## Learning Outcomes

* Load and analyze CSV data using Pandas.
* Create calculated columns for revenue and profit.
* Group data by product, customer, category, region, and month.
* Create business charts using Matplotlib.
* Calculate and interpret business KPIs.

## Conclusion

This project demonstrates beginner-level data analysis skills by converting retail transaction data into useful business insights and visualizations.
