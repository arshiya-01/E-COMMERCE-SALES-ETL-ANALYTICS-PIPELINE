# E-Commerce Data ETL and Sales Analytics Pipeline

## Overview
An end-to-end project that converts raw e-commerce sales data into business insights.

**Pipeline:** CSV → Python/Pandas ETL → MySQL → SQL Analytics → Power BI

## Objectives
- Extract raw sales data
- Clean and validate data
- Transform data using business rules
- Store processed data in MySQL
- Analyze sales and profit
- Build an interactive dashboard

## Tools
Python, Pandas, MySQL, SQL, Power BI, CSV

## Run
```bash
pip install -r requirements.txt
python src/etl_pipeline.py
```
Then import `data/clean_ecommerce_sales.csv` into MySQL and run `sql/analytics_queries.sql`.
Finally follow `powerbi/POWER_BI_GUIDE.md`.

## Viva answer
“I developed an end-to-end e-commerce sales ETL and analytics pipeline. I extracted raw sales data from CSV, cleaned and transformed it using Python and Pandas, calculated net sales and profit, loaded the processed data into MySQL, performed SQL analysis, and visualized the results in Power BI.”
