# Power BI Dashboard Guide

Load `data/clean_ecommerce_sales.csv` into Power BI Desktop.

## DAX measures
```DAX
Total Sales = SUM(clean_ecommerce_sales[net_sales])
Total Profit = SUM(clean_ecommerce_sales[profit])
Total Orders = DISTINCTCOUNT(clean_ecommerce_sales[order_id])
Units Sold = SUM(clean_ecommerce_sales[quantity])
Average Order Value = DIVIDE([Total Sales], [Total Orders])
Profit Margin = DIVIDE([Total Profit], [Total Sales])
```

## Visuals
- KPI cards: Total Sales, Total Profit, Total Orders, Units Sold, Average Order Value
- Line chart: Order Month vs Total Sales
- Bar chart: Category vs Total Sales
- Bar chart: Top 10 Products vs Total Sales
- Column chart: Region vs Total Sales
- Donut chart: Payment Method vs Orders
- Table: Product, Quantity, Sales, Profit

## Slicers
Order Month, Category, Region, Order Status, Payment Method.

Dashboard title: **E-Commerce Sales Analytics Dashboard**
