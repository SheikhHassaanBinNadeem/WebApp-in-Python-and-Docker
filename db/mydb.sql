-- MySQL dump 10.13  Distrib 9.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: Trainer_app_data
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Trainer_app_data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Trainer_app_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Trainer_app_data`;

--
-- Table structure for table `student_credentials`
--

DROP TABLE IF EXISTS `student_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_credentials`
--

LOCK TABLES `student_credentials` WRITE;
/*!40000 ALTER TABLE `student_credentials` DISABLE KEYS */;
INSERT INTO `student_credentials` VALUES (1,'hassaan','123','hassaan@gmail.com'),(2,'sarah','321','sarah@gmail.com'),(3,'sameer','54321','sam@gmail.com'),(4,'sammy','54321','sammy@gmail.com'),(5,'ali','6542','ali@gmail.com'),(6,'bro','1231','bro@gmail.com'),(8,'has','asdads','has@gmail.com'),(9,'jam','123','jam@gmail.com'),(10,'lam','123','lam@gmail.com'),(11,'ken','asdlk','ken@gmail.com'),(12,'han','askdj','han@gmail.com'),(13,'bas','asdas','bas@gmail.com'),(14,'sheikhhassaan','1234','shbn');
/*!40000 ALTER TABLE `student_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_details`
--

DROP TABLE IF EXISTS `trainer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_details` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `fname` char(255) DEFAULT NULL,
  `lname` char(255) DEFAULT NULL,
  `design` char(255) DEFAULT NULL,
  `course` char(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_details`
--

LOCK TABLES `trainer_details` WRITE;
/*!40000 ALTER TABLE `trainer_details` DISABLE KEYS */;
INSERT INTO `trainer_details` VALUES (1,'Sheikh Hassaan','Bin Nadeem','Senior Advisor','All Tech','2025-10-21 00:00:00'),(2,'Sam','Altman','Jnr. Developer','Data Science','2025-10-21 00:00:00'),(3,'abde','ali','Developer','Automation','2025-10-21 00:00:00'),(4,'Asad','Rauf','Course Advisor','Education','2025-10-22 00:00:00'),(5,'Salim','Ahmed','Teacher','Mindset mentor','2025-10-22 00:00:00');
/*!40000 ALTER TABLE `trainer_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-08 16:21:48
