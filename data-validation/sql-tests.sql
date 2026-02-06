-- These tests validate financial data accuracy between source and reporting layers
-- Critical for financial planning and decision-making systems
-- Row count validation
SELECT COUNT(*) FROM source_transactions;
SELECT COUNT(*) FROM reporting_transactions;

-- Null checks
SELECT * FROM reporting_transactions
WHERE transaction_amount IS NULL;

-- Aggregate validation
SELECT SUM(transaction_amount) FROM source_transactions;
SELECT SUM(transaction_amount) FROM reporting_transactions;

-- Mismatch detection
SELECT s.id, s.transaction_amount, r.transaction_amount
FROM source_transactions s
JOIN reporting_transactions r ON s.id = r.id
WHERE s.transaction_amount <> r.transaction_amount;
