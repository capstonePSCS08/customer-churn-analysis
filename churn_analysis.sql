-- Customer Churn Analysis
-- Dataset: Telco Customer Churn
-- This file contains SQL queries used to analyze churn drivers

CREATE DATABASE customer_churn;

USE customer_churn;

CREATE TABLE customers (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);
SELECT COUNT(*) AS total_rows FROM customers;

SELECT COUNT(*) AS total_customers
FROM customers;


SELECT 
    Churn,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS churn_percentage
FROM customers
GROUP BY Churn;

SELECT 
    Contract,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Contract, Churn
ORDER BY Contract, Churn;

SELECT 
    Contract,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY Contract;

SELECT 
    Contract,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY Contract;

SELECT 
    Churn,
    ROUND(AVG(tenure), 2) AS avg_tenure_months
FROM customers
GROUP BY Churn;


SELECT 
    PaymentMethod,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_percentage DESC;


