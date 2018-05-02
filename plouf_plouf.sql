-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 02 mai 2018 à 10:12
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `degree`
--

DROP TABLE IF EXISTS `degree`;
CREATE TABLE IF NOT EXISTS `degree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Level` int(11) NOT NULL,
  `Language` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `Text` varchar(300) NOT NULL,
  `Date` datetime NOT NULL,
  `Location` varchar(150) NOT NULL,
  `ID_Profil` int(11) NOT NULL,
  `ID_Activity` int(11) NOT NULL,
  `ID_Mood` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mood`
--

DROP TABLE IF EXISTS `mood`;
CREATE TABLE IF NOT EXISTS `mood` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MoodTxt` varchar(150) NOT NULL,
  `MoodImg` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Update_Date` datetime NOT NULL,
  `Statut` int(11) NOT NULL,
  `ID_Language` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`ID`),
  KEY `DepositDate` (`DepositDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `speaks`
--

DROP TABLE IF EXISTS `speaks`;
CREATE TABLE IF NOT EXISTS `speaks` (
  `ID_Profil` int(11) NOT NULL,
  `ID_Language` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
