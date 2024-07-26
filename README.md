# Project Overview

This repository contains a set of files for analyzing investment and revenue data using SQL, Python, and visualization tools. The project aims to address several analytical questions related to investment and revenue by province, customer, and farmer.

## Files

### 1. `Code_SQL.sql`

This SQL script contains queries to analyze investment and revenue data. It addresses the following questions:
- Total investment in each province for the year. Which province received the most investment?
- Revenue generated from each province for the year.
- Calculation of ROI for each province by month and year using the formula: ROI = (Revenue - Investment) / Investment.
- Total investment and revenue for each level 1 customer for the year.
- Number of farmers in the system for each level 2 customer. Which customer has the highest number of farmers?
- Number of customers where the company invested but did not generate revenue for the year.

### 2. `Code_python.ipynb`

This Jupyter notebook contains Python code to perform the following tasks:
- Data analysis and transformation to answer the questions specified in the SQL queries.
- Data processing using pandas, NumPy, and other Python libraries.

### 3. `Dashboard.png`

This image file shows the dashboard created using Tableau or Power BI, which visualizes the following:
- Level 1 and Level 2 customers and the number of farmers.
- Geographical distribution of level 1 and level 2 customers and farmers.
- Geographical distribution of investment by product name, product group, and crop.
- Geographical distribution of revenue by product name, product group, and crop.
- Management of level 1 and level 2 customers and farmers.
- Revenue generated by employees by province and product.

### 4. `Insert_data.py`

This Python script is used to insert data from dataframes into MySQL tables. The data includes:
- Investment Data: Contains columns such as `No`, `Month`, `Year`, `Customer C2`, `Customer C1`, `Province`, `Activity Name`, `Quantity`, `Product Group`, `Product`, `Crop`, `Number of Farmers`, `Investment`, `Implementation`.
- Revenue Data: Contains columns such as `No`, `Year`, `Month`, `Customer C2`, `Customer C1`, `Province`, `Product`, `Quantity`, `Revenue`, `Product Group`.

## Setup

1. **SQL Database Setup**:
   - Import the `Code_SQL.sql` into your SQL database to create the necessary tables and execute the queries.

2. **Python Environment**:
   - Install required Python libraries if not already installed:
    
     pip install pandas numpy mysql-connector-python
     
   - Run `Insert_data.py` to insert data into MySQL from the provided dataframes.

3. **Data Analysis and Visualization**:
   - Open `Code_python.ipynb` in Jupyter Notebook to execute data analysis tasks.
   - Use the dashboard image (`Dashboard.png`) for reference on visualizations created.

## Notes

- Ensure that your MySQL database is properly configured and running.
- Update the MySQL connection settings in `Insert_data.py` as needed.
- The dashboard visualizations provide insights based on the analyzed data and are intended to support decision-making.

Feel free to reach out for any questions or issues.

## Dashboard
https://public.tableau.com/shared/SKX2CGRTD?:display_count=n&:origin=viz_share_link

