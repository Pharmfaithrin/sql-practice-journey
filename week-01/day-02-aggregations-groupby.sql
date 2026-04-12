-- ================================================
-- Topic    : Aggregate Functions, GROUP BY, HAVING
-- Date     : April 11,2026
-- Week     : Week 1, Day 2
-- Dataset  : bank_analysis.transactions
-- ================================================
-- Concepts covered:
-- 1. COUNT, SUM, AVG, MAX, MIN
-- 2. GROUP BY — summarise data by category
-- 3. AS — rename output columns
-- 4. HAVING — filter after grouping
-- ================================================

-- Ex 1: Count total transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- Ex 2: Total amount of all transactions
SELECT SUM(amount) AS total_amount
FROM transactions;

-- Ex 3: Average transaction amount
SELECT AVG(amount) AS avg_amount
FROM transactions;

-- Ex 4: Largest and smallest transaction
SELECT MAX(amount) AS largest,
       MIN(amount) AS smallest
FROM transactions;

-- Ex 5: Count deposits only
SELECT COUNT(*) AS total_deposits
FROM transactions
WHERE transaction_type = 'deposit';

-- Ex 6: Total amount per branch
SELECT branch, SUM(amount) AS total_amount
FROM transactions
GROUP BY branch;

-- Ex 7: Transaction count per customer
SELECT customer_name, COUNT(*) AS num_transactions
FROM transactions
GROUP BY customer_name;

-- Ex 8: Average amount per transaction type
SELECT transaction_type, AVG(amount) AS avg_amount
FROM transactions
GROUP BY transaction_type;

-- Ex 9: Total deposits per branch, highest first
SELECT branch, SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'deposit'
GROUP BY branch
ORDER BY total_deposits DESC;

-- Ex 10: Customer summary — count and total
SELECT customer_name,
  COUNT(*) AS num_transactions,
  SUM(amount) AS total_amount
FROM transactions
GROUP BY customer_name
ORDER BY total_amount DESC;

-- Ex 11: Branches where total exceeds 100,000
SELECT branch, SUM(amount) AS total_amount
FROM transactions
GROUP BY branch
HAVING SUM(amount) > 100000;

-- Ex 12: Customers with more than 3 transactions
SELECT customer_name, COUNT(*) AS num_transactions
FROM transactions
GROUP BY customer_name
HAVING COUNT(*) > 3;

-- Ex 13: Branches where average is below 25,000
SELECT branch, AVG(amount) AS avg_transaction
FROM transactions
GROUP BY branch
HAVING AVG(amount) < 25000;

-- Ex 14: Transaction types where total > 200,000
SELECT transaction_type, SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type
HAVING SUM(amount) > 200000;

-- Ex 15: Total deposits per branch — Jan 2024 only
SELECT branch, SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'deposit'
  AND transaction_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY branch
ORDER BY total_deposits DESC;

-- Ex 16: Count deposits vs withdrawals per branch
SELECT branch,
  COUNT(CASE WHEN transaction_type = 'deposit'
        THEN 1 END) AS num_deposits,
  COUNT(CASE WHEN transaction_type = 'withdrawal'
        THEN 1 END) AS num_withdrawals
FROM transactions
GROUP BY branch;

-- Ex 17: Top 2 customers by total deposits
SELECT customer_name, SUM(amount) AS total_deposited
FROM transactions
WHERE transaction_type = 'deposit'
GROUP BY customer_name
ORDER BY total_deposited DESC
LIMIT 2;

-- Ex 18: Branches with more than 3 deposits
SELECT branch, COUNT(*) AS deposit_count
FROM transactions
WHERE transaction_type = 'deposit'
GROUP BY branch
HAVING COUNT(*) > 3;

-- Ex 19: Full customer summary
SELECT customer_name,
  COUNT(*) AS num_transactions,
  SUM(amount) AS total_amount,
  AVG(amount) AS avg_amount
FROM transactions
GROUP BY customer_name
ORDER BY avg_amount DESC;

-- Ex 20: Management report — net balance per branch
SELECT branch,
  SUM(CASE WHEN transaction_type = 'deposit'
      THEN amount ELSE 0 END) AS total_deposits,
  SUM(CASE WHEN transaction_type = 'withdrawal'
      THEN amount ELSE 0 END) AS total_withdrawals,
  SUM(CASE WHEN transaction_type = 'deposit'
      THEN amount ELSE -amount END) AS net_balance
FROM transactions
GROUP BY branch
ORDER BY net_balance DESC;
