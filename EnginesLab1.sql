-- EnginesLabTrans
-- Verion 2.0 09-05-22 - CE

-- Supported engines
SHOW ENGINES;

-- Create database;
CREATE DATABASE EnginesLab1;
USE EnginesLab1;

----------------------------------------------------------------------
-- Test transactions with InnoDB storage engine
----------------------------------------------------------------------

-- Create an InnoDB table
CREATE TABLE Cat
(
	CatID int NOT NULL PRIMARY KEY,
    Name varchar(25) CHARACTER SET utf8mb4 NOT NULL,
    Color varchar(20) CHARACTER SET utf8mb4 NOT NULL,
    Weight decimal(4,2) NOT NULL
)
ENGINE = InnoDB;

-- Insert three rows
INSERT INTO Cat (CatID, Name, Color, Weight)
	VALUES
		(4, N'Tiddles', N'Marmalade', 4.80),
		(5,	N'Socks', N'Black-white', 5.00),
		(6,	N'Felicity', N'Blue', 5.00);
        
SELECT *
	FROM Cat;

-- Insert a row within a transaction
START TRANSACTION;
INSERT INTO Cat (CatID, Name, Color, Weight)
	VALUES
		(10, N'Camembert', N'Cream', 5.60);
COMMIT;

SELECT *
	FROM Cat;

-- Insert a row and rollback the transaction
START TRANSACTION;
INSERT INTO Cat (CatID, Name, Color, Weight)
	VALUES
		(11, N'Daffodil', N'Tabby', 3.80);
ROLLBACK;

SELECT *
	FROM Cat;


----------------------------------------------------------------------
-- Test transactions with Memory storage engine
----------------------------------------------------------------------

-- Create a Memory table
CREATE TABLE CatM
(
	CatID int NOT NULL PRIMARY KEY,
    Name varchar(25) CHARACTER SET utf8mb4 NOT NULL,
    Color varchar(20) CHARACTER SET utf8mb4 NOT NULL,
    Weight decimal(4,2) NOT NULL
)
ENGINE = MEMORY;

-- Insert three rows
INSERT INTO CatM (CatID, Name, Color, Weight)
	VALUES
		(4, N'Tiddles', N'Marmalade', 4.80),
		(5,	N'Socks', N'Black-white', 5.00),
		(6,	N'Felicity', N'Blue', 5.00);      
SELECT *
	FROM CatM;
    

-- Insert a row within a transaction  
START TRANSACTION;
INSERT INTO CatM (CatID, Name, Color, Weight)
	VALUES
		(10, N'Camembert', N'Cream', 5.60);
COMMIT;

SELECT *
	FROM CatM;

-- Insert a row and rollback the transaction
START TRANSACTION;
INSERT INTO CatM (CatID, Name, Color, Weight)
	VALUES
		(11, N'Daffodil', N'Tabby', 3.80);
ROLLBACK;

SELECT *
	FROM CatM;


----------------------------------------------------------------------
-- Test transactions with CSV storage engine
----------------------------------------------------------------------

-- Create a CSV table
CREATE TABLE CatC
(
	CatID int NOT NULL PRIMARY KEY,
    Name varchar(25) CHARACTER SET utf8mb4 NOT NULL,
    Color varchar(20) CHARACTER SET utf8mb4 NOT NULL,
    Weight decimal(4,2) NOT NULL
)
ENGINE = CSV;

-- Create a CSV table with no primary key
CREATE TABLE CatC
(
	CatID int NOT NULL,
    Name varchar(25) CHARACTER SET utf8mb4 NOT NULL,
    Color varchar(20) CHARACTER SET utf8mb4 NOT NULL,
    Weight decimal(4,2) NOT NULL
)
ENGINE = CSV;


-- Insert three rows
INSERT INTO CatC (CatID, Name, Color, Weight)
	VALUES
		(4, N'Tiddles', N'Marmalade', 4.80),
		(5,	N'Socks', N'Black-white', 5.00),
		(6,	N'Felicity', N'Blue', 5.00);
        
SELECT *
	FROM CatC;
    

-- Insert a row within a transaction
START TRANSACTION;
INSERT INTO CatC (CatID, Name, Color, Weight)
	VALUES
		(10, N'Camembert', N'Cream', 5.60);
COMMIT;

SELECT *
	FROM CatC;


-- Insert a row and rollback the transaction
START TRANSACTION;
INSERT INTO CatC (CatID, Name, Color, Weight)
	VALUES
		(11, N'Daffodil', N'Tabby', 3.80);
ROLLBACK;

SELECT *
	FROM CatC;


