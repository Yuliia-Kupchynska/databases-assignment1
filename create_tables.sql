DROP DATABASE ASSIGNMENT1;
CREATE DATABASE ASSIGNMENT1;
USE ASSIGNMENT1;

SET GLOBAL local_infile = 1;

-- Drivers
CREATE TABLE drivers (
    driverId INT PRIMARY KEY,
    forename VARCHAR(50),
    surname VARCHAR(50),
    dob DATE,
    nationality VARCHAR(50)
);

-- Drivers standings 
CREATE TABLE IF NOT EXISTS driver_standings (
  driverStandingsId INT PRIMARY KEY,
  raceId INT,
  driverId INT,
  points FLOAT,
  position INT,
  wins INT
);

-- Constructors
CREATE TABLE IF NOT EXISTS constructors (
  constructorId INT PRIMARY KEY,
  name VARCHAR(100),
  nationality VARCHAR(100)
);

-- Races
CREATE TABLE IF NOT EXISTS races (
  raceId INT PRIMARY KEY,
  year INT,
  name VARCHAR(255),
  date DATE
);

-- Qualifying
CREATE TABLE IF NOT EXISTS qualifying (
  qualifyId INT PRIMARY KEY,
  raceId INT,
  driverId INT,
  constructorId INT,
  position INT
);




