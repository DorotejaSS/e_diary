-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e_diary
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.10-MariaDB

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_out` bit(1) NOT NULL,
  `justified` bit(1) NOT NULL,
  `students_id` int(11) NOT NULL,
  `schedules_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_students1_idx` (`students_id`),
  KEY `fk_attendance_schedules1_idx` (`schedules_id`),
  CONSTRAINT `fk_attendance_schedules_id` FOREIGN KEY (`schedules_id`) REFERENCES `schedules` (`id`),
  CONSTRAINT `fk_attendance_students_id` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_certificates_students1_idx` (`student_id`),
  CONSTRAINT `fk_certificates_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `semestar` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  `closing` bit(1) NOT NULL,
  `student_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grades_students1_idx` (`student_id`),
  KEY `fk_grades_users1_idx` (`lecturer_id`),
  CONSTRAINT `fk_grades_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `fk_grades_students2` FOREIGN KEY (`lecturer_id`) REFERENCES `students` (`id`),
  CONSTRAINT `fk_grades_users1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_subject`
--

DROP TABLE IF EXISTS `lecturer_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturer_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lecturer_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_id_fk_idx` (`lecturer_id`),
  KEY `subject_id_fk_idx` (`subject_id`),
  CONSTRAINT `lecturer_subject_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `lecturer_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_subject`
--

LOCK TABLES `lecturer_subject` WRITE;
/*!40000 ALTER TABLE `lecturer_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturer_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (10,'users','#'),(11,'subjects','#'),(12,'student groups','#'),(13,'schedules','#'),(14,'notifications','#'),(15,'students','#'),(16,'statistic - student groups','#'),(17,'statistic - subject','#'),(18,'grades - professor','#'),(19,'open door - professor','#'),(20,'messages','#'),(21,'notifications','#'),(22,'diary','#'),(23,'certificates','#'),(24,'schedules - parent','#'),(25,'schedules - profesor','#'),(26,'grades - parent','#'),(27,'open door - parent','#');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('message','notification') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_fk_idx` (`from`),
  KEY `to_fk_idx` (`to`),
  CONSTRAINT `from_fk` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  CONSTRAINT `to_fk` FOREIGN KEY (`to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_student`
--

DROP TABLE IF EXISTS `parent_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id_fk_idx` (`parent_id`),
  KEY `student_id_fk_idx` (`student_id`),
  CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`),
  CONSTRAINT `student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_student`
--

LOCK TABLES `parent_student` WRITE;
/*!40000 ALTER TABLE `parent_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'user_c'),(2,'user_r'),(3,'user_u'),(4,'user_d'),(5,'student_group_c'),(6,'student_group_r'),(7,'student_group_u'),(8,'student_group_d'),(9,'schedules_c'),(10,'schedules_r'),(11,'schedules_u'),(12,'schedules_d'),(13,'messages_c'),(14,'messages_r'),(15,'messages_u'),(16,'messages_d'),(17,'certificates_c'),(18,'certificates_r'),(19,'certificates_u'),(20,'certificates_d'),(21,'grades_c'),(22,'grades_r'),(23,'grades_u'),(24,'grades_d'),(25,'students_c'),(26,'students_r'),(27,'students_u'),(28,'students_d'),(29,'subjects_c'),(30,'subjects_r'),(31,'subjects_u'),(32,'subjects_d'),(33,'attendance_c'),(34,'attendance_r'),(35,'attendance_u'),(36,'attendance_d'),(37,'statistic_st_group_r'),(38,'statistic_subjects_r');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_menu_roles1_idx` (`menu_id`),
  KEY `fk_role_menu_menu1_idx` (`role_id`),
  CONSTRAINT `fk_role_menu_menu1` FOREIGN KEY (`role_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_role_menu_roles1` FOREIGN KEY (`menu_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `access` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id_fk_idx` (`role_id`),
  KEY `permission_id_fk_idx` (`permission_id`),
  CONSTRAINT `permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(7,1,7,1),(8,1,8,1),(9,1,9,1),(10,1,10,1),(11,1,11,1),(12,1,12,1),(13,1,13,1),(14,1,14,1),(15,1,15,1),(16,1,16,1),(17,1,17,0),(18,1,18,0),(19,1,19,0),(20,1,20,0),(21,1,21,0),(22,1,22,0),(23,1,23,0),(24,1,24,0),(25,1,25,1),(26,1,26,1),(27,1,27,1),(28,1,28,1),(29,1,29,1),(30,1,30,1),(31,1,31,1),(32,1,32,1),(33,1,33,0),(34,1,34,0),(35,1,35,0),(36,1,36,0),(37,2,1,NULL),(38,2,2,NULL),(39,2,3,NULL),(40,2,4,NULL),(41,2,5,NULL),(42,2,6,NULL),(43,2,7,NULL),(44,2,8,NULL),(45,2,9,NULL),(46,2,10,NULL),(47,2,11,NULL),(48,2,12,NULL),(49,2,13,NULL),(50,2,14,NULL),(51,2,15,NULL),(52,2,16,NULL),(53,2,17,NULL),(54,2,18,NULL),(55,2,19,NULL),(56,2,20,NULL),(57,2,21,NULL),(58,2,22,NULL),(59,2,23,NULL),(60,2,24,NULL),(61,2,25,NULL),(62,2,26,NULL),(63,2,27,NULL),(64,2,28,NULL),(65,2,29,NULL),(66,2,30,NULL),(67,2,31,NULL),(68,2,32,NULL),(69,2,33,NULL),(70,2,34,NULL),(71,2,35,NULL),(72,2,36,NULL),(73,3,1,0),(74,3,2,0),(75,3,3,0),(76,3,4,0),(77,3,5,0),(78,3,6,1),(79,3,7,0),(80,3,8,0),(81,3,9,1),(82,3,10,1),(83,3,11,1),(84,3,12,1),(85,3,13,1),(86,3,14,1),(87,3,15,1),(88,3,16,1),(89,3,17,1),(90,3,18,1),(91,3,19,1),(92,3,20,1),(93,3,21,1),(94,3,22,1),(95,3,23,1),(96,3,24,1),(97,3,25,0),(98,3,26,1),(99,3,27,0),(100,3,28,0),(101,3,29,0),(102,3,30,0),(103,3,31,0),(104,3,32,0),(105,3,33,1),(106,3,34,1),(107,3,35,1),(108,3,36,1),(109,4,1,0),(110,4,2,0),(111,4,3,0),(112,4,4,0),(113,4,5,0),(114,4,6,1),(115,4,7,0),(116,4,8,0),(117,4,9,1),(118,4,10,1),(119,4,11,1),(120,4,12,1),(121,4,13,1),(122,4,14,1),(123,4,15,1),(124,4,16,1),(125,4,17,1),(126,4,18,1),(127,4,19,1),(128,4,20,1),(129,4,21,1),(130,4,22,1),(131,4,23,1),(132,4,24,1),(133,4,25,0),(134,4,26,1),(135,4,27,0),(136,4,28,0),(137,4,29,0),(138,4,30,0),(139,4,31,0),(140,4,32,0),(141,4,33,1),(142,4,34,1),(143,4,35,1),(144,4,36,1),(145,5,1,0),(146,5,2,0),(147,5,3,0),(148,5,4,0),(149,5,5,0),(150,5,6,1),(151,5,7,0),(152,5,8,0),(153,5,9,0),(154,5,10,1),(155,5,11,0),(156,5,12,0),(157,5,13,1),(158,5,14,1),(159,5,15,1),(160,5,16,1),(161,5,17,0),(162,5,18,1),(163,5,19,0),(164,5,20,0),(165,5,21,0),(166,5,22,1),(167,5,23,0),(168,5,24,0),(169,5,25,0),(170,5,26,1),(171,5,27,0),(172,5,28,0),(173,5,29,0),(174,5,30,1),(175,5,31,0),(176,5,32,0),(177,5,33,0),(178,5,34,1),(179,5,35,0),(180,5,36,0),(181,2,37,1),(182,2,38,1);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'principal'),(3,'professor'),(4,'teacher'),(5,'parent');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_group_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `semestar_id` int(11) NOT NULL,
  `type` enum('opendoor','celebration','dayoff') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schedules_users1_idx` (`lecturer_id`),
  KEY `fk_schedules_student_group1_idx` (`student_group_id`),
  KEY `fk_schedules_semestars1_idx` (`semestar_id`),
  CONSTRAINT `fk_schedules_semestars1` FOREIGN KEY (`semestar_id`) REFERENCES `semestars` (`id`),
  CONSTRAINT `fk_schedules_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`),
  CONSTRAINT `fk_schedules_users1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestars`
--

DROP TABLE IF EXISTS `semestars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part_of_semestar` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestars`
--

LOCK TABLES `semestars` WRITE;
/*!40000 ALTER TABLE `semestars` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_group`
--

DROP TABLE IF EXISTS `student_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_year` year(4) NOT NULL,
  `finish_year` year(4) NOT NULL,
  `main_teacher_id` int(11) DEFAULT NULL,
  `subgroup_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `year_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_group_subgroups1_idx` (`subgroup_id`),
  KEY `fk_student_group_users1_idx` (`main_teacher_id`),
  KEY `year_id_fk_idx` (`year_id`),
  CONSTRAINT `main_teacher_id_fk` FOREIGN KEY (`main_teacher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `subgroup_id_fk` FOREIGN KEY (`subgroup_id`) REFERENCES `subgroups` (`id`),
  CONSTRAINT `year_id_fk` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_group`
--

LOCK TABLES `student_group` WRITE;
/*!40000 ALTER TABLE `student_group` DISABLE KEYS */;
INSERT INTO `student_group` VALUES (1,2012,2020,4,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',8),(2,2012,2020,7,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',8),(3,2012,2020,16,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',8),(4,2013,2021,21,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',7),(5,2013,2021,24,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',7),(6,2013,2021,9,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',7),(7,2014,2022,29,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',6),(8,2014,2022,30,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',6),(9,2014,2022,32,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',6),(10,2015,2023,35,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',5),(11,2015,2023,37,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',5),(12,2015,2023,39,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',5),(13,2016,2024,44,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',4),(14,2016,2024,48,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',4),(15,2016,2024,50,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',4),(16,2017,2025,51,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',3),(17,2017,2025,58,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',3),(18,2017,2025,60,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',3),(19,2018,2026,63,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',2),(20,2018,2026,64,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',2),(21,2018,2026,68,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',2),(22,2019,2027,74,1,'2020-01-15 10:47:59','2020-01-15 10:47:59',1),(23,2019,2027,79,2,'2020-01-15 10:47:59','2020-01-15 10:47:59',1),(24,2019,2027,84,3,'2020-01-15 10:47:59','2020-01-15 10:47:59',1);
/*!40000 ALTER TABLE `student_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `social_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `student_group_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_group_id_fk_idx` (`student_group_id`),
  KEY `student_group_fk_id_idx` (`student_group_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `fk_students_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Artusss','Bothbie','2005-12-20','55-307-1675','2020-01-13 08:40:25','2020-01-15 11:49:04',1,6),(2,'Misty','Dinis','2012-01-23','19-851-8314','2020-01-13 08:40:25','2020-01-15 11:49:04',22,6),(3,'Moe','Duddell','2006-01-20','70-288-7005','2020-01-13 08:40:25','2020-01-15 11:49:04',4,8),(4,'Elsworth','Naper','2010-05-29','69-929-9590','2020-01-13 08:40:25','2020-01-15 11:49:04',16,12),(5,'Ephrem','Benedit','2007-07-01','34-326-1091','2020-01-13 08:40:25','2020-01-15 11:49:04',7,12),(6,'Carey','Finnie','2005-04-08','75-186-9440','2020-01-13 08:40:25','2020-01-15 11:49:04',1,12),(7,'Zorah','Dossetter','2008-05-21','34-144-8024','2020-01-13 08:40:25','2020-01-15 11:49:04',10,14),(8,'Sonia','Andreini','2007-08-01','10-086-6372','2020-01-13 08:40:25','2020-01-15 11:49:04',7,15),(9,'Summer','Wetton','2006-07-12','53-146-2668','2020-01-13 08:40:25','2020-01-15 11:49:04',4,17),(10,'Mandel','Dorin','2008-08-22','04-357-5286','2020-01-13 08:40:25','2020-01-15 11:49:04',10,17),(11,'Parsifal','Shattock','2009-03-13','04-177-6094','2020-01-13 08:40:25','2020-01-15 11:49:04',13,18),(12,'Fonzie','Prandini','2009-02-19','41-166-4828','2020-01-13 08:40:25','2020-01-15 11:49:04',13,20),(13,'Oliy','Crocetto','2008-04-16','51-727-1408','2020-01-13 08:40:25','2020-01-15 11:49:04',10,20),(14,'Lettie','MacAlpine','2005-01-15','26-372-3906','2020-01-13 08:40:25','2020-01-15 11:49:04',1,20),(15,'Joane','Hanbidge','2011-10-20','87-449-1206','2020-01-13 08:40:25','2020-01-15 11:49:04',19,22),(16,'Sabina','Vestica','2006-08-16','12-060-7721','2020-01-13 08:40:25','2020-01-15 11:49:04',4,22),(17,'Susan','Boundy','2007-04-08','60-366-7653','2020-01-13 08:40:25','2020-01-15 11:49:04',7,25),(18,'Cissiee','Thunders','2010-06-07','05-527-5369','2020-01-13 08:40:25','2020-01-15 11:49:04',16,25),(19,'Carolus','Peacop','2007-07-18','99-097-2260','2020-01-13 08:40:26','2020-01-15 11:49:04',7,27),(20,'Jaimie','Caser','2011-12-01','11-753-5955','2020-01-13 08:40:26','2020-01-15 11:49:04',19,27),(21,'Patton','Barsham','2009-08-12','97-845-6795','2020-01-13 08:40:26','2020-01-15 11:49:04',13,34),(22,'Helaine','Heinig','2006-05-08','64-402-5078','2020-01-13 08:40:26','2020-01-15 11:49:04',4,36),(23,'Maryjane','Leele','2007-08-01','99-968-0226','2020-01-13 08:40:26','2020-01-15 11:49:04',7,40),(24,'Natalina','Falkous','2007-02-25','45-136-6466','2020-01-13 08:40:26','2020-01-15 11:49:04',7,43),(25,'Theo','Lilian','2007-02-06','53-383-1197','2020-01-13 08:40:26','2020-01-15 11:49:04',7,43),(26,'Reagen','Venneur','2008-03-02','64-369-5910','2020-01-13 08:40:26','2020-01-15 11:49:04',10,46),(27,'Casandra','Floodgate','2006-12-17','74-664-2768','2020-01-13 08:40:26','2020-01-15 11:49:04',4,47),(28,'Harry','Larne','2009-07-19','20-647-1918','2020-01-13 08:40:26','2020-01-15 11:49:04',13,47),(29,'Prissie','Sherwen','2005-02-15','31-636-2941','2020-01-13 08:40:26','2020-01-15 11:49:04',1,54),(30,'Daune','Manby','2011-06-11','75-838-0276','2020-01-13 08:40:26','2020-01-15 11:49:04',19,56),(31,'Annemarie','Scampion','2006-08-23','73-478-7611','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,56),(32,'Porty','Pindar','2008-01-25','28-194-4783','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,65),(33,'Ron','Burgett','2008-01-18','58-191-2263','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,65),(34,'Boonie','Branchet','2008-01-24','68-943-2949','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,65),(35,'Andonis','Gyde','2010-04-01','34-174-2528','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,67),(36,'Madelon','Leggin','2009-03-28','39-236-0896','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,69),(37,'Bobine','Shallcrass','2006-03-01','70-653-6672','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,69),(38,'Shurlocke','Planks','2011-06-29','36-102-7680','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,69),(39,'Brandy','Buntine','2008-11-06','07-050-7865','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,70),(40,'Ilyssa','Comellini','2010-08-14','80-857-7604','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,70),(41,'Hubey','Duffie','2010-10-11','51-298-8247','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,72),(42,'Fredericka','Yewdell','2009-03-16','81-939-8157','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,73),(43,'Brandon','Cuseck','2007-03-10','01-044-6809','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,76),(44,'Gal','Wyborn','2006-10-12','95-889-0457','2020-01-13 08:40:26','2020-01-13 22:40:56',NULL,76),(45,'Myrlene','Creane','2012-12-19','13-948-4128','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,80),(46,'Arv','Mattityahou','2012-11-29','65-647-1984','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,82),(47,'Merilee','Stetson','2011-08-30','02-783-5791','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,82),(48,'Padraig','Mains','2008-11-29','68-081-5001','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,89),(49,'Wilmette','Broske','2011-10-11','11-609-1215','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,92),(50,'Tabby','Sucre','2009-05-09','37-883-7103','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,92),(51,'Sherwin','Alekhov','2011-05-19','38-091-3662','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,92),(52,'Donna','Peyntue','2011-02-25','35-183-9132','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,92),(53,'Honor','Baroc','2008-11-24','20-233-2850','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,95),(54,'Padriac','Schuster','2008-12-18','00-389-4544','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,100),(55,'Beale','Sybry','2007-01-23','85-130-9558','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,101),(56,'Marketa','Wythe','2011-06-27','48-331-5900','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,101),(57,'Nealson','Jopson','2010-09-30','07-149-5965','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,101),(58,'Louisette','Freestone','2008-01-19','67-283-9658','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,105),(59,'Bird','Clynman','2010-07-03','60-609-7459','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,105),(60,'Jorry','Marson','2012-11-26','08-539-9665','2020-01-13 08:40:27','2020-01-13 22:40:56',NULL,105),(61,'Dorothea','Thompson','2011-11-05','41-815-0180','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,108),(62,'Samuele','Cartmale','2008-09-04','03-457-9572','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,109),(63,'Dominick','Rau','2011-11-27','30-087-4002','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,110),(64,'Jase','Buglass','2011-09-11','75-072-1579','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,111),(65,'Davin','Hehnke','2008-05-02','12-177-1502','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,112),(66,'Jacqueline','Scola','2011-07-16','59-565-7746','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,113),(67,'Ertha','Utting','2005-07-21','33-723-4273','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,114),(68,'Quillan','Mowsley','2008-01-17','56-776-8216','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,115),(69,'Bobbie','Dowdam','2007-06-17','08-828-5216','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,116),(70,'Davida','Trainor','2011-06-27','95-066-4294','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,117),(71,'Fred','Bulbrook','2008-03-26','87-395-5372','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,118),(72,'Hilary','Dressel','2006-01-30','09-660-8349','2020-01-13 08:40:27','2020-01-13 23:08:12',NULL,119),(73,'Gaspard','Plowell','2005-04-16','13-966-3667','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,120),(74,'Merline','Ebsworth','2007-02-27','80-014-7658','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,121),(75,'Jackie','Semken','2008-06-02','69-156-5223','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,122),(76,'Debbi','Meni','2006-06-18','95-992-1723','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,123),(77,'Randal','Leathley','2009-10-20','75-156-4151','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,124),(78,'Benni','Belfelt','2006-05-22','80-222-1636','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,125),(79,'Dav','Robbins','2005-03-16','86-789-0335','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,126),(80,'Corliss','Mulder','2009-01-30','95-998-4623','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,127),(81,'Deva','Tumbridge','2008-06-23','20-958-4277','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,128),(82,'Allayne','Galer','2012-12-28','94-909-0668','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,129),(83,'Shina','Kauble','2008-02-16','64-861-4202','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,130),(84,'Herc','Igo','2005-07-05','04-008-1956','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,131),(85,'Dew','Zecchini','2009-11-13','69-440-2005','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,132),(86,'Marvin','Pridham','2005-04-26','40-549-8343','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,133),(87,'Hally','Amys','2006-08-11','76-736-7608','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,134),(88,'Reynard','Temprell','2007-06-15','65-051-6000','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,135),(89,'Krystal','Fetherston','2010-12-23','80-745-7431','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,136),(90,'Dion','Fincken','2006-02-06','16-994-2110','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,137),(91,'Gaynor','Milsted','2011-07-15','63-267-1606','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,138),(92,'Amanda','Michal','2011-01-29','45-727-9322','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,139),(93,'Melisandra','Nice','2012-09-24','62-753-0866','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,140),(94,'Emyle','Bleything','2006-06-05','37-951-2413','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,141),(95,'Carole','Jewell','2005-05-10','68-611-4682','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,142),(96,'Kathryne','Frears','2005-11-09','35-763-6429','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,143),(97,'Tabbitha','Arents','2009-06-18','39-002-4984','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,144),(98,'Jedidiah','Lotterington','2007-08-29','00-279-5942','2020-01-13 08:40:28','2020-01-13 23:08:12',NULL,145),(99,'Georgianne','Impey','2012-01-10','41-076-3260','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,146),(100,'Arlinda','Perle','2007-10-09','63-107-9385','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,147),(101,'Brucie','Reef','2010-07-19','41-508-9271','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,148),(102,'Saxe','Dimitrov','2010-11-24','99-694-7132','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,149),(103,'Reinald','Godmer','2012-10-09','59-648-7785','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,150),(104,'Tadeo','Pykett','2007-06-06','65-012-9321','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,151),(105,'Carmelina','Dudson','2007-03-10','21-471-1941','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,152),(106,'Willow','Mellor','2011-12-14','45-919-5715','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,153),(107,'Pat','Splevin','2008-08-10','81-517-8318','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,154),(108,'Kelsey','Verecker','2007-05-18','99-817-0664','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,155),(109,'Murvyn','Boscher','2006-03-31','91-097-2045','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,156),(110,'Marabel','Sharphurst','2006-06-27','85-527-1046','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,157),(111,'Cathe','Bastable','2006-09-07','82-861-0934','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,158),(112,'Noach','Batcock','2005-03-17','87-671-7284','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,159),(113,'Meredith','Reims','2011-10-25','61-206-1217','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,160),(114,'Adriana','MacNulty','2011-12-22','06-455-6678','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,161),(115,'Eilis','Piecha','2008-11-28','98-593-5297','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,162),(116,'Frederique','Truwert','2005-01-03','56-727-7514','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,163),(117,'Konstance','Wooder','2012-09-16','31-354-6883','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,164),(118,'Rollin','Ockwell','2005-04-26','97-800-0196','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,165),(119,'Ford','Arkley','2008-10-10','04-205-5299','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,166),(120,'Nathalie','Domingues','2007-10-11','33-752-3879','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,167),(121,'Milzie','Treagust','2010-12-22','50-073-7048','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,168),(122,'Rodd','Kobsch','2011-06-13','54-818-1584','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,169),(123,'Merrie','Healey','2010-05-15','88-374-5906','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,170),(124,'Carola','Pinches','2006-07-02','09-174-8858','2020-01-13 08:40:29','2020-01-13 23:08:12',NULL,171),(125,'Marcel','Bagot','2006-02-02','59-501-9585','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,172),(126,'Kingsly','Haskew','2012-06-10','47-624-6146','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,173),(127,'Adah','Ivanenko','2010-04-28','85-882-5821','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,174),(128,'Natalina','Barthrop','2008-12-15','43-984-0203','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,175),(129,'Leelah','Chesnut','2009-01-18','26-752-0839','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,176),(130,'Binnie','Exell','2007-06-10','31-967-7388','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,177),(131,'Verla','Gellan','2011-12-14','05-409-6024','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,178),(132,'Aloysia','Newark','2012-01-19','06-323-5983','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,179),(133,'Fayette','Petrou','2009-03-09','42-477-6735','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,180),(134,'Giustino','Arnefield','2012-10-04','28-609-6326','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,181),(135,'Charissa','Dachey','2012-10-29','50-675-9611','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,182),(136,'Melisandra','Fishly','2011-05-14','94-000-0996','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,183),(137,'Karl','MacCawley','2010-01-14','66-596-3979','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,184),(138,'Ola','MacGillivray','2008-07-03','23-753-0878','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,185),(139,'Nanete','Shields','2009-02-11','19-457-0024','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,186),(140,'Agata','O\'Currane','2012-01-15','80-358-4626','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,187),(141,'Fin','Toopin','2009-03-15','35-921-5104','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,188),(142,'Hilda','Glowacki','2011-03-11','61-250-9030','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,189),(143,'Shellysheldon','Lauderdale','2009-12-10','12-526-7033','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,190),(144,'Hoebart','Henricsson','2012-11-03','51-308-3840','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,191),(145,'James','Rainville','2006-12-22','50-244-5953','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,192),(146,'Malvin','Knappett','2012-05-12','38-495-3380','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,193),(147,'Gerrie','Solomonides','2006-10-14','02-848-8502','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,194),(148,'Florry','Satchel','2006-11-21','93-724-6549','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,195),(149,'Fowler','Jermy','2009-07-31','09-036-0844','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,196),(150,'Stacie','Wyon','2006-09-28','37-338-9055','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,197),(151,'Adrianne','Altree','2011-08-18','04-486-5621','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,199),(152,'Cecilla','Philp','2011-07-31','98-237-5090','2020-01-13 08:40:30','2020-01-13 23:08:12',NULL,198),(153,'Penrod','Monget','2007-08-13','69-927-6590','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,200),(154,'Kelwin','Cooke','2006-05-03','52-649-1170','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,201),(155,'Isabel','Weepers','2011-06-05','02-990-8532','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,202),(156,'Berton','Balint','2008-12-25','37-323-7777','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,203),(157,'Dacie','Mandrier','2010-08-28','24-948-3319','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,204),(158,'Brittne','Pounds','2007-01-13','57-599-5090','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,205),(159,'Domenic','Milius','2010-06-28','62-325-7372','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,206),(160,'Nita','Sharrard','2010-11-02','25-488-9453','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,207),(161,'Zorah','Brodeur','2012-08-21','49-025-1310','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,208),(162,'Blanca','Gullivent','2011-11-16','93-053-1525','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,209),(163,'Fredericka','Cadwallader','2009-01-01','75-512-3317','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,210),(164,'Deana','Hickisson','2010-02-19','50-501-9465','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,211),(165,'Dominic','Mandel','2005-02-24','77-866-7619','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,212),(166,'Faith','McGlynn','2008-05-05','88-648-5259','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,213),(167,'Addia','Collar','2008-12-28','36-342-7902','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,214),(168,'Olivero','Karmel','2007-02-25','26-364-9643','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,215),(169,'Romy','Frunks','2008-07-05','61-368-5395','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,216),(170,'Izzy','Paulsen','2010-08-02','73-392-9474','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,217),(171,'Wright','Enbury','2012-01-04','38-290-0805','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,218),(172,'Jolynn','Arends','2012-03-23','80-270-5292','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,219),(173,'Ravid','Sewall','2007-10-14','59-470-2388','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,220),(174,'Salome','Tonkes','2011-10-14','70-083-7206','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,221),(175,'Gilbertine','Tremayne','2007-06-29','04-235-4321','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,222),(176,'Tanner','Barradell','2007-09-22','05-214-9599','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,223),(177,'Taffy','Tullot','2011-08-08','24-199-7911','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,224),(178,'Jermayne','Neggrini','2010-08-01','39-854-7087','2020-01-13 08:40:31','2020-01-13 23:08:12',NULL,225),(179,'Hubey','Baumber','2007-11-19','64-621-2265','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,226),(180,'Blithe','Aymes','2005-04-26','39-457-6205','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,227),(181,'Ermengarde','Jurries','2010-04-30','57-649-8095','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,228),(182,'Auguste','McMorland','2010-12-16','62-647-3876','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,229),(183,'Ruddy','Twyford','2012-12-31','17-377-4923','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,230),(184,'Ring','Laver','2007-05-14','45-517-1351','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,231),(185,'Chad','Royds','2010-06-25','03-583-4578','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,232),(186,'Alain','Lancaster','2012-07-04','86-672-7366','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,233),(187,'Florella','MacDearmont','2008-08-03','30-510-4947','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,234),(188,'Emanuel','Scholes','2012-03-17','86-174-9686','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,235),(189,'Wes','Baselli','2005-03-30','54-364-5249','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,236),(190,'Rafi','Shewen','2012-11-25','85-324-0175','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,237),(191,'Ethel','Featherston','2011-10-18','87-478-7410','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,238),(192,'Karon','Mainds','2007-11-08','76-481-8346','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,239),(193,'Colin','Noirel','2005-07-14','56-376-1021','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,240),(194,'Martie','Joselovitch','2007-03-01','33-162-9657','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,241),(195,'Lonny','Tytler','2007-11-11','85-108-8148','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,242),(196,'Anastassia','Dessent','2009-04-07','34-934-6164','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,243),(197,'Ludvig','McRuvie','2011-02-28','43-812-8126','2020-01-13 08:40:32','2020-01-13 23:08:12',NULL,244),(198,'Gavan','Cantua','2012-01-29','05-326-3655','2020-01-13 08:40:32','2020-01-14 11:41:41',NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgroups`
--

DROP TABLE IF EXISTS `subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgroups`
--

LOCK TABLES `subgroups` WRITE;
/*!40000 ALTER TABLE `subgroups` DISABLE KEYS */;
INSERT INTO `subgroups` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `subgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_classes_users1_idx` (`lecturer_id`),
  CONSTRAINT `fk_classes_users1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Mathematics',4),(2,'Languages',7),(3,'History',16),(4,'Music',21),(5,'Geography',24),(6,'Literacy',9),(7,'Natural history',29),(8,'Science',30),(9,'History',32),(10,'Physical education',35),(11,'Computer studies',37),(12,'Art',39),(13,'Languages',44),(14,'Languages',48),(15,'Mathematics',50),(16,'Art',51),(17,'Literacy',58),(18,'Science',60),(19,'Physical ',63),(20,'Science',64),(21,'Physical ',68),(22,'Natural history',74),(23,'Citizenship',79),(24,'Science',84),(25,'History',86),(26,'History',87),(27,'Physical education',88),(29,'Computer studies',93),(30,'Computer studies',97),(31,'Graphical Design',84);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_roles1_idx` (`role_id`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'pera','peric','pera@peric.com',1,'pera','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(3,'mira','miric','mira@miric.com',2,'mira','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(4,'ana','anic','ana@anic.com',3,'ana','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(5,'luka','lukic','luka@lukic.com',4,'luka','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(6,'dejan','dekic','dejan@dekic.com',5,'dejan','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(7,'Valentine','Speenden','vspeenden0@home.pl',3,'duamXprgXad','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(8,'Courtney','Husthwaite','chusthwaite1@marketwatch.com',5,'JQBmpE','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(9,'Olin','Willows','owillows2@soup.io',3,'B3gwvx6VX7Q','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(10,'Elly','Sesser','esesser3@ucla.edu',4,'AEEKeFh8Cmsu','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(11,'Laverna','Kiellor','lkiellor4@zimbio.com',4,'7hQzLaz','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(12,'Gregoor','Chaundy','gchaundy5@sakura.ne.jp',5,'4vM5VVT9MH','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(13,'Merilee','de Mendoza','mdemendoza6@wordpress.org',4,'0h6XgG5nXB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(14,'Karole','Dunkerly','kdunkerly7@paginegialle.it',5,'njtNWTAsGcV','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(15,'Aymer','Jorcke','ajorcke8@spotify.com',5,'wEFM95e','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(16,'Wash','Eastop','weastop9@hao123.com',3,'1ArxEpjdYRu','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(17,'Jorey','Dary','jdarya@gov.uk',5,'2jfWyG0Ua','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(18,'Mickey','Stollen','mstollenb@reverbnation.com',5,'BEs44lOSQNC','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(19,'Frederigo','Aindrais','faindraisc@google.it',4,'YQRT8NU','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(20,'Sonny','Seeman','sseemand@google.co.jp',5,'vcLm8V','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(21,'Rahel','Giscken','rgisckene@rediff.com',3,'3IL6OM9','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(22,'Tony','Soprano','tboornef@newsvine.com',5,'Z7qcu0fmL7','2020-01-10 11:27:28','2020-01-09 15:16:04',NULL),(23,'Garald','Rusk','gruskg@disqus.com',4,'9ZFcyH0Lt','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(24,'Isis','Thirkettle','ithirkettleh@google.de',3,'Cn19NNijD6','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(25,'Natassia','Ciubutaro','nciubutaroi@arstechnica.com',5,'GrTb16c','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(26,'Naomi','Gauford','ngaufordj@freewebs.com',4,'HMKsKw4EIia','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(27,'Jarret','Netti','jnettik@people.com.cn',5,'vVfuixAG','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(28,'Wallache','Coling','wcolingl@indiatimes.com',4,'buUeiC','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(29,'Frayda','Gutierrez','fgutierrezm@taobao.com',3,'x7XeRISmEw','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(30,'Brigitta','Millett','bmillettn@cnn.com',3,'0FGE3TQ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(31,'Francklyn','Fredson','ffredsono@cnet.com',4,'TJfo15crqE','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(32,'Vodopad','Hilldrop','lhilldropp@prnewswire.com',3,'T0tsZQ5L','2020-01-10 11:13:22','2020-01-09 15:16:04',NULL),(33,'Flory','Quilkin','fquilkinq@nbcnews.com',4,'eyhzFvfWeFd','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(34,'Galina','Klausewitz','gklausewitzr@liveinternet.ru',5,'mfxyXd','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(35,'Filippa','Bresnen','fbresnens@youtube.com',3,'jzYpyrdEok','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(36,'Pollyanna','Knightley','pknightleyt@japanpost.jp',5,'Az5TJaR75','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(37,'Elinor','Haylands','ehaylandsu@state.tx.us',3,'5QiePoM','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(38,'Mickey','Hallam','mhallamv@weibo.com',4,'ezRNf2md','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(39,'Bird','Fidele','bfidelew@vkontakte.ru',3,'GnXPxfB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(40,'Minnnie','Glasby','mglasbyx@linkedin.com',5,'5lnBDmB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(41,'Obadias','Kitchiner','okitchinery@patch.com',4,'CNuzuW','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(42,'Alice','Thurley','athurleyz@army.mil',4,'dLPE4YnZy7Ag','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(43,'Rand','Lomax','rlomax10@themeforest.net',5,'nZCmbJ1RfW','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(44,'Hamid','Kensit','hkensit11@naver.com',3,'9qcok7','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(45,'Mallissa','Ogelsby','mogelsby12@google.ca',4,'yp5ctn','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(46,'Jecho','Duthie','jduthie13@edublogs.org',5,'Ask2OZ9Zgyi0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(47,'Zaccaria','Rawstorn','zrawstorn14@china.com.cn',5,'U90m4ACxQ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(48,'Giovanna','Legat','glegat15@sitemeter.com',3,'E6Zzj6EJVphF','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(49,'Agnes','Wroughton','awroughton16@tuttocitta.it',4,'mOeE4E7U','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(50,'Helen-elizabeth','Lambersen','hlambersen17@woothemes.com',3,'5dqCiunn','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(51,'Gusti','Sok','gamesbury18@globo.com',3,'hUyhxoAP1','2020-01-10 11:24:03','2020-01-09 15:16:04',NULL),(52,'Karole','Adderson','kadderson19@topsy.com',4,'j6T9t9UdDDY1','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(53,'Opaline','Meadway','omeadway1a@deliciousdays.com',4,'8t8V8x4','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(54,'Brena','Hallan','bhallan1b@naver.com',5,'NVKEgbLgL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(55,'Tawnya','O\' Markey','tomarkey1c@wikia.com',4,'w06eAwAaL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(56,'Worthington','Gynn','wgynn1d@clickbank.net',5,'63ESBtM1','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(57,'Rick','Scheffel','rscheffel1e@hibu.com',4,'s2RA5KGl7qV','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(58,'Ardath','McMillan','amcmillan1f@cam.ac.uk',3,'ULUYlXAi','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(59,'Cosmo','Metcalfe','cmetcalfe1g@pen.io',4,'hXWZc8g5qFJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(60,'Myles','Haddy','mhaddy1h@jigsy.com',3,'iW4LVBy','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(61,'Kamilah','Fynes','kfynes1i@alexa.com',4,'ULRAuKh10c','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(62,'Ilsa','Bawden','ibawden1j@sphinn.com',4,'W6SlCp5','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(63,'Nonnah','Lucks','nlucks1k@jiathis.com',3,'ZHpU0juL2gAV','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(64,'Orelia','Aitchison','oaitchison1l@paypal.com',3,'bDKwXDt6','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(65,'Obadiah','Medlen','omedlen1m@newsvine.com',5,'0GsFejRDJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(66,'Jeffrey','Balkwill','jbalkwill1n@comcast.net',5,'uA5zs6qnO','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(67,'Pearle','Ealles','pealles1o@wiley.com',5,'DK9WilAUzv2c','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(68,'Cheri','Classic','cmeake1p@webnode.com',3,'fPLQf6VlP','2020-01-10 11:25:55','2020-01-09 15:16:04',NULL),(69,'Franklin','Baldin','fbaldin1q@sourceforge.net',5,'wpVCuG','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(70,'Ines','Delves','idelves1r@bravesites.com',5,'dxT0JaPpOD8','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(71,'Osgood','Osbad','okelso1s@tmall.com',4,'BMFYGfzEgX1D','2020-01-10 11:26:54','2020-01-09 15:16:04',NULL),(72,'Clarence','Maydway','cmaydway1t@baidu.com',5,'PPl1tjw6','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(73,'Catina','Quested','cquested1u@mysql.com',5,'8CkRAA0oaS','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(74,'Jess','Semkins','jsemkins1v@cbc.ca',3,'K6TA2KiEk','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(75,'Enid','Truin','etruin1w@phpbb.com',4,'4DSN10sB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(76,'Danie','Wearne','dwearne1x@kickstarter.com',5,'sgzXMl7f','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(77,'Maegan','Done','mdone1y@wikia.com',4,'goErrRZJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(78,'Luise','Tardiff','ltardiff1z@barnesandnoble.com',4,'KXtCS0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(79,'Dedie','Springtorpe','dspringtorpe20@hostgator.com',3,'AcM8IH','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(80,'Northrup','Barnby','nbarnby21@hp.com',5,'OT0LOHh','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(81,'Bellina','Fosdike','bfosdike22@stanford.edu',4,'nu1t8tVWOBc','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(82,'Edvard','Pittock','epittock23@instagram.com',5,'FX6dG3XDJPP','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(83,'Katerina','Ambrosini','kambrosini24@e-recht24.de',4,'Rack9y0n9W','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(84,'Bear','Medved','bdobson25@blogspot.com',3,'CInIx6xps4','2020-01-10 11:36:05','2020-01-09 15:16:04',NULL),(85,'Rodger','Ferre','rferre26@ehow.com',4,'fFAgmjL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(86,'Allen','Faulconer','afaulconer27@cdbaby.com',3,'06sB5Jn','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(87,'Luca','Catherick','lcatherick28@army.mil',3,'2bKQ8tg1O','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(88,'Myrtice','Stoak','mstoak29@earthlink.net',3,'clXr1C2ITBz','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(89,'Arnuad','Craighead','acraighead2a@yahoo.co.jp',5,'oLXqjN','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(90,'Dorotea','Teenan','dteenan2b@lycos.com',3,'SSVZXM7U5I0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(91,'Thatch','Soloway','tsoloway2c@bandcamp.com',4,'vLIrPWVdP','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(92,'Garrek','Clemanceau','gclemanceau2d@themeforest.net',5,'2G4wWYCLk','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(93,'Gustave','Juza','gjuza2e@tuttocitta.it',3,'BXgSPI','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(94,'Moselle','Itskovitz','mitskovitz2f@netlog.com',4,'EnQinvdvyE','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(95,'Marleah','Dugget','mdugget2g@vk.com',5,'ApFIz3','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(96,'Lita','Pendergrast','lpendergrast2h@nifty.com',4,'gtKQNJaqpJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(97,'Rozanne','Wheeler','rwheeler2i@princeton.edu',3,'9Su111wllA','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(98,'Suzette','Benjafield','sbenjafield2j@nytimes.com',4,'aSGazFlwUwg','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(99,'Mel','Cunney','mcunney2k@technorati.com',4,'He0JdnBxl','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(100,'Mitchel','Kemmett','mkemmett2l@amazon.co.jp',5,'rZ8k1G7sF','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(101,'Quill','McFadzean','qmcfadzean2m@zimbio.com',5,'yA2OH7O','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(102,'Teddy','Dovington','tdovington2n@apache.org',4,'lMr5KF8','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(103,'Elwood','Dudeney','edudeney2o@ehow.com',4,'k2uuFsn0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(104,'Toddie','Condict','tcondict2p@instagram.com',4,'o9n3G5s','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(105,'Elmira','Leijs','eleijs2q@fastcompany.com',5,'2FpyI1iUqfpD','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(106,'Hart','Mazzia','hmazzia2r@bandcamp.com',4,'DznYXqL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(108,'Berkly','Bussen','bbussen0@cdc.gov',5,'apdxPD','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(109,'Latashia','Aspenlon','laspenlon1@skyrock.com',5,'9LGFm9RV3TTv','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(110,'Milo','McCullouch','mmccullouch2@seesaa.net',5,'TxU3RLqgEP','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(111,'Antonius','Goodridge','agoodridge3@fema.gov',5,'dyc95DYlm','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(112,'Jolynn','Richmond','jrichmond4@walmart.com',5,'aIHlikuT4Lk','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(113,'Amye','Pellew','apellew5@dagondesign.com',5,'YOp7juFZnUuv','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(114,'Kristien','Orae','korae6@psu.edu',5,'oHsYy1I78yv','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(115,'Jabez','Grayling','jgrayling7@bloglovin.com',5,'KNTblhMV9c','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(116,'Cariotta','Verrillo','cverrillo8@blogtalkradio.com',5,'Zsj98C','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(117,'Betty','Rowantree','browantree9@stumbleupon.com',5,'2NExONipB38','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(118,'Kary','Rigmond','krigmonda@ibm.com',5,'Gm0RTLcyW','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(119,'Franz','Georgeau','fgeorgeaub@usda.gov',5,'OXXGIj','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(120,'Alexina','Wardroper','awardroperc@ning.com',5,'DIhIPeKNUN','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(121,'Emalia','Haliburn','ehaliburnd@slideshare.net',5,'OdYdEY1eCy','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(122,'Garold','Behagg','gbehagge@fastcompany.com',5,'XfX08xKS3o','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(123,'Lemmy','Brothers','lbrothersf@wp.com',5,'14XCf8P','2020-01-13 22:45:45','2020-01-13 22:45:45',NULL),(124,'Nevil','Poytheras','npoytherasg@ustream.tv',5,'jPUdiioSO1','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(125,'Garrek','Vedenichev','gvedenichevh@infoseek.co.jp',5,'mbzLdlGLc','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(126,'Washington','Lockton','wlocktoni@google.pl',5,'WzBT0gatEI','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(127,'Maxie','MacRury','mmacruryj@pagesperso-orange.fr',5,'wZdhZ0t','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(128,'Nesta','Russe','nrussek@delicious.com',5,'fAAM3j','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(129,'Aurelia','Pawley','apawleyl@goodreads.com',5,'Kvm4JEDqf','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(130,'Archibaldo','Giottoi','agiottoim@goodreads.com',5,'oD3BYZZ','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(131,'Alwin','Harmant','aharmantn@miibeian.gov.cn',5,'EL1kuwQl5db','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(132,'Bernelle','Collen','bcolleno@hc360.com',5,'eMlq4LO','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(133,'Trev','Tingly','ttinglyp@jimdo.com',5,'ph7S29R0','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(134,'Juliette','Jephcote','jjephcoteq@cam.ac.uk',5,'d0AJaib1G','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(135,'Selia','Audritt','saudrittr@studiopress.com',5,'90bWdjj8XlJi','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(136,'Alexio','Offner','aoffners@over-blog.com',5,'1bnciM7R63VK','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(137,'Sheelah','Wyer','swyert@netscape.com',5,'KCXPhTXG','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(138,'Lizzie','Appleyard','lappleyardu@ezinearticles.com',5,'nqVu3F75LkR','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(139,'Doti','Fronczak','dfronczakv@shutterfly.com',5,'f0SyeLyFW9Qu','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(140,'Marlene','Hembling','mhemblingw@quantcast.com',5,'K5Et4ncrmj','2020-01-13 22:45:46','2020-01-13 22:45:46',NULL),(141,'Giovanna','McDonald','gmcdonaldx@uol.com.br',5,'UdTINjx','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(142,'Kerr','Tilbey','ktilbeyy@acquirethisname.com',5,'Tq9wPNx','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(143,'Chane','Joy','cjoyz@opensource.org',5,'GS4Lgp','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(144,'Fabe','Frenchum','ffrenchum10@vinaora.com',5,'4X3q2AUWhxYJ','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(145,'Vivyanne','Kelsall','vkelsall11@prlog.org',5,'Gi7co57','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(146,'Quentin','Feakins','qfeakins12@linkedin.com',5,'jamkHEk3y7ZA','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(147,'Baily','Colgrave','bcolgrave13@plala.or.jp',5,'qLGMAwpX3','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(148,'Olvan','Trainer','otrainer14@pen.io',5,'ErQ1ZPXO9Ld','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(149,'Davidde','Runge','drunge15@uol.com.br',5,'PjqUMh1D7X','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(150,'Krissy','Pomphrey','kpomphrey16@tripadvisor.com',5,'QnU6wkp15','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(151,'Fair','Hazeley','fhazeley17@people.com.cn',5,'TIRvT7IeDg','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(152,'Fania','Hawkswell','fhawkswell18@businessinsider.com',5,'lUv8X07','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(153,'Cyrus','Speeks','cspeeks19@huffingtonpost.com',5,'QqfL8b4NzL','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(154,'Coral','McNae','cmcnae1a@cornell.edu',5,'EOi4ocXCKg','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(155,'Patrice','Brabin','pbrabin1b@wikimedia.org',5,'T6yJwi','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(156,'Fredericka','Koche','fkoche1c@spiegel.de',5,'pUeVJd7UBtRh','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(157,'Martelle','Jakab','mjakab1d@thetimes.co.uk',5,'xAXX3IZ6k','2020-01-13 22:45:47','2020-01-13 22:45:47',NULL),(158,'Sheila','Cossey','scossey1e@discovery.com',5,'3KQAtr','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(159,'Adeline','Dudney','adudney1f@wiley.com',5,'sl33gYkaFTr','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(160,'Leisha','Zamboniari','lzamboniari1g@imgur.com',5,'XXtKs5tujs','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(161,'Bernadine','Cornau','bcornau1h@elpais.com',5,'JLGQyi','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(162,'Hermine','Lehrahan','hlehrahan1i@wsj.com',5,'3UWs4JN1SwTj','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(163,'Oralie','MacTrustey','omactrustey1j@google.com',5,'XPpYZaJ5mkh','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(164,'Dawn','Genthner','dgenthner1k@amazon.com',5,'zy8XqXRUYxZT','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(165,'Ruperto','Gravie','rgravie1l@squarespace.com',5,'vcNlpxMS50','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(166,'Giles','Kures','gkures1m@cargocollective.com',5,'LLS4e22mSb3','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(167,'Cooper','Wathan','cwathan1n@cbsnews.com',5,'Z0sofw4hAn1','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(168,'Mercedes','Dougher','mdougher1o@thetimes.co.uk',5,'Y5SHJk','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(169,'Giffie','Halson','ghalson1p@infoseek.co.jp',5,'R6LRURmKavKI','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(170,'Norina','Kingdon','nkingdon1q@nationalgeographic.com',5,'WfTiIwXtigwz','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(171,'Shelley','Cottam','scottam1r@discovery.com',5,'dYmuAC2','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(172,'Dinnie','Croose','dcroose1s@bizjournals.com',5,'ddK7An6zM','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(173,'Kaitlynn','Jukubczak','kjukubczak1t@cnet.com',5,'8MgsoV20g','2020-01-13 22:45:48','2020-01-13 22:45:48',NULL),(174,'Therine','Minchell','tminchell1u@meetup.com',5,'CPvGQc','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(175,'Zora','Stollhofer','zstollhofer1v@liveinternet.ru',5,'yJ5i5NlFEi','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(176,'Deanna','Hasnip','dhasnip1w@cocolog-nifty.com',5,'tfVes6sKTp','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(177,'Parnell','Lovegrove','plovegrove1x@nhs.uk',5,'W64a5Z','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(178,'Trstram','Thyer','tthyer1y@friendfeed.com',5,'3HlaxipY3D4','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(179,'Karim','Robins','krobins1z@domainmarket.com',5,'YkDHzt','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(180,'Loree','Fairnington','lfairnington20@51.la',5,'0BG9df7E7','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(181,'Willow','Delahunty','wdelahunty21@thetimes.co.uk',5,'tN8FrQ','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(182,'Jerrilee','Clewett','jclewett22@ask.com',5,'SUO9j3ebtyrh','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(183,'Kelley','Flaherty','kflaherty23@marriott.com',5,'8zJGV6KG','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(184,'Emelyne','Aristide','earistide24@baidu.com',5,'FnknkxANMo','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(185,'Ericka','Wychard','ewychard25@merriam-webster.com',5,'cul3L13tqow','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(186,'Ruthie','Percy','rpercy26@ifeng.com',5,'DGwsJCR','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(187,'Casie','Tockell','ctockell27@is.gd',5,'UBF0Zr1Nt5','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(188,'Amble','Callan','acallan28@bandcamp.com',5,'foMZRj','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(189,'Raffarty','Jodlkowski','rjodlkowski29@netlog.com',5,'rH8U6vLD0F','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(190,'Fredericka','Jefferys','fjefferys2a@senate.gov',5,'bcZzl2O','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(191,'Debbi','Ceci','dceci2b@princeton.edu',5,'Orz4bd6Dx44N','2020-01-13 22:45:49','2020-01-13 22:45:49',NULL),(192,'Hort','Kubecka','hkubecka2c@ycombinator.com',5,'Ikwr5qgKLB','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(193,'Janith','Calafate','jcalafate2d@pen.io',5,'7S55Np17fej','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(194,'Gerardo','Quartermain','gquartermain2e@tumblr.com',5,'JkKvK2nHUBT','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(195,'Silvio','Crinidge','scrinidge2f@bandcamp.com',5,'BFAcEd','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(196,'Richie','Jodlowski','rjodlowski2g@nymag.com',5,'HY0BtmT4M6','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(197,'Eustace','Burtwell','eburtwell2h@howstuffworks.com',5,'98gcDyFIfAe','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(198,'Corabella','Dahlen','cdahlen2i@histats.com',5,'7PMzHdE5bJJ','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(199,'Edgar','Bengal','ebengal2j@squarespace.com',5,'hizG1gejg8pJ','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(200,'Stearne','Gloves','sgloves2k@squidoo.com',5,'t7AwJo2SFQ','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(201,'Nani','Casbourne','ncasbourne2l@webnode.com',5,'XG1iZUNYs2Y','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(202,'Lorene','Stegell','lstegell2m@xing.com',5,'Bf36oPC4F1GE','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(203,'Karin','Ruttgers','kruttgers2n@bbb.org',5,'C4Rpk53YN','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(204,'Ammamaria','Langlois','alanglois2o@redcross.org',5,'HF44OybJq','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(205,'Rosana','Lindley','rlindley2p@surveymonkey.com',5,'HqYZZEm','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(206,'Carry','Gounel','cgounel2q@bandcamp.com',5,'1bh0v2K','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(207,'Fawnia','Monteath','fmonteath2r@ocn.ne.jp',5,'FqBoCG','2020-01-13 22:45:50','2020-01-13 22:45:50',NULL),(208,'Tommie','Fellibrand','tfellibrand2s@archive.org',5,'6nfKXNn','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(209,'Tim','Davidov','tdavidov2t@adobe.com',5,'lgk99BgRoyi','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(210,'Ferrel','Mickelwright','fmickelwright2u@simplemachines.org',5,'d0ZslrAdi','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(211,'Zola','Bohea','zbohea2v@desdev.cn',5,'q0GPK5KY6m4C','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(212,'Jeramie','Dreghorn','jdreghorn2w@globo.com',5,'pGtd8DivkTa','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(213,'Karim','Bompas','kbompas2x@wp.com',5,'GMuEF5e','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(214,'Carlynne','Sandever','csandever2y@angelfire.com',5,'6f3NS2Mz','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(215,'Rowen','Petran','rpetran2z@google.cn',5,'khpss9','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(216,'Wiatt','Juliano','wjuliano30@about.me',5,'rrBzFzC5JJoh','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(217,'Tawnya','Schindler','tschindler31@people.com.cn',5,'dJCCSM','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(218,'Hollyanne','Oliveira','holiveira32@indiatimes.com',5,'LhGBaoBBZ','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(219,'Ruprecht','Pennell','rpennell33@mtv.com',5,'C0zRwbwlzgk','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(220,'Chucho','Skillington','cskillington34@dropbox.com',5,'ftkzB8wmsY6B','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(221,'Hamlen','Sindall','hsindall35@gravatar.com',5,'8Fgm6ck9SGzP','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(222,'Wenda','Extill','wextill36@java.com',5,'JVAaXLySIx','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(223,'Elwood','Leete','eleete37@home.pl',5,'NQcP7Ni2B','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(224,'Cassandre','Davidowich','cdavidowich38@delicious.com',5,'7oqfTgH','2020-01-13 22:45:51','2020-01-13 22:45:51',NULL),(225,'Giordano','Tixier','gtixier39@smugmug.com',5,'Um9pew7M','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(226,'Nonah','Scahill','nscahill3a@craigslist.org',5,'ZDBeQ4zog6eN','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(227,'Cherry','Eastes','ceastes3b@eventbrite.com',5,'B4bt2X','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(228,'Suzann','Woodburne','swoodburne3c@wikia.com',5,'p3s8JPwjlM2','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(229,'Lu','Moodie','lmoodie3d@wired.com',5,'DLA7pJQ1brR','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(230,'Dorita','Paybody','dpaybody3e@webnode.com',5,'rrrELu','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(231,'Sam','Smithen','ssmithen3f@aol.com',5,'H1h8WIaW15','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(232,'Beaufort','Ebrall','bebrall3g@abc.net.au',5,'TnEyD3tr3Ytu','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(233,'Isabeau','Yesipov','iyesipov3h@bloglines.com',5,'pa5QxTgYr2e4','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(234,'Dulsea','Belmont','dbelmont3i@g.co',5,'32kJ9ZjxsqF','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(235,'Jacenta','Pingstone','jpingstone3j@sogou.com',5,'WhDCpzP','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(236,'Shelly','Verrall','sverrall3k@microsoft.com',5,'zZpw7ETYLnlh','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(237,'Alfi','Popley','apopley3l@lycos.com',5,'2f4UkG','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(238,'Giuseppe','Drabble','gdrabble3m@europa.eu',5,'JhZOO8iMeGUP','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(239,'Crissy','Josowitz','cjosowitz3n@squidoo.com',5,'9HUuHao2','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(240,'Linea','Skillen','lskillen3o@mysql.com',5,'g7elTNTeB14','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(241,'Audre','Tod','atod3p@photobucket.com',5,'pUKhnf','2020-01-13 22:45:52','2020-01-13 22:45:52',NULL),(242,'Clarence','Spedroni','cspedroni3q@aboutads.info',5,'SwEtdX','2020-01-13 22:45:53','2020-01-13 22:45:53',NULL),(243,'Westley','O\'Roan','woroan3r@bandcamp.com',5,'d37wEokX5','2020-01-13 22:45:53','2020-01-13 22:45:53',NULL),(244,'Sena','Mault','smault3s@samsung.com',5,'5jIh9zf345J','2020-01-13 22:45:53','2020-01-13 22:45:53',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8);
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'e_diary'
--

--
-- Dumping routines for database 'e_diary'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-15 12:50:36
