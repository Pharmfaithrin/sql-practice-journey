Databasae tool used: MySQL Workbench
  Analysis is done in the 'pharmacy_sale_analysis.sql' file
  
*Understanding the Project Goal

I am creating/analyzing a pharmacy’s data to answer:

1. Which drugs sell the most?
2. How much revenue is generated monthly?
3. Who are the top customers?
4. Are there expired drugs still in stock?

-- Create table
CREATE TABLE pharmacy_sales (
    sale_id INT,
    drug_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE,
    customer_id INT,
    expiry_date DATE
);

-- Insert sample data
INSERT INTO pharmacy_sales VALUES
(1, 'Paracetamol', 'Analgesic', 10, 500, '2026-01-10', 101, '2027-01-01'),
(2, 'Amoxicillin', 'Antibiotic', 5, 1500, '2026-01-11', 102, '2025-12-01'),
(3, 'Vitamin C', 'Supplement', 20, 300, '2026-02-01', 103, '2026-08-01'),
(4, 'Paracetamol', 'Analgesic', 15, 500, '2026-02-05', 101, '2027-01-01'),
(5, 'Ibuprofen', 'Analgesic', 8, 700, '2026-03-01', 104, '2025-10-01');

-- query table content
SELECT * FROM pharmacy_sales;
