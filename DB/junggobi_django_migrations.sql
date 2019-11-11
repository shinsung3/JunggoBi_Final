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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-15 02:24:34.118103'),(2,'auth','0001_initial','2019-10-15 02:24:34.330666'),(3,'admin','0001_initial','2019-10-15 02:24:34.962589'),(4,'admin','0002_logentry_remove_auto_add','2019-10-15 02:24:35.113188'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-15 02:24:35.134130'),(6,'contenttypes','0002_remove_content_type_name','2019-10-15 02:24:35.273757'),(7,'auth','0002_alter_permission_name_max_length','2019-10-15 02:24:35.360526'),(8,'auth','0003_alter_user_email_max_length','2019-10-15 02:24:35.396429'),(9,'auth','0004_alter_user_username_opts','2019-10-15 02:24:35.412388'),(10,'auth','0005_alter_user_last_login_null','2019-10-15 02:24:35.481203'),(11,'auth','0006_require_contenttypes_0002','2019-10-15 02:24:35.486190'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-15 02:24:35.496162'),(13,'auth','0008_alter_user_username_max_length','2019-10-15 02:24:35.581933'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-15 02:24:35.676680'),(15,'auth','0010_alter_group_name_max_length','2019-10-15 02:24:35.702400'),(16,'auth','0011_update_proxy_permissions','2019-10-15 02:24:35.714367'),(17,'sessions','0001_initial','2019-10-15 02:24:35.746283'),(18,'api','0001_initial','2019-10-16 03:05:48.599404'),(19,'api','0002_product','2019-10-18 06:18:22.346151'),(20,'api','0003_navercafe','2019-10-21 07:59:43.856407'),(21,'api','0003_product_info','2019-10-24 02:36:49.306108'),(22,'api','0003_productinfo','2019-10-24 02:46:47.699230'),(23,'api','0004_auto_20191024_1352','2019-10-24 04:52:37.691656'),(24,'api','0004_auto_20191025_1350','2019-10-25 04:51:00.663904');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-11 16:03:50
