-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: SlowPokeBase
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'test@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','test@test.com'),(2,'fcp3','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','fcp3'),(3,'brbspamacc@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','brbspamacc@gmail.com'),(4,'brbspamacc2@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','brbspamacc2@gmail.com'),(5,'test1@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','test1@test.com'),(6,'testtest@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','testtest@test.com'),(7,'test2@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','test2@test.com'),(8,'test3@test.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','test3@test.com'),(9,'jimmytest@gmail.com','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','jimmytest@gmail.com'),(10,'mayra','99032fb72a5e1725a3df5ea44e6dce405c5f5b1b2ef34b24dd2e6fab8c54d998','mayra'),(11,'test1@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','test1@gmail.com');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Caught`
--

DROP TABLE IF EXISTS `Caught`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caught` (
  `accountID` int(11) NOT NULL,
  `gameID` varchar(50) DEFAULT NULL,
  `pokemonID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `sp_att` int(11) DEFAULT NULL,
  `sp_def` int(11) DEFAULT NULL,
  `sprite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pokemonID`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caught`
--

LOCK TABLES `Caught` WRITE;
/*!40000 ALTER TABLE `Caught` DISABLE KEYS */;
INSERT INTO `Caught` VALUES (1,'red-blue-yellow',1000,'blastoise',1,79,78,83,100,85,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png'),(1,'red-blue-yellow',1001,'blastoise',99,999,999,999,999,999,999,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png'),(3,'red-blue-yellow',1002,'Pikachu',50,35,90,55,40,50,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'),(1,'red-blue-yellow',1003,'charmander',1,39,65,52,43,60,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png'),(1,'red-blue-yellow',1004,'pikachu',90,90,90,90,90,90,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'),(3,'red-blue-yellow',1005,'Pikachu',2,35,90,55,40,50,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'),(3,'red-blue-yellow',1006,'Pikachu',1,35,90,55,40,50,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'),(3,'red-blue-yellow',1007,'Pikachu',67,35,0,0,0,0,0,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'),(1,'red-blue-yellow',1008,'blastoise',100,252,252,252,252,252,252,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png');
/*!40000 ALTER TABLE `Caught` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoubleTo`
--

DROP TABLE IF EXISTS `DoubleTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoubleTo` (
  `Attacking` varchar(20) NOT NULL,
  `Defending` varchar(20) NOT NULL,
  PRIMARY KEY (`Attacking`,`Defending`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoubleTo`
--

LOCK TABLES `DoubleTo` WRITE;
/*!40000 ALTER TABLE `DoubleTo` DISABLE KEYS */;
INSERT INTO `DoubleTo` VALUES ('bug','dark'),('bug','grass'),('bug','psychic'),('dark','ghost'),('dark','psychic'),('dragon','dragon'),('electric','flying'),('electric','water'),('fairy','dark'),('fairy','dragon'),('fairy','fighting'),('fighting','dark'),('fighting','ice'),('fighting','normal'),('fighting','rock'),('fighting','steel'),('fire','bug'),('fire','grass'),('fire','ice'),('fire','steel'),('flying','bug'),('flying','fighting'),('flying','grass'),('ghost','ghost'),('ghost','psychic'),('grass','ground'),('grass','rock'),('grass','water'),('ground','electric'),('ground','fire'),('ground','poison'),('ground','rock'),('ground','steel'),('ice','dragon'),('ice','flying'),('ice','grass'),('ice','ground'),('poison','fairy'),('poison','grass'),('psychic','fighting'),('psychic','poison'),('rock','bug'),('rock','fire'),('rock','flying'),('rock','ice'),('steel','fairy'),('steel','ice'),('steel','rock'),('water','fire'),('water','ground'),('water','rock');
/*!40000 ALTER TABLE `DoubleTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HalfTo`
--

DROP TABLE IF EXISTS `HalfTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HalfTo` (
  `Attacking` varchar(20) NOT NULL,
  `Defending` varchar(20) NOT NULL,
  PRIMARY KEY (`Attacking`,`Defending`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HalfTo`
--

LOCK TABLES `HalfTo` WRITE;
/*!40000 ALTER TABLE `HalfTo` DISABLE KEYS */;
INSERT INTO `HalfTo` VALUES ('bug','fairy'),('bug','fighting'),('bug','fire'),('bug','flying'),('bug','ghost'),('bug','poison'),('bug','steel'),('dark','dark'),('dark','fairy'),('dark','fighting'),('dragon','steel'),('electric','dragon'),('electric','electric'),('electric','grass'),('fairy','fire'),('fairy','poison'),('fairy','steel'),('fighting','bug'),('fighting','fairy'),('fighting','flying'),('fighting','poison'),('fighting','psychic'),('fire','dragon'),('fire','fire'),('fire','rock'),('fire','water'),('flying','electric'),('flying','rock'),('flying','steel'),('ghost','dark'),('grass','bug'),('grass','dragon'),('grass','fire'),('grass','flying'),('grass','grass'),('grass','poison'),('grass','steel'),('ground','bug'),('ground','grass'),('ice','fire'),('ice','ice'),('ice','steel'),('ice','water'),('normal','rock'),('normal','steel'),('poison','ghost'),('poison','ground'),('poison','poison'),('poison','rock'),('psychic','psychic'),('psychic','steel'),('rock','fighting'),('rock','ground'),('rock','steel'),('steel','electric'),('steel','fire'),('steel','steel'),('steel','water'),('water','dragon'),('water','grass'),('water','water');
/*!40000 ALTER TABLE `HalfTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NullTo`
--

DROP TABLE IF EXISTS `NullTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NullTo` (
  `Attacking` varchar(20) NOT NULL,
  `Defending` varchar(20) NOT NULL,
  PRIMARY KEY (`Attacking`,`Defending`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NullTo`
--

LOCK TABLES `NullTo` WRITE;
/*!40000 ALTER TABLE `NullTo` DISABLE KEYS */;
INSERT INTO `NullTo` VALUES ('dragon','fairy'),('electric','ground'),('fighting','ghost'),('ghost','normal'),('ground','flying'),('normal','ghost'),('poison','steel'),('psychic','dark');
/*!40000 ALTER TABLE `NullTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pokemon`
--

DROP TABLE IF EXISTS `Pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pokemon` (
  `pokedexID` int(11) NOT NULL,
  `gameID` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `type_1` char(25) NOT NULL,
  `type_2` char(25) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `sp_att` int(11) NOT NULL,
  `sp_def` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `sprite` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`pokedexID`,`gameID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pokemon`
--

LOCK TABLES `Pokemon` WRITE;
/*!40000 ALTER TABLE `Pokemon` DISABLE KEYS */;
INSERT INTO `Pokemon` VALUES (0,'red-blue-yellow','bulbasaur','poison','grass',49,49,65,65,45,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',1),(1,'red-blue-yellow','ivysaur','poison','grass',62,63,80,80,60,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',1),(2,'red-blue-yellow','venusaur','poison','grass',82,83,100,100,80,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',1),(3,'red-blue-yellow','charmander','fire','none',52,43,60,50,65,39,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',1),(4,'red-blue-yellow','charmeleon','fire','none',64,58,80,65,80,58,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png',1),(5,'red-blue-yellow','charizard','flying','fire',84,78,109,85,100,78,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',1),(6,'red-blue-yellow','squirtle','water','none',48,65,50,64,43,44,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png',1),(7,'red-blue-yellow','wartortle','water','none',63,80,65,80,58,59,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png',1),(8,'red-blue-yellow','blastoise','water','none',83,100,85,105,78,79,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png',1),(9,'red-blue-yellow','caterpie','bug','none',30,35,20,20,45,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png',1),(10,'red-blue-yellow','metapod','bug','none',20,55,25,25,30,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png',1),(11,'red-blue-yellow','butterfree','flying','bug',45,50,90,80,70,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png',1),(12,'red-blue-yellow','weedle','poison','bug',35,30,20,20,50,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png',1),(13,'red-blue-yellow','kakuna','poison','bug',25,50,25,25,35,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png',1),(14,'red-blue-yellow','beedrill','poison','bug',90,40,45,80,75,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png',1),(15,'red-blue-yellow','pidgey','flying','normal',45,40,35,35,56,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png',1),(16,'red-blue-yellow','pidgeotto','flying','normal',60,55,50,50,71,63,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png',1),(17,'red-blue-yellow','pidgeot','flying','normal',80,75,70,70,101,83,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png',1),(18,'red-blue-yellow','rattata','normal','none',56,35,25,35,72,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png',1),(19,'red-blue-yellow','raticate','normal','none',81,60,50,70,97,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png',1),(20,'red-blue-yellow','spearow','flying','normal',60,30,31,31,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/21.png',1),(21,'red-blue-yellow','fearow','flying','normal',90,65,61,61,100,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/22.png',1),(22,'red-blue-yellow','ekans','poison','none',60,44,40,54,55,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/23.png',1),(23,'red-blue-yellow','arbok','poison','none',95,69,65,79,80,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/24.png',1),(24,'red-blue-yellow','pikachu','electric','none',55,40,50,50,90,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',1),(25,'red-blue-yellow','raichu','electric','none',90,55,90,80,110,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/26.png',1),(26,'red-blue-yellow','sandshrew','ground','none',75,85,20,30,40,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/27.png',1),(27,'red-blue-yellow','sandslash','ground','none',100,110,45,55,65,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/28.png',1),(28,'red-blue-yellow','nidoran-f','poison','none',47,52,40,40,41,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/29.png',1),(29,'red-blue-yellow','nidorina','poison','none',62,67,55,55,56,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/30.png',1),(30,'red-blue-yellow','nidoqueen','ground','poison',92,87,75,85,76,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/31.png',1),(31,'red-blue-yellow','nidoran-m','poison','none',57,40,40,40,50,46,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/32.png',1),(32,'red-blue-yellow','nidorino','poison','none',72,57,55,55,65,61,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/33.png',1),(33,'red-blue-yellow','nidoking','ground','poison',102,77,85,75,85,81,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/34.png',1),(34,'red-blue-yellow','clefairy','fairy','none',45,48,60,65,35,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/35.png',1),(35,'red-blue-yellow','clefable','fairy','none',70,73,95,90,60,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/36.png',1),(36,'red-blue-yellow','vulpix','fire','none',41,40,50,65,65,38,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/37.png',1),(37,'red-blue-yellow','ninetales','fire','none',76,75,81,100,100,73,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/38.png',1),(38,'red-blue-yellow','jigglypuff','fairy','normal',45,20,45,25,20,115,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png',1),(39,'red-blue-yellow','wigglytuff','fairy','normal',70,45,85,50,45,140,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/40.png',1),(40,'red-blue-yellow','zubat','flying','poison',45,35,30,40,55,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/41.png',1),(41,'red-blue-yellow','golbat','flying','poison',80,70,65,75,90,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/42.png',1),(42,'red-blue-yellow','oddish','poison','grass',50,55,75,65,30,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/43.png',1),(43,'red-blue-yellow','gloom','poison','grass',65,70,85,75,40,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/44.png',1),(44,'red-blue-yellow','vileplume','poison','grass',80,85,110,90,50,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/45.png',1),(45,'red-blue-yellow','paras','grass','bug',70,55,45,55,25,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/46.png',1),(46,'red-blue-yellow','parasect','grass','bug',95,80,60,80,30,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/47.png',1),(47,'red-blue-yellow','venonat','poison','bug',55,50,40,55,45,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/48.png',1),(48,'red-blue-yellow','venomoth','poison','bug',65,60,90,75,90,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/49.png',1),(49,'red-blue-yellow','diglett','ground','none',55,25,35,45,95,10,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/50.png',1),(50,'red-blue-yellow','dugtrio','ground','none',100,50,50,70,120,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/51.png',1),(51,'red-blue-yellow','meowth','normal','none',45,35,40,40,90,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png',1),(52,'red-blue-yellow','persian','normal','none',70,60,65,65,115,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/53.png',1),(53,'red-blue-yellow','psyduck','water','none',52,48,65,50,55,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/54.png',1),(54,'red-blue-yellow','golduck','water','none',82,78,95,80,85,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/55.png',1),(55,'red-blue-yellow','mankey','fighting','none',80,35,35,45,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png',1),(56,'red-blue-yellow','primeape','fighting','none',105,60,60,70,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/57.png',1),(57,'red-blue-yellow','growlithe','fire','none',70,45,70,50,60,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/58.png',1),(58,'red-blue-yellow','arcanine','fire','none',110,80,100,80,95,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/59.png',1),(59,'red-blue-yellow','poliwag','water','none',50,40,40,40,90,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/60.png',1),(60,'red-blue-yellow','poliwhirl','water','none',65,65,50,50,90,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/61.png',1),(61,'red-blue-yellow','poliwrath','fighting','water',95,95,70,90,70,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/62.png',1),(62,'red-blue-yellow','abra','psychic','none',20,15,105,55,90,25,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/63.png',1),(63,'red-blue-yellow','kadabra','psychic','none',35,30,120,70,105,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/64.png',1),(64,'red-blue-yellow','alakazam','psychic','none',50,45,135,95,120,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/65.png',1),(65,'red-blue-yellow','machop','fighting','none',80,50,35,35,35,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/66.png',1),(66,'red-blue-yellow','machoke','fighting','none',100,70,50,60,45,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/67.png',1),(67,'red-blue-yellow','machamp','fighting','none',130,80,65,85,55,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/68.png',1),(68,'red-blue-yellow','bellsprout','poison','grass',75,35,70,30,40,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/69.png',1),(69,'red-blue-yellow','weepinbell','poison','grass',90,50,85,45,55,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/70.png',1),(70,'red-blue-yellow','victreebel','poison','grass',105,65,100,70,70,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/71.png',1),(71,'red-blue-yellow','tentacool','poison','water',40,35,50,100,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/72.png',1),(72,'red-blue-yellow','tentacruel','poison','water',70,65,80,120,100,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/73.png',1),(73,'red-blue-yellow','geodude','ground','rock',80,100,30,30,20,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/74.png',1),(74,'red-blue-yellow','graveler','ground','rock',95,115,45,45,35,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/75.png',1),(75,'red-blue-yellow','golem','ground','rock',120,130,55,65,45,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/76.png',1),(76,'red-blue-yellow','ponyta','fire','none',85,55,65,65,90,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/77.png',1),(77,'red-blue-yellow','rapidash','fire','none',100,70,80,80,105,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/78.png',1),(78,'red-blue-yellow','slowpoke','psychic','water',65,65,40,40,15,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/79.png',1),(79,'red-blue-yellow','slowbro','psychic','water',75,110,100,80,30,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/80.png',1),(80,'red-blue-yellow','magnemite','steel','electric',35,70,95,55,45,25,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/81.png',1),(81,'red-blue-yellow','magneton','steel','electric',60,95,120,70,70,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/82.png',1),(82,'red-blue-yellow','farfetchd','flying','normal',90,55,58,62,60,52,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/83.png',1),(83,'red-blue-yellow','doduo','flying','normal',85,45,35,35,75,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/84.png',1),(84,'red-blue-yellow','dodrio','flying','normal',110,70,60,60,110,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/85.png',1),(85,'red-blue-yellow','seel','water','none',45,55,45,70,45,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/86.png',1),(86,'red-blue-yellow','dewgong','ice','water',70,80,70,95,70,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/87.png',1),(87,'red-blue-yellow','grimer','poison','none',80,50,40,50,25,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/88.png',1),(88,'red-blue-yellow','muk','poison','none',105,75,65,100,50,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/89.png',1),(89,'red-blue-yellow','shellder','water','none',65,100,45,25,40,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/90.png',1),(90,'red-blue-yellow','cloyster','ice','water',95,180,85,45,70,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/91.png',1),(91,'red-blue-yellow','gastly','poison','ghost',35,30,100,35,80,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/92.png',1),(92,'red-blue-yellow','haunter','poison','ghost',50,45,115,55,95,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/93.png',1),(93,'red-blue-yellow','gengar','poison','ghost',65,60,130,75,110,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/94.png',1),(94,'red-blue-yellow','onix','ground','rock',45,160,30,45,70,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/95.png',1),(95,'red-blue-yellow','drowzee','psychic','none',48,45,43,90,42,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/96.png',1),(96,'red-blue-yellow','hypno','psychic','none',73,70,73,115,67,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/97.png',1),(97,'red-blue-yellow','krabby','water','none',105,90,25,25,50,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/98.png',1),(98,'red-blue-yellow','kingler','water','none',130,115,50,50,75,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/99.png',1),(99,'red-blue-yellow','voltorb','electric','none',30,50,55,55,100,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/100.png',1),(100,'red-blue-yellow','electrode','electric','none',50,70,80,80,150,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/101.png',1),(101,'red-blue-yellow','exeggcute','psychic','grass',40,80,60,45,40,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/102.png',1),(102,'red-blue-yellow','exeggutor','psychic','grass',95,85,125,75,55,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/103.png',1),(103,'red-blue-yellow','cubone','ground','none',50,95,40,50,35,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/104.png',1),(104,'red-blue-yellow','marowak','ground','none',80,110,50,80,45,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/105.png',1),(105,'red-blue-yellow','hitmonlee','fighting','none',120,53,35,110,87,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/106.png',1),(106,'red-blue-yellow','hitmonchan','fighting','none',105,79,35,110,76,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/107.png',1),(107,'red-blue-yellow','lickitung','normal','none',55,75,60,75,30,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/108.png',1),(108,'red-blue-yellow','koffing','poison','none',65,95,60,45,35,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/109.png',1),(109,'red-blue-yellow','weezing','poison','none',90,120,85,70,60,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/110.png',1),(110,'red-blue-yellow','rhyhorn','rock','ground',85,95,30,30,25,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/111.png',1),(111,'red-blue-yellow','rhydon','rock','ground',130,120,45,45,40,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/112.png',1),(112,'red-blue-yellow','chansey','normal','none',5,5,35,105,50,250,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/113.png',1),(113,'red-blue-yellow','tangela','grass','none',55,115,100,40,60,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/114.png',1),(114,'red-blue-yellow','kangaskhan','normal','none',95,80,40,80,90,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/115.png',1),(115,'red-blue-yellow','horsea','water','none',40,70,70,25,60,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/116.png',1),(116,'red-blue-yellow','seadra','water','none',65,95,95,45,85,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/117.png',1),(117,'red-blue-yellow','goldeen','water','none',67,60,35,50,63,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/118.png',1),(118,'red-blue-yellow','seaking','water','none',92,65,65,80,68,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/119.png',1),(119,'red-blue-yellow','staryu','water','none',45,55,70,55,85,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/120.png',1),(120,'red-blue-yellow','starmie','psychic','water',75,85,100,85,115,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/121.png',1),(121,'red-blue-yellow','mr-mime','fairy','psychic',45,65,100,120,90,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/122.png',1),(122,'red-blue-yellow','scyther','flying','bug',110,80,55,80,105,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/123.png',1),(123,'red-blue-yellow','jynx','psychic','ice',50,35,115,95,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/124.png',1),(124,'red-blue-yellow','electabuzz','electric','none',83,57,95,85,105,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/125.png',1),(125,'red-blue-yellow','magmar','fire','none',95,57,100,85,93,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/126.png',1),(126,'red-blue-yellow','pinsir','bug','none',125,100,55,70,85,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/127.png',1),(127,'red-blue-yellow','tauros','normal','none',100,95,40,70,110,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/128.png',1),(128,'red-blue-yellow','magikarp','water','none',10,55,15,20,80,20,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/129.png',1),(129,'red-blue-yellow','gyarados','flying','water',125,79,60,100,81,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/130.png',1),(130,'red-blue-yellow','lapras','ice','water',85,80,85,95,60,130,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/131.png',1),(131,'red-blue-yellow','ditto','normal','none',48,48,48,48,48,48,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png',1),(132,'red-blue-yellow','eevee','normal','none',55,50,45,65,55,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png',1),(133,'red-blue-yellow','vaporeon','water','none',65,60,110,95,65,130,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/134.png',1),(134,'red-blue-yellow','jolteon','electric','none',65,60,110,95,130,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/135.png',1),(135,'red-blue-yellow','flareon','fire','none',130,60,95,110,65,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/136.png',1),(136,'red-blue-yellow','porygon','normal','none',60,70,85,75,40,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/137.png',1),(137,'red-blue-yellow','omanyte','water','rock',40,100,90,55,35,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/138.png',1),(138,'red-blue-yellow','omastar','water','rock',60,125,115,70,55,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/139.png',1),(139,'red-blue-yellow','kabuto','water','rock',80,90,55,45,55,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/140.png',1),(140,'red-blue-yellow','kabutops','water','rock',115,105,65,70,80,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/141.png',1),(141,'red-blue-yellow','aerodactyl','flying','rock',105,65,60,75,130,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/142.png',1),(142,'red-blue-yellow','snorlax','normal','none',110,65,65,110,30,160,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png',1),(143,'red-blue-yellow','articuno','flying','ice',85,100,95,125,85,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/144.png',1),(144,'red-blue-yellow','zapdos','flying','electric',90,85,125,90,100,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/145.png',1),(145,'red-blue-yellow','moltres','flying','fire',100,90,125,85,90,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/146.png',1),(146,'red-blue-yellow','dratini','dragon','none',64,45,50,50,50,41,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/147.png',1),(147,'red-blue-yellow','dragonair','dragon','none',84,65,70,70,70,61,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/148.png',1),(148,'red-blue-yellow','dragonite','flying','dragon',134,95,100,100,80,91,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/149.png',1),(149,'red-blue-yellow','mewtwo','psychic','none',110,90,154,90,130,106,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png',1),(150,'red-blue-yellow','mew','psychic','none',100,100,100,100,100,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png',1),(151,'gold-silver-crystal','chikorita','grass','none',49,65,49,65,45,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png',1),(152,'gold-silver-crystal','bayleef','grass','none',62,80,63,80,60,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/153.png',1),(153,'gold-silver-crystal','meganium','grass','none',82,100,83,100,80,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/154.png',1),(154,'gold-silver-crystal','cyndaquil','fire','none',52,43,60,50,65,39,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/155.png',1),(155,'gold-silver-crystal','quilava','fire','none',64,58,80,65,80,58,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/156.png',1),(156,'gold-silver-crystal','typhlosion','fire','none',84,78,109,85,100,78,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/157.png',1),(157,'gold-silver-crystal','totodile','water','none',65,64,44,48,43,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/158.png',1),(158,'gold-silver-crystal','croconaw','water','none',80,80,59,63,58,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/159.png',1),(159,'gold-silver-crystal','feraligatr','water','none',105,100,79,83,78,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/160.png',1),(160,'gold-silver-crystal','sentret','normal','none',46,34,35,45,20,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/161.png',1),(161,'gold-silver-crystal','furret','normal','none',76,64,45,55,90,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/162.png',1),(162,'gold-silver-crystal','hoothoot','flying','normal',30,30,36,56,50,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png',1),(163,'gold-silver-crystal','noctowl','flying','normal',50,50,86,96,70,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/164.png',1),(164,'gold-silver-crystal','ledyba','flying','bug',20,30,40,80,55,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/165.png',1),(165,'gold-silver-crystal','ledian','flying','bug',35,50,55,110,85,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/166.png',1),(166,'gold-silver-crystal','spinarak','poison','bug',60,40,40,40,30,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/167.png',1),(167,'gold-silver-crystal','ariados','poison','bug',90,70,60,70,40,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/168.png',1),(168,'gold-silver-crystal','crobat','flying','poison',90,80,70,80,130,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/169.png',1),(169,'gold-silver-crystal','chinchou','electric','water',38,38,56,56,67,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/170.png',1),(170,'gold-silver-crystal','lanturn','electric','water',58,58,76,76,67,125,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/171.png',1),(171,'gold-silver-crystal','pichu','electric','none',40,15,35,35,60,20,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/172.png',1),(172,'gold-silver-crystal','cleffa','fairy','none',25,28,45,55,15,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/173.png',1),(173,'gold-silver-crystal','igglybuff','fairy','normal',30,15,40,20,15,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/174.png',1),(174,'gold-silver-crystal','togepi','fairy','none',20,65,40,65,20,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/175.png',1),(175,'gold-silver-crystal','togetic','flying','fairy',40,85,80,105,40,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/176.png',1),(176,'gold-silver-crystal','natu','flying','psychic',50,45,70,45,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/177.png',1),(177,'gold-silver-crystal','xatu','flying','psychic',75,70,95,70,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/178.png',1),(178,'gold-silver-crystal','mareep','electric','none',40,40,65,45,35,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/179.png',1),(179,'gold-silver-crystal','flaaffy','electric','none',55,55,80,60,45,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/180.png',1),(180,'gold-silver-crystal','ampharos','electric','none',75,85,115,90,55,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/181.png',1),(181,'gold-silver-crystal','bellossom','grass','none',80,95,90,100,50,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/182.png',1),(182,'gold-silver-crystal','marill','fairy','water',20,50,20,50,40,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/183.png',1),(183,'gold-silver-crystal','azumarill','fairy','water',50,80,60,80,50,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/184.png',1),(184,'gold-silver-crystal','sudowoodo','rock','none',100,115,30,65,30,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/185.png',1),(185,'gold-silver-crystal','politoed','water','none',75,75,90,100,70,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/186.png',1),(186,'gold-silver-crystal','hoppip','flying','grass',35,40,35,55,50,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/187.png',1),(187,'gold-silver-crystal','skiploom','flying','grass',45,50,45,65,80,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/188.png',1),(188,'gold-silver-crystal','jumpluff','flying','grass',55,70,55,95,110,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/189.png',1),(189,'gold-silver-crystal','aipom','normal','none',70,55,40,55,85,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/190.png',1),(190,'gold-silver-crystal','sunkern','grass','none',30,30,30,30,30,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/191.png',1),(191,'gold-silver-crystal','sunflora','grass','none',75,55,105,85,30,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/192.png',1),(192,'gold-silver-crystal','yanma','flying','bug',65,45,75,45,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/193.png',1),(193,'gold-silver-crystal','wooper','ground','water',45,45,25,25,15,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/194.png',1),(194,'gold-silver-crystal','quagsire','ground','water',85,85,65,65,35,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/195.png',1),(195,'gold-silver-crystal','espeon','psychic','none',65,60,130,95,110,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/196.png',1),(196,'gold-silver-crystal','umbreon','dark','none',65,110,60,130,65,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/197.png',1),(197,'gold-silver-crystal','murkrow','flying','dark',85,42,85,42,91,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/198.png',1),(198,'gold-silver-crystal','slowking','psychic','water',75,80,100,110,30,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/199.png',1),(199,'gold-silver-crystal','misdreavus','ghost','none',60,60,85,85,85,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/200.png',1),(200,'gold-silver-crystal','unown','psychic','none',72,48,72,48,48,48,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/201.png',1),(201,'gold-silver-crystal','wobbuffet','psychic','none',33,58,33,58,33,190,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/202.png',1),(202,'gold-silver-crystal','girafarig','psychic','normal',80,65,90,65,85,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/203.png',1),(203,'gold-silver-crystal','pineco','bug','none',65,90,35,35,15,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/204.png',1),(204,'gold-silver-crystal','forretress','steel','bug',90,140,60,60,40,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/205.png',1),(205,'gold-silver-crystal','dunsparce','normal','none',70,70,65,65,45,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/206.png',1),(206,'gold-silver-crystal','gligar','flying','ground',75,105,35,65,85,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/207.png',1),(207,'gold-silver-crystal','steelix','ground','steel',85,200,55,65,30,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/208.png',1),(208,'gold-silver-crystal','snubbull','fairy','none',80,50,40,40,30,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/209.png',1),(209,'gold-silver-crystal','granbull','fairy','none',120,75,60,60,45,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/210.png',1),(210,'gold-silver-crystal','qwilfish','poison','water',95,85,55,55,85,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/211.png',1),(211,'gold-silver-crystal','scizor','steel','bug',130,100,55,80,65,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/212.png',1),(212,'gold-silver-crystal','shuckle','rock','bug',10,230,10,230,5,20,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/213.png',1),(213,'gold-silver-crystal','heracross','fighting','bug',125,75,40,95,85,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/214.png',1),(214,'gold-silver-crystal','sneasel','ice','dark',95,55,35,75,115,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/215.png',1),(215,'gold-silver-crystal','teddiursa','normal','none',80,50,50,50,40,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/216.png',1),(216,'gold-silver-crystal','ursaring','normal','none',130,75,75,75,55,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/217.png',1),(217,'gold-silver-crystal','slugma','fire','none',40,40,70,40,20,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/218.png',1),(218,'gold-silver-crystal','magcargo','rock','fire',50,120,90,80,30,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/219.png',1),(219,'gold-silver-crystal','swinub','ground','ice',50,40,30,30,50,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/220.png',1),(220,'gold-silver-crystal','piloswine','ground','ice',100,80,60,60,50,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/221.png',1),(221,'gold-silver-crystal','corsola','rock','water',55,95,65,95,35,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/222.png',1),(222,'gold-silver-crystal','remoraid','water','none',65,35,65,35,65,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/223.png',1),(223,'gold-silver-crystal','octillery','water','none',105,75,105,75,45,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/224.png',1),(224,'gold-silver-crystal','delibird','flying','ice',55,45,65,45,75,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/225.png',1),(225,'gold-silver-crystal','mantine','flying','water',40,70,80,140,70,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/226.png',1),(226,'gold-silver-crystal','skarmory','flying','steel',80,140,40,70,70,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/227.png',1),(227,'gold-silver-crystal','houndour','fire','dark',60,30,80,50,65,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/228.png',1),(228,'gold-silver-crystal','houndoom','fire','dark',90,50,110,80,95,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/229.png',1),(229,'gold-silver-crystal','kingdra','dragon','water',95,95,95,95,85,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/230.png',1),(230,'gold-silver-crystal','phanpy','ground','none',60,60,40,40,40,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/231.png',1),(231,'gold-silver-crystal','donphan','ground','none',120,120,60,60,50,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/232.png',1),(232,'gold-silver-crystal','porygon2','normal','none',80,90,105,95,60,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/233.png',1),(233,'gold-silver-crystal','stantler','normal','none',95,62,85,65,85,73,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/234.png',1),(234,'gold-silver-crystal','smeargle','normal','none',20,35,20,45,75,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/235.png',1),(235,'gold-silver-crystal','tyrogue','fighting','none',35,35,35,35,35,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/236.png',1),(236,'gold-silver-crystal','hitmontop','fighting','none',95,95,35,110,70,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/237.png',1),(237,'gold-silver-crystal','smoochum','psychic','ice',30,15,85,65,65,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/238.png',1),(238,'gold-silver-crystal','elekid','electric','none',63,37,65,55,95,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/239.png',1),(239,'gold-silver-crystal','magby','fire','none',75,37,70,55,83,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/240.png',1),(240,'gold-silver-crystal','miltank','normal','none',80,105,40,70,100,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/241.png',1),(241,'gold-silver-crystal','blissey','normal','none',10,10,75,135,55,255,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/242.png',1),(242,'gold-silver-crystal','raikou','electric','none',85,75,115,100,115,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/243.png',1),(243,'gold-silver-crystal','entei','fire','none',115,85,90,75,100,115,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/244.png',1),(244,'gold-silver-crystal','suicune','water','none',75,115,90,115,85,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/245.png',1),(245,'gold-silver-crystal','larvitar','ground','rock',64,50,45,50,41,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/246.png',1),(246,'gold-silver-crystal','pupitar','ground','rock',84,70,65,70,51,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/247.png',1),(247,'gold-silver-crystal','tyranitar','dark','rock',134,110,95,100,61,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/248.png',1),(248,'gold-silver-crystal','lugia','flying','psychic',90,130,90,154,110,106,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/249.png',1),(249,'gold-silver-crystal','ho-oh','flying','fire',130,90,110,154,90,106,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/250.png',1),(250,'gold-silver-crystal','celebi','grass','psychic',100,100,100,100,100,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/251.png',1);
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
  PRIMARY KEY (`accountID`,`Name`,`pokemon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES ('1','another test team','gold-silver-crystal','155'),('1','another test team','gold-silver-crystal','156'),('1','another test team','gold-silver-crystal','168'),('1','another test team','gold-silver-crystal','184'),('1','another test team','gold-silver-crystal','185'),('1','another test team','gold-silver-crystal','211'),('1','big bois','red-blue-yellow','16'),('1','big bois','red-blue-yellow','2'),('1','big bois','red-blue-yellow','5'),('1','venasaurs bby','red-blue-yellow','0'),('1','venusaurs bby','red-blue-yellow','2'),('1','venusaurs bby','red-blue-yellow','4'),('1','venusaurs bby','red-blue-yellow','5'),('1','venusaurs bby','red-blue-yellow','6'),('1','venusaurs bby','red-blue-yellow','7'),('1','venusaurs bby','red-blue-yellow','8'),('1','venusaurs bby','red-blue-yellow','9'),('1','yum','red-blue-yellow','145'),('1','yum','red-blue-yellow','146'),('1','yum','red-blue-yellow','147'),('1','yum','red-blue-yellow','148'),('1','yum','red-blue-yellow','149'),('1','yum','red-blue-yellow','9'),('10','water dragons','red-blue-yellow','129'),('10','water dragons','red-blue-yellow','130'),('10','water dragons','red-blue-yellow','140'),('10','water dragons','red-blue-yellow','148'),('10','water dragons','red-blue-yellow','86'),('10','water dragons','red-blue-yellow','90'),('10','water dragons pt 2','gold-silver-crystal','159'),('10','water dragons pt 2','gold-silver-crystal','185'),('10','water dragons pt 2','gold-silver-crystal','194'),('10','water dragons pt 2','gold-silver-crystal','198'),('10','water dragons pt 2','gold-silver-crystal','229'),('10','water dragons pt 2','gold-silver-crystal','244'),('3','Example','red-blue-yellow','3'),('3','Example','red-blue-yellow','36'),('3','Example','red-blue-yellow','37'),('3','Example','red-blue-yellow','4'),('3','Example','red-blue-yellow','5'),('3','Example','red-blue-yellow','57'),('3','Team 1','red-blue-yellow','3'),('3','Team 1','red-blue-yellow','4'),('3','Team 1','red-blue-yellow','5'),('3','Team 1','red-blue-yellow','6'),('3','Team 1','red-blue-yellow','7'),('3','Team 1','red-blue-yellow','8'),('3','Team 2','gold-silver-crystal','160'),('3','Team 2','gold-silver-crystal','161'),('3','Team 2','gold-silver-crystal','162'),('3','Team 2','gold-silver-crystal','163'),('3','Team 2','gold-silver-crystal','169'),('3','Team 2','gold-silver-crystal','170'),('3','Test Team','red-blue-yellow','0'),('3','Test Team','red-blue-yellow','1'),('3','Test Team','red-blue-yellow','2'),('3','Test Team','red-blue-yellow','6'),('3','Test Team','red-blue-yellow','7'),('3','Test Team','red-blue-yellow','8');
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

-- Dump completed on 2018-05-03 20:43:13
