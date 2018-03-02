-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: slowpokebase
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `accountID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caught`
--

DROP TABLE IF EXISTS `Caught`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caught` (
  `accountID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` text NOT NULL,
  `pokemon_ID` int(11) NOT NULL,
  PRIMARY KEY (`accountID`,`pokemon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caught`
--

LOCK TABLES `Caught` WRITE;
/*!40000 ALTER TABLE `Caught` DISABLE KEYS */;
/*!40000 ALTER TABLE `Caught` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pokemon`
--

DROP TABLE IF EXISTS `Pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pokemon` (
  `pokedexID` int(255) NOT NULL,
  `gameID` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `poke_type` int(5) NOT NULL,
  `attack` int(5) NOT NULL,
  `defence` int(5) NOT NULL,
  `sp_att` int(5) NOT NULL,
  `sp_def` int(5) NOT NULL,
  `speed` int(5) NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`pokedexID`,`gameID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pokemon`
--

LOCK TABLES `Pokemon` WRITE;
/*!40000 ALTER TABLE `Pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TM`
--

DROP TABLE IF EXISTS `TM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TM` (
  `tmID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tmID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TM`
--

LOCK TABLES `TM` WRITE;
/*!40000 ALTER TABLE `TM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TableMember`
--

DROP TABLE IF EXISTS `TableMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TableMember` (
  `pokemon_ID` int(11) NOT NULL AUTO_INCREMENT,
  `pokedexID` int(11) NOT NULL,
  `gameID` int(11) NOT NULL,
  `tmID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pokemon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TableMember`
--

LOCK TABLES `TableMember` WRITE;
/*!40000 ALTER TABLE `TableMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `TableMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team` (
  `accountID` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `gameID` varchar(255) NOT NULL,
  `pokemon_ID` varchar(255) NOT NULL,
  `attack` int(5) DEFAULT NULL,
  `defence` int(5) DEFAULT NULL,
  `sp_att` int(5) DEFAULT NULL,
  `sp_def` int(5) DEFAULT NULL,
  `speed` int(5) DEFAULT NULL,
  PRIMARY KEY (`accountID`,`pokemon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `username` varchar(12) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 21:03:50
