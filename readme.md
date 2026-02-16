# Retail Revenue & Customer Segmentation Analysis

## 1. Project Overview

This project analyzes a large-scale retail transaction dataset to evaluate revenue patterns, customer behavior, and potential business risks. The goal was to simulate a real-world business analytics case using SQL for data transformation and Power BI for visualization.

The analysis focuses on:

- Revenue distribution and concentration
- Geographic dependency
- Seasonal volatility
- Customer segmentation (RFM analysis)
- Strategic improvement opportunities

---

## 2. Dataset Information

| Metric | Value |
|--------|-------|
| Raw Transactions | 541,909 |
| Cleaned Transactions | 397,924 |
| Unique Customers | 4,339 |
| Total Revenue | £8.91M |
| Time Period | 2010–2011 |

**Dataset Source:** Online Retail Dataset (UCI / Kaggle)  
https://www.kaggle.com/datasets/carrie1/ecommerce-data?resource=download

Note: The full dataset is not included in this repository due to size constraints.

---

## 3. Data Cleaning & Preparation

Data cleaning was performed using MySQL.

### 3.1 Records Removed

| Reason | Records Removed |
|--------|-----------------|
| Missing CustomerID | 135,080 |
| Cancelled Invoices | 9,288 |
| Negative / Return Quantities | 10,624 |

### 3.2 Cleaning Logic Applied

- Removed NULL or empty `CustomerID`
- Excluded invoices starting with 'C' (cancelled transactions)
- Filtered `Quantity <= 0`
- Converted date fields using `STR_TO_DATE()`
- Cast numeric columns using `CAST()`
- Engineered `Revenue = Quantity × UnitPrice`

### 3.3 SQL Techniques Used

| Technique | Purpose |
|------------|----------|
| CAST() | Data type conversion |
| STR_TO_DATE() | Date transformation |
| DATEDIFF() | Recency calculation |
| GROUP BY | Revenue aggregation |
| HAVING | Conditional filtering |
| NTILE() | RFM scoring |
| Window Functions | Customer segmentation |

---

## 4. Key Business Metrics

| KPI | Value |
|------|-------|
| Total Revenue | £8.91M |
| Average Order Value | £480 |
| Revenue per Customer | £2,053 |
| Repeat Purchase Rate | 65.6% |
| Q4 Revenue Contribution | 37% |
| UK Revenue Contribution | 82% |

---

## 5. Revenue Analysis

### 5.1 Geographic Distribution

| Country | Revenue Contribution |
|----------|---------------------|
| United Kingdom | 82% |
| Netherlands | ~3% |
| EIRE | ~3% |
| Germany | ~2.5% |
| France | ~2% |

**Observation:** Revenue is highly concentrated in the UK market, indicating geographic dependency.

---

### 5.2 Seasonal Distribution

| Quarter | Revenue |
|----------|----------|
| Q1 | £1.61M |
| Q2 | £1.81M |
| Q3 | £2.20M |
| Q4 | £3.29M |

**Observation:** Q4 contributes 37% of total annual revenue, indicating strong seasonality.

---

## 6. Customer Segmentation (RFM Analysis)

Customers were segmented using Recency, Frequency, and Monetary (RFM) scoring implemented in SQL.

### 6.1 Segment Distribution

| Segment | Customers | Revenue Contribution |
|-----------|------------|---------------------|
| Champions | 971 | £5.78M (~65%) |
| Loyal High Value | 412 | £1.16M |
| Mid Tier | 1,224 | £1.22M |
| At Risk | 383 | £0.42M |
| Low Value | 1,349 | £0.32M |

**Key Insight:**

- Top 22% of customers generate approximately 65% of total revenue.
- Repeat purchase rate (65.6%) suggests strong customer retention.
- The revenue model resembles a bulk or wholesale purchasing pattern.

---

## 7. Dashboard Overview

The Power BI dashboard includes:

| Component | Purpose |
|------------|-----------|
| KPI Summary | Overall revenue and customer metrics |
| Monthly Revenue Trend | Identify seasonality |
| Quarterly Revenue Chart | Visualize volatility |
| Revenue by Country | Assess geographic concentration |
| Revenue by Segment | Evaluate customer dependency |

Files included:

- `/dashboard/executive_dashboard.pbix`
- `/dashboard/dashboard_preview.png`

---

## 8. Strategic Observations

Based on the analysis:

1. Revenue is geographically concentrated (82% UK).
2. Revenue shows significant seasonal dependency (37% in Q4).
3. A relatively small segment of customers drives the majority of revenue.
4. Retention levels are strong but dependency risk exists.

---

## 9. Potential Business Recommendations

| Area | Suggested Action |
|-------|------------------|
| Geographic Risk | Expand into additional EU markets |
| Customer Dependency | Strengthen retention for Champion segment |
| Seasonality | Implement Q1–Q2 promotional campaigns |
| At-Risk Customers | Monitor recency and initiate re-engagement strategies |

---

## 10. Tools & Skills Demonstrated

| Category | Skills |
|-----------|--------|
| Data Cleaning | SQL filtering, type conversion |
| Aggregation | SUM, GROUP BY, HAVING |
| Advanced SQL | Window functions, NTILE |
| Modeling | RFM segmentation |
| Visualization | Power BI dashboard development |
| Business Analysis | Revenue concentration and risk assessment |

---

This project demonstrates the ability to handle large transactional datasets, apply structured analytical methods, and translate technical findings into business insights.
