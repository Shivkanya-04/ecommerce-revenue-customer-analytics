/*
Create raw table structure and import retail dataset.
*/

CREATE DATABASE IF NOT EXISTS retail_consulting;
USE retail_consulting;

CREATE TABLE retail_raw (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity VARCHAR(50),
    InvoiceDate VARCHAR(50),
    UnitPrice VARCHAR(50),
    CustomerID VARCHAR(50),
    Country VARCHAR(100)
);
SELECT * FROM retail_raw;
