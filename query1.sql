DROP DATABASE IF EXISTS Cluedo;
CREATE DATABASE IF NOT EXISTS Cluedo;
USE Cluedo;

CREATE TABLE suspects(
    suspect_id SERIAL, -- Automatically adds AUTO_INCREMENT and PRIMARY KEY
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50),
    gender VARCHAR(1),
    age INT,
    token_colour VARCHAR(10)
);

INSERT INTO suspects
(first_name, surname, gender, age, token_colour)
VALUES
('Scarlet', 'Miss', 'F', 42, 'Red'),
('Nick', 'Mr', 'M', 42, 'Red');

SELECT * FROM suspects;


    