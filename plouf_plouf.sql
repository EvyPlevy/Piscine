-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 05 mai 2018 à 20:52
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `plouf_plouf`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityTxt` varchar(150) NOT NULL,
  `ActivityImg` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`ID`, `ActivityTxt`, `ActivityImg`) VALUES
(1, 'en train de lire', 'http://www.emoji.co.uk/files/apple-emojis/objects-ios/746-open-book.png'),
(2, 'en train d\'ecouter de la musique', 'http://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-11/256/headphone.png'),
(3, 'en train de boire', 'http://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-11/256/tropical-drink.png'),
(4, 'en train de manger', 'http://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-11/256/doughnut.png'),
(5, 'en voyage', 'http://www.emoji.co.uk/files/apple-emojis/travel-places-ios/515-airplane.png');

-- --------------------------------------------------------

--
-- Structure de la table `commentary`
--

DROP TABLE IF EXISTS `commentary`;
CREATE TABLE IF NOT EXISTS `commentary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_media` int(11) NOT NULL,
  `ID_Profil` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Content` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentary`
--

INSERT INTO `commentary` (`ID`, `ID_media`, `ID_Profil`, `Date`, `Content`) VALUES
(1, 1, 1, '2018-05-02 14:00:00', 'Eh c\'est moi la plou belle'),
(2, 17, 2, '2018-05-04 15:29:00', ''),
(3, 17, 2, '2018-05-04 15:29:00', ''),
(4, 17, 2, '2018-05-04 15:29:00', ''),
(5, 17, 2, '2018-05-04 15:29:00', 'Commenter '),
(6, 17, 2, '2018-05-04 15:30:00', 'Commenter '),
(7, 17, 2, '2018-05-04 16:10:00', 'opiuygt'),
(8, 17, 2, '2018-05-04 16:53:00', 'oiuhg'),
(9, 17, 2, '2018-05-04 16:56:00', 'piuoygf'),
(10, 17, 2, '2018-05-04 16:56:00', 'poiuy'),
(11, 17, 2, '2018-05-04 20:49:00', 'opiouyg'),
(12, 17, 2, '2018-05-04 20:50:00', 'opiouyg'),
(13, 17, 2, '2018-05-04 20:50:00', '');

-- --------------------------------------------------------

--
-- Structure de la table `degree`
--

DROP TABLE IF EXISTS `degree`;
CREATE TABLE IF NOT EXISTS `degree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `degree`
--

INSERT INTO `degree` (`ID`, `Name`) VALUES
(1, 'Baccalaureat'),
(2, 'License'),
(3, 'BEP'),
(4, 'CAP'),
(5, 'BTS'),
(6, 'DUT'),
(7, 'DEUG'),
(8, 'Doctorat'),
(9, 'Master'),
(10, 'Diplôme d\'ingénieur');

-- --------------------------------------------------------

--
-- Structure de la table `degreerequired`
--

DROP TABLE IF EXISTS `degreerequired`;
CREATE TABLE IF NOT EXISTS `degreerequired` (
  `ID_Recruitment` int(11) NOT NULL,
  `ID_Degree` int(11) NOT NULL,
  KEY `Recruitment` (`ID_Recruitment`),
  KEY `ID_Degree` (`ID_Degree`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE IF NOT EXISTS `experience` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(150) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `BeginningDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `Organization` varchar(150) NOT NULL,
  `Location` varchar(150) NOT NULL,
  `ID_profile` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `experience`
--

INSERT INTO `experience` (`ID`, `Title`, `Description`, `BeginningDate`, `EndDate`, `Type`, `Organization`, `Location`, `ID_profile`) VALUES
(1, 'Stage chez PULV', 'Pétage de genoux et tirage de cheveux', '2018-04-08', '2018-04-10', 1, 'PULV', 'Paris', 1);

-- --------------------------------------------------------

--
-- Structure de la table `has_graduated`
--

DROP TABLE IF EXISTS `has_graduated`;
CREATE TABLE IF NOT EXISTS `has_graduated` (
  `ID_Profile` int(11) NOT NULL,
  `ID_Degree` int(11) NOT NULL,
  `Year` year(4) NOT NULL,
  `Country` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `has_graduated`
--

INSERT INTO `has_graduated` (`ID_Profile`, `ID_Degree`, `Year`, `Country`) VALUES
(1, 1, 2015, 'France'),
(2, 1, 2015, 'France');

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Language` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `language`
--

INSERT INTO `language` (`ID`, `Language`) VALUES
(1, 'Francais'),
(2, 'Anglais'),
(3, 'Russe'),
(4, 'Coréen');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` tinyint(4) NOT NULL,
  `URL` varchar(300) NOT NULL,
  `Album` varchar(300) NOT NULL,
  `Texte` varchar(300) NOT NULL,
  `Date` datetime NOT NULL,
  `Location` varchar(150) NOT NULL,
  `ID_Profil` int(11) NOT NULL,
  `ID_Activity` int(11) NOT NULL,
  `ID_Mood` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`ID`, `Type`, `URL`, `Album`, `Texte`, `Date`, `Location`, `ID_Profil`, `ID_Activity`, `ID_Mood`) VALUES
(14, 0, ' ', ' ', 'oiuytfxcvbnj', '2018-05-04 14:01:00', '', 2, 1, 2),
(15, 0, ' ', ' ', 'iuygvbhnj', '2018-05-04 14:02:00', '', 2, 1, 2),
(16, 0, ' ', ' ', 'iuytrfdfcv', '2018-05-04 14:02:00', '', 2, 1, 2),
(17, 1, 'upload/5aec6a83b9d144.45470220.png', ' ', 'uiyghj', '2018-05-04 14:13:00', '', 2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `mood`
--

DROP TABLE IF EXISTS `mood`;
CREATE TABLE IF NOT EXISTS `mood` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MoodTxt` varchar(150) NOT NULL,
  `MoodImg` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mood`
--

INSERT INTO `mood` (`ID`, `MoodTxt`, `MoodImg`) VALUES
(1, 'Amoureux', 'https://d24bnpykhxwj9p.cloudfront.net/s3file/s3fs-public/users1/2017-02/Fri/smiling-face-with-heart-shaped-eyes.png'),
(2, 'Tres Bien', 'https://www.geekjunior.fr/wp-content/uploads/2015/10/emoji-sourire-Snapchat.png'),
(3, 'Triste', 'https://i.pinimg.com/originals/16/a5/77/16a577624f9f16259ba4a02465cd854f.jpg'),
(4, 'Cool', 'https://i2.wp.com/lamineauxinfos.fr/wp-content/uploads/2015/04/Emoticones-Snapchat-signification.jpg'),
(5, 'Fatigue', 'http://www.hey.fr/tools/emoji/fr/ios_emoji_emoticone_visage_fatigue.png'),
(6, 'En colere', 'http://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-11/256/pouting-face.png'),
(7, 'Sarcastique', 'https://ih1.redbubble.net/image.302990784.7524/st%2Csmall%2C215x235-pad%2C210x230%2Cf8f8f8.lite-1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `network`
--

DROP TABLE IF EXISTS `network`;
CREATE TABLE IF NOT EXISTS `network` (
  `ID_person` int(11) NOT NULL,
  `ID_Friend` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `Accepted` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `network`
--

INSERT INTO `network` (`ID_person`, `ID_Friend`, `Type`, `Accepted`) VALUES
(1, 2, 0, b'01'),
(2, 1, 0, b'01');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `ID_Profil` int(11) NOT NULL,
  `ID_Media` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`ID_Profil`, `ID_Media`, `Type`, `Date`) VALUES
(1, 1, 1, '2018-05-02 14:00:00'),
(2, 12, 0, '2018-05-04 20:48:00'),
(2, 12, 2, '2018-05-04 20:50:00'),
(2, 13, 0, '2018-05-04 20:50:00'),
(2, 13, 2, '2018-05-04 20:50:00'),
(2, 14, 0, '2018-05-05 14:23:00');

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `ConnexionMode` bit(2) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `Id_Profile` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Surname` (`Surname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`ID`, `Name`, `Surname`, `Password`, `Mail`, `ConnexionMode`, `CreationDate`, `Id_Profile`) VALUES
(1, 'Duchesne', 'Anastasia', '12345', 'anastasia@ece.fr', b'01', '2018-05-02 12:35:00', 1),
(2, 'Schmitt', 'Camille', 'cam', 'camille@ece.fr', b'01', '2018-05-02 12:30:00', 2),
(3, 'Test', 'gne', 'gnegne', 'test@ece.fr', b'00', '2018-05-02 12:32:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Update_Date` datetime NOT NULL,
  `Statut` int(11) NOT NULL,
  `PhoneNumber` varchar(50) NOT NULL,
  `Skills` varchar(150) NOT NULL,
  `Picture_URL` varchar(300) NOT NULL,
  `CouvURL` varchar(300) NOT NULL,
  `ResumeeURL` varchar(300) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Website` varchar(300) NOT NULL,
  `Facebook` varchar(300) NOT NULL,
  `Twitter` varchar(300) NOT NULL,
  `LinkedIn` varchar(300) NOT NULL,
  `Instagram` varchar(300) NOT NULL,
  `ID_Person` int(11) NOT NULL,
  `ID_Organization` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`ID`, `Update_Date`, `Statut`, `PhoneNumber`, `Skills`, `Picture_URL`, `CouvURL`, `ResumeeURL`, `Country`, `Website`, `Facebook`, `Twitter`, `LinkedIn`, `Instagram`, `ID_Person`, `ID_Organization`) VALUES
(1, '2018-05-02 13:00:00', 3, '0011223344', 'bien bonne ;)', 'http://bagheera.b.a.pic.centerblog.net/7m3lapv7.jpg', 'http://bagheera.b.a.pic.centerblog.net/7m3lapv7.jpg', '', 'France', '', '', '', '', '', 1, 1),
(2, '2018-05-02 13:00:00', 3, '1122334455', 'pas trop mal :)', 'http://www.univers-cheval.com/images/cheval/wallpapers/real_8673-cheval-sur-fond-orange.jpg', 'http://www.univers-cheval.com/images/cheval/wallpapers/real_8673-cheval-sur-fond-orange.jpg', '', 'France', '', '', '', '', '', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
CREATE TABLE IF NOT EXISTS `reaction` (
  `ID_Profile` int(11) NOT NULL,
  `ID_Media` int(11) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reaction`
--

INSERT INTO `reaction` (`ID_Profile`, `ID_Media`, `Date`) VALUES
(1, 1, '2018-05-02 12:00:00'),
(2, 17, '2018-05-04 15:23:00'),
(2, 17, '2018-05-04 15:24:00'),
(2, 17, '2018-05-04 15:29:00'),
(2, 17, '2018-05-04 20:24:00'),
(2, 17, '2018-05-04 20:25:00'),
(2, 17, '2018-05-04 20:26:00'),
(2, 17, '2018-05-04 20:43:00'),
(2, 17, '2018-05-04 20:44:00'),
(2, 17, '2018-05-04 20:45:00'),
(2, 17, '2018-05-04 20:46:00'),
(2, 17, '2018-05-04 20:48:00'),
(2, 17, '2018-05-04 20:50:00'),
(2, 14, '2018-05-05 14:23:00');

-- --------------------------------------------------------

--
-- Structure de la table `recruitment`
--

DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE IF NOT EXISTS `recruitment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(300) NOT NULL,
  `DepositDate` datetime NOT NULL,
  `EndPostDate` datetime NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `Class` tinyint(4) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `BeginningDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Language` varchar(150) NOT NULL,
  `RequiredSkills` varchar(150) NOT NULL,
  `Archived` bit(2) NOT NULL,
  `ID_Rectruter` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DepositDate` (`DepositDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recruitment`
--

INSERT INTO `recruitment` (`ID`, `Description`, `DepositDate`, `EndPostDate`, `Country`, `Title`, `Class`, `Type`, `BeginningDate`, `EndDate`, `Language`, `RequiredSkills`, `Archived`, `ID_Rectruter`) VALUES
(1, 'Stage de pompom', '2018-05-02 00:00:00', '2018-05-31 00:00:00', 'France', 'Pompoooooooooooooom', 3, 1, '2018-06-09', '2018-06-12', 'Francais', 'Bowte', b'00', 2),
(2, 'plouf plouf', '2018-05-05 11:00:00', '2018-05-21 08:00:00', 'Russie', 'Sortie educative', 2, 0, '2018-05-15', '2018-05-30', 'Russe', 'maillot de bain', b'00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `speak`
--

DROP TABLE IF EXISTS `speak`;
CREATE TABLE IF NOT EXISTS `speak` (
  `ID_Profile` int(11) NOT NULL,
  `ID_Language` int(11) NOT NULL,
  `Level` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `speak`
--

INSERT INTO `speak` (`ID_Profile`, `ID_Language`, `Level`) VALUES
(1, 1, 5),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
CREATE TABLE IF NOT EXISTS `waitinglist` (
  `ID_Recruitment` int(11) NOT NULL,
  `ID_Profile` int(11) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `RegisterDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
