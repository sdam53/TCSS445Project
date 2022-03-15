/*
	Project Phase III
	Group 6 - Aaron, Naomi, Shilnara
	The DBMS was made in XAMPP in phpMyAdmin
	Run by importing into database
	This file contains the database create and data population
	the query statements are in another file since importing this file will not display its results
*/

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2022 at 04:27 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_time`
--
-- *************************************************************************************************************************************
-- creating tables
-- *************************************************************************************************************************************
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table 'developer' store information on developers
-- ***********************************************************************************************************
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `Name` varchar(64) NOT NULL,
  `Headquarters` varchar(255) DEFAULT NULL,
  `About_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table 'game' store information on games
-- ***********************************************************************************************************
CREATE TABLE `game` (
  `Id` int(16) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Series` varchar(32) DEFAULT NULL,
  `Developer` varchar(64) NOT NULL,
  `Publisher` varchar(64) NOT NULL,
  `Release_Date` date NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table 'game_critic_publication' store information on critic publications
-- ***********************************************************************************************************
CREATE TABLE `game_critic_publication` (
  `Publication` varchar(16) NOT NULL,
  `About_URL` varchar(255) DEFAULT NULL,
  `Rating` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `game_genres` store information on game genres
-- ***********************************************************************************************************
CREATE TABLE `game_genres` (
  `Genre` varchar(32) NOT NULL,
  `Game_Id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `game_series`store information on games in a particular series
-- ***********************************************************************************************************
CREATE TABLE `game_series` (
  `Series` varchar(32) NOT NULL,
  `Game_Id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `genres` store information on game genres
-- ***********************************************************************************************************
CREATE TABLE `genres` (
  `Name` varchar(32) NOT NULL,
  `Description` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `owned_games` store information on games owned by users
-- ***********************************************************************************************************
CREATE TABLE `owned_games` (
  `Game_Id` int(16) NOT NULL,
  `User_Id` int(16) NOT NULL,
  `Hours_Played` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `publisher` store information on game publishers
-- ***********************************************************************************************************
CREATE TABLE `publisher` (
  `Name` varchar(64) NOT NULL,
  `Headquarters` varchar(128) DEFAULT NULL,
  `About_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `review` store information on game reviews
-- ***********************************************************************************************************
CREATE TABLE `review` (
  `Game_Id` int(16) NOT NULL,
  `User_Id` int(16) NOT NULL,
  `Head` varchar(128) NOT NULL,
  `Body` varchar(10000) DEFAULT NULL,
  `Rating` int(2) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `series` on game series
-- ***********************************************************************************************************
CREATE TABLE `series` (
  `Name` varchar(32) NOT NULL,
  `Description` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------
-- ***********************************************************************************************************
-- table `user` to store user information
-- ***********************************************************************************************************
CREATE TABLE `user` (
  `Id` int(16) NOT NULL,
  `Name_Display` varchar(32) NOT NULL,
  `Name_First` varchar(32) NOT NULL,
  `Name_Last` varchar(32) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Is_Verified` int(2) DEFAULT NULL,
  `Publication` varchar(16) DEFAULT NULL,
  `User_Rating` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- *************************************************************************************************************************************
-- populating table with data
-- *************************************************************************************************************************************
-- ***********************************************************************************************************
-- populating `user` table
-- ***********************************************************************************************************
INSERT INTO `user` (`Id`, `Name_Display`, `Name_First`, `Name_Last`, `Email`, `Is_Verified`, `Publication`, `User_Rating`) VALUES
(1, 'Yeet', 'Shilnara', 'Dam', 'shilnara123@someemail.com', 1, NULL, NULL),
(2, 'g.jones', 'George', 'Jones', 'g.jones@randatmail.com', 1, 'Destructoid', NULL),
(3, 'j.lloyd2', 'Lloyd', NULL, 'j.lloyd@randatmail.com', 0, NULL, NULL),
(6, 's.clark3', 'Clark', 'Jones', 's.clark@randatmail.com', 1, 'Game Informer', 7),
(7, 't.wes2', 'Wes', NULL, 't.west@randatmail.com', 0, NULL, NULL),
(8, 'j.sfzondi', 'J', NULL, 'j.sfzondi@randatmail.com', 1, 'IGN', 8),
(9, 'x.balba', 'Balba', NULL, 'x.balba@randatmail.com', 0, NULL, NULL),
(10, 'd.surgeon', 'D', NULL, 'd.surgeon@randatmail.com', 1, 'Retro Gamer', 8),
(11, 'Swolechu', 'Bob', NULL, 'Swolechu@fake.com', 1, NULL, NULL),
(12, 'Stevebobs', 'Bob', 'Steve', 'Stevebobs@fake.com', 1, 'Pocket Tactics', 5),
(13, 'IamVerySmart', 'Rob', NULL, 'IamVerySmart@fake.com', 1, NULL, NULL);
-- ***********************************************************************************************************
-- populating `series` table
-- ***********************************************************************************************************
INSERT INTO `series` (`Name`, `Description`) VALUES
('Chrono', 'The series follows Mamo and Nu, who are joined by Johnny and Spekkio (in the form of a frog), as they continue their adventure through time.'),
('Dark Souls', 'Souls[a] is a series of action role-playing games developed by FromSoftware. The series began with the release of Demon\'s Souls for the PlayStation 3 in 2009, and was followed by Dark Souls and its sequels.'),
('Fatal Frame', 'Fatal Frame, titled Zero[a] in Japan and Project Zero in Europe and Australia, is a Japanese survival horror video game series created, published and developed by Koei Tecmo (originally Tecmo).'),
('Final Fantasy', 'Final Fantasy[a] is a Japanese science fantasy anthology media franchise created by Hironobu Sakaguchi, and developed and owned by Square Enix (formerly Square). The franchise centers on a series of fantasy and science fantasy role-playing video games.'),
('Klonoa', 'Klonoa[a] is a platform video game series created by Namco starting in 1997. It stars Klonoa, an anthropomorphic animal who explores dream worlds. '),
('Nioh', 'Nioh is an action role-playing video game developed by Team Ninja and Kou Shibusawa[1] for the PlayStation 4 (PS4).'),
('Pokémon', 'Pokémon[a][1][2][3] (an abbreviation for Pocket Monsters[b] in Japan) is a Japanese media franchise managed by The Pokémon Company, a company founded by Nintendo, Game Freak, and Creatures.'),
('StarCrafft', 'StarCraft is a military science fiction media franchise created by Chris Metzen and James Phinney and owned by Blizzard Entertainment.'),
('Subnautica', 'Subnautica is an open-world survival action-adventure video game developed and published by Unknown Worlds Entertainment. Players are free to explore the ocean on the alien planet 4546B, after their spaceship, the Aurora, crashes on the planet\'s surface.'),
('The Elder Scrolls', NULL),
('Yu-Gi-Oh!', 'Yu-Gi-Oh! (Japanese: 遊☆戯☆王, Hepburn: Yū-Gi-Ō!, lit. \"King of Games\") is a Japanese manga series about trading card gaming written and illustrated by Kazuki Takahashi.');
-- ***********************************************************************************************************
-- populating `review` table
-- ***********************************************************************************************************
INSERT INTO `review` (`Game_Id`, `User_Id`, `Head`, `Body`, `Rating`, `Date`) VALUES
(1, 3, 'Managed to feed my Fatal Frame nostalgia.', 'Definitely weakest in the FF franchise, but still good.\r\nLore is great just like with other parts.\r\nI feel the difficulty is easier than the rest, but then again I played first three on PS2, it has been a long time.\r\nWould be great if we had an opportunity to play FF2: Crimson Butterfly, which by far was the best.', 7, '2022-03-14 22:54:35'),
(1, 10, 'Emotional', 'It\'s been a long time since a video game\'s ending can make me this emotional. The characters are very well designed, especially Yuri and Ose. The game is super scary. I highly recommend playing with headphones.', 7, '2022-03-10 05:39:03'),
(2, 2, 'Great Game', 'Great, overall story, but most of the lore happens behind the scenes. The ending portion of the game is also heavily rushed.', 8, '2022-03-10 05:39:03'),
(3, 13, 'Super fun!', 'The combat is so much fun! Honestly, can\'t believe how much I love this game.', 6, '2022-03-10 05:39:48'),
(4, 1, 'AMAZING!', 'After putting these many hours, I must say that this is one of the best, if not THE best RPG. Period.', 9, '2022-03-10 05:39:03'),
(4, 2, 'By far the most fun I\'ve had with a Souls game. ', 'While the world is a bit more linear than DS1 and DS2, it more than makes up for it with much more fluid gameplay. I\'ve spent so much time playing it in different ways, including all \"normal\" builds, challenge runs like SL1, Skills only, no healing and magic only and with mods like Convergence. And even after over 700 hours, playing it is still enjoyable to me. Easily one of my favorite games and I can\'t recommend it enough.', 8, '2022-03-14 22:41:35'),
(4, 11, 'HARD AF', NULL, 6, '2022-03-10 05:43:00'),
(5, 6, 'BRRRRRRRRRR', 'Ultrakill make me go BRRRRRRRRRR and VRRRRRRRRRRRRRRRRRRRRRRR and RATATATATATATATATATATATA and KAPLOOEY', 8, '2022-03-14 23:18:20'),
(5, 7, 'FAST', 'Amazing game, fast-paced action, challenging but not impossible. Easily the best game I\'ve played all year, with influences from other retro FPS games.', 10, '2022-03-10 05:40:19'),
(5, 9, 'Great FPS!', 'Amazing game, fast paced action, challenging but not impossible. Easily the best game I\'ve played all year, with influences from other retro FPS games.', 3, '2022-03-10 05:40:48'),
(6, 7, 'This is how a free game should be designed. ', 'You have the option to pay to win. BUT you don\'t need it at all. It lets you get the cards you need for any deck without being forced to pay money. Or grind for 100s of hours.', 7, '2022-03-14 23:21:50'),
(6, 8, 'Terrible...', 'literally the worst card games I\'ve ever played. I\'m immeasurably disgusted by the infinite combos that guarantee the win each and every time.', 0, '2022-03-10 05:41:19'),
(7, 10, 'Game is really fun!', 'Procedural roads means you\'ll never drive on the same road!\r\n\r\n18 unique environments.\r\n\r\n10 cars.\r\n\r\nThe ability to customise the texture of your car.\r\n\r\nThis game would have made a killing as an arcade machine in the 80s..', 8, '2022-03-14 22:40:42'),
(10, 12, '\"My life for Aiur!\"', NULL, 10, '2022-03-10 05:41:43'),
(11, 11, 'Nostalgia', NULL, 8, '2022-03-10 05:42:40'),
(12, 8, 'Scary', 'I was afraid to go in the water. This game doesn\'t accommodate people with hydrophobia. Will be requesting a refund, IMMEDIATELY!', 0, '2022-03-10 05:42:15'),
(13, 12, 'Best MMORPG I\'ve ever played, definitely worth checking out. ', 'One character, ALL content including classes, jobs etc. BASE GAME AND FIRST EXPANSION ARE NOW FREE TO PLAY, with some restrictions.', 9, '2022-03-14 23:19:44'),
(14, 11, 'Too small', 'The issue is the map is too small, the game is scary but it doesn\'t have the size of the original or the depth in story, also the cyclops is not in the game so that\'s another negative, overall it feels as if the scope of this game has been lowered, i would still recommend as it is enjoyable, just not as enjoyable as the original', 6, '2022-03-14 23:20:42'),
(15, 1, 'yes', 'Good game', 9, '2022-03-14 23:24:02'),
(15, 13, 'The best video game I\'ve ever played.', 'The best video game I\'ve ever played.', 9, '2022-03-14 22:53:43'),
(18, 8, 'Explore!', 'I LOVE how there is different planets to explore and its easier to get currency than other games!!', 7, '2022-03-14 23:17:40'),
(19, 9, 'This Game was my Childhood', 'I couldn\'t tell you how many hours on PS3, PS4, XBOX360 i have spend escaping my problems by Completing Quests, Killing Dragons, Levelling up to the max to become a god! If you need the same then an adventure awaits!', 8, '2022-03-14 23:23:15');
-- ***********************************************************************************************************
-- populating `publisher` table
-- ***********************************************************************************************************
INSERT INTO `publisher` (`Name`, `Headquarters`, `About_URL`) VALUES
('Bandai Namco', 'Tokyo, Japan', 'https://www.bandainamcoent.com/'),
('Bethesda Softworks', 'Rockville, MD', 'https://bethesda.net/'),
('Blizzard Entertainment', 'Irvine, CA', 'http://blizzard.com/'),
('Devolver Digital', 'Austin, TX', 'https://www.devolverdigital.com/'),
('Digital Extremes', 'London, Canada', 'https://www.digitalextremes.com/'),
('Fabio Fontes', NULL, 'https://fabiofontes.com/'),
('Koei Tecmo', 'Yokohama, Kanagawa, Japan', 'https://www.koeitecmoamerica.com/'),
('Konami', 'Chuo City, Tokyo, Japan', 'https://www.konami.com/'),
('New Blood Interactive', 'Dusk, Pennsylvania', 'https://newblood.games/'),
('Nintendo', 'Kyoto, Kyoto, Japan', 'https://www.nintendo.com/'),
('Rubeki', 'Ontario, Canada', 'https://rubeki.com/'),
('Sloclap', 'Paris, France', 'http://sloclap.com/'),
('Sony Interactive Entertainment 	', 'San Mateo, CA', 'https://www.sie.com/'),
('Square Enix', 'Shinjuku City, Tokyo, Japan', 'https://www.square-enix.com/'),
('Tencent Games', 'Shenzhen, China', 'https://www.tencent.com/'),
('The Pokémon Company', 'Minato City, Tokyo, Japan', 'https://www.pokemon.com/'),
('Uknown Worlds Entertainment', 'San Francisco, CA', 'https://unknownworlds.com/'),
('ZeniMax', 'Rockville, MD', 'https://www.zenimax.com/');
-- ***********************************************************************************************************
-- populating `owned_games` table
-- ***********************************************************************************************************
INSERT INTO `owned_games` (`Game_Id`, `User_Id`, `Hours_Played`) VALUES
(1, 1, 20),
(1, 3, 8),
(1, 10, 20),
(2, 1, 100),
(2, 2, 37),
(2, 3, 20),
(2, 9, 86),
(3, 1, 100),
(3, 6, 37),
(3, 7, 16),
(3, 13, 9),
(4, 1, 200),
(4, 2, 16),
(4, 3, 31),
(4, 8, 81),
(4, 11, 10),
(5, 6, 11),
(5, 7, 16),
(5, 9, 7),
(6, 7, 9),
(6, 8, 2),
(6, 10, 1),
(7, 2, 7),
(7, 10, 4),
(9, 13, 68),
(10, 8, 27),
(10, 12, 800),
(11, 11, 50),
(12, 2, 30),
(12, 8, 5),
(12, 11, 9),
(13, 12, 40),
(15, 1, 45),
(15, 13, 12),
(16, 12, 13),
(17, 12, 20),
(18, 6, 100),
(18, 8, 25),
(19, 9, 100),
(20, 6, 20);
-- ***********************************************************************************************************
-- populating `genres` table
-- ***********************************************************************************************************
INSERT INTO `genres` (`Name`, `Description`) VALUES
('Action', 'An action game is a video game genre that emphasizes physical challenges, including hand–eye coordination and reaction-time. The genre includes a large variety of sub-genres, such as fighting games, beat \'em ups, shooter games, and platform games.'),
('Action RPG', 'Action role-playing games (abbreviated action RPG, action/RPG, or ARPG) form a loosely defined sub-genre of role-playing video games that incorporate elements of action or action-adventure games, emphasizing real-time action where the player has direct control over characters.'),
('Anime', NULL),
('Arena Shooter', 'An arena shooter is a subgenre of shooter games and multiplayer games that cover both the first-person shooter and third-person shooter genres. These games emphasize fast paced movement in enclosed map designs that foster engagement between players. '),
('Blood', NULL),
('Card', 'CCGs are games of strategy between two or more players. Each player has their own deck constructed from a very large pool of unique cards in the commercial market. The cards have different effects, costs, and art. New card sets are released periodically and sold as starter decks or booster packs.'),
('Character Customization', NULL),
('Early Access', 'Early access, also known as early funding, alpha access, alpha founding, or paid alpha, is a funding model in the video game industry by which consumers can purchase and play a game in the various pre-release development cycles.'),
('Exploration', NULL),
('Fantasy', 'Fantasy genre stories revolve around magic or supernatural forces, rather than technology. Stories from the fantasy genre are set in fanciful, invented worlds or in a legendary, mythic past that rely on the outright invention of magic.'),
('FPS', 'First-person shooter (FPS) is a sub-genre of shooter video games centered on gun and other weapon-based combat in a first-person perspective, with the player experiencing the action through the eyes of the protagonist and controlling the player character in a three-dimensional space.'),
('Horror', 'A horror game is a video game genre centered on horror fiction and typically designed to scare the player. Unlike most other video game genres, which are classified by their gameplay, horror games are nearly always based on narrative or visual presentation, and use a variety of gameplay types.'),
('Japanese RPG', 'Japanese Role-Playing Games (commonly known as JRPG) are games that have distinct features from Western-RPGs. JRPGs are typically made by Japanese developers but not exclusively. The term JRPG stems from console RPGs which defines games like Dragon Quest or Final Fantasy.'),
('Mature', NULL),
('MMO', 'MMORPG means massively multiplayer online role-playing games, and it\'s a type of video game that combines elements of role-playing games (RPGs) with the gameplay of multiplayer online gaming worlds.'),
('Mystery', 'The mystery genre is a genre of fiction that follows a crime (like a murder or a disappearance) from the moment it is committed to the moment it is solved.'),
('Nudity', NULL),
('Open World', 'Open-world video games are a type of video game where a player can roam freely through a virtual world and is given considerable freedom in choosing how or when to approach objectives.'),
('Party-Based RPG', NULL),
('PvP', 'Player versus player (PvP) refers to a game that is designed for gamers to compete against other gamers, rather than against the game\'s artificial intelligence (AI).'),
('Racing games are a video game ge', NULL),
('Retro', NULL),
('RPG', 'A role-playing game (RPG) is a genre of video game where the gamer controls a fictional character (or characters) that undertakes a quest in an imaginary world. '),
('Sci-Fi', 'Science fiction (sometimes shortened to sci-fi or SF) is a genre of speculative fiction which typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, and extraterrestrial life.'),
('Simulation', 'Simulation games are a genre of games that are designed to mimic activities you\'d see in the real world. '),
('Souls-Like', 'The genre was primarily inspired by classic Japanese video games, combining elements from the action-adventure, action RPG, Metroidvania, survival horror, hack & slash and fighting game genres.'),
('Space', NULL),
('Story Rich', NULL),
('Strategy', NULL),
('Survival', NULL),
('Third Person', NULL),
('Turn Based', NULL),
('Underwater', NULL),
('Violent', NULL);
-- ***********************************************************************************************************
-- populating `game_series` table
-- ***********************************************************************************************************
INSERT INTO `game_series` (`Series`, `Game_Id`) VALUES
('Chrono', 8),
('Dark Souls', 4),
('Fatal Frame', 1),
('Final Fantasy', 2),
('Final Fantasy', 13),
('Klonoa', 9),
('Nioh', 3),
('Pokémon', 11),
('StarCrafft', 10),
('Subnautica', 12),
('Yu-Gi-Oh!', 6);
-- ***********************************************************************************************************
-- populating `game_genres` table
-- ***********************************************************************************************************
INSERT INTO `game_genres` (`Genre`, `Game_Id`) VALUES
('Action', 3),
('Action RPG', 15),
('Anime', 1),
('Anime', 6),
('Card', 6),
('Character Customization', 3),
('Character Customization', 13),
('Exploration', 12),
('Fantasy', 19),
('Horror', 1),
('Japanese RPG', 2),
('Japanese RPG', 8),
('Japanese RPG', 11),
('Japanese RPG', 13),
('Japanese RPG', 20),
('MMO', 13),
('MMO', 18),
('Nudity', 1),
('Open World', 2),
('Open World', 15),
('Party-Based RPG', 8),
('Racing games are a video game ge', 7),
('RPG', 4),
('RPG', 19),
('Souls-Like', 4),
('Souls-Like', 15),
('Story Rich', 19),
('Underwater', 12);
-- ***********************************************************************************************************
-- populating `game_critic_publication` table
-- ***********************************************************************************************************
INSERT INTO `game_critic_publication` (`Publication`, `About_URL`, `Rating`) VALUES
('Destructoid', 'https://www.destructoid.com/', NULL),
('Game Informer', 'https://www.gameinformer.com/', NULL),
('GameRant', 'https://gamerant.com/', NULL),
('GameSpot', 'https://www.gamespot.com/', NULL),
('Gaming Nexus', 'https://www.gamingnexus.com/', NULL),
('IGN', 'https://www.ign.com/', NULL),
('NME', 'https://www.nme.com/', NULL),
('Old School Gamer', 'https://www.oldschoolgamermagazine.com/', NULL),
('PC Gamer', 'https://www.pcgamer.com/', NULL),
('Pocket Tactics', 'https://www.pockettactics.com/', NULL),
('Retro Gamer', 'https://www.retrogamer.net/', NULL);
-- ***********************************************************************************************************
-- populating `game` table
-- ***********************************************************************************************************
INSERT INTO `game` (`Id`, `Title`, `Series`, `Developer`, `Publisher`, `Release_Date`, `Image`) VALUES
(1, 'Fatal Frame: Maiden of Black Water', 'Fatal Frame', 'Koei Tecmo Games', 'Koei Tecmo', '2014-07-14', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1732190/capsule_616x353.jpg?t=1636940085'),
(2, 'Final Fantasy XV', 'Final Fantasy', 'Square Enix', 'Square Enix', '2016-11-29', 'https://cdn.akamai.steamstatic.com/steam/apps/637650/capsule_616x353.jpg?t=1592962568'),
(3, 'Nioh 2', 'Nioh', 'Team Ninja', 'Koei Tecmo', '2020-03-12', 'https://cdn.akamai.steamstatic.com/steam/apps/1325200/capsule_616x353.jpg?t=1624438008'),
(4, 'Dark Souls III', 'Dark Souls', 'From Software', 'Bandai Namco', '2016-03-24', 'https://cdn.akamai.steamstatic.com/steam/apps/374320/capsule_616x353.jpg?t=1638193506'),
(5, 'Ultrakill', NULL, 'Arsi \"Hakita\" Patala', 'New Blood Interactive', '2020-09-03', 'https://cdn.akamai.steamstatic.com/steam/apps/1229490/capsule_616x353.jpg?t=1624470586'),
(6, 'Yu-Gi-Oh! Master Duel', 'Yu-Gi-Oh!', 'Konami', 'Konami', '2022-01-18', 'https://cdn.akamai.steamstatic.com/steam/apps/1449850/capsule_616x353.jpg?t=1642554034'),
(7, 'Buck Up And Drive!', NULL, 'Fabio Fontes', 'Fabio Fontes', '2022-01-10', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1714590/header.jpg?t=1641827333'),
(8, 'Chrono Cross: The Radical Dreamers Edition', 'Chrono', 'Square Enix', 'Square Enix', '2022-04-07', 'https://assets.nintendo.com/image/upload/c_fill,f_auto,q_auto,w_1200/v1/ncom/en_US/games/switch/c/chrono-cross-the-radical-dreamers-edition-switch/hero'),
(9, 'KLONOA Phantasy Reverie Series', 'Klonoa', 'Bandai Namco', 'Bandai Namco', '2022-07-08', 'https://assets.nintendo.com/image/upload/ar_16:9,b_auto,c_pad,dpr_3.0,f_auto,q_auto,w_500/b_rgb:ffffff/v1/ncom/en_US/games/switch/k/klonoa-phantasy-reverie-series-switch/hero'),
(10, 'StarCraft', 'StarCrafft', 'Blizzard Entertainment', 'Blizzard Entertainment', '1998-03-31', 'https://bnetcmsus-a.akamaihd.net/cms/blog_thumbnail/ay/AYJ0P9WLD7IP1602720127239.jpg'),
(11, 'Pokémon Yellow', 'Pokémon', 'Game Freak', 'Nintendo', '1996-02-27', 'https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/game_boy_4/H2x1_GB_PokemonYellow_enGB_image1600w.jpg'),
(12, 'Subnautica', 'Subnautica', 'Unknown Worlds Entertainment', 'Uknown Worlds Entertainment', '2018-01-23', 'https://cdn.akamai.steamstatic.com/steam/apps/264710/capsule_616x353.jpg?t=1634241829'),
(13, 'FINAL FANTASY XIV Online', 'Final Fantasy', 'Square Enix', 'Square Enix', '2014-02-18', 'https://cdn.akamai.steamstatic.com/steam/apps/39210/capsule_616x353.jpg?t=1638928577'),
(14, 'Subnautica: Below Zero', 'Subnautica', 'Unknown Worlds Entertainment', 'Uknown Worlds Entertainment', '2021-05-13', 'https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_SubnauticaBelowZero_UnknownWorldsEntertainmentInc_S1_2560x1440-c8f0ba616d3dcd2ef3dcdd0c7d5e8967'),
(15, 'Elden Ring', NULL, 'From Software', 'Bandai Namco', '2022-02-25', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1245620/header.jpg?t=1646817776'),
(16, 'Lorn\'s Lure: Prologue', NULL, 'Rubeki', 'Rubeki', '2022-03-11', 'https://cdn.cloudflare.steamstatic.com/steam/apps/1417930/header.jpg?t=1647006655'),
(17, 'Sifu', NULL, 'Sloclap', 'Sloclap', '2022-02-06', 'https://cdn2.unrealengine.com/egs-greeneye-sloclap-ic1-400x400-7f5493d6af29.png?h=270&resize=1&w=480'),
(18, 'Warframe', NULL, 'Digital Extremes', 'Digital Extremes', '2013-03-25', 'https://cdn.cloudflare.steamstatic.com/steam/apps/230410/header.jpg?t=1645212234'),
(19, 'The Elder Scrolls V: Skyrim Special Edition', 'The Elder Scrolls', 'Bethesda Game Studios', 'Bethesda Softworks', '2016-10-27', 'https://cdn.cloudflare.steamstatic.com/steam/apps/489830/header.jpg?t=1636654357'),
(20, 'Pokémon Legends: Arceus', 'Pokémon', 'Game Freak', 'Nintendo', '2022-01-28', 'https://assets.nintendo.com/image/upload/ar_16:9,b_auto,c_pad,dpr_1.0,f_auto,q_auto,w_1200/b_rgb:ffffff/v1/ncom/en_US/games/switch/p/pokemon-legends-arceus-switch/hero');
-- ***********************************************************************************************************
-- populating `developer` table
-- ***********************************************************************************************************
INSERT INTO `developer` (`Name`, `Headquarters`, `About_URL`) VALUES
('Arkane Studios', 'Lyon, France', 'https://www.arkane-studios.com/'),
('Arsi \"Hakita\" Patala', 'Finland', 'https://twitter.com/HakitaDev'),
('Bandai Namco', 'Tokyo, Japan', 'https://www.bandainamcoent.com/'),
('Bethesda Game Studios', 'Rockville, MD', 'https://bethesdagamestudios.com/'),
('Blizzard Entertainment', 'Irvine, CA', 'http://blizzard.com/'),
('Digital Extremes', 'London, Canada', 'https://www.digitalextremes.com/'),
('Fabio Fontes', NULL, 'https://fabiofontes.com/'),
('From Software', 'Tokyo, Japan', 'https://www.fromsoftware.jp/ww/'),
('Game Freak', 'Setagaya City, Tokyo, Japan', 'https://www.gamefreak.co.jp'),
('id Software', 'Richardson, TX', 'https://www.idsoftware.com/'),
('Koei Tecmo Games', 'Yokohama, Kanagawa, Japan', 'https://www.koeitecmoamerica.com/'),
('Konami', 'Chuo City, Tokyo, Japan', 'https://www.konami.com/'),
('Machine Games', 'Uppsala, Sweden', 'https://www.machinegames.com/'),
('Rubeki', 'Ontario, Canada', 'https://rubeki.com/'),
('Sloclap', 'Paris, France', 'http://sloclap.com/en'),
('Square Enix', 'Shinjuku City, Tokyo, Japan', 'https://www.square-enix.com/'),
('Tango Gameworks', 'Tokyo, Japan', 'https://www.tangogameworks.com/'),
('Team Ninja', 'Tokyo, Japan', 'https://teamninja.com/'),
('Unknown Worlds Entertainment', 'San Francisco, CA', 'https://unknownworlds.com/'),
('ZeniMax Online Studios', 'Hunt Valley, Cockeysville, MD', 'https://www.zenimaxonline.com/');
-- *************************************************************************************************************************************
-- adding primary keys into tables
-- *************************************************************************************************************************************
ALTER TABLE `developer`
  ADD PRIMARY KEY (`Name`);

ALTER TABLE `game`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `game_developer_foreign` (`Developer`),
  ADD KEY `game_publisher_foreign` (`Publisher`),
  ADD KEY `game_series_foreign` (`Series`);

ALTER TABLE `game_critic_publication`
  ADD PRIMARY KEY (`Publication`);

ALTER TABLE `game_genres`
  ADD PRIMARY KEY (`Genre`,`Game_Id`),
  ADD KEY `game_genre_game_foreign` (`Game_Id`);

ALTER TABLE `game_series`
  ADD PRIMARY KEY (`Series`,`Game_Id`),
  ADD KEY `game_series_game_foreign` (`Game_Id`);

ALTER TABLE `genres`
  ADD PRIMARY KEY (`Name`);

ALTER TABLE `owned_games`
  ADD PRIMARY KEY (`Game_Id`,`User_Id`),
  ADD KEY `owned_games_user_foreign` (`User_Id`);

ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Name`);

ALTER TABLE `review`
  ADD PRIMARY KEY (`Game_Id`,`User_Id`),
  ADD KEY `review_user_foreign` (`User_Id`);

ALTER TABLE `series`
  ADD PRIMARY KEY (`Name`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `user_publication_foreign` (`Publication`);
-- *************************************************************************************************************************************
-- auto incrementing Id for games and users
-- *************************************************************************************************************************************
--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `Id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

-- *************************************************************************************************************************************
-- adding foreign keys into tables
-- *************************************************************************************************************************************
--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_developer_foreign` FOREIGN KEY (`Developer`) REFERENCES `developer` (`Name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `game_publisher_foreign` FOREIGN KEY (`Publisher`) REFERENCES `publisher` (`Name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `game_series_foreign` FOREIGN KEY (`Series`) REFERENCES `series` (`Name`) ON UPDATE CASCADE;
--
-- Constraints for table `game_genres`
--
ALTER TABLE `game_genres`
  ADD CONSTRAINT `game_genre_game_foreign` FOREIGN KEY (`Game_Id`) REFERENCES `game` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `game_genre_genres_foreign` FOREIGN KEY (`Genre`) REFERENCES `genres` (`Name`) ON UPDATE CASCADE;
--
-- Constraints for table `game_series`
--
ALTER TABLE `game_series`
  ADD CONSTRAINT `game_series_game_foreign` FOREIGN KEY (`Game_Id`) REFERENCES `game` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `game_series_series_foreign` FOREIGN KEY (`Series`) REFERENCES `series` (`Name`) ON UPDATE CASCADE;
--
-- Constraints for table `owned_games`
--
ALTER TABLE `owned_games`
  ADD CONSTRAINT `owned_games_game_foreign` FOREIGN KEY (`Game_Id`) REFERENCES `game` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `owned_games_user_foreign` FOREIGN KEY (`User_Id`) REFERENCES `user` (`Id`) ON UPDATE CASCADE;
--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_game_foreign` FOREIGN KEY (`Game_Id`) REFERENCES `game` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `review_user_foreign` FOREIGN KEY (`User_Id`) REFERENCES `user` (`Id`) ON UPDATE CASCADE;
--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_publication_foreign` FOREIGN KEY (`Publication`) REFERENCES `game_critic_publication` (`Publication`) ON UPDATE CASCADE;
COMMIT;
-- *************************************************************************************************************************************
-- *************************************************************************************************************************************

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;