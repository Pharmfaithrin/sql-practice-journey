-- ============================================
-- Project: Pharmacy Sales Analysis
-- Author: Faith
-- Tool: MySQL
-- ============================================

I am creating/analyzing a pharmacy’s data to answer:

1. Which drugs sell the most?
2. How much revenue is generated monthly?
3. Who are the top customers?
4. Are there expired drugs still in stock?
-- ============================================
-- 1. Top-Selling Drugs
-- ============================================

SELECT drug_name, SUM(quantity) AS total_sold
FROM pharmacy_sales
GROUP BY drug_name
ORDER BY total_sold DESC;

-- Insight:
-- Paracetamol appears to be the most frequently purchased drug, with quantity sold being 25 

-- ============================================
-- 2. Monthly Revenue
-- ============================================

SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(quantity * price) AS revenue
FROM pharmacy_sales
GROUP BY month
ORDER BY month;

-- Insight:
-- Revenue shows growth between January and March
January  2026-01	12500.00
February 2026-02	13500.00
March    2026-03	5600.00
-- ============================================
-- 3. Top Customers
-- ============================================

SELECT customer_id, SUM(quantity * price) AS total_spent
FROM pharmacy_sales
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Insight:
-- Customer 101 contributes the highest revenue

-- ===============================101	12500.00
customer101 12500.00
customer102	7500.00
customer103	6000.00
customer104	5600.00=============
-- 4. Expired Drugs
-- ============================================

SELECT drug_name, expiry_date
FROM pharmacy_sales
WHERE expiry_date < CURDATE();

-- Insight:
-- Some drugs are expired and should be removed from inventory
Amoxicillin	2025-12-01
Ibuprofen	2025-10-01


