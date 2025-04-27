CREATE TABLE AthleteData (
    Sex VARCHAR,
    Age INT,
    Height float,
    Weight float,
    Year INT,
    Season VARCHAR(10),
    HostCity VARCHAR(50),
    Sport VARCHAR(50),
    MedalType VARCHAR(10),
    AthleteCountry VARCHAR(50),
    HostRegion VARCHAR(50),
    AthleteRegion VARCHAR(50),
    SportType VARCHAR(50)
);

select * from olympics_games

--1: PersonalDetails

CREATE TABLE Personal_Details as (select distinct  Sex ,Age , Height ,Weight from olympics_games
);

select * from Personal_Details

--2: EventDetails

CREATE TABLE Event_Details as (select distinct Year ,Season ,HostCity ,HostRegion from olympics_games
);

select * from Event_Details

-- 3: SportDetails

CREATE TABLE Sport_Details as (select distinct Sport , SportType  from olympics_games
);

select * from Sport_Details

-- 4: MedalDetails

CREATE TABLE Medal_Details as (select distinct MedalType ,AthleteCountry from olympics_games
);

select * from Medal_Details 

--5: AthleteRegionDetails

CREATE TABLE Athlete_Region_Details as (select distinct AthleteCountry,AthleteRegion  from olympics_games
);

select * from Athlete_Region_Details



--1. INNER JOIN between PersonalDetails and EventDetails

SELECT *
FROM Personal_Details
INNER JOIN Event_Details
ON Personal_Details.Sex = 'M' AND Event_Details.Season = 'Summer';


--2. LEFT JOIN between PersonalDetails and MedalDetails

SELECT *
FROM Personal_Details
inner JOIN Medal_Details
ON Personal_Details.Height = 168;


--3. Left JOIN between EventDetails and MedalDetails

SELECT *
FROM Event_Details
left JOIN Medal_Details
ON Event_Details = Medal_Details;


--4. INNER JOIN between SportDetails and AthleteRegionDetails

SELECT *
FROM Sport_Details
INNER JOIN Athlete_Region_Details
ON Athlete_Region_Details.AthleteRegion = 'Africa';


--5. Inner JOIN between EventDetails and AthleteRegionDetails

SELECT *
FROM Event_Details
inner JOIN Athlete_Region_Details
ON Event_Details.HostRegion = 'North America';


--6. RIGHT JOIN between MedalDetails and AthleteRegionDetails

SELECT *
FROM Medal_Details
RIGHT JOIN Athlete_Region_Details
ON Medal_Details.AthleteCountry = Athlete_Region_Details.AthleteCountry;


--7. INNER JOIN between PersonalDetails and AthleteRegionDetails

SELECT *
FROM Personal_Details
INNER JOIN Athlete_Region_Details
ON Athlete_Region_Details.AthleteRegion = 'North America';


--8. LEFT JOIN between SportDetails and MedalDetails

SELECT *
FROM Sport_Details
LEFT JOIN Medal_Details
ON Medal_Details.MedalType = 'Bronze';


--9. Inner JOIN between EventDetails and SportDetails

SELECT *
FROM Event_Details
inner JOIN Sport_Details
ON Sport_Details.SportType = 'Race';


--10. Combining multiple tables using LEFT JOIN

SELECT *
FROM Personal_Details
LEFT JOIN Event_Details ON Event_Details.Season = 'Summer'
LEFT JOIN Sport_Details ON Sport_Details.SportType = 'Race';



--1.Calculate the average height and weight of athletes (Aggregation)

SELECT AVG(Height) AS AvgHeight, AVG(Weight) AS AvgWeight
FROM Personal_Details;



--2. Count the number of medals grouped by medal type (GROUP BY)

SELECT MedalType, COUNT(*) AS MedalCount
FROM Medal_Details
GROUP BY MedalType;



--3. Find the total number of athletes from each region (GROUP BY)

SELECT AthleteRegion, COUNT(*) AS AthleteCount
FROM Athlete_Region_Details
GROUP BY AthleteRegion;



--4. Calculate the total number of medals by each country and filter countries with more than 2 medals (GROUP BY and HAVING)

SELECT AthleteCountry, COUNT(*) AS TotalMedals
FROM Medal_Details
GROUP BY AthleteCountry
HAVING COUNT(*) > 2;



--5. List the average weight of athletes from each athlete region and order results by average weight (GROUP BY and ORDER BY)

SELECT AthleteRegion, AVG(Weight) AS AvgWeight
FROM Athlete_Region_Details
JOIN Personal_Details ON Athlete_Region_Details.AthleteRegion = Athlete_Region_Details.AthleteRegion
GROUP BY AthleteRegion
ORDER BY AvgWeight DESC;



--6. Get the total medals won in each sport type and sort by descending order (GROUP BY and ORDER BY)

SELECT SportType, COUNT(*) AS TotalMedals
FROM Sport_Details
JOIN Medal_Details ON Sport_Details.SportType = 'Race'  
GROUP BY SportType
ORDER BY TotalMedals DESC;



--7. Find the maximum and minimum age of athletes grouped by athlete country (GROUP BY)

SELECT AthleteCountry, MAX(Age) AS MaxAge, MIN(Age) AS MinAge
FROM Athlete_Region_Details
JOIN Personal_Details ON Personal_Details.Sex='F'
GROUP BY AthleteCountry;



--8. Count the total number of sports hosted in each host city and filter cities with more than 1 sport (GROUP BY and HAVING)

SELECT HostCity, COUNT(*) AS TotalSports
FROM Event_Details
GROUP BY HostCity
HAVING COUNT(*) > 1;



--9. Calculate the average weight and height of athletes for each medal type (GROUP BY)

SELECT MedalType, AVG(Weight) AS Avg_Weight, AVG(Height) AS Avg_Height
FROM Medal_Details
JOIN Personal_Details ON weight = 60
GROUP BY MedalType;



--10. List all host cities and their corresponding regions ordered alphabetically by region (ORDER BY)

SELECT HostCity, HostRegion
FROM Event_Details
ORDER BY HostRegion ASC, HostCity ASC;









