# Remove invalid and non-analytical records.
USE retail_consulting;

CREATE TABLE retail_clean AS
SELECT *
FROM retail_raw
WHERE CustomerID IS NOT NULL
  AND CustomerID <> ''
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(Quantity AS SIGNED) > 0;
