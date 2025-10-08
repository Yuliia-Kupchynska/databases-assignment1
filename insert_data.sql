-- Drivers
LOAD DATA LOCAL INFILE '/Users/yuliia/Documents/F1/data/driversclean.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(driverId, forename, surname, dob, nationality);

-- Drivers standings 
LOAD DATA LOCAL INFILE '/Users/yuliia/Documents/F1/data/driver_standings.csv'
INTO TABLE driver_standings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(driverStandingsId, raceId, driverId, points, position, wins);

-- Constructors
LOAD DATA LOCAL INFILE '/Users/yuliia/Documents/F1/data/constructors.csv'
INTO TABLE constructors
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(constructorId, name, nationality);

-- Races
LOAD DATA LOCAL INFILE '/Users/yuliia/Documents/F1/data/races.csv'
INTO TABLE races
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(raceId, year, name, date);

-- Qualifying
LOAD DATA LOCAL INFILE '/Users/yuliia/Documents/F1/data/qualifying.csv'
INTO TABLE qualifying
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(qualifyId, raceId, driverId, constructorId, position);