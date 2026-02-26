# 🏠 Real Estate Business — SQL Exploratory Data Analysis

> *Turning raw property data into business intelligence using pure SQL*

---

## 📌 Project Overview

This project performs a full **Exploratory Data Analysis (EDA)** on a real estate business dataset using SQL Server. It covers everything from data cleaning and KPI calculation to trend analysis and profitability breakdowns — all in SQL, no BI tool required.

The goal is to answer key business questions:
- How profitable is the business overall — and by property type?
- Which countries and sales channels drive the most revenue?
- How has performance changed year over year?

---

## 🗂️ Database Schema

The analysis is built on four relational tables:

| Table | Description |
|---|---|
| `Property_Table` | Property details — type, country, price, status |
| `Client_Table` | Client profiles — occupation and demographics |
| `Sales_Table` | Sales transactions — date, payment method, channel |
| `Expense_Table` | Expenses per property — type and amount |

---

## 🔍 What's Inside

### 🧹 Data Cleaning
- Detected and removed null records from `Client_Table`
- Validated unique dimension values across all tables

### 📊 KPI Dashboard (SQL)
| Metric | Covered |
|---|---|
| Total Clients | ✅ |
| Properties Sold | ✅ |
| Total Revenue | ✅ |
| Total Expenses | ✅ |
| Net Income | ✅ |
| Profit Margin % | ✅ |
| Expense Ratio % | ✅ |

### 📈 Analysis Sections

**1. Magnitude Analysis**
- Clients by occupation
- Properties sold by country
- Expenses by category
- Revenue by payment status & sales channel

**2. Profitability by Property Type**
- Revenue, expenses, net income
- Profit margin and expense ratio per type

**3. Change Over Time**
- Monthly revenue and units sold for 2022, 2023, and 2024
- Running total revenue year over year

---

## 💡 Key SQL Techniques Used

- `CTEs` for multi-step calculations
- `Window Functions` — running totals with `SUM() OVER()`
- `DATEDIFF` for time period analysis
- Multi-table `JOINs` across all four tables
- Aggregations with `GROUP BY` + conditional filtering

---

## 🚀 How to Run

1. Clone this repo
2. Import the four tables into your SQL Server database
3. Open `EDA_sql_project.sql` in SSMS or Azure Data Studio
4. Run queries section by section — each block is independently executable

> Compatible with **SQL Server / T-SQL**

---

## 📁 File Structure

```
📦 real-estate-sql-eda
 ┗ 📄 EDA_sql_project.sql    ← Full analysis script
 ┗ 📄 README.md
```

---

## 🧠 Skills Demonstrated

`SQL` · `EDA` · `Data Cleaning` · `KPI Analysis` · `Window Functions` · `CTEs` · `Business Analytics` · `Real Estate Domain`

---

## 👤 Author

**Mostafa Rabee**  
📧 [mostafarabee742@gmail.com](mailto:mostafarabee742@gmail.com)

---

⭐ *If you found this project useful, consider giving it a star!*
