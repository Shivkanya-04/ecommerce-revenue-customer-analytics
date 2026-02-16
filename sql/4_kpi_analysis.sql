#Compute business KPIs and revenue distribution metrics.
USE retail_consulting;

#Total Revenue
SELECT ROUND(SUM(Revenue),2) AS Total_Revenue
FROM retail_final;

#Total Unique Customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM retail_final;

#Revenue by Country
SELECT Country,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail_final
GROUP BY Country
ORDER BY Revenue DESC;

#Monthly Revenue Trend
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail_final
GROUP BY Month
ORDER BY Month;

#Quarterly Revenue
SELECT QUARTER(InvoiceDate) AS Quarter,
       ROUND(SUM(Revenue),2) AS Revenue
FROM retail_final
GROUP BY Quarter
ORDER BY Quarter;
#Retention Calculation
SELECT 
    ROUND(
        (COUNT(DISTINCT CASE WHEN order_count > 1 THEN CustomerID END)
        / COUNT(DISTINCT CustomerID)) * 100, 2
    ) AS Retention_Percentage
FROM (
    SELECT CustomerID,
           COUNT(DISTINCT InvoiceNo) AS order_count
    FROM retail_final
    GROUP BY CustomerID
) t;
