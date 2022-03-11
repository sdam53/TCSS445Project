-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2022 at 12:24 PM
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
('Arkane Studios', 'Lyon, France', 'https://www.arkane-studios.com/'),
('Arsi \"Hakita\" Patala', 'Finland', 'https://twitter.com/HakitaDev'),
('Bandai Namco', 'Tokyo, Japan', 'https://www.bandainamcoent.com/'),
('Bethesda Game Studios', 'Rockville, MD', 'https://bethesdagamestudios.com/'),
('Blizzard Entertainment', 'Irvine, CA', 'http://blizzard.com/'),
('Fabio Fontes', NULL, 'https://fabiofontes.com/'),
('From Software', 'Tokyo, Japan', 'https://www.fromsoftware.jp/ww/'),
('Game Freak', 'Setagaya City, Tokyo, Japan', 'https://www.gamefreak.co.jp'),
('id Software', 'Richardson, TX', 'https://www.idsoftware.com/'),
('Koei Tecmo Games', 'Yokohama, Kanagawa, Japan', 'https://www.koeitecmoamerica.com/'),
('Konami', 'Chuo City, Tokyo, Japan', 'https://www.konami.com/'),
('Machine Games', 'Uppsala, Sweden', 'https://www.machinegames.com/'),
('Square Enix', 'Shinjuku City, Tokyo, Japan', 'https://www.square-enix.com/'),
('Tango Gameworks', 'Tokyo, Japan', 'https://www.tangogameworks.com/'),
('Team Ninja', 'Tokyo, Japan', 'https://teamninja.com/'),
('Unknown Worlds Entertainment', 'San Francisco, CA', 'https://unknownworlds.com/'),
('ZeniMax Online Studios', 'Hunt Valley, Cockeysville, MD', 'https://www.zenimaxonline.com/');

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
(12, 'Subnautica', 'StarCrafft', 'Unknown Worlds Entertainment', 'Uknown Worlds Entertainment', '2018-01-23', 'https://cdn.akamai.steamstatic.com/steam/apps/264710/capsule_616x353.jpg?t=1634241829'),
(13, 'FINAL FANTASY XIV Online', 'Final Fantasy', 'Square Enix', 'Square Enix', '2014-02-18', 'https://cdn.akamai.steamstatic.com/steam/apps/39210/capsule_616x353.jpg?t=1638928577'),
(14, 'Subnautica: Below Zero', 'Subnautica', 'Unknown Worlds Entertainment', 'Uknown Worlds Entertainment', '2021-05-13', 'https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_SubnauticaBelowZero_UnknownWorldsEntertainmentInc_S1_2560x1440-c8f0ba616d3dcd2ef3dcdd0c7d5e8967');

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
('Horror', 1),
('Japanese RPG', 2),
('Japanese RPG', 8),
('Japanese RPG', 11),
('Japanese RPG', 13),
('Nudity', 1),
('Racing games are a video game ge', 7),
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
  `Description` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

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
('Bandai Namco', 'Tokyo, Japan', 'https://www.bandainamcoent.com/'),
('Blizzard Entertainment', 'Irvine, CA', 'http://blizzard.com/'),
('Devolver Digital', 'Austin, TX', 'https://www.devolverdigital.com/'),
('Fabio Fontes', NULL, 'https://fabiofontes.com/'),
('Koei Tecmo', 'Yokohama, Kanagawa, Japan', 'https://www.koeitecmoamerica.com/'),
('Konami', 'Chuo City, Tokyo, Japan', 'https://www.konami.com/'),
('New Blood Interactive', 'Dusk, Pennsylvania', 'https://newblood.games/'),
('Nintendo', 'Kyoto, Kyoto, Japan', 'https://www.nintendo.com/'),
('Sony Interactive Entertainment 	', 'San Mateo, CA', 'https://www.sie.com/'),
('Square Enix', 'Shinjuku City, Tokyo, Japan', 'https://www.square-enix.com/'),
('Tencent Games', 'Shenzhen, China', 'https://www.tencent.com/'),
('The Pokémon Company', 'Minato City, Tokyo, Japan', 'https://www.pokemon.com/'),
('Uknown Worlds Entertainment', 'San Francisco, CA', 'https://unknownworlds.com/'),
('ZeniMax', 'Rockville, MD', 'https://www.zenimax.com/');

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
  `Description` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `series`
--

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
('Yu-Gi-Oh!', 'Yu-Gi-Oh! (Japanese: 遊☆戯☆王, Hepburn: Yū-Gi-Ō!, lit. \"King of Games\") is a Japanese manga series about trading card gaming written and illustrated by Kazuki Takahashi.');

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
