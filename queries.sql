/*
	Project Phase III
	Group 6 - Aaron, Naomi, Shilnara
	The DBMS was made in XAMPP with phpMyAdmin
	Run by importing into database
	This file contains only queries
*/
-- ***********************************************************************************************************
-- Query 1
-- Purpose: gets all reviews and displays all its information
-- Expected: list containing all reviews
-- used in review page
SELECT game.Title, user.Name_Display, review.Head, review.Body, review.Date, user.Id as 'userId', game.Id as 'gameId', review.Rating, game.Image
FROM review JOIN game ON review.Game_Id = game.Id
JOIN user ON review.User_Id = user.Id
ORDER BY date DESC;
-- ***********************************************************************************************************
-- Query 2
-- Purpose: provides all verified reviews
-- Expected: table containing reviews from only verified users
SELECT Review.Game_Id,Review.Head,Review.Body
FROM Review
WHERE Review.User_Id IN(SELECT User.Id
                        FROM User
                        WHERE User.Is_Verified > 0)
                        GROUP BY Review.Game_Id,Review.Head,Review.Body;
-- ***********************************************************************************************************
-- Query 3
-- Purpose: gets all users who have made 2 or more reviews
-- Expected: list containing users who have made more than 2 reviews
SELECT User.Name_Display as 'User', ReviewCount
FROM (SELECT Review.User_Id as 'User', COUNT(Review.Head) as 'ReviewCount'     
      FROM Review     
      GROUP BY Review.User_Id) AS T
JOIN User ON T.user = User.Id
WHERE ReviewCount >= 2
GROUP BY User;
-- ***********************************************************************************************************
-- Query 4
-- Purpose: displays game title with their associated genre
-- Expected: table containing all games with their associated genre ids
SELECT Game.Title AS "Game Title",Game_Genres.Genre AS "Genre Name"
FROM Game
LEFT JOIN Game_Genres ON Game.Id=Game_Genres.Game_Id
UNION
SELECT Game.Title,Game_Genres.Genre
FROM Game
RIGHT JOIN Game_Genres ON Game.Id=Game_Genres.Game_Id;
-- ***********************************************************************************************************
-- Query 5
-- Purpose: gets list of games with a high average rating or a high hours played by a user. can be used for to help verify a review's integrity
-- Expected: list of video games with high average rating or high amound of hours played
SELECT Game.Title
FROM (select review.game_Id as 'gameid', AVG(review.rating) as 'Average'
        FROM review
         GROUP BY review.Game_Id
     ) as T
JOIN game
ON game.Id = gameid
WHERE Average >= 7
UNION
SELECT game.Title
FROM (SELECT owned_games.Game_Id as 'gameid' , MAX(owned_games.Hours_Played) as 'max'
      FROM owned_games
      GROUP BY owned_games.Game_Id) as A 
JOIN game
ON gameid = game.Id
WHERE max >= 80;
-- ***********************************************************************************************************
-- Query 6
-- Purpose: gets all games that have been reviewed by a specific user
-- Expected: list containing the user name and game their have reviewed
-- used in user details page
SELECT game.Id, game.Title,review.Head, review.Body, review.Rating, review.Date
FROM review JOIN game ON review.Game_Id = game.Id
WHERE review.User_Id = 1;
-- ***********************************************************************************************************
-- Query 7
-- Purpose: gets all reviews written about a particular game. 
-- Expected: list containing all users and their review on a particular game
-- used in game details page
SELECT user.Name_Display, review.Head, review.Body, review.Rating, review.Date, user.Id
FROM review JOIN user ON review.User_Id = user.Id
WHERE review.Game_Id = 1;
-- ***********************************************************************************************************
-- Query 8
-- Purpose: gets all games the user does not have but are in a genre the user does have
-- used for recomendation
-- Expected: list games in genres of games user owns
-- used in user details page
SELECT DISTINCT(game.Title), game.Id, game.Image, game.Series, game.Developer, game.Publisher, game.Release_Date
FROM (SELECT DISTINCT(genres.Name) as 'genreName', game.image, game.Title, game.Series, game.Developer, game.Publisher, game.Release_Date
      FROM game JOIN owned_games on game.Id = owned_games.Game_Id
      JOIN game_genres ON game.Id = game_genres.Game_Id
      JOIN genres ON game_genres.Genre = genres.Name
      where owned_games.User_Id = 1) as A
JOIN game_genres ON genreName = game_genres.Genre
JOIN game ON game_genres.Game_Id = game.Id 
WHERE game.Title NOT IN (SELECT game.Title
      FROM game JOIN owned_games on game.Id = owned_games.Game_Id
      JOIN game_genres ON game.Id = game_genres.Game_Id
      JOIN genres ON game_genres.Genre = genres.Name
      WHERE owned_games.User_Id = 1);
-- ***********************************************************************************************************
-- Query 9
-- Purpose: lists all games a user has reviewed
-- Expected: list of all games users have reviewed. this will list all users
-- used in user details page
SELECT User.Name_Display as 'User Name', Game.Title as `Game Name`
FROM Review,User,Game
WHERE Review.User_Id=User.Id
AND Review.Game_Id=Game.Id;
-- ***********************************************************************************************************
-- Query 10
-- Purpose: gets all games and their play time 
-- Expected: list containing all games along with their playtime. will display all users
SELECT user.name_display AS "User Name", game.title AS "Game Owned", owned_games.Hours_Played
FROM user, game, owned_games
WHERE owned_games.User_Id = user.Id AND owned_games.Game_Id= game.Id;