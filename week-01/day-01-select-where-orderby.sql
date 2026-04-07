-- =============================================
-- Topic: SELECT, WHERE, ORDER BY, LIMIT
-- Date: 07-04-2026
-- Week: Week 1, Day 1
-- Dataset: POS_transactions Analysis
-- =============================================

-- Key concepts practiced:
-- 1. SELECT * and selecting specific columns
-- 2. WHERE to filter rows
-- 3. AND / OR / IN / BETWEEN / NOT
-- 4. ORDER BY ASC and DESC
-- 5. LIMIT to control result size

-- =============================================

-- Exercise 1: Show all columns and rows
SELECT * FROM transactions;

-- Exercise 2: Show customer name and amount only
SELECT customer_name, amount FROM transactions;

-- Exercise 3: Show ID, name, and date
SELECT transaction_id, customer_name, transaction_date
FROM transactions;

-- Exercise 4: Show all deposits
SELECT * FROM transactions
WHERE transaction_type = 'deposit';

-- Exercise 5: Show Lagos branch only
SELECT * FROM transactions
WHERE branch = 'Lagos';

-- Exercise 6: Amounts above 30,000
SELECT * FROM transactions
WHERE amount > 30000;

-- Exercise 7: All transactions for Ada Okafor
SELECT * FROM transactions
WHERE customer_name = 'Ada Okafor';

-- Exercise 8: Deposits above 20,000
SELECT * FROM transactions
WHERE transaction_type = 'deposit'
  AND amount > 20000;

-- Exercise 9: Lagos OR Abuja branches
SELECT * FROM transactions
WHERE branch IN ('Lagos', 'Abuja');

-- Exercise 10: Emeka Nwosu withdrawals only
SELECT * FROM transactions
WHERE customer_name = 'Emeka Nwosu'
  AND transaction_type = 'withdrawal';

-- Exercise 11: Sort by amount largest first
SELECT * FROM transactions
ORDER BY amount DESC;

-- Exercise 12: Sort by date oldest first
SELECT * FROM transactions
ORDER BY transaction_date ASC;

-- Exercise 13: 5 most recent transactions
SELECT * FROM transactions
ORDER BY transaction_date DESC
LIMIT 5;

-- Exercise 14: Top 3 largest deposits
SELECT * FROM transactions
WHERE transaction_type = 'deposit'
ORDER BY amount DESC
LIMIT 3;

-- Exercise 15: Amounts between 10,000 and 50,000
SELECT * FROM transactions
WHERE amount BETWEEN 10000 AND 50000;

-- Exercise 16: Kano or Port Harcourt branches
SELECT * FROM transactions
WHERE branch IN ('Kano', 'Port Harcourt');

-- Exercise 17: All branches except Lagos
SELECT * FROM transactions
WHERE branch != 'Lagos';

-- Exercise 18: Deposits above 15k in Lagos/Abuja sorted by amount
SELECT customer_name, amount, branch
FROM transactions
WHERE transaction_type = 'deposit'
  AND amount > 15000
  AND branch IN ('Lagos', 'Abuja')
ORDER BY amount DESC;

-- Exercise 19: 3 smallest Feb 2024 withdrawals
SELECT customer_name, amount, transaction_date
FROM transactions
WHERE transaction_type = 'withdrawal'
  AND transaction_date BETWEEN '2024-02-01' AND '2024-02-29'
ORDER BY amount ASC
LIMIT 3;

-- Exercise 20: Branch manager report - Kano/PH deposits
SELECT * FROM transactions
WHERE transaction_type = 'deposit'
  AND branch IN ('Kano', 'Port Harcourt')
  AND amount BETWEEN 20000 AND 100000
ORDER BY transaction_date DESC;
