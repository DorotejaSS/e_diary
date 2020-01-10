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
  `main_teacher_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_group_subgroups1_idx` (`subgroup_id`),
  KEY `fk_student_group_users1_idx` (`main_teacher_id`),
  KEY `year_id_fk_idx` (`year_id`),
  CONSTRAINT `main_teacher_id_fk` FOREIGN KEY (`main_teacher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `subgroup_id_fk` FOREIGN KEY (`subgroup_id`) REFERENCES `subgroups` (`id`),
  CONSTRAINT `year_id_fk` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_group`
--

LOCK TABLES `student_group` WRITE;
/*!40000 ALTER TABLE `student_group` DISABLE KEYS */;
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
  `social_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `student_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_group_id_fk_idx` (`student_group_id`),
  KEY `student_group_fk_id_idx` (`student_group_id`),
  CONSTRAINT `fk_students_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
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
INSERT INTO `subgroups` VALUES (1,1),(2,2),(3,3),(4,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Mathematics',4),(2,'Languages',7),(3,'History',16),(4,'Music',21),(5,'Geography',24),(6,'Literacy',9),(7,'Natural history',29),(8,'Science',30),(9,'History',32),(10,'Physical education',35),(11,'Computer studies',37),(12,'Art',39),(13,'Languages',44),(14,'Languages',48),(15,'Mathematics',50),(16,'Art',51),(17,'Literacy',58),(18,'Science',60),(19,'Physical ',63),(20,'Science',64),(21,'Physical ',68),(22,'Natural history',74),(23,'Citizenship',79),(24,'Science',84),(25,'History',86),(26,'History',87),(27,'Physical education',88),(28,'Computer studies',90),(29,'Computer studies',93),(30,'Computer studies',97);
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'pera','peric','pera@peric.com',1,'pera','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(3,'mira','miric','mira@miric.com',2,'mira','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(4,'ana','anic','ana@anic.com',3,'ana','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(5,'luka','lukic','luka@lukic.com',4,'luka','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(6,'dejan','dekic','dejan@dekic.com',5,'dejan','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(7,'Valentine','Speenden','vspeenden0@home.pl',3,'duamXprgXad','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(8,'Courtney','Husthwaite','chusthwaite1@marketwatch.com',5,'JQBmpE','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(9,'Olin','Willows','owillows2@soup.io',3,'B3gwvx6VX7Q','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(10,'Elly','Sesser','esesser3@ucla.edu',4,'AEEKeFh8Cmsu','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(11,'Laverna','Kiellor','lkiellor4@zimbio.com',4,'7hQzLaz','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(12,'Gregoor','Chaundy','gchaundy5@sakura.ne.jp',5,'4vM5VVT9MH','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(13,'Merilee','de Mendoza','mdemendoza6@wordpress.org',4,'0h6XgG5nXB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(14,'Karole','Dunkerly','kdunkerly7@paginegialle.it',5,'njtNWTAsGcV','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(15,'Aymer','Jorcke','ajorcke8@spotify.com',5,'wEFM95e','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(16,'Wash','Eastop','weastop9@hao123.com',3,'1ArxEpjdYRu','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(17,'Jorey','Dary','jdarya@gov.uk',5,'2jfWyG0Ua','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(18,'Mickey','Stollen','mstollenb@reverbnation.com',5,'BEs44lOSQNC','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(19,'Frederigo','Aindrais','faindraisc@google.it',4,'YQRT8NU','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(20,'Sonny','Seeman','sseemand@google.co.jp',5,'vcLm8V','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(21,'Rahel','Giscken','rgisckene@rediff.com',3,'3IL6OM9','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(22,'Tony','Soprano','tboornef@newsvine.com',5,'Z7qcu0fmL7','2020-01-10 11:27:28','2020-01-09 15:16:04',NULL),(23,'Garald','Rusk','gruskg@disqus.com',4,'9ZFcyH0Lt','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(24,'Isis','Thirkettle','ithirkettleh@google.de',3,'Cn19NNijD6','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(25,'Natassia','Ciubutaro','nciubutaroi@arstechnica.com',5,'GrTb16c','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(26,'Naomi','Gauford','ngaufordj@freewebs.com',4,'HMKsKw4EIia','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(27,'Jarret','Netti','jnettik@people.com.cn',5,'vVfuixAG','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(28,'Wallache','Coling','wcolingl@indiatimes.com',4,'buUeiC','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(29,'Frayda','Gutierrez','fgutierrezm@taobao.com',3,'x7XeRISmEw','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(30,'Brigitta','Millett','bmillettn@cnn.com',3,'0FGE3TQ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(31,'Francklyn','Fredson','ffredsono@cnet.com',4,'TJfo15crqE','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(32,'Vodopad','Hilldrop','lhilldropp@prnewswire.com',3,'T0tsZQ5L','2020-01-10 11:13:22','2020-01-09 15:16:04',NULL),(33,'Flory','Quilkin','fquilkinq@nbcnews.com',4,'eyhzFvfWeFd','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(34,'Galina','Klausewitz','gklausewitzr@liveinternet.ru',5,'mfxyXd','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(35,'Filippa','Bresnen','fbresnens@youtube.com',3,'jzYpyrdEok','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(36,'Pollyanna','Knightley','pknightleyt@japanpost.jp',5,'Az5TJaR75','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(37,'Elinor','Haylands','ehaylandsu@state.tx.us',3,'5QiePoM','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(38,'Mickey','Hallam','mhallamv@weibo.com',4,'ezRNf2md','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(39,'Bird','Fidele','bfidelew@vkontakte.ru',3,'GnXPxfB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(40,'Minnnie','Glasby','mglasbyx@linkedin.com',5,'5lnBDmB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(41,'Obadias','Kitchiner','okitchinery@patch.com',4,'CNuzuW','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(42,'Alice','Thurley','athurleyz@army.mil',4,'dLPE4YnZy7Ag','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(43,'Rand','Lomax','rlomax10@themeforest.net',5,'nZCmbJ1RfW','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(44,'Hamid','Kensit','hkensit11@naver.com',3,'9qcok7','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(45,'Mallissa','Ogelsby','mogelsby12@google.ca',4,'yp5ctn','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(46,'Jecho','Duthie','jduthie13@edublogs.org',5,'Ask2OZ9Zgyi0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(47,'Zaccaria','Rawstorn','zrawstorn14@china.com.cn',5,'U90m4ACxQ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(48,'Giovanna','Legat','glegat15@sitemeter.com',3,'E6Zzj6EJVphF','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(49,'Agnes','Wroughton','awroughton16@tuttocitta.it',4,'mOeE4E7U','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(50,'Helen-elizabeth','Lambersen','hlambersen17@woothemes.com',3,'5dqCiunn','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(51,'Gusti','Sok','gamesbury18@globo.com',3,'hUyhxoAP1','2020-01-10 11:24:03','2020-01-09 15:16:04',NULL),(52,'Karole','Adderson','kadderson19@topsy.com',4,'j6T9t9UdDDY1','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(53,'Opaline','Meadway','omeadway1a@deliciousdays.com',4,'8t8V8x4','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(54,'Brena','Hallan','bhallan1b@naver.com',5,'NVKEgbLgL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(55,'Tawnya','O\' Markey','tomarkey1c@wikia.com',4,'w06eAwAaL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(56,'Worthington','Gynn','wgynn1d@clickbank.net',5,'63ESBtM1','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(57,'Rick','Scheffel','rscheffel1e@hibu.com',4,'s2RA5KGl7qV','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(58,'Ardath','McMillan','amcmillan1f@cam.ac.uk',3,'ULUYlXAi','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(59,'Cosmo','Metcalfe','cmetcalfe1g@pen.io',4,'hXWZc8g5qFJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(60,'Myles','Haddy','mhaddy1h@jigsy.com',3,'iW4LVBy','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(61,'Kamilah','Fynes','kfynes1i@alexa.com',4,'ULRAuKh10c','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(62,'Ilsa','Bawden','ibawden1j@sphinn.com',4,'W6SlCp5','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(63,'Nonnah','Lucks','nlucks1k@jiathis.com',3,'ZHpU0juL2gAV','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(64,'Orelia','Aitchison','oaitchison1l@paypal.com',3,'bDKwXDt6','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(65,'Obadiah','Medlen','omedlen1m@newsvine.com',5,'0GsFejRDJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(66,'Jeffrey','Balkwill','jbalkwill1n@comcast.net',5,'uA5zs6qnO','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(67,'Pearle','Ealles','pealles1o@wiley.com',5,'DK9WilAUzv2c','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(68,'Cheri','Classic','cmeake1p@webnode.com',3,'fPLQf6VlP','2020-01-10 11:25:55','2020-01-09 15:16:04',NULL),(69,'Franklin','Baldin','fbaldin1q@sourceforge.net',5,'wpVCuG','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(70,'Ines','Delves','idelves1r@bravesites.com',5,'dxT0JaPpOD8','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(71,'Osgood','Osbad','okelso1s@tmall.com',4,'BMFYGfzEgX1D','2020-01-10 11:26:54','2020-01-09 15:16:04',NULL),(72,'Clarence','Maydway','cmaydway1t@baidu.com',5,'PPl1tjw6','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(73,'Catina','Quested','cquested1u@mysql.com',5,'8CkRAA0oaS','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(74,'Jess','Semkins','jsemkins1v@cbc.ca',3,'K6TA2KiEk','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(75,'Enid','Truin','etruin1w@phpbb.com',4,'4DSN10sB','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(76,'Danie','Wearne','dwearne1x@kickstarter.com',5,'sgzXMl7f','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(77,'Maegan','Done','mdone1y@wikia.com',4,'goErrRZJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(78,'Luise','Tardiff','ltardiff1z@barnesandnoble.com',4,'KXtCS0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(79,'Dedie','Springtorpe','dspringtorpe20@hostgator.com',3,'AcM8IH','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(80,'Northrup','Barnby','nbarnby21@hp.com',5,'OT0LOHh','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(81,'Bellina','Fosdike','bfosdike22@stanford.edu',4,'nu1t8tVWOBc','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(82,'Edvard','Pittock','epittock23@instagram.com',5,'FX6dG3XDJPP','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(83,'Katerina','Ambrosini','kambrosini24@e-recht24.de',4,'Rack9y0n9W','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(84,'Bear','Medved','bdobson25@blogspot.com',3,'CInIx6xps4','2020-01-10 11:36:05','2020-01-09 15:16:04',NULL),(85,'Rodger','Ferre','rferre26@ehow.com',4,'fFAgmjL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(86,'Allen','Faulconer','afaulconer27@cdbaby.com',3,'06sB5Jn','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(87,'Luca','Catherick','lcatherick28@army.mil',3,'2bKQ8tg1O','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(88,'Myrtice','Stoak','mstoak29@earthlink.net',3,'clXr1C2ITBz','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(89,'Arnuad','Craighead','acraighead2a@yahoo.co.jp',5,'oLXqjN','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(90,'Dorotea','Teenan','dteenan2b@lycos.com',3,'SSVZXM7U5I0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(91,'Thatch','Soloway','tsoloway2c@bandcamp.com',4,'vLIrPWVdP','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(92,'Garrek','Clemanceau','gclemanceau2d@themeforest.net',5,'2G4wWYCLk','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(93,'Gustave','Juza','gjuza2e@tuttocitta.it',3,'BXgSPI','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(94,'Moselle','Itskovitz','mitskovitz2f@netlog.com',4,'EnQinvdvyE','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(95,'Marleah','Dugget','mdugget2g@vk.com',5,'ApFIz3','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(96,'Lita','Pendergrast','lpendergrast2h@nifty.com',4,'gtKQNJaqpJ','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(97,'Rozanne','Wheeler','rwheeler2i@princeton.edu',3,'9Su111wllA','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(98,'Suzette','Benjafield','sbenjafield2j@nytimes.com',4,'aSGazFlwUwg','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(99,'Mel','Cunney','mcunney2k@technorati.com',4,'He0JdnBxl','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(100,'Mitchel','Kemmett','mkemmett2l@amazon.co.jp',5,'rZ8k1G7sF','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(101,'Quill','McFadzean','qmcfadzean2m@zimbio.com',5,'yA2OH7O','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(102,'Teddy','Dovington','tdovington2n@apache.org',4,'lMr5KF8','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(103,'Elwood','Dudeney','edudeney2o@ehow.com',4,'k2uuFsn0','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(104,'Toddie','Condict','tcondict2p@instagram.com',4,'o9n3G5s','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(105,'Elmira','Leijs','eleijs2q@fastcompany.com',5,'2FpyI1iUqfpD','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL),(106,'Hart','Mazzia','hmazzia2r@bandcamp.com',4,'DznYXqL','2020-01-09 15:16:04','2020-01-09 15:16:04',NULL);
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

-- Dump completed on 2020-01-10 12:41:32
