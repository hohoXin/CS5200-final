CREATE DATABASE  IF NOT EXISTS `city_evaluation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `city_evaluation`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: city_evaluation
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(64) DEFAULT NULL,
  `cost_of_living_index` float DEFAULT NULL,
  `rent_index` float DEFAULT NULL,
  `general_cost_index` float DEFAULT NULL,
  `groceries_index` float DEFAULT NULL,
  `restaurant_price_index` float DEFAULT NULL,
  `local_purchasing_power_index` float DEFAULT NULL,
  `country_name` varchar(64) DEFAULT NULL,
  `topography_id` int DEFAULT NULL,
  `climate_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_name` (`country_name`),
  KEY `topography_id` (`topography_id`),
  KEY `climate_type` (`climate_type`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`topography_id`) REFERENCES `topography` (`topography_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_ibfk_3` FOREIGN KEY (`climate_type`) REFERENCES `climate` (`climate_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'London',81.26,68.1,74.97,61.27,79.44,81.01,'United Kingdom',2,'Temprate'),(2,'New York',100,100,100,100,100,100,'United States',2,'Temprate'),(3,'Shang Hai',53.35,41.92,47.89,57.66,40.37,49.65,'China',2,'Temprate'),(4,'Beijing',53.39,42.39,48.13,52.24,36.7,45.75,'China',3,'Continental'),(5,'Paris',77.77,44.91,62.06,77.09,71.11,70.69,'France',4,'Temprate'),(6,'Chicago',75.4,55.22,65.75,72.06,74.19,129.44,'United States',4,'Continental'),(7,'Los Angeles',80,74.02,77.14,80.22,84.61,125.03,'United States',1,'Temprate'),(8,'Hong Kong',78.88,67.09,73.24,85.44,53.74,66.06,'China',1,'Temprate'),(9,'Moscow',42.97,26.51,35.09,36.47,42.77,44.61,'Russia',4,'Continental'),(10,'Tokyo',80.68,35.2,58.93,93.25,43.27,80.68,'Japan',1,'Temprate'),(11,'Mumbai',28.38,19.57,24.16,28.93,24.11,56.28,'India',2,'Tropical'),(12,'Bangkok',51.91,26.22,39.63,52.64,24.13,26.16,'Thailand',2,'Tropical'),(13,'Istanbul',34.24,10.6,22.93,28.16,21.75,25.53,'Turkey',2,'Temprate'),(14,'Rio de Janeiro',43.6,12.92,28.93,38.01,33.13,19.57,'Brasil',2,'Temprate'),(15,'Sydney',84.75,56.72,71.35,81.94,69.85,102.07,'Australia',2,'Temprate'),(16,'Cairo',27.91,6.64,17.73,25.46,23.64,22.08,'Egypt',4,'Dry');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_to_crime`
--

DROP TABLE IF EXISTS `city_to_crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_to_crime` (
  `city_id` int NOT NULL,
  `crime_type` varchar(64) NOT NULL,
  PRIMARY KEY (`city_id`,`crime_type`),
  KEY `crime_type` (`crime_type`),
  CONSTRAINT `city_to_crime_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_to_crime_ibfk_2` FOREIGN KEY (`crime_type`) REFERENCES `crime` (`crime_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_to_crime`
--

LOCK TABLES `city_to_crime` WRITE;
/*!40000 ALTER TABLE `city_to_crime` DISABLE KEYS */;
INSERT INTO `city_to_crime` VALUES (6,'corruption'),(9,'corruption'),(11,'corruption'),(12,'corruption'),(13,'corruption'),(14,'corruption'),(16,'corruption'),(1,'drug dealing'),(6,'drug dealing'),(7,'drug dealing'),(14,'drug dealing'),(5,'insult'),(6,'insult'),(6,'robbery'),(14,'robbery'),(5,'theft'),(6,'theft'),(14,'theft');
/*!40000 ALTER TABLE `city_to_crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_to_cuisine`
--

DROP TABLE IF EXISTS `city_to_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_to_cuisine` (
  `city_id` int NOT NULL,
  `cuisine_name` varchar(64) NOT NULL,
  PRIMARY KEY (`city_id`,`cuisine_name`),
  KEY `cuisine_name` (`cuisine_name`),
  CONSTRAINT `city_to_cuisine_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_to_cuisine_ibfk_2` FOREIGN KEY (`cuisine_name`) REFERENCES `cuisine` (`cuisine_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_to_cuisine`
--

LOCK TABLES `city_to_cuisine` WRITE;
/*!40000 ALTER TABLE `city_to_cuisine` DISABLE KEYS */;
INSERT INTO `city_to_cuisine` VALUES (2,'American'),(6,'American'),(7,'American'),(12,'American'),(14,'American'),(15,'American'),(1,'British'),(15,'British'),(2,'Chinese'),(3,'Chinese'),(4,'Chinese'),(7,'Chinese'),(8,'Chinese'),(5,'French'),(1,'Indian'),(11,'Indian'),(1,'Italian'),(2,'Italian'),(5,'Italian'),(6,'Italian'),(10,'Japanese'),(2,'Mexican'),(7,'Mexican'),(12,'Mexican'),(14,'Mexican'),(9,'Russian'),(13,'Turkish'),(16,'Turkish');
/*!40000 ALTER TABLE `city_to_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_to_language`
--

DROP TABLE IF EXISTS `city_to_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_to_language` (
  `city_id` int NOT NULL,
  `language_name` varchar(64) NOT NULL,
  PRIMARY KEY (`city_id`,`language_name`),
  KEY `language_name` (`language_name`),
  CONSTRAINT `city_to_language_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `city_to_language_ibfk_2` FOREIGN KEY (`language_name`) REFERENCES `speaking_language` (`language_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_to_language`
--

LOCK TABLES `city_to_language` WRITE;
/*!40000 ALTER TABLE `city_to_language` DISABLE KEYS */;
INSERT INTO `city_to_language` VALUES (16,'Arabic'),(3,'Chinese'),(4,'Chinese'),(8,'Chinese'),(1,'English'),(2,'English'),(6,'English'),(7,'English'),(8,'English'),(11,'English'),(15,'English'),(5,'French'),(11,'Hindi'),(10,'Japanese'),(14,'Portuguess'),(9,'Russian'),(7,'Spanish'),(12,'Thai'),(13,'Turkish');
/*!40000 ALTER TABLE `city_to_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `climate`
--

DROP TABLE IF EXISTS `climate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `climate` (
  `climate_type` varchar(64) NOT NULL,
  `summer_temprature` varchar(64) DEFAULT NULL,
  `winter_temprature` varchar(64) DEFAULT NULL,
  `precipitation` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`climate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climate`
--

LOCK TABLES `climate` WRITE;
/*!40000 ALTER TABLE `climate` DISABLE KEYS */;
INSERT INTO `climate` VALUES ('Continental','warm','cold','moderate'),('Dry','hot','cold','light'),('Polar','cool','extremely cold','light'),('Temprate','warm','mild','moderate'),('Tropical','hot','mild','heavy');
/*!40000 ALTER TABLE `climate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_name` varchar(64) NOT NULL,
  `continent` varchar(64) DEFAULT NULL,
  `government_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`country_name`),
  KEY `government_type` (`government_type`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`government_type`) REFERENCES `government` (`government_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Australia','Oceania','Parliamentary constitutional monarchies'),('Brasil','South America','Full presidential republics'),('China','Asia','One-party states'),('Egypt','Africa','Semi-presidential republics'),('France','Europe','Semi-presidential republics'),('India','Asia','Parliamentary republics'),('Japan','Asia','Parliamentary constitutional monarchies'),('Russia','Europe','Semi-presidential republics'),('Thailand','Asia','Parliamentary constitutional monarchies'),('Turkey','Asia','Full presidential republics'),('United Kingdom','Europe','Parliamentary constitutional monarchies'),('United States','North America','Full presidential republics');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime`
--

DROP TABLE IF EXISTS `crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crime` (
  `crime_type` varchar(64) NOT NULL,
  `is_violent` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`crime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime`
--

LOCK TABLES `crime` WRITE;
/*!40000 ALTER TABLE `crime` DISABLE KEYS */;
INSERT INTO `crime` VALUES ('corruption','no'),('drug dealing','yes'),('home broken','yes'),('insult','no'),('robbery','yes'),('theft','no');
/*!40000 ALTER TABLE `crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `cuisine_name` varchar(64) NOT NULL,
  `popularity_rank` int DEFAULT NULL,
  `is_spicy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cuisine_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES ('American',9,'no'),('British',11,'no'),('Chinese',1,'yes'),('French',3,'no'),('Indian',7,'yes'),('Italian',2,'no'),('Japanese',4,'no'),('Mediterranean',5,'no'),('Mexican',10,'yes'),('Russian',12,'no'),('South-east Asain',6,'yes'),('Turkish',8,'no');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `government`
--

DROP TABLE IF EXISTS `government`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `government` (
  `government_type` varchar(64) NOT NULL,
  `has_mornach` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`government_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `government`
--

LOCK TABLES `government` WRITE;
/*!40000 ALTER TABLE `government` DISABLE KEYS */;
INSERT INTO `government` VALUES ('Absolute monarchies','yes'),('Full presidential republics','no'),('One-party states','no'),('Parliamentary constitutional monarchies','yes'),('Parliamentary republics','no'),('Semi-presidential republics','no');
/*!40000 ALTER TABLE `government` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speaking_language`
--

DROP TABLE IF EXISTS `speaking_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speaking_language` (
  `language_name` varchar(64) NOT NULL,
  `learning_difficulty` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`language_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speaking_language`
--

LOCK TABLES `speaking_language` WRITE;
/*!40000 ALTER TABLE `speaking_language` DISABLE KEYS */;
INSERT INTO `speaking_language` VALUES ('Arabic','hard'),('Chinese','hard'),('English','easy'),('French','normal'),('Hindi','normal'),('Japanese','hard'),('Portuguess','easy'),('Russian','normal'),('Spanish','easy'),('Thai','hard'),('Turkish','normal');
/*!40000 ALTER TABLE `speaking_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topography`
--

DROP TABLE IF EXISTS `topography`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topography` (
  `topography_id` int NOT NULL,
  `near_sea` varchar(10) DEFAULT NULL,
  `near_mountain` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`topography_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topography`
--

LOCK TABLES `topography` WRITE;
/*!40000 ALTER TABLE `topography` DISABLE KEYS */;
INSERT INTO `topography` VALUES (1,'yes','yes'),(2,'yes','no'),(3,'no','yes'),(4,'no','no');
/*!40000 ALTER TABLE `topography` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'city_evaluation'
--

--
-- Dumping routines for database 'city_evaluation'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_city`(IN id INT)
BEGIN

 DELETE FROM city WHERE city_id = id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_city`(in cityname varchar(64), 
  in cosindex float,
  in renindex float,
  in genindex float,
  in groindex float,
  in resindex float,
  in locindex float,
  in counname varchar(64),
  in topoid int,
  in climate varchar(64))
BEGIN

-- error handling

 DECLARE EXIT HANDLER FOR SQLEXCEPTION 
 SELECT 'SQLException invoked';
 DECLARE EXIT HANDLER FOR 1062 
        SELECT 'MySQL error code 1062 invoked';
 DECLARE EXIT HANDLER FOR SQLSTATE '23000'
 SELECT 'SQLSTATE 23000 invoked';
 
INSERT INTO city(city_name, 
  cost_of_living_index,
  rent_index,
  general_cost_index,
  groceries_index,
  restaurant_price_index,
  local_purchasing_power_index,
  country_name,
  topography_id,
  climate_type) 
 VALUES (cityname, cosindex, renindex, genindex, groindex, resindex, locindex, counname, topoid, climate);
 
 SELECT city_id AS your_id 
 FROM city WHERE 
  city_name = cityname and 
  cost_of_living_index = cosindex and
  rent_index = renindex and
  general_cost_index = genindex and
  groceries_index = groindex and
  restaurant_price_index = resindex and
  local_purchasing_power_index = locindex and
  country_name = counname and
  topography_id = topoid and
  climate_type = climate
  LIMIT 1;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_city` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_city`( in id int,
  in cityname varchar(64), 
  in cosindex float,
  in renindex float,
  in genindex float,
  in groindex float,
  in resindex float,
  in locindex float,
  in counname varchar(64),
  in topoid int,
  in climate varchar(64))
BEGIN

 UPDATE city 
 SET city_name = cityname, 
  cost_of_living_index = cosindex,
  rent_index = renindex,
  general_cost_index = genindex,
  groceries_index = groindex,
  restaurant_price_index = resindex,
  local_purchasing_power_index = locindex,
  country_name = counname,
  topography_id = topoid,
  climate_type = climate
 WHERE city_id = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 22:44:03
