create schema MLB_Project;
use MLB_Project;

Select * 
FROM games;

ALTER TABLE `MLB_Project`.`rosters-orig` 
RENAME TO  `MLB_Project`.`rosters_orig` ;

CREATE TABLE World_Series
As SELECT ballparks.PARKID, biodata.BioID, rosters_orig.RosterID, games_import.GameID, teams.TeamID, YEAR(games_import.date) as Year
FROM ballparks, biodata, rosters_orig, games_import, teams;

INSERT INTO World_Series (PARKID, BioID, RosterID, GameID, TeamID, Year)
SELECT bp.PARKID, bd.bioID, ro.rosterID, gi.gameID, gi.teamID, YEAR(gi.date) as Year
FROM ballparks bp, rosters_orig ro
INNER JOIN biodata bd ON bp.PARKID = bd.PARKID
INNER JOIN rosters_orig ro ON bd.bioID = ro.bioID
INNER JOIN games_import gi ON ro.rosterID = gi.rosterID
INNER JOIN teams t ON gi.teamID = t.teamID;

#fail
INSERT INTO World_Series (ParkID, BioID, RosterID, GameID, TeamID, Year)
SELECT ballparks.PARKID, biodata.BioID, Rosters_Orig.RosterID, games_import.GameID, Teams.TeamID, Year(games_import.Date) as Year
FROM ballparks, biodata, rosters, game_import, teams, games_import
INNER JOIN ballparks ON ballparks.ParkID = World_Series.ParkID
INNER JOIN biodata ON biodata.BioID = World_Series.BioID
INNER JOIN rosters_orig ON Rosters_orig.bioID = World_series.bioID 
INNER JOIN games_import ON games_import.rosterID = World_series.rosterID
INNER JOIN teams ON Teams.teamID = World_series.teamID;


#fail
INSERT INTO World_Series (ParkID, BioID, RosterID, GameID, teamID, Year)
SELECT bp.ParkID, bd.BioID, ro.RosterID, gi.GameID, t.TeamID, YEAR(gi.Date) AS Year
FROM World_Series ws
INNER JOIN ballparks bp ON bp.ParkID = ws.ParkID
INNER JOIN biodata bd ON bd.BioID = ws.BioID
INNER JOIN rosters_orig ro ON ro.rosterID = ws.rosterID 
INNER JOIN games_import gi ON gi.bioID = ws.bioID
INNER JOIN teams t ON t.TeamID = ws.TeamID;

#fail
INSERT INTO World_Series (ParkID, BioID, RosterID, GameID, TeamID, Year)
SELECT bp1.PARKID, bd.BioID, ro.RosterID, gi.GameID, t.TeamID, YEAR(gi.Date) AS Year
FROM ballparks bp1, biodata bd, rosters_orig ro, games_import gi, teams t, games_import gi2
INNER JOIN ballparks bp2 ON bp2.ParkID = World_Series.ParkID
INNER JOIN biodata bd2 ON bd2.BioID = World_Series.BioID
INNER JOIN rosters_orig ro2 ON ro2.bioID = World_series.bioID 
INNER JOIN games_import gi3 ON gi3.rosterID = World_series.rosterID
INNER JOIN teams t2 ON t2.teamID = World_series.teamID;



SELECT NAME
FROM ballparks;

#Error Code: 3. Error writing file '/var/tmp/MYMCFzUs' (OS errno 28 - No space left on device)

SELECT *
FROM games_import;

SELECT *
FROM games_import
WHERE YEAR(date) = 2012;

##Data tables in 3rd NF

SELECT ParkID, Name, City, State, Start, End
FROM Ballparks;

SELECT RosterID, PlayerID, NameLast, NameFirst, Position, Theyear
FROM rosters_orig;

#Bioid not included

SELECT teams.TeamID, teams.League, teams.City, teams.Nickname, biodata.bioid
FROM teams,biodata
LEFT JOIN biodata ON teams.TeamID = biodata.TeamID;

SELECT teams.TeamID, teams.League, teams.City, teams.Nickname, biodata.Bioid
FROM teams, biodata;

SELECT BioID, NameFirstMiddle, NameLast, Birthdate, Player_debut, Height_inches
FROM BIODATA;

SELECT *
FROM GAMES_IMPORT;

SELECT  Gamesstats.Gamestatsid, Games_import.GameID, Games_import.visitor_score, Games_import.home_score, Games_import.winning_pitcher_id
FROM games_import, GamesStats;

SELECT GamesStats.Gamestatsid, Games_import.GameID, Games_import.Visitor_score, Games_import.Home_score, Games_import.Winning_pitcher_id
FROM GamesStats
INNER JOIN Games_import ON GamesStats.GameID = Games_import.GameID;

#gamestatsid not there
SELECT GameStatsID, GameID, Visitor_score, Home_score, Winning_pitcher_id
FROM games_import; 

SELECT GameID, Date, Dayofweek, Home_gameno, ParkID
FROM games_import;

SELECt p.NAME, COUNT(DISTINCT ws.GAMEID) AS total_games
FROM world_series ws
JOIN Ballparks p ON ws.PARKID = p.PARKID
GROUP BY p.PARKID, p.NAME
ORDER BY total_games DESC
LIMIT 5;

SELECT ballparks.Parkid, biodata.Bioid, Rosters_orig.Rosterid, Games_import.Gameid, Teams.Teamid
FROM ballparks, biodata, Rosters_orig, games_import, teams;

#CREATE TABLE World_Series1 AS
SELECT DISTINCT ballparks.Parkid, biodata.Bioid, Rosters_orig.Rosterid, Games_import.Gameid, Teams.Teamid
FROM ballparks, biodata, Rosters_orig, games_import, teams;


DELIMITER //

CREATE PROCEDURE PopulateWorldSeries()
BEGIN
    -- Create the World_Series table if it doesn't exist
    CREATE TABLE IF NOT EXISTS World_Series (
        PARKID INT,
        bioID INT,
        rosterID INT,
        gameID INT,
        teamID INT,
        Year INT
    );

    -- Populate the World_Series table using an INSERT INTO SELECT statement with JOINs
    INSERT INTO World_Series (PARKID, BioID, RosterID, GameID, TeamID, Year)
    SELECT bp.PARKID, bd.bioID, ro.rosterID, gi.gameID, t.teamID, YEAR(gi.date) as Year
    FROM ballparks bp
    INNER JOIN biodata bd ON bp.PARKID = bd.PARKID
    INNER JOIN rosters_orig ro ON bd.bioID = ro.bioID
    INNER JOIN games_import gi ON ro.rosterID = gi.rosterID
    INNER JOIN teams t ON gi.teamID = t.teamID;
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS World_Series (
    PARKID INT,
    bioID INT,
    rosterID INT,
    gameID INT,
    teamID INT,
    Year INT
);

SELECT TeamID, GameStatsID
FROM Result;



