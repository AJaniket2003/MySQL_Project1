# Tech Layoffs Data Cleaning & Exploratory Data Analysis (SQL)

## Project Overview

This project focuses on cleaning and analyzing a real-world dataset of global tech layoffs using **MySQL**.
The goal was to transform raw and inconsistent data into a clean dataset suitable for analysis and then perform exploratory analysis to uncover patterns in layoffs across companies, industries, and time.

The project demonstrates practical SQL skills including **data cleaning, transformation, window functions, and exploratory analysis**.

---

## Dataset

Source: Public dataset containing records of layoffs across global tech companies.

Files included:

* `layoffs.csv` → Raw dataset
* `layoffs_cleaned.csv` → Cleaned dataset after preprocessing

Key columns in the dataset:

* Company
* Location
* Industry
* Total Laid Off
* Percentage Laid Off
* Date
* Company Stage
* Country
* Funds Raised

---

## Tools & Technologies

* **MySQL**
* SQL Window Functions
* Data Cleaning Techniques
* Exploratory Data Analysis (EDA)

---

# Data Cleaning Steps

The dataset required several cleaning operations before analysis.

### 1. Removing Duplicate Records

Duplicate rows were identified using the `ROW_NUMBER()` window function and removed using a staging table.

Key technique used:

* `ROW_NUMBER() OVER(PARTITION BY ...)`

---

### 2. Standardizing Data

Several inconsistencies were fixed:

* Trimmed extra spaces in company names
* Standardized industry values (e.g., Crypto variations)
* Cleaned country names
* Converted date column to **DATE datatype**

---

### 3. Handling Null and Blank Values

Blank fields were converted to `NULL` values and missing industries were populated using company-level information from other records.

Techniques used:

* Self join to populate missing values
* Conditional updates

---

### 4. Removing Irrelevant Records

Rows where both **total_laid_off** and **percentage_laid_off** were missing were removed since they provided no analytical value.

---

# Exploratory Data Analysis

After cleaning, SQL queries were used to explore trends in layoffs.

Key analysis performed:

### Total Layoffs by Company

Identified companies with the highest number of layoffs.

### Layoffs by Industry

Analyzed which industries were most affected.

### Layoffs by Year

Observed trends across different years.

### Layoffs by Company Stage

Compared layoffs across startup stages.

### Rolling Monthly Layoffs

Calculated cumulative layoffs over time using window functions.

Key SQL concept used:

* `SUM() OVER()` for rolling totals

---

# Key SQL Concepts Demonstrated

* Window Functions (`ROW_NUMBER`, `SUM OVER`)
* Common Table Expressions (CTE)
* Data Cleaning using SQL
* Data Standardization
* Handling Null Values
* Aggregation and Grouping
* Ranking using `DENSE_RANK()`

---

# Project Outcome

The project transformed messy raw data into a structured dataset ready for analysis and revealed important patterns in global tech layoffs across companies, industries, and time periods.

---

# Author

**Aniket Jaiswal**

Aspiring Data Engineer / Data Analyst
Python • SQL • Data Analysis
