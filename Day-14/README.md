# Day 14 — Exploratory Data Analysis (EDA)

## Objective

Analyze a sales dataset using Python, Pandas, Matplotlib, and Seaborn to identify missing values, outliers, trends, correlations, categories, and distributions.

## Project Structure

```text
EDA/
├── analysis.ipynb
├── dataset.csv
└── README.md
```

## Dataset Description

**File:** `dataset.csv`

| Column     | Description        |
| ---------- | ------------------ |
| order_date | Order date         |
| product    | Product name       |
| category   | Product category   |
| region     | Sales region       |
| quantity   | Units sold         |
| unit_price | Price per unit     |
| sales      | Total sales amount |

The dataset contains sales records across different products, categories, regions, and months.

## Concepts Covered

### 1. Data Inspection

* `head()`
* `info()`
* `describe()`
* `shape`
* `columns`

### 2. Missing Value Analysis

* Identify missing values using `isnull()`.
* Calculate missing-value percentages.
* Handle missing data using `fillna()`.

### 3. Outlier Detection

* Calculate Q1, Q3, and IQR.
* Identify potential outliers.
* Visualize outliers using box plots.

### 4. Trend Analysis

* Analyze monthly sales.
* Use line charts to identify changes over time.

### 5. Category and Regional Analysis

* Calculate sales by product category.
* Compare revenue by region.
* Identify top-selling products.

### 6. Correlation Analysis

* Calculate correlations between quantity, unit price, and sales.
* Visualize relationships using a heatmap.

### 7. Distribution Analysis

* Analyze sales and quantity distributions.
* Use histograms and box plots.

## Key Business Questions

1. Which product generates the highest revenue?
2. Which product has the highest quantity sold?
3. Which region generates the most revenue?
4. Which category performs best?
5. Are there missing values in the dataset?
6. Which sales records are potential outliers?
7. How do sales change month by month?
8. What is the relationship between quantity and sales?
9. How are sales distributed across categories?
10. Should any outliers be investigated further?

## Tools Used

* Python
* Pandas
* Matplotlib
* Seaborn
* Jupyter Notebook
* VS Code
* Git and GitHub

## Learning Outcomes

After completing this project, I can:

* Inspect and understand a dataset.
* Identify and handle missing values.
* Detect potential outliers using IQR.
* Analyze monthly sales trends.
* Compare products, categories, and regions.
* Calculate correlations between numerical variables.
* Visualize data distributions.
* Generate business insights from sales data.
* Export cleaned data to CSV.

## How to Run

Install the required libraries:

```bash
pip install pandas matplotlib seaborn jupyter
```

Open `analysis.ipynb` in Jupyter Notebook or VS Code and run the cells in sequence.

## Git Commands

```bash
git add EDA/
git commit -m "Day 14: Exploratory data analysis"
git push
```

## Conclusion

This project demonstrates the Exploratory Data Analysis workflow, from inspecting and cleaning data to identifying trends, analyzing correlations, visualizing distributions, and generating business insights.

**Day 14 Completed — Exploratory Data Analysis.**
