#Convert data types and engineer revenue column.
USE retail_consulting;

CREATE TABLE retail_final AS
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    CAST(Quantity AS SIGNED) AS Quantity,
    STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i') AS InvoiceDate,
    CAST(UnitPrice AS DECIMAL(10,2)) AS UnitPrice,
    CAST(CustomerID AS SIGNED) AS CustomerID,
    Country,
    (CAST(Quantity AS SIGNED) * CAST(UnitPrice AS DECIMAL(10,2))) AS Revenue
FROM retail_clean;
