WITH QualifyingWinners AS ( -- using CTE for winners of qualifying
    SELECT -- subquery
        q.raceId,
        q.driverId,
        q.constructorId,
        q.position
    FROM qualifying q
    WHERE q.position = 1 -- using WHERE
),

DriverPoints AS ( -- using CTE for total points per driver
    SELECT -- subquery
        ds.driverId,
        SUM(ds.points) AS total_points
    FROM driver_standings ds
    GROUP BY ds.driverId -- using GROUP BY
    HAVING total_points > 50  -- using HAVING
)

SELECT 
	'Won both qualification and race' as "About",
    r.date AS "Race date",
    r.name AS "Grand Prix name",
    CONCAT(d.forename, ' ', d.surname) AS "Qualification winner",
	ds.position AS "Position in the race",
    c.name AS "Constructor",
    dp.total_points AS "Total points"
FROM QualifyingWinners qw
JOIN drivers d ON qw.driverId = d.driverId -- Using JOIN
JOIN races r ON qw.raceId = r.raceId
JOIN constructors c ON qw.constructorId = c.constructorId
LEFT JOIN driver_standings ds ON qw.raceId = ds.raceId AND qw.driverId = ds.driverId
JOIN DriverPoints dp ON qw.driverId = dp.driverId
WHERE ds.position = 1
UNION ALL -- UNION ALL

SELECT 
	'Won only qualification' as "About",
    r.date AS "Race date",
    r.name AS "Grand Prix name",
    CONCAT(d.forename, ' ', d.surname) AS "Qualification winner",
    ds.position AS "Position in the race",
    c.name AS "Constructor",
    dp.total_points AS "Total points"
FROM QualifyingWinners qw
JOIN drivers d ON qw.driverId = d.driverId
JOIN races r ON qw.raceId = r.raceId
JOIN constructors c ON qw.constructorId = c.constructorId
LEFT JOIN driver_standings ds ON qw.raceId = ds.raceId AND qw.driverId = ds.driverId
JOIN DriverPoints dp ON qw.driverId = dp.driverId
WHERE ds.position != 1
ORDER BY `Race date` DESC -- using ORDER BY
LIMIT 20 -- using LIMIT