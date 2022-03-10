-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2022 at 10:17 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `Name` varchar(64) NOT NULL,
  `Headquarters` varchar(255) DEFAULT NULL,
  `About_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`Name`, `Headquarters`, `About_URL`) VALUES
('Arkane Studios', NULL, NULL),
('Arsi \"Hakita\" Patala', NULL, NULL),
('Bandai Namco', NULL, NULL),
('Bethesda Game Studios', NULL, NULL),
('Blizzard Entertainment', NULL, NULL),
('Fabio Fontes', NULL, NULL),
('From Software', NULL, NULL),
('Game Freak', NULL, NULL),
('id Software', NULL, NULL),
('Koei Tecmo Games', NULL, NULL),
('Konami', NULL, NULL),
('Machine Games', NULL, NULL),
('Square Enix', NULL, NULL),
('Tango Gameworks', NULL, NULL),
('Team Ninja', NULL, NULL),
('Unknown Worlds Entertainment', NULL, NULL),
('ZeniMax Online Studios', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `Id` int(16) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Series` varchar(32) DEFAULT NULL,
  `Developer` varchar(64) NOT NULL,
  `Publisher` varchar(64) NOT NULL,
  `Release_Date` date NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`Id`, `Title`, `Series`, `Developer`, `Publisher`, `Release_Date`, `Image`) VALUES
(1, 'Fatal Frame: Maiden of Black Water', 'Fatal Frame', 'Koei Tecmo Games', 'Koei Tecmo', '2014-07-14', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(2, 'Final Fantasy XV', 'Final Fantasy', 'Square Enix', 'Square Enix', '2016-11-29', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(3, 'Nioh 2', 'Nioh', 'Team Ninja', 'Koei Tecmo', '2020-03-12', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(4, 'Darks souls III', 'Dark Souls', 'From Software', 'Bandai Namco', '2016-03-24', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(5, 'Ultrakill', NULL, 'Arsi \"Hakita\" Patala', 'New Blood Interactive', '2020-09-03', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(6, 'Yu-Gi-Oh! Master Duel', 'Yu-Gi-Oh!', 'Konami', 'Konami', '2022-01-18', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(7, 'Buck Up And Drive!', NULL, 'Fabio Fontes', 'Fabio Fontes', '2022-01-10', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(8, 'Chrono Cross: The Radical Dreamers Edition', 'Chrono', 'Square Enix', 'Square Enix', '2022-04-07', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(9, 'KLONOA Phantasy Reverie Series', 'Klonoa', 'Bandai Namco', 'Bandai Namco', '2022-07-08', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(10, 'StarCraft', 'StarCrafft', 'Blizzard Entertainment', 'Blizzard Entertainment', '1998-03-31', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(11, 'Pokémon Yellow', 'Pokémon', 'Game Freak', 'Nintendo', '1996-02-27', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(12, 'Subnautica', 'StarCrafft', 'Unknown Worlds Entertainment', 'Uknown Worlds Entertainment', '2018-01-23', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(13, 'FINAL FANTASY XIV Online', 'Final Fantasy', 'Square Enix', 'Square Enix', '2014-02-18', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg'),
(14, 'Subnautica: Below Zero', 'Subnautica', 'Unknown Worlds Entertainment', 'Uknown Worlds Entertainment', '2021-05-13', 'https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/sheep-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `game_critic_publication`
--

CREATE TABLE `game_critic_publication` (
  `Publication` varchar(16) NOT NULL,
  `About_URL` varchar(255) DEFAULT NULL,
  `Rating` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_critic_publication`
--

INSERT INTO `game_critic_publication` (`Publication`, `About_URL`, `Rating`) VALUES
('Destructoid', NULL, NULL),
('Game Informer', NULL, NULL),
('GameRant', NULL, NULL),
('GameSpot', NULL, NULL),
('Gaming Nexus', NULL, NULL),
('IGN', NULL, NULL),
('NME', NULL, NULL),
('Old School Gamer', NULL, NULL),
('PC Gamer', NULL, NULL),
('Pocket Tactics', NULL, NULL),
('Retro Gamer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_genres`
--

CREATE TABLE `game_genres` (
  `Genre` varchar(32) NOT NULL,
  `Game_Id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_genres`
--

INSERT INTO `game_genres` (`Genre`, `Game_Id`) VALUES
('Action', 3),
('Anime', 1),
('Card', 6),
('Driving', 7),
('Horror', 1),
('Japanese RPG', 2),
('Japanese RPG', 8),
('Japanese RPG', 11),
('Japanese RPG', 13),
('Nudity', 1),
('RPG', 4),
('Souls-Like', 4),
('Underwater', 12);

-- --------------------------------------------------------

--
-- Table structure for table `game_series`
--

CREATE TABLE `game_series` (
  `Series` varchar(32) NOT NULL,
  `Game_Id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game_series`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `Name` varchar(32) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`Name`, `Description`) VALUES
('Action', NULL),
('Action RPG', NULL),
('Anime', NULL),
('Arena Shooter', NULL),
('Blood', NULL),
('Card', NULL),
('Character Customization', NULL),
('Driving', NULL),
('Early Access', NULL),
('Exploration', NULL),
('Fantasy', NULL),
('FPS', NULL),
('Horror', NULL),
('Japanese RPG', NULL),
('Mature', NULL),
('Mystery', NULL),
('Nudity', NULL),
('Open World', NULL),
('Party-Based RPG', NULL),
('PvP', NULL),
('Retro', NULL),
('RPG', NULL),
('Sci-Fi', NULL),
('Simulation', NULL),
('Souls-Like', NULL),
('Space', NULL),
('Story Rich', NULL),
('Strategy', NULL),
('Survival', NULL),
('Third Person', NULL),
('Turn Based', NULL),
('Underwater', NULL),
('Violent', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `owned_games`
--

CREATE TABLE `owned_games` (
  `Game_Id` int(16) NOT NULL,
  `User_Id` int(16) NOT NULL,
  `Hours_Played` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owned_games`
--

INSERT INTO `owned_games` (`Game_Id`, `User_Id`, `Hours_Played`) VALUES
(1, 1, 20),
(1, 3, 8),
(2, 1, 100),
(2, 3, 20),
(2, 9, 86),
(3, 1, 100),
(3, 6, 37),
(3, 7, 16),
(4, 1, 200),
(4, 2, 16),
(4, 3, 31),
(4, 8, 81),
(6, 10, 1),
(7, 2, 7),
(7, 10, 4),
(9, 13, 68),
(10, 8, 27),
(10, 12, 800),
(12, 2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Name` varchar(64) NOT NULL,
  `Headquarters` varchar(128) DEFAULT NULL,
  `About_URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`Name`, `Headquarters`, `About_URL`) VALUES
('Bandai Namco', NULL, NULL),
('Blizzard Entertainment', NULL, NULL),
('Devolver Digital', NULL, NULL),
('Fabio Fontes', NULL, NULL),
('Koei Tecmo', NULL, NULL),
('Konami', NULL, NULL),
('New Blood Interactive', NULL, NULL),
('Nintendo', NULL, NULL),
('Sony Interactive Entertainment 	', NULL, NULL),
('Square Enix', NULL, NULL),
('Tencent Games', NULL, NULL),
('The Pokémon Company', NULL, NULL),
('Uknown Worlds Entertainment', NULL, NULL),
('ZeniMax', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Game_Id` int(16) NOT NULL,
  `User_Id` int(16) NOT NULL,
  `Head` varchar(128) NOT NULL,
  `Body` varchar(10000) DEFAULT NULL,
  `Rating` int(2) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Game_Id`, `User_Id`, `Head`, `Body`, `Rating`, `Date`) VALUES
(1, 10, 'Emotional', 'It\'s been a long time since a video game\'s ending can make me this emotional. The characters are very well designed, especially Yuri and Ose. The game is super scary. I highly recommend playing with headphones.', 7, '2022-03-10 05:39:03'),
(2, 2, 'Great Game', 'Great, overall story, but most of the lore happens behind the scenes. The ending portion of the game is also heavily rushed.', 8, '2022-03-10 05:39:03'),
(3, 13, 'Super fun!', 'The combat is so much fun! Honestly, can\'t believe how much I love this game.', 6, '2022-03-10 05:39:48'),
(4, 1, 'AMAZING!', 'After putting these many hours, I must say that this is one of the best, if not THE best RPG. Period.', 9, '2022-03-10 05:39:03'),
(4, 11, 'HARD AF', NULL, 6, '2022-03-10 05:43:00'),
(5, 7, 'FAST', 'Amazing game, fast-paced action, challenging but not impossible. Easily the best game I\'ve played all year, with influences from other retro FPS games.', 10, '2022-03-10 05:40:19'),
(5, 9, 'Great FPS!', 'Amazing game, fast paced action, challenging but not impossible. Easily the best game I\'ve played all year, with influences from other retro FPS games.', 3, '2022-03-10 05:40:48'),
(6, 8, 'Terrible...', 'literally the worst card games I\'ve ever played. I\'m immeasurably disgusted by the infinite combos that guarantee the win each and every time.', 0, '2022-03-10 05:41:19'),
(10, 12, '\"My life for Aiur!\"', NULL, 10, '2022-03-10 05:41:43'),
(11, 11, 'Nostalgia', NULL, 8, '2022-03-10 05:42:40'),
(12, 8, 'Scary', 'I was afraid to go in the water. This game doesn\'t accommodate people with hydrophobia. Will be requesting a refund, IMMEDIATELY!', 0, '2022-03-10 05:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `Name` varchar(32) NOT NULL,
  `Description` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`Name`, `Description`) VALUES
('Chrono', NULL),
('Dark Souls', NULL),
('Fatal Frame', NULL),
('Final Fantasy', NULL),
('Klonoa', NULL),
('Nioh', NULL),
('Pokémon', NULL),
('StarCrafft', NULL),
('Subnautica', NULL),
('Yu-Gi-Oh!', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

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

--
-- Dumping data for table `user`
--

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `game_developer_foreign` (`Developer`),
  ADD KEY `game_publisher_foreign` (`Publisher`),
  ADD KEY `game_series_foreign` (`Series`);

--
-- Indexes for table `game_critic_publication`
--
ALTER TABLE `game_critic_publication`
  ADD PRIMARY KEY (`Publication`);

--
-- Indexes for table `game_genres`
--
ALTER TABLE `game_genres`
  ADD PRIMARY KEY (`Genre`,`Game_Id`),
  ADD KEY `game_genre_game_foreign` (`Game_Id`);

--
-- Indexes for table `game_series`
--
ALTER TABLE `game_series`
  ADD PRIMARY KEY (`Series`,`Game_Id`),
  ADD KEY `game_series_game_foreign` (`Game_Id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `owned_games`
--
ALTER TABLE `owned_games`
  ADD PRIMARY KEY (`Game_Id`,`User_Id`),
  ADD KEY `owned_games_user_foreign` (`User_Id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Game_Id`,`User_Id`),
  ADD KEY `review_user_foreign` (`User_Id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `user_publication_foreign` (`Publication`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `Id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
