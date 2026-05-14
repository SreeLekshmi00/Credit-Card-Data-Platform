# 💳 Credit Card Data Platform (Azure End-to-End ETL Pipeline)

![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Azure Synapse](https://img.shields.io/badge/Azure%20Synapse-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![ADLS Gen2](https://img.shields.io/badge/ADLS%20Gen2-0089D6?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Delta Lake](https://img.shields.io/badge/Delta%20Lake-0A6EBD?style=for-the-badge)
![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)

**Azure Data Engineer Project | ETL Pipeline | Medallion Architecture | Data Lakehouse | Financial Data Processing**

---

## 🚀 Project Summary

Designed and implemented a **scalable, Azure-based Data Engineering pipeline** for processing credit card customer and transaction data using modern cloud data engineering practices.

The solution follows a **Medallion Architecture (Raw → Bronze → Silver → Gold)** and demonstrates end-to-end ETL pipeline development, PySpark transformations, and analytics-ready data delivery using the Azure Synapse Analytics ecosystem.

---

## 🎯 Business Objective

To build a **reliable and automated data pipeline** that transforms raw credit card records into clean, structured, analytics-ready datasets — enabling insights into customer spending behaviour, merchant performance, and country-level transaction trends.

---

## 🏗️ Architecture: Medallion Data Lakehouse Design

```
Raw Layer  ──►  Bronze Layer  ──►  Silver Layer  ──►  Gold Layer  ──►  SQL Pool
  (CSV)           (CSV)            (Delta)            (Delta)          (Tables)
```

### 🔹 Bronze Layer — Raw Data Ingestion
- Raw CSV files copied from the Raw container into Bronze via a Synapse Copy Activity
- Schema defined and validated at ingestion for Customers and Transactions

### 🔹 Silver Layer — Cleaned & Standardised Data
- PySpark transformations applied: deduplication, null handling, date parsing, string normalisation
- Derived columns added: `transaction_category`, `is_declined`, `customer_age`
- SCD Type 2 scaffolding applied to the Customers dimension
- Written as **Delta Lake**, partitioned for query performance

### 🔹 Gold Layer — Business-Ready Aggregations
- Transactions joined with Customers to produce an enriched dataset
- Three aggregated tables produced:
  - **`customer_monthly_spend`** — spend, transaction count, and declined transactions per customer per month
  - **`merchant_summary`** — revenue, transaction count, and average ticket size per merchant
  - **`country_summary`** — total spend and unique customer count per country
- All Gold tables written to the Synapse Dedicated SQL Pool for BI consumption

---

## ⚙️ Pipeline Orchestration

- End-to-end orchestration via **Azure Synapse Pipelines**
- `RawData2Bronze` pipeline runs two sequential activities:
  1. **Copy Activity** — ingests CSV files from Raw to Bronze
  2. **Notebook Activity** — triggers the PySpark transformation notebook on the Spark Pool
- Credentials managed securely via **Azure Key Vault**

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Cloud Platform | Microsoft Azure |
| Orchestration | Azure Synapse Pipelines |
| Storage | Azure Data Lake Storage Gen2 |
| Distributed Processing | Azure Synapse Spark Pool (Spark 3.5) |
| Data Format | Delta Lake |
| Transformation | PySpark |
| Analytics Serving | Azure Synapse Dedicated SQL Pool |
| Secret Management | Azure Key Vault |
| Architecture Pattern | Medallion (Raw → Bronze → Silver → Gold) |

---

## 📁 Repository Structure

```
Credit-Card-Data-Platform/
├── dataset/                    # Source and destination dataset definitions
├── integration-runtime/        # Managed integration runtime config
├── linked-service/             # ADLS Gen2 linked service definitions
├── notebook/                   # PySpark transformation notebook (Bronze → Gold)
├── pipeline/                   # Synapse pipeline (Copy + Notebook activities)
├── sql-notebook/               # Gold schema and table creation SQL scripts
└── sql-pool/                   # Spark Pool configuration
```

---

## 📈 Key Engineering Outcomes

- Fully automated Azure Synapse end-to-end ETL pipeline
- Scalable Medallion Architecture across Raw, Bronze, Silver, and Gold layers
- Production-style schema enforcement and data quality framework
- Analytics-ready Gold layer tables served into Synapse Dedicated SQL Pool
- Secure credential management via Azure Key Vault
