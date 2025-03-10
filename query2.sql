DROP DATABASE IF EXISTS Finance;
CREATE DATABASE IF NOT EXISTS Finance;

USE Finance;

CREATE TABLE customers(
	customer_id SERIAL, -- Automatically adds AUTO_INCREMENT and PRIMARY KEY
	full_name VARCHAR(50),
    address VARCHAR(150),
    balance INT,
    credit INT,
    debit INT
);

ALTER TABLE customers
ADD UNIQUE(full_name, address, balance, credit, debit);

-- when adding a UNIQUE constraint on multiple columns (full_name, address, 
-- balance, credit, debit),MySQL automatically creates a composite unique index on those columns

-- The composite index includes all the specified columns (full_name, address, 
-- balance, credit, debit), but each column in the composite index is also implicitly indexed.
-- when column are indexed, 
-- update data using those columns under safe updates mode, no error code.

INSERT IGNORE INTO customers  -- only insert records that don’t already exist in the table
(full_name, address, balance, credit, debit)
VALUES
("Polly Moore", "123 Fake Street, Bristol, BS15BB", 10, NULL, 15),
("John Doe", "456 Imaginary Ave, London, W1A1AA", 100, 50, 20),
("Jane Smith", "789 Fictional Rd, Manchester, M13BB", 200, NULL, 30),
("Alice Brown", "101 Placeholder Lane, Leeds, LS1AA", 50, 10, NULL);

SELECT * FROM customers;

-- Update records;

SET SQL_SAFE_UPDATES = 1; -- built-in feature in MySQL

SHOW INDEX FROM customers;

UPDATE customers
SET
customers.balance = 20
WHERE full_name = "Polly Moore"; 
-- full_name is a indexed column, can execute under safe updates mode

UPDATE customers
SET
customers.address = "10 Fake Name, Glasgow, GL74AAA"
WHERE full_name = "Polly Moore"; 

UPDATE customers
SET
customers.balance = 21
WHERE full_name = "Jane Smith";  

UPDATE customers
SET
customers.balance = 15
WHERE full_name = "John Doe";  

SELECT * FROM customers;

-- DELETE

-- SELECT * FROM customers
-- WHERE balance < 20;

DELETE FROM customers
WHERE balance < 20; -- this code violate SQL_SAFE_UPDATES mode

-- DELETE FROM customers
-- WHERE full_name = 'Polly Moore' 
-- 	AND address = '123 Fake Street, Bristol, BS15BB' 
--     AND balance = 10;  -- this code does not violate SQL_SAFE_UPDATES mode

SHOW INDEX FROM customers;


-- Temporarily Disable SQL_SAFE_UPDATES, if you are certain the query is safe
SET SQL_SAFE_UPDATES = 0; 

-- after disable safe update mode, this code does violate SQL_SAFE_UPDATES mode
-- a good practice is: Before deleting, check data to be deleted using SELECT
DELETE FROM customers
WHERE balance < 20; 

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM customers







