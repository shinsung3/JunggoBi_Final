-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 192.168.100.60    Database: junggobi
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category` varchar(10) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model_name` varchar(100) DEFAULT NULL,
  `generation` varchar(10) DEFAULT NULL,
  `display` varchar(10) DEFAULT NULL,
  `release_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'태블릿','애플','아이패드','1세대','9.7','2010.5'),(2,'태블릿','애플','아이패드','2세대','9.7','2011.4'),(3,'태블릿','애플','아이패드','3세대','9.7','2012.3'),(4,'태블릿','애플','아이패드','4세대','9.7','2012.11'),(5,'태블릿','애플','아이패드','5세대','9.7','2017.3'),(6,'태블릿','애플','아이패드','6세대','9.7','2018.5'),(7,'태블릿','애플','아이패드','7세대','10.2','2019.9'),(8,'태블릿','애플','아이패드 에어','1세대','9.7','2013.11'),(9,'태블릿','애플','아이패드 에어','2세대','9.7','2014.1'),(10,'태블릿','애플','아이패드 에어','3세대','10.5','2019.3'),(11,'태블릿','애플','아이패드 미니','1세대','7.9','2012.11'),(12,'태블릿','애플','아이패드 미니','2세대','7.9','2013.11'),(13,'태블릿','애플','아이패드 미니','3세대','7.9','2014.1'),(14,'태블릿','애플','아이패드 미니','4세대','7.9','2015.9'),(15,'태블릿','애플','아이패드 미니','5세대','7.9','2019.3'),(16,'태블릿','애플','아이패드 프로','1세대','12.9','2015.11'),(17,'태블릿','애플','아이패드 프로','','9.7','2016.3'),(18,'태블릿','애플','아이패드 프로','2세대','12.9','2017.6'),(19,'태블릿','애플','아이패드 프로','','10.5','2017.6'),(20,'태블릿','애플','아이패드 프로','','11','2018.12'),(21,'태블릿','애플','아이패드 프로','3세대','12.9','2018.12');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-11 16:03:49
