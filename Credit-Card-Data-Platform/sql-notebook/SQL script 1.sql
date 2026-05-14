
CREATE SCHEMA gold;

SELECT name FROM sys.schemas;

SELECT name FROM sys.databases;

CREATE TABLE gold.country_summary (
    merchant_country NVARCHAR(100),
    country_spend FLOAT,
    unique_customers INT
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
);
select * from gold.country_summary;

CREATE TABLE gold.merchant_summary (
    merchant_name VARCHAR(255),
    merchant_category_name VARCHAR(255),
    total_revenue FLOAT,
    transaction_count INT,
    avg_ticket_size FLOAT
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
);
select * from gold.merchant_summary;

CREATE TABLE gold.customer_monthly_spend (
    customer_id VARCHAR(50),
    transaction_year INT,
    transaction_month INT,
    total_spend_gbp FLOAT,
    total_transactions INT,
    avg_transaction_amount FLOAT,
    declined_transactions INT
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
);
select * from gold.customer_monthly_spend;