-- Lab2_ZooDb
-- Version 1.0.0  05-May-2022

/*********************************************************************************
Create database
*********************************************************************************/

CREATE DATABASE ZooDb;

USE ZooDb;
SELECT DATABASE();

/*********************************************************************************
Create tables
*********************************************************************************/

CREATE TABLE Category
(
	CategoryID int PRIMARY KEY,
    Category varchar(50) NOT NULL
);

CREATE TABLE Enclosure
(
	EnclosureID int PRIMARY KEY,
    Enclosure varchar(50) NOT NULL
);

CREATE TABLE Animal
(
	AnimalID int PRIMARY KEY,
    Name varchar(50) NULL,
    CategoryID int NOT NULL,
    EnclosureID int NOT NULL
);


/*********************************************************************************
Create foreign keys
*********************************************************************************/

ALTER TABLE Animal
	ADD	CONSTRAINT FK_Animal_Category FOREIGN KEY (CategoryID)
		REFERENCES Category (CategoryID),
	ADD CONSTRAINT FK_Animal_Enclosure FOREIGN KEY (EnclosureID)
		REFERENCES Enclosure (EnclosureID);
       

/*********************************************************************************
Populate tables
*********************************************************************************/

-- DELETE FROM Category WHERE CategoryID > 0;
INSERT INTO Category (CategoryID, Category)
	VALUES
		(1, 'Badgers'),
		(2, 'Bats'),
		(3, 'Big cats'),
		(4, 'Camels'),
		(5, 'Insects'),
		(6, 'Penguins'),
		(7, 'Reptiles'),
		(8, 'Small mammals');
    

-- DELETE FROM Enclosure WHERE EnclosureID > 0;
INSERT INTO Enclosure (EnclosureID, Enclosure)
	VALUES
		(1, 'North Enclosure'),			-- camels, small mammals
        (2, 'South Enclosure'),			-- badgers
        (3, 'East Enclosure'),			-- big cats
        (4, 'Central'),					-- bats, monkeys
        (5, 'Aquarium'),				-- penguins
        (6, 'Insect house'),			-- insects
        (7, 'Reptile house');			-- reptiles
        

-- TRUNCATE TABLE Animal;
INSERT INTO Animal (AnimalID, Name, CategoryID, EnclosureID)
	VALUES
		(1, "Bart Badger", 1, 2),
		(2, "Barley Badger", 1, 2),
        (3, "Vampire #1", 2, 4),        
		(4, "Vampire #2", 2, 4),        
		(5, "Flying fox", 2, 4),
		(6, "Leo Lion", 3, 3),        
		(7, "Leonie Lion", 3, 3),        
		(8, "Dromedary #1", 4, 1),        
		(9, "Dromedary #2", 4, 1),        
		(10, "Dromedary #3", 4, 1),        
		(11, "Ants", 5, 6),        
		(12, "Tarantula", 5, 6),        
		(13, "Emperor moth", 5, 6),        
		(14, "Penguin #1", 6, 5),        
		(15, "Penguin #2", 6, 5),        
		(16, "Penguin #3", 6, 5),
		(17, "Anaconda", 7, 7),
		(18, "Monitor lizard #1", 7, 7),        
		(19, "Monitor lizard #2", 7, 7),        
		(20, "Chameleon", 7, 7),
		(21, "Monkey #1", 8, 4),        
		(22, "Monkey #2", 8, 4),        
		(23, "Rabbit #1", 8, 1),        
		(24, "Rabbit #2", 8, 1),        
		(25, "Rabbit #3", 8, 1),        
		(26, "Griselda Goat", 8, 1),        
		(27, "George Goat", 8, 1);
        
        
SELECT *
	FROM Category
    ORDER BY CategoryID;
    
SELECT *
	FROM Enclosure
    ORDER BY EnclosureID;
    
SELECT A.AnimalID, A.Name, C.Category, E.Enclosure
	FROM Animal AS A
		INNER JOIN Category AS C
			ON A.CategoryID = C.CategoryID
		INNER JOIN Enclosure AS E
			ON A.EnclosureID = E.EnclosureID
	ORDER BY A.AnimalID;
    
    
