-- EnginesLab2
-- Version 2.0 09-05-2022 - CE

-- Create database
CREATE DATABASE EnginesLab2;
USE EnginesLab2;

----------------------------------------------------------------------
-- Create a table using Memory storage engine and populate it
----------------------------------------------------------------------

-- Create a table using Memory storage engine
CREATE TABLE CatM
(
	CatID int NOT NULL PRIMARY KEY,
    Name varchar(25) CHARACTER SET utf8mb4 NOT NULL,
    Color varchar(20) CHARACTER SET utf8mb4 NOT NULL,
    Weight decimal(4,2) NOT NULL
)
ENGINE = MEMORY;

-- Populate the table
INSERT INTO CatM (CatID, Name, Color, Weight)
	VALUES
		(4, N'Tiddles', N'Marmalade', 4.80),
		(5,	N'Socks', N'Black-white', 5.00),
		(6,	N'Felicity', N'Blue', 5.00);
        
SELECT *
	FROM CatM;

----------------------------------------------------------------------
-- Restart the server and then examine the Memory table
----------------------------------------------------------------------
-- Use the Azure portal to restart the server

-- The table is now empty, but the table schema still exists
SELECT *
	FROM CatM;

-- Repopulate the table
INSERT INTO CatM (CatID, Name, Color, Weight)
	VALUES
		(4, N'Tiddles', N'Marmalade', 4.80),
		(5,	N'Socks', N'Black-white', 5.00),
		(6,	N'Felicity', N'Blue', 5.00);

SELECT *
	FROM CatM;


