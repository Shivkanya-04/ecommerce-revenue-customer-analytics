#Perform RFM segmentation using Recency, Frequency, Monetary metrics.
USE retail_consulting;

CREATE TABLE rfm_base AS
SELECT 
    CustomerID,
    DATEDIFF(
        (SELECT MAX(InvoiceDate) FROM retail_final),
        MAX(InvoiceDate)
    ) AS Recency_Days,
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    ROUND(SUM(Revenue),2) AS Monetary
FROM retail_final
GROUP BY CustomerID;

#Assign RFM Scores

CREATE TABLE rfm_scored AS
SELECT *,
    NTILE(5) OVER (ORDER BY Recency_Days DESC) AS R_Score,
    NTILE(5) OVER (ORDER BY Frequency ASC) AS F_Score,
    NTILE(5) OVER (ORDER BY Monetary ASC) AS M_Score
FROM rfm_base;
#Segment Classification

CREATE TABLE rfm_segment_final AS
SELECT 
    CustomerID,
    CASE 
        WHEN R_Score >=4 AND F_Score >=4 AND M_Score >=4 THEN 'Champions'
        WHEN F_Score >=4 AND M_Score >=4 THEN 'Loyal High Value'
        WHEN R_Score <=2 AND F_Score >=3 THEN 'At Risk'
        WHEN F_Score <=2 AND M_Score <=2 THEN 'Low Value'
        ELSE 'Mid Tier'
    END AS Segment
FROM rfm_scored;
