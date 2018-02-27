-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: SlowPokeBase
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
  PRIMARY KEY (`pokedexID`,`gameID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pokemon`
--

LOCK TABLES `Pokemon` WRITE;
/*!40000 ALTER TABLE `Pokemon` DISABLE KEYS */;
INSERT INTO `Pokemon` VALUES (0,'N/A','bulbasaur','poison','grass',49,49,65,65,45,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'),(1,'N/A','ivysaur','poison','grass',62,63,80,80,60,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png'),(2,'N/A','venusaur','poison','grass',82,83,100,100,80,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png'),(3,'N/A','charmander','fire','none',52,43,60,50,65,39,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png'),(4,'N/A','charmeleon','fire','none',64,58,80,65,80,58,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png'),(5,'N/A','charizard','flying','fire',84,78,109,85,100,78,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png'),(6,'N/A','squirtle','water','none',48,65,50,64,43,44,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png'),(7,'N/A','wartortle','water','none',63,80,65,80,58,59,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png'),(8,'N/A','blastoise','water','none',83,100,85,105,78,79,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png'),(9,'N/A','caterpie','bug','none',30,35,20,20,45,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png'),(10,'N/A','metapod','bug','none',20,55,25,25,30,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png'),(11,'N/A','butterfree','flying','bug',45,50,90,80,70,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png'),(12,'N/A','weedle','poison','bug',35,30,20,20,50,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png'),(13,'N/A','kakuna','poison','bug',25,50,25,25,35,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png'),(14,'N/A','beedrill','poison','bug',90,40,45,80,75,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png'),(15,'N/A','pidgey','flying','normal',45,40,35,35,56,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png'),(16,'N/A','pidgeotto','flying','normal',60,55,50,50,71,63,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png'),(17,'N/A','pidgeot','flying','normal',80,75,70,70,101,83,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png'),(18,'N/A','rattata','normal','none',56,35,25,35,72,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png'),(19,'N/A','raticate','normal','none',81,60,50,70,97,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png'),(20,'N/A','spearow','flying','normal',60,30,31,31,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/21.png'),(21,'N/A','fearow','flying','normal',90,65,61,61,100,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/22.png'),(22,'N/A','ekans','poison','none',60,44,40,54,55,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/23.png'),(23,'N/A','arbok','poison','none',95,69,65,79,80,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/24.png'),(24,'N/A','pikachu','electric','none',55,40,50,50,90,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png'),(25,'N/A','raichu','electric','none',90,55,90,80,110,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/26.png'),(26,'N/A','sandshrew','ground','none',75,85,20,30,40,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/27.png'),(27,'N/A','sandslash','ground','none',100,110,45,55,65,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/28.png'),(28,'N/A','nidoran-f','poison','none',47,52,40,40,41,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/29.png'),(29,'N/A','nidorina','poison','none',62,67,55,55,56,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/30.png'),(30,'N/A','nidoqueen','ground','poison',92,87,75,85,76,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/31.png'),(31,'N/A','nidoran-m','poison','none',57,40,40,40,50,46,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/32.png'),(32,'N/A','nidorino','poison','none',72,57,55,55,65,61,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/33.png'),(33,'N/A','nidoking','ground','poison',102,77,85,75,85,81,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/34.png'),(34,'N/A','clefairy','fairy','none',45,48,60,65,35,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/35.png'),(35,'N/A','clefable','fairy','none',70,73,95,90,60,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/36.png'),(36,'N/A','vulpix','fire','none',41,40,50,65,65,38,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/37.png'),(37,'N/A','ninetales','fire','none',76,75,81,100,100,73,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/38.png'),(38,'N/A','jigglypuff','fairy','normal',45,20,45,25,20,115,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png'),(39,'N/A','wigglytuff','fairy','normal',70,45,85,50,45,140,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/40.png'),(40,'N/A','zubat','flying','poison',45,35,30,40,55,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/41.png'),(41,'N/A','golbat','flying','poison',80,70,65,75,90,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/42.png'),(42,'N/A','oddish','poison','grass',50,55,75,65,30,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/43.png'),(43,'N/A','gloom','poison','grass',65,70,85,75,40,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/44.png'),(44,'N/A','vileplume','poison','grass',80,85,110,90,50,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/45.png'),(45,'N/A','paras','grass','bug',70,55,45,55,25,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/46.png'),(46,'N/A','parasect','grass','bug',95,80,60,80,30,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/47.png'),(47,'N/A','venonat','poison','bug',55,50,40,55,45,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/48.png'),(48,'N/A','venomoth','poison','bug',65,60,90,75,90,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/49.png'),(49,'N/A','diglett','ground','none',55,25,35,45,95,10,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/50.png'),(50,'N/A','dugtrio','ground','none',100,50,50,70,120,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/51.png'),(51,'N/A','meowth','normal','none',45,35,40,40,90,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png'),(52,'N/A','persian','normal','none',70,60,65,65,115,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/53.png'),(53,'N/A','psyduck','water','none',52,48,65,50,55,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/54.png'),(54,'N/A','golduck','water','none',82,78,95,80,85,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/55.png'),(55,'N/A','mankey','fighting','none',80,35,35,45,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png'),(56,'N/A','primeape','fighting','none',105,60,60,70,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/57.png'),(57,'N/A','growlithe','fire','none',70,45,70,50,60,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/58.png'),(58,'N/A','arcanine','fire','none',110,80,100,80,95,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/59.png'),(59,'N/A','poliwag','water','none',50,40,40,40,90,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/60.png'),(60,'N/A','poliwhirl','water','none',65,65,50,50,90,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/61.png'),(61,'N/A','poliwrath','fighting','water',95,95,70,90,70,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/62.png'),(62,'N/A','abra','psychic','none',20,15,105,55,90,25,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/63.png'),(63,'N/A','kadabra','psychic','none',35,30,120,70,105,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/64.png'),(64,'N/A','alakazam','psychic','none',50,45,135,95,120,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/65.png'),(65,'N/A','machop','fighting','none',80,50,35,35,35,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/66.png'),(66,'N/A','machoke','fighting','none',100,70,50,60,45,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/67.png'),(67,'N/A','machamp','fighting','none',130,80,65,85,55,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/68.png'),(68,'N/A','bellsprout','poison','grass',75,35,70,30,40,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/69.png'),(69,'N/A','weepinbell','poison','grass',90,50,85,45,55,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/70.png'),(70,'N/A','victreebel','poison','grass',105,65,100,70,70,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/71.png'),(71,'N/A','tentacool','poison','water',40,35,50,100,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/72.png'),(72,'N/A','tentacruel','poison','water',70,65,80,120,100,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/73.png'),(73,'N/A','geodude','ground','rock',80,100,30,30,20,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/74.png'),(74,'N/A','graveler','ground','rock',95,115,45,45,35,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/75.png'),(75,'N/A','golem','ground','rock',120,130,55,65,45,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/76.png'),(76,'N/A','ponyta','fire','none',85,55,65,65,90,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/77.png'),(77,'N/A','rapidash','fire','none',100,70,80,80,105,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/78.png'),(78,'N/A','slowpoke','psychic','water',65,65,40,40,15,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/79.png'),(79,'N/A','slowbro','psychic','water',75,110,100,80,30,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/80.png'),(80,'N/A','magnemite','steel','electric',35,70,95,55,45,25,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/81.png'),(81,'N/A','magneton','steel','electric',60,95,120,70,70,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/82.png'),(82,'N/A','farfetchd','flying','normal',90,55,58,62,60,52,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/83.png'),(83,'N/A','doduo','flying','normal',85,45,35,35,75,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/84.png'),(84,'N/A','dodrio','flying','normal',110,70,60,60,110,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/85.png'),(85,'N/A','seel','water','none',45,55,45,70,45,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/86.png'),(86,'N/A','dewgong','ice','water',70,80,70,95,70,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/87.png'),(87,'N/A','grimer','poison','none',80,50,40,50,25,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/88.png'),(88,'N/A','muk','poison','none',105,75,65,100,50,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/89.png'),(89,'N/A','shellder','water','none',65,100,45,25,40,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/90.png'),(90,'N/A','cloyster','ice','water',95,180,85,45,70,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/91.png'),(91,'N/A','gastly','poison','ghost',35,30,100,35,80,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/92.png'),(92,'N/A','haunter','poison','ghost',50,45,115,55,95,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/93.png'),(93,'N/A','gengar','poison','ghost',65,60,130,75,110,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/94.png'),(94,'N/A','onix','ground','rock',45,160,30,45,70,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/95.png'),(95,'N/A','drowzee','psychic','none',48,45,43,90,42,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/96.png'),(96,'N/A','hypno','psychic','none',73,70,73,115,67,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/97.png'),(97,'N/A','krabby','water','none',105,90,25,25,50,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/98.png'),(98,'N/A','kingler','water','none',130,115,50,50,75,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/99.png'),(99,'N/A','voltorb','electric','none',30,50,55,55,100,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/100.png'),(100,'N/A','electrode','electric','none',50,70,80,80,150,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/101.png'),(101,'N/A','exeggcute','psychic','grass',40,80,60,45,40,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/102.png'),(102,'N/A','exeggutor','psychic','grass',95,85,125,75,55,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/103.png'),(103,'N/A','cubone','ground','none',50,95,40,50,35,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/104.png'),(104,'N/A','marowak','ground','none',80,110,50,80,45,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/105.png'),(105,'N/A','hitmonlee','fighting','none',120,53,35,110,87,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/106.png'),(106,'N/A','hitmonchan','fighting','none',105,79,35,110,76,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/107.png'),(107,'N/A','lickitung','normal','none',55,75,60,75,30,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/108.png'),(108,'N/A','koffing','poison','none',65,95,60,45,35,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/109.png'),(109,'N/A','weezing','poison','none',90,120,85,70,60,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/110.png'),(110,'N/A','rhyhorn','rock','ground',85,95,30,30,25,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/111.png'),(111,'N/A','rhydon','rock','ground',130,120,45,45,40,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/112.png'),(112,'N/A','chansey','normal','none',5,5,35,105,50,250,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/113.png'),(113,'N/A','tangela','grass','none',55,115,100,40,60,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/114.png'),(114,'N/A','kangaskhan','normal','none',95,80,40,80,90,105,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/115.png'),(115,'N/A','horsea','water','none',40,70,70,25,60,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/116.png'),(116,'N/A','seadra','water','none',65,95,95,45,85,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/117.png'),(117,'N/A','goldeen','water','none',67,60,35,50,63,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/118.png'),(118,'N/A','seaking','water','none',92,65,65,80,68,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/119.png'),(119,'N/A','staryu','water','none',45,55,70,55,85,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/120.png'),(120,'N/A','starmie','psychic','water',75,85,100,85,115,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/121.png'),(121,'N/A','mr-mime','fairy','psychic',45,65,100,120,90,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/122.png'),(122,'N/A','scyther','flying','bug',110,80,55,80,105,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/123.png'),(123,'N/A','jynx','psychic','ice',50,35,115,95,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/124.png'),(124,'N/A','electabuzz','electric','none',83,57,95,85,105,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/125.png'),(125,'N/A','magmar','fire','none',95,57,100,85,93,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/126.png'),(126,'N/A','pinsir','bug','none',125,100,55,70,85,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/127.png'),(127,'N/A','tauros','normal','none',100,95,40,70,110,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/128.png'),(128,'N/A','magikarp','water','none',10,55,15,20,80,20,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/129.png'),(129,'N/A','gyarados','flying','water',125,79,60,100,81,95,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/130.png'),(130,'N/A','lapras','ice','water',85,80,85,95,60,130,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/131.png'),(131,'N/A','ditto','normal','none',48,48,48,48,48,48,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png'),(132,'N/A','eevee','normal','none',55,50,45,65,55,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png'),(133,'N/A','vaporeon','water','none',65,60,110,95,65,130,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/134.png'),(134,'N/A','jolteon','electric','none',65,60,110,95,130,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/135.png'),(135,'N/A','flareon','fire','none',130,60,95,110,65,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/136.png'),(136,'N/A','porygon','normal','none',60,70,85,75,40,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/137.png'),(137,'N/A','omanyte','water','rock',40,100,90,55,35,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/138.png'),(138,'N/A','omastar','water','rock',60,125,115,70,55,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/139.png'),(139,'N/A','kabuto','water','rock',80,90,55,45,55,30,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/140.png'),(140,'N/A','kabutops','water','rock',115,105,65,70,80,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/141.png'),(141,'N/A','aerodactyl','flying','rock',105,65,60,75,130,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/142.png'),(142,'N/A','snorlax','normal','none',110,65,65,110,30,160,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png'),(143,'N/A','articuno','flying','ice',85,100,95,125,85,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/144.png'),(144,'N/A','zapdos','flying','electric',90,85,125,90,100,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/145.png'),(145,'N/A','moltres','flying','fire',100,90,125,85,90,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/146.png'),(146,'N/A','dratini','dragon','none',64,45,50,50,50,41,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/147.png'),(147,'N/A','dragonair','dragon','none',84,65,70,70,70,61,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/148.png'),(148,'N/A','dragonite','flying','dragon',134,95,100,100,80,91,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/149.png'),(149,'N/A','mewtwo','psychic','none',110,90,154,90,130,106,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png'),(150,'N/A','mew','psychic','none',100,100,100,100,100,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png'),(151,'N/A','chikorita','grass','none',49,65,49,65,45,45,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png'),(152,'N/A','bayleef','grass','none',62,80,63,80,60,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/153.png'),(153,'N/A','meganium','grass','none',82,100,83,100,80,80,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/154.png'),(154,'N/A','cyndaquil','fire','none',52,43,60,50,65,39,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/155.png'),(155,'N/A','quilava','fire','none',64,58,80,65,80,58,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/156.png'),(156,'N/A','typhlosion','fire','none',84,78,109,85,100,78,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/157.png'),(157,'N/A','totodile','water','none',65,64,44,48,43,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/158.png'),(158,'N/A','croconaw','water','none',80,80,59,63,58,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/159.png'),(159,'N/A','feraligatr','water','none',105,100,79,83,78,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/160.png'),(160,'N/A','sentret','normal','none',46,34,35,45,20,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/161.png'),(161,'N/A','furret','normal','none',76,64,45,55,90,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/162.png'),(162,'N/A','hoothoot','flying','normal',30,30,36,56,50,60,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png'),(163,'N/A','noctowl','flying','normal',50,50,86,96,70,100,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/164.png'),(164,'N/A','ledyba','flying','bug',20,30,40,80,55,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/165.png'),(165,'N/A','ledian','flying','bug',35,50,55,110,85,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/166.png'),(166,'N/A','spinarak','poison','bug',60,40,40,40,30,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/167.png'),(167,'N/A','ariados','poison','bug',90,70,60,70,40,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/168.png'),(168,'N/A','crobat','flying','poison',90,80,70,80,130,85,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/169.png'),(169,'N/A','chinchou','electric','water',38,38,56,56,67,75,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/170.png'),(170,'N/A','lanturn','electric','water',58,58,76,76,67,125,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/171.png'),(171,'N/A','pichu','electric','none',40,15,35,35,60,20,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/172.png'),(172,'N/A','cleffa','fairy','none',25,28,45,55,15,50,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/173.png'),(173,'N/A','igglybuff','fairy','normal',30,15,40,20,15,90,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/174.png'),(174,'N/A','togepi','fairy','none',20,65,40,65,20,35,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/175.png'),(175,'N/A','togetic','flying','fairy',40,85,80,105,40,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/176.png'),(176,'N/A','natu','flying','psychic',50,45,70,45,70,40,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/177.png'),(177,'N/A','xatu','flying','psychic',75,70,95,70,95,65,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/178.png'),(178,'N/A','mareep','electric','none',40,40,65,45,35,55,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/179.png'),(179,'N/A','flaaffy','electric','none',55,55,80,60,45,70,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/180.png');
/*!40000 ALTER TABLE `Pokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-27  0:01:20