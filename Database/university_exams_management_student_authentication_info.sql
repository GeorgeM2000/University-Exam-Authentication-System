-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: university_exams_management
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `student_authentication_info`
--

DROP TABLE IF EXISTS `student_authentication_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_authentication_info` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `department` varchar(100) DEFAULT NULL,
  `academic_email` varchar(20) DEFAULT NULL,
  `academic_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `department` (`department`),
  CONSTRAINT `student_authentication_info_ibfk_1` FOREIGN KEY (`department`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_authentication_info`
--

LOCK TABLES `student_authentication_info` WRITE;
/*!40000 ALTER TABLE `student_authentication_info` DISABLE KEYS */;
INSERT INTO `student_authentication_info` VALUES (1,'Computer Science','cs04229@uowm.gr','12345'),(2,'Computer Science','cs04110@uowm.gr','3463264'),(3,'Computer Science','cs04220@uowm.gr','8795'),(4,'Mathematics','ms02030@uowm.gr','fth36fg'),(5,'Mathematics','ms01140@uowm.gr','gfrt1243');
/*!40000 ALTER TABLE `student_authentication_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 20:13:38
