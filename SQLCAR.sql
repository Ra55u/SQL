
CREATE DATABASE Machine;

USE Machine;

CREATE TABLE CarType (
  Id INT PRIMARY KEY,
  Type VARCHAR(50) NOT NULL
);

INSERT INTO CarType (Id, Type)
VALUES
  (1, 'Sedan'),
  (2, 'Coupe'),
  (3, 'Hatchback'),
  (4, 'SUV'),
  (5, 'Pickup');

CREATE TABLE Car (
  Id INT PRIMARY KEY,
  Color VARCHAR(50) NOT NULL,
  EnginePower INT NOT NULL,
  CarTypeId INT NOT NULL,
  FOREIGN KEY (CarTypeId) REFERENCES CarType(Id)
);

INSERT INTO Car (Id, Color, EnginePower, CarTypeId)
VALUES
  (1, 'Red', 150, 1),
  (2, 'Blue', 120, 1),
  (3, 'Green', 180, 1),
  (4, 'Silver', 110, 2),
  (5, 'Black', 200, 2),
  (6, 'White', 130, 2),
  (7, 'Yellow', 140, 3),
  (8, 'Orange', 170, 3),
  (9, 'Purple', 190, 3),
  (10, 'Gray', 160, 4),
  (11, 'Brown', 210, 4),
  (12, 'Beige', 180, 4),
  (13, 'Dark Green', 220, 5),
  (14, 'Light Blue', 200, 5),
  (15, 'Dark Blue', 240, 5),
  (16, 'Light Green', 120, 1),
  (17, 'Light Gray', 130, 2),
  (18, 'Dark Gray', 140, 3),
  (19, 'Light Purple', 150, 4),
  (20, 'Dark Purple', 160, 5);