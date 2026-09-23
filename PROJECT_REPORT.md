# Project Report — E-Commerce Data ETL and Sales Analytics Pipeline

## Abstract
This project implements an end-to-end ETL and analytics workflow for e-commerce sales data. Raw transaction records are extracted from CSV, cleaned and transformed with Python/Pandas, loaded into MySQL, analyzed with SQL, and visualized using Power BI.

## Problem Statement
Raw transaction data can contain duplicates, missing values, inconsistent text and unsuitable data types. The project creates a repeatable pipeline to prepare reliable data for reporting.

## Objectives
1. Extract transaction data.
2. Clean and validate records.
3. Transform data and calculate sales metrics.
4. Load processed data into a relational database.
5. Analyze business performance with SQL.
6. Present insights in Power BI.

## Methodology
**Extract:** Read CSV data with Pandas.

**Transform:** Standardize column names, remove duplicates, clean text, handle missing values, convert types, remove invalid transactions, and calculate gross sales, discounts, net sales, estimated cost, profit and month.

**Load:** Store the processed records in MySQL.

**Analyze:** Calculate KPIs, category sales, monthly trends, top products, regional performance and payment-method usage.

**Visualize:** Build a Power BI dashboard with KPI cards, charts and slicers.

## Architecture
Raw CSV → Python/Pandas → Clean CSV → MySQL → SQL Analytics → Power BI

## Future Enhancements
- Schedule ETL with Apache Airflow
- Add customer segmentation
- Add sales forecasting
- Add anomaly detection
- Connect to a live database

## Conclusion
The project demonstrates practical skills across data engineering and data analytics, from raw data ingestion and transformation to database storage and dashboard reporting.
