-- Isolate (or group) the transactions of each cardholder
CREATE VIEW cardholder_transactions AS
SELECT	cc.cardholder_id,
		t.*
FROM transaction AS t
JOIN credit_card AS cc ON t.card = cc.card;

-- Query the cardholder_transactions view
SELECT *
FROM cardholder_transactions;
			
-- Count the transactions that are less than $2.00 per cardholder
CREATE VIEW small_transactions AS
SELECT	cc.cardholder_id,
		COUNT(t.*) AS transaction_count
FROM transaction AS t
JOIN credit_card AS cc ON t.card = cc.card
WHERE t.amount < 2.00
GROUP BY cc.cardholder_id
ORDER BY transaction_count DESC;

-- Query the small_transactions view
SELECT *
FROM small_transactions;

-- Top 100 highest transactions made between 7:00 am and 9:00 am
CREATE VIEW early_transactions AS
SELECT * 
FROM transaction
WHERE date::time BETWEEN '07:00:00' AND '09:00:00'
ORDER BY amount DESC
LIMIT 100;

-- Query the early_transactions view
SELECT *
FROM early_transactions;

-- Top 100 highest transactions not made between 7:00 am and 9:00 am
CREATE VIEW day_transactions AS
SELECT * 
FROM transaction
WHERE date::time NOT BETWEEN '07:00:00' AND '09:00:00'
ORDER BY amount DESC
LIMIT 100;

-- Query the day_transactions view
SELECT *
FROM day_transactions;

-- top 5 merchants prone to being hacked using small transactions
CREATE VIEW merchant_small_transactions AS
SELECT	m.merchant_name,
		COUNT(t.*) AS transaction_count
FROM transaction AS t
JOIN merchant AS m ON t.merchant_id = m.merchant_id
WHERE t.amount < 2.00
GROUP BY m.merchant_name
ORDER BY transaction_count DESC
LIMIT 5;

-- Query the merchant_small_transactions view
SELECT *
FROM merchant_small_transactions;