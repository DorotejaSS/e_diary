-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 26, 2020 at 03:47 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_diary`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_out` bit(1) NOT NULL,
  `justified` bit(1) NOT NULL,
  `students_id` int(11) NOT NULL,
  `schedules_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_students1_idx` (`students_id`),
  KEY `fk_attendance_schedules1_idx` (`schedules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
CREATE TABLE IF NOT EXISTS `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_certificates_students1_idx` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `semestar` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  `closing` bit(1) NOT NULL,
  `student_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grades_students1_idx` (`student_id`),
  KEY `fk_grades_users1_idx` (`lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `grade`, `created_at`, `semestar`, `closing`, `student_id`, `lecturer_id`) VALUES
(1, 3, '2020-01-22 16:08:18', '1', b'0', 1, 4),
(2, 5, '2020-01-22 16:08:18', '1', b'0', 1, 4),
(3, 4, '2020-01-22 16:08:18', '1', b'1', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_subject`
--

DROP TABLE IF EXISTS `lecturer_subject`;
CREATE TABLE IF NOT EXISTS `lecturer_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lecturer_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturer_id_fk_idx` (`lecturer_id`),
  KEY `subject_id_fk_idx` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`) VALUES
(10, 'users', '/users'),
(11, 'subjects', '/subjects'),
(12, 'student groups', '/studentgroup'),
(13, 'schedules', '/schedule'),
(14, 'notifications', '#'),
(15, 'students', '/students'),
(16, 'statistic - student groups', '#'),
(17, 'statistic - subject', '#'),
(18, 'grades - professor', '#'),
(19, 'open door - professor', '#'),
(20, 'messages', '#'),
(21, 'notifications', '#'),
(22, 'diary', '#'),
(23, 'certificates', '#'),
(24, 'schedules - parent', '#'),
(25, 'schedules - profesor', '#'),
(26, 'grades - parent', '#'),
(27, 'open door - parent', '#');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('message','notification') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_fk_idx` (`from`),
  KEY `to_fk_idx` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `parent_student`
--

DROP TABLE IF EXISTS `parent_student`;
CREATE TABLE IF NOT EXISTS `parent_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id_fk_idx` (`parent_id`),
  KEY `student_id_fk_idx` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`) VALUES
(1, 'user_c'),
(2, 'user_r'),
(3, 'user_u'),
(4, 'user_d'),
(5, 'student_group_c'),
(6, 'student_group_r'),
(7, 'student_group_u'),
(8, 'student_group_d'),
(9, 'schedules_c'),
(10, 'schedules_r'),
(11, 'schedules_u'),
(12, 'schedules_d'),
(13, 'messages_c'),
(14, 'messages_r'),
(15, 'messages_u'),
(16, 'messages_d'),
(17, 'certificates_c'),
(18, 'certificates_r'),
(19, 'certificates_u'),
(20, 'certificates_d'),
(21, 'grades_c'),
(22, 'grades_r'),
(23, 'grades_u'),
(24, 'grades_d'),
(25, 'students_c'),
(26, 'students_r'),
(27, 'students_u'),
(28, 'students_d'),
(29, 'subjects_c'),
(30, 'subjects_r'),
(31, 'subjects_u'),
(32, 'subjects_d'),
(33, 'attendance_c'),
(34, 'attendance_r'),
(35, 'attendance_u'),
(36, 'attendance_d'),
(37, 'statistic_st_group_r'),
(38, 'statistic_subjects_r');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`) VALUES
(1, 'admin'),
(2, 'principal'),
(3, 'professor'),
(4, 'teacher'),
(5, 'parent');

-- --------------------------------------------------------

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE IF NOT EXISTS `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id_fk_idx` (`menu_id`),
  KEY `role_id_fk_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`id`, `menu_id`, `role_id`) VALUES
(6, 10, 1),
(7, 11, 1),
(8, 12, 1),
(9, 13, 1),
(10, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE IF NOT EXISTS `role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `access` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id_fk_idx` (`role_id`),
  KEY `permission_id_fk_idx` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `access`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 1),
(8, 1, 8, 1),
(9, 1, 9, 1),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 1, 12, 1),
(13, 1, 13, 1),
(14, 1, 14, 1),
(15, 1, 15, 1),
(16, 1, 16, 1),
(17, 1, 17, 0),
(18, 1, 18, 0),
(19, 1, 19, 0),
(20, 1, 20, 0),
(21, 1, 21, 0),
(22, 1, 22, 0),
(23, 1, 23, 0),
(24, 1, 24, 0),
(25, 1, 25, 1),
(26, 1, 26, 1),
(27, 1, 27, 1),
(28, 1, 28, 1),
(29, 1, 29, 1),
(30, 1, 30, 1),
(31, 1, 31, 1),
(32, 1, 32, 1),
(33, 1, 33, 0),
(34, 1, 34, 0),
(35, 1, 35, 0),
(36, 1, 36, 0),
(37, 2, 1, NULL),
(38, 2, 2, NULL),
(39, 2, 3, NULL),
(40, 2, 4, NULL),
(41, 2, 5, NULL),
(42, 2, 6, NULL),
(43, 2, 7, NULL),
(44, 2, 8, NULL),
(45, 2, 9, NULL),
(46, 2, 10, NULL),
(47, 2, 11, NULL),
(48, 2, 12, NULL),
(49, 2, 13, NULL),
(50, 2, 14, NULL),
(51, 2, 15, NULL),
(52, 2, 16, NULL),
(53, 2, 17, NULL),
(54, 2, 18, NULL),
(55, 2, 19, NULL),
(56, 2, 20, NULL),
(57, 2, 21, NULL),
(58, 2, 22, NULL),
(59, 2, 23, NULL),
(60, 2, 24, NULL),
(61, 2, 25, NULL),
(62, 2, 26, NULL),
(63, 2, 27, NULL),
(64, 2, 28, NULL),
(65, 2, 29, NULL),
(66, 2, 30, NULL),
(67, 2, 31, NULL),
(68, 2, 32, NULL),
(69, 2, 33, NULL),
(70, 2, 34, NULL),
(71, 2, 35, NULL),
(72, 2, 36, NULL),
(73, 3, 1, 0),
(74, 3, 2, 0),
(75, 3, 3, 0),
(76, 3, 4, 0),
(77, 3, 5, 0),
(78, 3, 6, 1),
(79, 3, 7, 0),
(80, 3, 8, 0),
(81, 3, 9, 1),
(82, 3, 10, 1),
(83, 3, 11, 1),
(84, 3, 12, 1),
(85, 3, 13, 1),
(86, 3, 14, 1),
(87, 3, 15, 1),
(88, 3, 16, 1),
(89, 3, 17, 1),
(90, 3, 18, 1),
(91, 3, 19, 1),
(92, 3, 20, 1),
(93, 3, 21, 1),
(94, 3, 22, 1),
(95, 3, 23, 1),
(96, 3, 24, 1),
(97, 3, 25, 0),
(98, 3, 26, 1),
(99, 3, 27, 0),
(100, 3, 28, 0),
(101, 3, 29, 0),
(102, 3, 30, 0),
(103, 3, 31, 0),
(104, 3, 32, 0),
(105, 3, 33, 1),
(106, 3, 34, 1),
(107, 3, 35, 1),
(108, 3, 36, 1),
(109, 4, 1, 0),
(110, 4, 2, 0),
(111, 4, 3, 0),
(112, 4, 4, 0),
(113, 4, 5, 0),
(114, 4, 6, 1),
(115, 4, 7, 0),
(116, 4, 8, 0),
(117, 4, 9, 1),
(118, 4, 10, 1),
(119, 4, 11, 1),
(120, 4, 12, 1),
(121, 4, 13, 1),
(122, 4, 14, 1),
(123, 4, 15, 1),
(124, 4, 16, 1),
(125, 4, 17, 1),
(126, 4, 18, 1),
(127, 4, 19, 1),
(128, 4, 20, 1),
(129, 4, 21, 1),
(130, 4, 22, 1),
(131, 4, 23, 1),
(132, 4, 24, 1),
(133, 4, 25, 0),
(134, 4, 26, 1),
(135, 4, 27, 0),
(136, 4, 28, 0),
(137, 4, 29, 0),
(138, 4, 30, 0),
(139, 4, 31, 0),
(140, 4, 32, 0),
(141, 4, 33, 1),
(142, 4, 34, 1),
(143, 4, 35, 1),
(144, 4, 36, 1),
(145, 5, 1, 0),
(146, 5, 2, 0),
(147, 5, 3, 0),
(148, 5, 4, 0),
(149, 5, 5, 0),
(150, 5, 6, 1),
(151, 5, 7, 0),
(152, 5, 8, 0),
(153, 5, 9, 0),
(154, 5, 10, 1),
(155, 5, 11, 0),
(156, 5, 12, 0),
(157, 5, 13, 1),
(158, 5, 14, 1),
(159, 5, 15, 1),
(160, 5, 16, 1),
(161, 5, 17, 0),
(162, 5, 18, 1),
(163, 5, 19, 0),
(164, 5, 20, 0),
(165, 5, 21, 0),
(166, 5, 22, 1),
(167, 5, 23, 0),
(168, 5, 24, 0),
(169, 5, 25, 0),
(170, 5, 26, 1),
(171, 5, 27, 0),
(172, 5, 28, 0),
(173, 5, 29, 0),
(174, 5, 30, 1),
(175, 5, 31, 0),
(176, 5, 32, 0),
(177, 5, 33, 0),
(178, 5, 34, 1),
(179, 5, 35, 0),
(180, 5, 36, 0),
(181, 2, 37, 1),
(182, 2, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_group_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `semestar_id` int(11) NOT NULL,
  `type` enum('opendoor','celebration','dayoff') COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_schedules_users1_idx` (`subject_id`),
  KEY `fk_schedules_student_group1_idx` (`student_group_id`),
  KEY `fk_schedules_semestars1_idx` (`semestar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2851 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `student_group_id`, `subject_id`, `start_time`, `end_time`, `semestar_id`, `type`, `position`) VALUES
(2155, 1, 1, NULL, NULL, 1, NULL, 'mon1'),
(2156, 1, 1, NULL, NULL, 1, NULL, 'mon2'),
(2157, 1, 3, NULL, NULL, 1, NULL, 'mon3'),
(2158, 1, 12, NULL, NULL, 1, NULL, 'mon4'),
(2159, 1, 18, NULL, NULL, 1, NULL, 'mon5'),
(2160, 1, 18, NULL, NULL, 1, NULL, 'mon6'),
(2161, 1, 10, NULL, NULL, 1, NULL, 'tue1'),
(2162, 1, 10, NULL, NULL, 1, NULL, 'tue2'),
(2163, 1, 30, NULL, NULL, 1, NULL, 'tue3'),
(2164, 1, 30, NULL, NULL, 1, NULL, 'tue4'),
(2165, 1, 23, NULL, NULL, 1, NULL, 'tue5'),
(2166, 1, 19, NULL, NULL, 1, NULL, 'wed1'),
(2167, 1, 22, NULL, NULL, 1, NULL, 'wed2'),
(2168, 1, 2, NULL, NULL, 1, NULL, 'wed3'),
(2169, 1, 2, NULL, NULL, 1, NULL, 'wed4'),
(2170, 1, 2, NULL, NULL, 1, NULL, 'wed5'),
(2171, 1, 4, NULL, NULL, 1, NULL, 'thr1'),
(2172, 1, 5, NULL, NULL, 1, NULL, 'thr2'),
(2173, 1, 23, NULL, NULL, 1, NULL, 'thr3'),
(2174, 1, 12, NULL, NULL, 1, NULL, 'thr4'),
(2175, 1, 18, NULL, NULL, 1, NULL, 'thr5'),
(2176, 1, 18, NULL, NULL, 1, NULL, 'thr6'),
(2177, 1, 2, NULL, NULL, 1, NULL, 'fri1'),
(2178, 1, 2, NULL, NULL, 1, NULL, 'fri2'),
(2179, 1, 31, NULL, NULL, 1, NULL, 'fri3'),
(2180, 1, 17, NULL, NULL, 1, NULL, 'fri4'),
(2181, 1, 17, NULL, NULL, 1, NULL, 'fri5'),
(2182, 1, 1, NULL, NULL, 1, NULL, 'fri6'),
(2183, 1, 1, NULL, NULL, 1, NULL, 'fri7'),
(2184, 4, 1, NULL, NULL, 1, NULL, 'mon1'),
(2185, 4, 1, NULL, NULL, 1, NULL, 'mon2'),
(2186, 4, 3, NULL, NULL, 1, NULL, 'mon3'),
(2187, 4, 12, NULL, NULL, 1, NULL, 'mon4'),
(2188, 4, 18, NULL, NULL, 1, NULL, 'mon5'),
(2189, 4, 18, NULL, NULL, 1, NULL, 'mon6'),
(2190, 4, 10, NULL, NULL, 1, NULL, 'tue1'),
(2191, 4, 10, NULL, NULL, 1, NULL, 'tue2'),
(2192, 4, 30, NULL, NULL, 1, NULL, 'tue3'),
(2193, 4, 30, NULL, NULL, 1, NULL, 'tue4'),
(2194, 4, 23, NULL, NULL, 1, NULL, 'tue5'),
(2195, 4, 19, NULL, NULL, 1, NULL, 'wed1'),
(2196, 4, 22, NULL, NULL, 1, NULL, 'wed2'),
(2197, 4, 2, NULL, NULL, 1, NULL, 'wed3'),
(2198, 4, 2, NULL, NULL, 1, NULL, 'wed4'),
(2199, 4, 2, NULL, NULL, 1, NULL, 'wed5'),
(2200, 4, 4, NULL, NULL, 1, NULL, 'thr1'),
(2201, 4, 5, NULL, NULL, 1, NULL, 'thr2'),
(2202, 4, 23, NULL, NULL, 1, NULL, 'thr3'),
(2203, 4, 12, NULL, NULL, 1, NULL, 'thr4'),
(2204, 4, 18, NULL, NULL, 1, NULL, 'thr5'),
(2205, 4, 18, NULL, NULL, 1, NULL, 'thr6'),
(2206, 4, 2, NULL, NULL, 1, NULL, 'fri1'),
(2207, 4, 2, NULL, NULL, 1, NULL, 'fri2'),
(2208, 4, 31, NULL, NULL, 1, NULL, 'fri3'),
(2209, 4, 17, NULL, NULL, 1, NULL, 'fri4'),
(2210, 4, 17, NULL, NULL, 1, NULL, 'fri5'),
(2211, 4, 1, NULL, NULL, 1, NULL, 'fri6'),
(2212, 4, 1, NULL, NULL, 1, NULL, 'fri7'),
(2213, 7, 1, NULL, NULL, 1, NULL, 'mon1'),
(2214, 7, 1, NULL, NULL, 1, NULL, 'mon2'),
(2215, 7, 3, NULL, NULL, 1, NULL, 'mon3'),
(2216, 7, 12, NULL, NULL, 1, NULL, 'mon4'),
(2217, 7, 18, NULL, NULL, 1, NULL, 'mon5'),
(2218, 7, 18, NULL, NULL, 1, NULL, 'mon6'),
(2219, 7, 10, NULL, NULL, 1, NULL, 'tue1'),
(2220, 7, 10, NULL, NULL, 1, NULL, 'tue2'),
(2221, 7, 30, NULL, NULL, 1, NULL, 'tue3'),
(2222, 7, 30, NULL, NULL, 1, NULL, 'tue4'),
(2223, 7, 23, NULL, NULL, 1, NULL, 'tue5'),
(2224, 7, 19, NULL, NULL, 1, NULL, 'wed1'),
(2225, 7, 22, NULL, NULL, 1, NULL, 'wed2'),
(2226, 7, 2, NULL, NULL, 1, NULL, 'wed3'),
(2227, 7, 2, NULL, NULL, 1, NULL, 'wed4'),
(2228, 7, 2, NULL, NULL, 1, NULL, 'wed5'),
(2229, 7, 4, NULL, NULL, 1, NULL, 'thr1'),
(2230, 7, 5, NULL, NULL, 1, NULL, 'thr2'),
(2231, 7, 23, NULL, NULL, 1, NULL, 'thr3'),
(2232, 7, 12, NULL, NULL, 1, NULL, 'thr4'),
(2233, 7, 18, NULL, NULL, 1, NULL, 'thr5'),
(2234, 7, 18, NULL, NULL, 1, NULL, 'thr6'),
(2235, 7, 2, NULL, NULL, 1, NULL, 'fri1'),
(2236, 7, 2, NULL, NULL, 1, NULL, 'fri2'),
(2237, 7, 31, NULL, NULL, 1, NULL, 'fri3'),
(2238, 7, 17, NULL, NULL, 1, NULL, 'fri4'),
(2239, 7, 17, NULL, NULL, 1, NULL, 'fri5'),
(2240, 7, 1, NULL, NULL, 1, NULL, 'fri6'),
(2241, 7, 1, NULL, NULL, 1, NULL, 'fri7'),
(2242, 10, 1, NULL, NULL, 1, NULL, 'mon1'),
(2243, 10, 1, NULL, NULL, 1, NULL, 'mon2'),
(2244, 10, 3, NULL, NULL, 1, NULL, 'mon3'),
(2245, 10, 12, NULL, NULL, 1, NULL, 'mon4'),
(2246, 10, 18, NULL, NULL, 1, NULL, 'mon5'),
(2247, 10, 18, NULL, NULL, 1, NULL, 'mon6'),
(2248, 10, 10, NULL, NULL, 1, NULL, 'tue1'),
(2249, 10, 10, NULL, NULL, 1, NULL, 'tue2'),
(2250, 10, 30, NULL, NULL, 1, NULL, 'tue3'),
(2251, 10, 30, NULL, NULL, 1, NULL, 'tue4'),
(2252, 10, 23, NULL, NULL, 1, NULL, 'tue5'),
(2253, 10, 19, NULL, NULL, 1, NULL, 'wed1'),
(2254, 10, 22, NULL, NULL, 1, NULL, 'wed2'),
(2255, 10, 2, NULL, NULL, 1, NULL, 'wed3'),
(2256, 10, 2, NULL, NULL, 1, NULL, 'wed4'),
(2257, 10, 2, NULL, NULL, 1, NULL, 'wed5'),
(2258, 10, 4, NULL, NULL, 1, NULL, 'thr1'),
(2259, 10, 5, NULL, NULL, 1, NULL, 'thr2'),
(2260, 10, 23, NULL, NULL, 1, NULL, 'thr3'),
(2261, 10, 12, NULL, NULL, 1, NULL, 'thr4'),
(2262, 10, 18, NULL, NULL, 1, NULL, 'thr5'),
(2263, 10, 18, NULL, NULL, 1, NULL, 'thr6'),
(2264, 10, 2, NULL, NULL, 1, NULL, 'fri1'),
(2265, 10, 2, NULL, NULL, 1, NULL, 'fri2'),
(2266, 10, 31, NULL, NULL, 1, NULL, 'fri3'),
(2267, 10, 17, NULL, NULL, 1, NULL, 'fri4'),
(2268, 10, 17, NULL, NULL, 1, NULL, 'fri5'),
(2269, 10, 1, NULL, NULL, 1, NULL, 'fri6'),
(2270, 10, 1, NULL, NULL, 1, NULL, 'fri7'),
(2271, 13, 1, NULL, NULL, 1, NULL, 'mon1'),
(2272, 13, 1, NULL, NULL, 1, NULL, 'mon2'),
(2273, 13, 3, NULL, NULL, 1, NULL, 'mon3'),
(2274, 13, 12, NULL, NULL, 1, NULL, 'mon4'),
(2275, 13, 18, NULL, NULL, 1, NULL, 'mon5'),
(2276, 13, 18, NULL, NULL, 1, NULL, 'mon6'),
(2277, 13, 10, NULL, NULL, 1, NULL, 'tue1'),
(2278, 13, 10, NULL, NULL, 1, NULL, 'tue2'),
(2279, 13, 30, NULL, NULL, 1, NULL, 'tue3'),
(2280, 13, 30, NULL, NULL, 1, NULL, 'tue4'),
(2281, 13, 23, NULL, NULL, 1, NULL, 'tue5'),
(2282, 13, 19, NULL, NULL, 1, NULL, 'wed1'),
(2283, 13, 22, NULL, NULL, 1, NULL, 'wed2'),
(2284, 13, 2, NULL, NULL, 1, NULL, 'wed3'),
(2285, 13, 2, NULL, NULL, 1, NULL, 'wed4'),
(2286, 13, 2, NULL, NULL, 1, NULL, 'wed5'),
(2287, 13, 4, NULL, NULL, 1, NULL, 'thr1'),
(2288, 13, 5, NULL, NULL, 1, NULL, 'thr2'),
(2289, 13, 23, NULL, NULL, 1, NULL, 'thr3'),
(2290, 13, 12, NULL, NULL, 1, NULL, 'thr4'),
(2291, 13, 18, NULL, NULL, 1, NULL, 'thr5'),
(2292, 13, 18, NULL, NULL, 1, NULL, 'thr6'),
(2293, 13, 2, NULL, NULL, 1, NULL, 'fri1'),
(2294, 13, 2, NULL, NULL, 1, NULL, 'fri2'),
(2295, 13, 31, NULL, NULL, 1, NULL, 'fri3'),
(2296, 13, 17, NULL, NULL, 1, NULL, 'fri4'),
(2297, 13, 17, NULL, NULL, 1, NULL, 'fri5'),
(2298, 13, 1, NULL, NULL, 1, NULL, 'fri6'),
(2299, 13, 1, NULL, NULL, 1, NULL, 'fri7'),
(2300, 16, 1, NULL, NULL, 1, NULL, 'mon1'),
(2301, 16, 1, NULL, NULL, 1, NULL, 'mon2'),
(2302, 16, 3, NULL, NULL, 1, NULL, 'mon3'),
(2303, 16, 12, NULL, NULL, 1, NULL, 'mon4'),
(2304, 16, 18, NULL, NULL, 1, NULL, 'mon5'),
(2305, 16, 18, NULL, NULL, 1, NULL, 'mon6'),
(2306, 16, 10, NULL, NULL, 1, NULL, 'tue1'),
(2307, 16, 10, NULL, NULL, 1, NULL, 'tue2'),
(2308, 16, 30, NULL, NULL, 1, NULL, 'tue3'),
(2309, 16, 30, NULL, NULL, 1, NULL, 'tue4'),
(2310, 16, 23, NULL, NULL, 1, NULL, 'tue5'),
(2311, 16, 19, NULL, NULL, 1, NULL, 'wed1'),
(2312, 16, 22, NULL, NULL, 1, NULL, 'wed2'),
(2313, 16, 2, NULL, NULL, 1, NULL, 'wed3'),
(2314, 16, 2, NULL, NULL, 1, NULL, 'wed4'),
(2315, 16, 2, NULL, NULL, 1, NULL, 'wed5'),
(2316, 16, 4, NULL, NULL, 1, NULL, 'thr1'),
(2317, 16, 5, NULL, NULL, 1, NULL, 'thr2'),
(2318, 16, 23, NULL, NULL, 1, NULL, 'thr3'),
(2319, 16, 12, NULL, NULL, 1, NULL, 'thr4'),
(2320, 16, 18, NULL, NULL, 1, NULL, 'thr5'),
(2321, 16, 18, NULL, NULL, 1, NULL, 'thr6'),
(2322, 16, 2, NULL, NULL, 1, NULL, 'fri1'),
(2323, 16, 2, NULL, NULL, 1, NULL, 'fri2'),
(2324, 16, 31, NULL, NULL, 1, NULL, 'fri3'),
(2325, 16, 17, NULL, NULL, 1, NULL, 'fri4'),
(2326, 16, 17, NULL, NULL, 1, NULL, 'fri5'),
(2327, 16, 1, NULL, NULL, 1, NULL, 'fri6'),
(2328, 16, 1, NULL, NULL, 1, NULL, 'fri7'),
(2329, 19, 1, NULL, NULL, 1, NULL, 'mon1'),
(2330, 19, 1, NULL, NULL, 1, NULL, 'mon2'),
(2331, 19, 3, NULL, NULL, 1, NULL, 'mon3'),
(2332, 19, 12, NULL, NULL, 1, NULL, 'mon4'),
(2333, 19, 18, NULL, NULL, 1, NULL, 'mon5'),
(2334, 19, 18, NULL, NULL, 1, NULL, 'mon6'),
(2335, 19, 10, NULL, NULL, 1, NULL, 'tue1'),
(2336, 19, 10, NULL, NULL, 1, NULL, 'tue2'),
(2337, 19, 30, NULL, NULL, 1, NULL, 'tue3'),
(2338, 19, 30, NULL, NULL, 1, NULL, 'tue4'),
(2339, 19, 23, NULL, NULL, 1, NULL, 'tue5'),
(2340, 19, 19, NULL, NULL, 1, NULL, 'wed1'),
(2341, 19, 22, NULL, NULL, 1, NULL, 'wed2'),
(2342, 19, 2, NULL, NULL, 1, NULL, 'wed3'),
(2343, 19, 2, NULL, NULL, 1, NULL, 'wed4'),
(2344, 19, 2, NULL, NULL, 1, NULL, 'wed5'),
(2345, 19, 4, NULL, NULL, 1, NULL, 'thr1'),
(2346, 19, 5, NULL, NULL, 1, NULL, 'thr2'),
(2347, 19, 23, NULL, NULL, 1, NULL, 'thr3'),
(2348, 19, 12, NULL, NULL, 1, NULL, 'thr4'),
(2349, 19, 18, NULL, NULL, 1, NULL, 'thr5'),
(2350, 19, 18, NULL, NULL, 1, NULL, 'thr6'),
(2351, 19, 2, NULL, NULL, 1, NULL, 'fri1'),
(2352, 19, 2, NULL, NULL, 1, NULL, 'fri2'),
(2353, 19, 31, NULL, NULL, 1, NULL, 'fri3'),
(2354, 19, 17, NULL, NULL, 1, NULL, 'fri4'),
(2355, 19, 17, NULL, NULL, 1, NULL, 'fri5'),
(2356, 19, 1, NULL, NULL, 1, NULL, 'fri6'),
(2357, 19, 1, NULL, NULL, 1, NULL, 'fri7'),
(2358, 22, 1, NULL, NULL, 1, NULL, 'mon1'),
(2359, 22, 1, NULL, NULL, 1, NULL, 'mon2'),
(2360, 22, 3, NULL, NULL, 1, NULL, 'mon3'),
(2361, 22, 12, NULL, NULL, 1, NULL, 'mon4'),
(2362, 22, 18, NULL, NULL, 1, NULL, 'mon5'),
(2363, 22, 18, NULL, NULL, 1, NULL, 'mon6'),
(2364, 22, 10, NULL, NULL, 1, NULL, 'tue1'),
(2365, 22, 10, NULL, NULL, 1, NULL, 'tue2'),
(2366, 22, 30, NULL, NULL, 1, NULL, 'tue3'),
(2367, 22, 30, NULL, NULL, 1, NULL, 'tue4'),
(2368, 22, 23, NULL, NULL, 1, NULL, 'tue5'),
(2369, 22, 19, NULL, NULL, 1, NULL, 'wed1'),
(2370, 22, 22, NULL, NULL, 1, NULL, 'wed2'),
(2371, 22, 2, NULL, NULL, 1, NULL, 'wed3'),
(2372, 22, 2, NULL, NULL, 1, NULL, 'wed4'),
(2373, 22, 2, NULL, NULL, 1, NULL, 'wed5'),
(2374, 22, 4, NULL, NULL, 1, NULL, 'thr1'),
(2375, 22, 5, NULL, NULL, 1, NULL, 'thr2'),
(2376, 22, 23, NULL, NULL, 1, NULL, 'thr3'),
(2377, 22, 12, NULL, NULL, 1, NULL, 'thr4'),
(2378, 22, 18, NULL, NULL, 1, NULL, 'thr5'),
(2379, 22, 18, NULL, NULL, 1, NULL, 'thr6'),
(2380, 22, 2, NULL, NULL, 1, NULL, 'fri1'),
(2381, 22, 2, NULL, NULL, 1, NULL, 'fri2'),
(2382, 22, 31, NULL, NULL, 1, NULL, 'fri3'),
(2383, 22, 17, NULL, NULL, 1, NULL, 'fri4'),
(2384, 22, 17, NULL, NULL, 1, NULL, 'fri5'),
(2385, 22, 1, NULL, NULL, 1, NULL, 'fri6'),
(2386, 22, 1, NULL, NULL, 1, NULL, 'fri7'),
(2387, 2, 1, NULL, NULL, 1, NULL, 'mon1'),
(2388, 2, 1, NULL, NULL, 1, NULL, 'mon2'),
(2389, 2, 3, NULL, NULL, 1, NULL, 'mon3'),
(2390, 2, 12, NULL, NULL, 1, NULL, 'mon4'),
(2391, 2, 18, NULL, NULL, 1, NULL, 'mon5'),
(2392, 2, 18, NULL, NULL, 1, NULL, 'mon6'),
(2393, 2, 10, NULL, NULL, 1, NULL, 'tue1'),
(2394, 2, 10, NULL, NULL, 1, NULL, 'tue2'),
(2395, 2, 30, NULL, NULL, 1, NULL, 'tue3'),
(2396, 2, 30, NULL, NULL, 1, NULL, 'tue4'),
(2397, 2, 23, NULL, NULL, 1, NULL, 'tue5'),
(2398, 2, 19, NULL, NULL, 1, NULL, 'wed1'),
(2399, 2, 22, NULL, NULL, 1, NULL, 'wed2'),
(2400, 2, 2, NULL, NULL, 1, NULL, 'wed3'),
(2401, 2, 2, NULL, NULL, 1, NULL, 'wed4'),
(2402, 2, 2, NULL, NULL, 1, NULL, 'wed5'),
(2403, 2, 4, NULL, NULL, 1, NULL, 'thr1'),
(2404, 2, 5, NULL, NULL, 1, NULL, 'thr2'),
(2405, 2, 23, NULL, NULL, 1, NULL, 'thr3'),
(2406, 2, 12, NULL, NULL, 1, NULL, 'thr4'),
(2407, 2, 18, NULL, NULL, 1, NULL, 'thr5'),
(2408, 2, 18, NULL, NULL, 1, NULL, 'thr6'),
(2409, 2, 2, NULL, NULL, 1, NULL, 'fri1'),
(2410, 2, 2, NULL, NULL, 1, NULL, 'fri2'),
(2411, 2, 31, NULL, NULL, 1, NULL, 'fri3'),
(2412, 2, 17, NULL, NULL, 1, NULL, 'fri4'),
(2413, 2, 17, NULL, NULL, 1, NULL, 'fri5'),
(2414, 2, 1, NULL, NULL, 1, NULL, 'fri6'),
(2415, 2, 1, NULL, NULL, 1, NULL, 'fri7'),
(2416, 5, 1, NULL, NULL, 1, NULL, 'mon1'),
(2417, 5, 1, NULL, NULL, 1, NULL, 'mon2'),
(2418, 5, 3, NULL, NULL, 1, NULL, 'mon3'),
(2419, 5, 12, NULL, NULL, 1, NULL, 'mon4'),
(2420, 5, 18, NULL, NULL, 1, NULL, 'mon5'),
(2421, 5, 18, NULL, NULL, 1, NULL, 'mon6'),
(2422, 5, 10, NULL, NULL, 1, NULL, 'tue1'),
(2423, 5, 10, NULL, NULL, 1, NULL, 'tue2'),
(2424, 5, 30, NULL, NULL, 1, NULL, 'tue3'),
(2425, 5, 30, NULL, NULL, 1, NULL, 'tue4'),
(2426, 5, 23, NULL, NULL, 1, NULL, 'tue5'),
(2427, 5, 19, NULL, NULL, 1, NULL, 'wed1'),
(2428, 5, 22, NULL, NULL, 1, NULL, 'wed2'),
(2429, 5, 2, NULL, NULL, 1, NULL, 'wed3'),
(2430, 5, 2, NULL, NULL, 1, NULL, 'wed4'),
(2431, 5, 2, NULL, NULL, 1, NULL, 'wed5'),
(2432, 5, 4, NULL, NULL, 1, NULL, 'thr1'),
(2433, 5, 5, NULL, NULL, 1, NULL, 'thr2'),
(2434, 5, 23, NULL, NULL, 1, NULL, 'thr3'),
(2435, 5, 12, NULL, NULL, 1, NULL, 'thr4'),
(2436, 5, 18, NULL, NULL, 1, NULL, 'thr5'),
(2437, 5, 18, NULL, NULL, 1, NULL, 'thr6'),
(2438, 5, 2, NULL, NULL, 1, NULL, 'fri1'),
(2439, 5, 2, NULL, NULL, 1, NULL, 'fri2'),
(2440, 5, 31, NULL, NULL, 1, NULL, 'fri3'),
(2441, 5, 17, NULL, NULL, 1, NULL, 'fri4'),
(2442, 5, 17, NULL, NULL, 1, NULL, 'fri5'),
(2443, 5, 1, NULL, NULL, 1, NULL, 'fri6'),
(2444, 5, 1, NULL, NULL, 1, NULL, 'fri7'),
(2445, 8, 1, NULL, NULL, 1, NULL, 'mon1'),
(2446, 8, 1, NULL, NULL, 1, NULL, 'mon2'),
(2447, 8, 3, NULL, NULL, 1, NULL, 'mon3'),
(2448, 8, 12, NULL, NULL, 1, NULL, 'mon4'),
(2449, 8, 18, NULL, NULL, 1, NULL, 'mon5'),
(2450, 8, 18, NULL, NULL, 1, NULL, 'mon6'),
(2451, 8, 10, NULL, NULL, 1, NULL, 'tue1'),
(2452, 8, 10, NULL, NULL, 1, NULL, 'tue2'),
(2453, 8, 30, NULL, NULL, 1, NULL, 'tue3'),
(2454, 8, 30, NULL, NULL, 1, NULL, 'tue4'),
(2455, 8, 23, NULL, NULL, 1, NULL, 'tue5'),
(2456, 8, 19, NULL, NULL, 1, NULL, 'wed1'),
(2457, 8, 22, NULL, NULL, 1, NULL, 'wed2'),
(2458, 8, 2, NULL, NULL, 1, NULL, 'wed3'),
(2459, 8, 2, NULL, NULL, 1, NULL, 'wed4'),
(2460, 8, 2, NULL, NULL, 1, NULL, 'wed5'),
(2461, 8, 4, NULL, NULL, 1, NULL, 'thr1'),
(2462, 8, 5, NULL, NULL, 1, NULL, 'thr2'),
(2463, 8, 23, NULL, NULL, 1, NULL, 'thr3'),
(2464, 8, 12, NULL, NULL, 1, NULL, 'thr4'),
(2465, 8, 18, NULL, NULL, 1, NULL, 'thr5'),
(2466, 8, 18, NULL, NULL, 1, NULL, 'thr6'),
(2467, 8, 2, NULL, NULL, 1, NULL, 'fri1'),
(2468, 8, 2, NULL, NULL, 1, NULL, 'fri2'),
(2469, 8, 31, NULL, NULL, 1, NULL, 'fri3'),
(2470, 8, 17, NULL, NULL, 1, NULL, 'fri4'),
(2471, 8, 17, NULL, NULL, 1, NULL, 'fri5'),
(2472, 8, 1, NULL, NULL, 1, NULL, 'fri6'),
(2473, 8, 1, NULL, NULL, 1, NULL, 'fri7'),
(2474, 11, 1, NULL, NULL, 1, NULL, 'mon1'),
(2475, 11, 1, NULL, NULL, 1, NULL, 'mon2'),
(2476, 11, 3, NULL, NULL, 1, NULL, 'mon3'),
(2477, 11, 12, NULL, NULL, 1, NULL, 'mon4'),
(2478, 11, 18, NULL, NULL, 1, NULL, 'mon5'),
(2479, 11, 18, NULL, NULL, 1, NULL, 'mon6'),
(2480, 11, 10, NULL, NULL, 1, NULL, 'tue1'),
(2481, 11, 10, NULL, NULL, 1, NULL, 'tue2'),
(2482, 11, 30, NULL, NULL, 1, NULL, 'tue3'),
(2483, 11, 30, NULL, NULL, 1, NULL, 'tue4'),
(2484, 11, 23, NULL, NULL, 1, NULL, 'tue5'),
(2485, 11, 19, NULL, NULL, 1, NULL, 'wed1'),
(2486, 11, 22, NULL, NULL, 1, NULL, 'wed2'),
(2487, 11, 2, NULL, NULL, 1, NULL, 'wed3'),
(2488, 11, 2, NULL, NULL, 1, NULL, 'wed4'),
(2489, 11, 2, NULL, NULL, 1, NULL, 'wed5'),
(2490, 11, 4, NULL, NULL, 1, NULL, 'thr1'),
(2491, 11, 5, NULL, NULL, 1, NULL, 'thr2'),
(2492, 11, 23, NULL, NULL, 1, NULL, 'thr3'),
(2493, 11, 12, NULL, NULL, 1, NULL, 'thr4'),
(2494, 11, 18, NULL, NULL, 1, NULL, 'thr5'),
(2495, 11, 18, NULL, NULL, 1, NULL, 'thr6'),
(2496, 11, 2, NULL, NULL, 1, NULL, 'fri1'),
(2497, 11, 2, NULL, NULL, 1, NULL, 'fri2'),
(2498, 11, 31, NULL, NULL, 1, NULL, 'fri3'),
(2499, 11, 17, NULL, NULL, 1, NULL, 'fri4'),
(2500, 11, 17, NULL, NULL, 1, NULL, 'fri5'),
(2501, 11, 1, NULL, NULL, 1, NULL, 'fri6'),
(2502, 11, 1, NULL, NULL, 1, NULL, 'fri7'),
(2503, 14, 1, NULL, NULL, 1, NULL, 'mon1'),
(2504, 14, 1, NULL, NULL, 1, NULL, 'mon2'),
(2505, 14, 3, NULL, NULL, 1, NULL, 'mon3'),
(2506, 14, 12, NULL, NULL, 1, NULL, 'mon4'),
(2507, 14, 18, NULL, NULL, 1, NULL, 'mon5'),
(2508, 14, 18, NULL, NULL, 1, NULL, 'mon6'),
(2509, 14, 10, NULL, NULL, 1, NULL, 'tue1'),
(2510, 14, 10, NULL, NULL, 1, NULL, 'tue2'),
(2511, 14, 30, NULL, NULL, 1, NULL, 'tue3'),
(2512, 14, 30, NULL, NULL, 1, NULL, 'tue4'),
(2513, 14, 23, NULL, NULL, 1, NULL, 'tue5'),
(2514, 14, 19, NULL, NULL, 1, NULL, 'wed1'),
(2515, 14, 22, NULL, NULL, 1, NULL, 'wed2'),
(2516, 14, 2, NULL, NULL, 1, NULL, 'wed3'),
(2517, 14, 2, NULL, NULL, 1, NULL, 'wed4'),
(2518, 14, 2, NULL, NULL, 1, NULL, 'wed5'),
(2519, 14, 4, NULL, NULL, 1, NULL, 'thr1'),
(2520, 14, 5, NULL, NULL, 1, NULL, 'thr2'),
(2521, 14, 23, NULL, NULL, 1, NULL, 'thr3'),
(2522, 14, 12, NULL, NULL, 1, NULL, 'thr4'),
(2523, 14, 18, NULL, NULL, 1, NULL, 'thr5'),
(2524, 14, 18, NULL, NULL, 1, NULL, 'thr6'),
(2525, 14, 2, NULL, NULL, 1, NULL, 'fri1'),
(2526, 14, 2, NULL, NULL, 1, NULL, 'fri2'),
(2527, 14, 31, NULL, NULL, 1, NULL, 'fri3'),
(2528, 14, 17, NULL, NULL, 1, NULL, 'fri4'),
(2529, 14, 17, NULL, NULL, 1, NULL, 'fri5'),
(2530, 14, 1, NULL, NULL, 1, NULL, 'fri6'),
(2531, 14, 1, NULL, NULL, 1, NULL, 'fri7'),
(2532, 17, 1, NULL, NULL, 1, NULL, 'mon1'),
(2533, 17, 1, NULL, NULL, 1, NULL, 'mon2'),
(2534, 17, 3, NULL, NULL, 1, NULL, 'mon3'),
(2535, 17, 12, NULL, NULL, 1, NULL, 'mon4'),
(2536, 17, 18, NULL, NULL, 1, NULL, 'mon5'),
(2537, 17, 18, NULL, NULL, 1, NULL, 'mon6'),
(2538, 17, 10, NULL, NULL, 1, NULL, 'tue1'),
(2539, 17, 10, NULL, NULL, 1, NULL, 'tue2'),
(2540, 17, 30, NULL, NULL, 1, NULL, 'tue3'),
(2541, 17, 30, NULL, NULL, 1, NULL, 'tue4'),
(2542, 17, 23, NULL, NULL, 1, NULL, 'tue5'),
(2543, 17, 19, NULL, NULL, 1, NULL, 'wed1'),
(2544, 17, 22, NULL, NULL, 1, NULL, 'wed2'),
(2545, 17, 2, NULL, NULL, 1, NULL, 'wed3'),
(2546, 17, 2, NULL, NULL, 1, NULL, 'wed4'),
(2547, 17, 2, NULL, NULL, 1, NULL, 'wed5'),
(2548, 17, 4, NULL, NULL, 1, NULL, 'thr1'),
(2549, 17, 5, NULL, NULL, 1, NULL, 'thr2'),
(2550, 17, 23, NULL, NULL, 1, NULL, 'thr3'),
(2551, 17, 12, NULL, NULL, 1, NULL, 'thr4'),
(2552, 17, 18, NULL, NULL, 1, NULL, 'thr5'),
(2553, 17, 18, NULL, NULL, 1, NULL, 'thr6'),
(2554, 17, 2, NULL, NULL, 1, NULL, 'fri1'),
(2555, 17, 2, NULL, NULL, 1, NULL, 'fri2'),
(2556, 17, 31, NULL, NULL, 1, NULL, 'fri3'),
(2557, 17, 17, NULL, NULL, 1, NULL, 'fri4'),
(2558, 17, 17, NULL, NULL, 1, NULL, 'fri5'),
(2559, 17, 1, NULL, NULL, 1, NULL, 'fri6'),
(2560, 17, 1, NULL, NULL, 1, NULL, 'fri7'),
(2561, 20, 1, NULL, NULL, 1, NULL, 'mon1'),
(2562, 20, 1, NULL, NULL, 1, NULL, 'mon2'),
(2563, 20, 3, NULL, NULL, 1, NULL, 'mon3'),
(2564, 20, 12, NULL, NULL, 1, NULL, 'mon4'),
(2565, 20, 18, NULL, NULL, 1, NULL, 'mon5'),
(2566, 20, 18, NULL, NULL, 1, NULL, 'mon6'),
(2567, 20, 10, NULL, NULL, 1, NULL, 'tue1'),
(2568, 20, 10, NULL, NULL, 1, NULL, 'tue2'),
(2569, 20, 30, NULL, NULL, 1, NULL, 'tue3'),
(2570, 20, 30, NULL, NULL, 1, NULL, 'tue4'),
(2571, 20, 23, NULL, NULL, 1, NULL, 'tue5'),
(2572, 20, 19, NULL, NULL, 1, NULL, 'wed1'),
(2573, 20, 22, NULL, NULL, 1, NULL, 'wed2'),
(2574, 20, 2, NULL, NULL, 1, NULL, 'wed3'),
(2575, 20, 2, NULL, NULL, 1, NULL, 'wed4'),
(2576, 20, 2, NULL, NULL, 1, NULL, 'wed5'),
(2577, 20, 4, NULL, NULL, 1, NULL, 'thr1'),
(2578, 20, 5, NULL, NULL, 1, NULL, 'thr2'),
(2579, 20, 23, NULL, NULL, 1, NULL, 'thr3'),
(2580, 20, 12, NULL, NULL, 1, NULL, 'thr4'),
(2581, 20, 18, NULL, NULL, 1, NULL, 'thr5'),
(2582, 20, 18, NULL, NULL, 1, NULL, 'thr6'),
(2583, 20, 2, NULL, NULL, 1, NULL, 'fri1'),
(2584, 20, 2, NULL, NULL, 1, NULL, 'fri2'),
(2585, 20, 31, NULL, NULL, 1, NULL, 'fri3'),
(2586, 20, 17, NULL, NULL, 1, NULL, 'fri4'),
(2587, 20, 17, NULL, NULL, 1, NULL, 'fri5'),
(2588, 20, 1, NULL, NULL, 1, NULL, 'fri6'),
(2589, 20, 1, NULL, NULL, 1, NULL, 'fri7'),
(2590, 23, 1, NULL, NULL, 1, NULL, 'mon1'),
(2591, 23, 1, NULL, NULL, 1, NULL, 'mon2'),
(2592, 23, 3, NULL, NULL, 1, NULL, 'mon3'),
(2593, 23, 12, NULL, NULL, 1, NULL, 'mon4'),
(2594, 23, 18, NULL, NULL, 1, NULL, 'mon5'),
(2595, 23, 18, NULL, NULL, 1, NULL, 'mon6'),
(2596, 23, 10, NULL, NULL, 1, NULL, 'tue1'),
(2597, 23, 10, NULL, NULL, 1, NULL, 'tue2'),
(2598, 23, 30, NULL, NULL, 1, NULL, 'tue3'),
(2599, 23, 30, NULL, NULL, 1, NULL, 'tue4'),
(2600, 23, 23, NULL, NULL, 1, NULL, 'tue5'),
(2601, 23, 19, NULL, NULL, 1, NULL, 'wed1'),
(2602, 23, 22, NULL, NULL, 1, NULL, 'wed2'),
(2603, 23, 2, NULL, NULL, 1, NULL, 'wed3'),
(2604, 23, 2, NULL, NULL, 1, NULL, 'wed4'),
(2605, 23, 2, NULL, NULL, 1, NULL, 'wed5'),
(2606, 23, 4, NULL, NULL, 1, NULL, 'thr1'),
(2607, 23, 5, NULL, NULL, 1, NULL, 'thr2'),
(2608, 23, 23, NULL, NULL, 1, NULL, 'thr3'),
(2609, 23, 12, NULL, NULL, 1, NULL, 'thr4'),
(2610, 23, 18, NULL, NULL, 1, NULL, 'thr5'),
(2611, 23, 18, NULL, NULL, 1, NULL, 'thr6'),
(2612, 23, 2, NULL, NULL, 1, NULL, 'fri1'),
(2613, 23, 2, NULL, NULL, 1, NULL, 'fri2'),
(2614, 23, 31, NULL, NULL, 1, NULL, 'fri3'),
(2615, 23, 17, NULL, NULL, 1, NULL, 'fri4'),
(2616, 23, 17, NULL, NULL, 1, NULL, 'fri5'),
(2617, 23, 1, NULL, NULL, 1, NULL, 'fri6'),
(2618, 23, 1, NULL, NULL, 1, NULL, 'fri7'),
(2619, 3, 1, NULL, NULL, 1, NULL, 'mon1'),
(2620, 3, 1, NULL, NULL, 1, NULL, 'mon2'),
(2621, 3, 3, NULL, NULL, 1, NULL, 'mon3'),
(2622, 3, 12, NULL, NULL, 1, NULL, 'mon4'),
(2623, 3, 18, NULL, NULL, 1, NULL, 'mon5'),
(2624, 3, 18, NULL, NULL, 1, NULL, 'mon6'),
(2625, 3, 10, NULL, NULL, 1, NULL, 'tue1'),
(2626, 3, 10, NULL, NULL, 1, NULL, 'tue2'),
(2627, 3, 30, NULL, NULL, 1, NULL, 'tue3'),
(2628, 3, 30, NULL, NULL, 1, NULL, 'tue4'),
(2629, 3, 23, NULL, NULL, 1, NULL, 'tue5'),
(2630, 3, 19, NULL, NULL, 1, NULL, 'wed1'),
(2631, 3, 22, NULL, NULL, 1, NULL, 'wed2'),
(2632, 3, 2, NULL, NULL, 1, NULL, 'wed3'),
(2633, 3, 2, NULL, NULL, 1, NULL, 'wed4'),
(2634, 3, 2, NULL, NULL, 1, NULL, 'wed5'),
(2635, 3, 4, NULL, NULL, 1, NULL, 'thr1'),
(2636, 3, 5, NULL, NULL, 1, NULL, 'thr2'),
(2637, 3, 23, NULL, NULL, 1, NULL, 'thr3'),
(2638, 3, 12, NULL, NULL, 1, NULL, 'thr4'),
(2639, 3, 18, NULL, NULL, 1, NULL, 'thr5'),
(2640, 3, 18, NULL, NULL, 1, NULL, 'thr6'),
(2641, 3, 2, NULL, NULL, 1, NULL, 'fri1'),
(2642, 3, 2, NULL, NULL, 1, NULL, 'fri2'),
(2643, 3, 31, NULL, NULL, 1, NULL, 'fri3'),
(2644, 3, 17, NULL, NULL, 1, NULL, 'fri4'),
(2645, 3, 17, NULL, NULL, 1, NULL, 'fri5'),
(2646, 3, 1, NULL, NULL, 1, NULL, 'fri6'),
(2647, 3, 1, NULL, NULL, 1, NULL, 'fri7'),
(2648, 6, 1, NULL, NULL, 1, NULL, 'mon1'),
(2649, 6, 1, NULL, NULL, 1, NULL, 'mon2'),
(2650, 6, 3, NULL, NULL, 1, NULL, 'mon3'),
(2651, 6, 12, NULL, NULL, 1, NULL, 'mon4'),
(2652, 6, 18, NULL, NULL, 1, NULL, 'mon5'),
(2653, 6, 18, NULL, NULL, 1, NULL, 'mon6'),
(2654, 6, 10, NULL, NULL, 1, NULL, 'tue1'),
(2655, 6, 10, NULL, NULL, 1, NULL, 'tue2'),
(2656, 6, 30, NULL, NULL, 1, NULL, 'tue3'),
(2657, 6, 30, NULL, NULL, 1, NULL, 'tue4'),
(2658, 6, 23, NULL, NULL, 1, NULL, 'tue5'),
(2659, 6, 19, NULL, NULL, 1, NULL, 'wed1'),
(2660, 6, 22, NULL, NULL, 1, NULL, 'wed2'),
(2661, 6, 2, NULL, NULL, 1, NULL, 'wed3'),
(2662, 6, 2, NULL, NULL, 1, NULL, 'wed4'),
(2663, 6, 2, NULL, NULL, 1, NULL, 'wed5'),
(2664, 6, 4, NULL, NULL, 1, NULL, 'thr1'),
(2665, 6, 5, NULL, NULL, 1, NULL, 'thr2'),
(2666, 6, 23, NULL, NULL, 1, NULL, 'thr3'),
(2667, 6, 12, NULL, NULL, 1, NULL, 'thr4'),
(2668, 6, 18, NULL, NULL, 1, NULL, 'thr5'),
(2669, 6, 18, NULL, NULL, 1, NULL, 'thr6'),
(2670, 6, 2, NULL, NULL, 1, NULL, 'fri1'),
(2671, 6, 2, NULL, NULL, 1, NULL, 'fri2'),
(2672, 6, 31, NULL, NULL, 1, NULL, 'fri3'),
(2673, 6, 17, NULL, NULL, 1, NULL, 'fri4'),
(2674, 6, 17, NULL, NULL, 1, NULL, 'fri5'),
(2675, 6, 1, NULL, NULL, 1, NULL, 'fri6'),
(2676, 6, 1, NULL, NULL, 1, NULL, 'fri7'),
(2677, 9, 1, NULL, NULL, 1, NULL, 'mon1'),
(2678, 9, 1, NULL, NULL, 1, NULL, 'mon2'),
(2679, 9, 3, NULL, NULL, 1, NULL, 'mon3'),
(2680, 9, 12, NULL, NULL, 1, NULL, 'mon4'),
(2681, 9, 18, NULL, NULL, 1, NULL, 'mon5'),
(2682, 9, 18, NULL, NULL, 1, NULL, 'mon6'),
(2683, 9, 10, NULL, NULL, 1, NULL, 'tue1'),
(2684, 9, 10, NULL, NULL, 1, NULL, 'tue2'),
(2685, 9, 30, NULL, NULL, 1, NULL, 'tue3'),
(2686, 9, 30, NULL, NULL, 1, NULL, 'tue4'),
(2687, 9, 23, NULL, NULL, 1, NULL, 'tue5'),
(2688, 9, 19, NULL, NULL, 1, NULL, 'wed1'),
(2689, 9, 22, NULL, NULL, 1, NULL, 'wed2'),
(2690, 9, 2, NULL, NULL, 1, NULL, 'wed3'),
(2691, 9, 2, NULL, NULL, 1, NULL, 'wed4'),
(2692, 9, 2, NULL, NULL, 1, NULL, 'wed5'),
(2693, 9, 4, NULL, NULL, 1, NULL, 'thr1'),
(2694, 9, 5, NULL, NULL, 1, NULL, 'thr2'),
(2695, 9, 23, NULL, NULL, 1, NULL, 'thr3'),
(2696, 9, 12, NULL, NULL, 1, NULL, 'thr4'),
(2697, 9, 18, NULL, NULL, 1, NULL, 'thr5'),
(2698, 9, 18, NULL, NULL, 1, NULL, 'thr6'),
(2699, 9, 2, NULL, NULL, 1, NULL, 'fri1'),
(2700, 9, 2, NULL, NULL, 1, NULL, 'fri2'),
(2701, 9, 31, NULL, NULL, 1, NULL, 'fri3'),
(2702, 9, 17, NULL, NULL, 1, NULL, 'fri4'),
(2703, 9, 17, NULL, NULL, 1, NULL, 'fri5'),
(2704, 9, 1, NULL, NULL, 1, NULL, 'fri6'),
(2705, 9, 1, NULL, NULL, 1, NULL, 'fri7'),
(2706, 12, 1, NULL, NULL, 1, NULL, 'mon1'),
(2707, 12, 1, NULL, NULL, 1, NULL, 'mon2'),
(2708, 12, 3, NULL, NULL, 1, NULL, 'mon3'),
(2709, 12, 12, NULL, NULL, 1, NULL, 'mon4'),
(2710, 12, 18, NULL, NULL, 1, NULL, 'mon5'),
(2711, 12, 18, NULL, NULL, 1, NULL, 'mon6'),
(2712, 12, 10, NULL, NULL, 1, NULL, 'tue1'),
(2713, 12, 10, NULL, NULL, 1, NULL, 'tue2'),
(2714, 12, 30, NULL, NULL, 1, NULL, 'tue3'),
(2715, 12, 30, NULL, NULL, 1, NULL, 'tue4'),
(2716, 12, 23, NULL, NULL, 1, NULL, 'tue5'),
(2717, 12, 19, NULL, NULL, 1, NULL, 'wed1'),
(2718, 12, 22, NULL, NULL, 1, NULL, 'wed2'),
(2719, 12, 2, NULL, NULL, 1, NULL, 'wed3'),
(2720, 12, 2, NULL, NULL, 1, NULL, 'wed4'),
(2721, 12, 2, NULL, NULL, 1, NULL, 'wed5'),
(2722, 12, 4, NULL, NULL, 1, NULL, 'thr1'),
(2723, 12, 5, NULL, NULL, 1, NULL, 'thr2'),
(2724, 12, 23, NULL, NULL, 1, NULL, 'thr3'),
(2725, 12, 12, NULL, NULL, 1, NULL, 'thr4'),
(2726, 12, 18, NULL, NULL, 1, NULL, 'thr5'),
(2727, 12, 18, NULL, NULL, 1, NULL, 'thr6'),
(2728, 12, 2, NULL, NULL, 1, NULL, 'fri1'),
(2729, 12, 2, NULL, NULL, 1, NULL, 'fri2'),
(2730, 12, 31, NULL, NULL, 1, NULL, 'fri3'),
(2731, 12, 17, NULL, NULL, 1, NULL, 'fri4'),
(2732, 12, 17, NULL, NULL, 1, NULL, 'fri5'),
(2733, 12, 1, NULL, NULL, 1, NULL, 'fri6'),
(2734, 12, 1, NULL, NULL, 1, NULL, 'fri7'),
(2735, 15, 1, NULL, NULL, 1, NULL, 'mon1'),
(2736, 15, 1, NULL, NULL, 1, NULL, 'mon2'),
(2737, 15, 3, NULL, NULL, 1, NULL, 'mon3'),
(2738, 15, 12, NULL, NULL, 1, NULL, 'mon4'),
(2739, 15, 18, NULL, NULL, 1, NULL, 'mon5'),
(2740, 15, 18, NULL, NULL, 1, NULL, 'mon6'),
(2741, 15, 10, NULL, NULL, 1, NULL, 'tue1'),
(2742, 15, 10, NULL, NULL, 1, NULL, 'tue2'),
(2743, 15, 30, NULL, NULL, 1, NULL, 'tue3'),
(2744, 15, 30, NULL, NULL, 1, NULL, 'tue4'),
(2745, 15, 23, NULL, NULL, 1, NULL, 'tue5'),
(2746, 15, 19, NULL, NULL, 1, NULL, 'wed1'),
(2747, 15, 22, NULL, NULL, 1, NULL, 'wed2'),
(2748, 15, 2, NULL, NULL, 1, NULL, 'wed3'),
(2749, 15, 2, NULL, NULL, 1, NULL, 'wed4'),
(2750, 15, 2, NULL, NULL, 1, NULL, 'wed5'),
(2751, 15, 4, NULL, NULL, 1, NULL, 'thr1'),
(2752, 15, 5, NULL, NULL, 1, NULL, 'thr2'),
(2753, 15, 23, NULL, NULL, 1, NULL, 'thr3'),
(2754, 15, 12, NULL, NULL, 1, NULL, 'thr4'),
(2755, 15, 18, NULL, NULL, 1, NULL, 'thr5'),
(2756, 15, 18, NULL, NULL, 1, NULL, 'thr6'),
(2757, 15, 2, NULL, NULL, 1, NULL, 'fri1'),
(2758, 15, 2, NULL, NULL, 1, NULL, 'fri2'),
(2759, 15, 31, NULL, NULL, 1, NULL, 'fri3'),
(2760, 15, 17, NULL, NULL, 1, NULL, 'fri4'),
(2761, 15, 17, NULL, NULL, 1, NULL, 'fri5'),
(2762, 15, 1, NULL, NULL, 1, NULL, 'fri6'),
(2763, 15, 1, NULL, NULL, 1, NULL, 'fri7'),
(2764, 18, 1, NULL, NULL, 1, NULL, 'mon1'),
(2765, 18, 1, NULL, NULL, 1, NULL, 'mon2'),
(2766, 18, 3, NULL, NULL, 1, NULL, 'mon3'),
(2767, 18, 12, NULL, NULL, 1, NULL, 'mon4'),
(2768, 18, 18, NULL, NULL, 1, NULL, 'mon5'),
(2769, 18, 18, NULL, NULL, 1, NULL, 'mon6'),
(2770, 18, 10, NULL, NULL, 1, NULL, 'tue1'),
(2771, 18, 10, NULL, NULL, 1, NULL, 'tue2'),
(2772, 18, 30, NULL, NULL, 1, NULL, 'tue3'),
(2773, 18, 30, NULL, NULL, 1, NULL, 'tue4'),
(2774, 18, 23, NULL, NULL, 1, NULL, 'tue5'),
(2775, 18, 19, NULL, NULL, 1, NULL, 'wed1'),
(2776, 18, 22, NULL, NULL, 1, NULL, 'wed2'),
(2777, 18, 2, NULL, NULL, 1, NULL, 'wed3'),
(2778, 18, 2, NULL, NULL, 1, NULL, 'wed4'),
(2779, 18, 2, NULL, NULL, 1, NULL, 'wed5'),
(2780, 18, 4, NULL, NULL, 1, NULL, 'thr1'),
(2781, 18, 5, NULL, NULL, 1, NULL, 'thr2'),
(2782, 18, 23, NULL, NULL, 1, NULL, 'thr3'),
(2783, 18, 12, NULL, NULL, 1, NULL, 'thr4'),
(2784, 18, 18, NULL, NULL, 1, NULL, 'thr5'),
(2785, 18, 18, NULL, NULL, 1, NULL, 'thr6'),
(2786, 18, 2, NULL, NULL, 1, NULL, 'fri1'),
(2787, 18, 2, NULL, NULL, 1, NULL, 'fri2'),
(2788, 18, 31, NULL, NULL, 1, NULL, 'fri3'),
(2789, 18, 17, NULL, NULL, 1, NULL, 'fri4'),
(2790, 18, 17, NULL, NULL, 1, NULL, 'fri5'),
(2791, 18, 1, NULL, NULL, 1, NULL, 'fri6'),
(2792, 18, 1, NULL, NULL, 1, NULL, 'fri7'),
(2793, 21, 1, NULL, NULL, 1, NULL, 'mon1'),
(2794, 21, 1, NULL, NULL, 1, NULL, 'mon2'),
(2795, 21, 3, NULL, NULL, 1, NULL, 'mon3'),
(2796, 21, 12, NULL, NULL, 1, NULL, 'mon4'),
(2797, 21, 18, NULL, NULL, 1, NULL, 'mon5'),
(2798, 21, 18, NULL, NULL, 1, NULL, 'mon6'),
(2799, 21, 10, NULL, NULL, 1, NULL, 'tue1'),
(2800, 21, 10, NULL, NULL, 1, NULL, 'tue2'),
(2801, 21, 30, NULL, NULL, 1, NULL, 'tue3'),
(2802, 21, 30, NULL, NULL, 1, NULL, 'tue4'),
(2803, 21, 23, NULL, NULL, 1, NULL, 'tue5'),
(2804, 21, 19, NULL, NULL, 1, NULL, 'wed1'),
(2805, 21, 22, NULL, NULL, 1, NULL, 'wed2'),
(2806, 21, 2, NULL, NULL, 1, NULL, 'wed3'),
(2807, 21, 2, NULL, NULL, 1, NULL, 'wed4'),
(2808, 21, 2, NULL, NULL, 1, NULL, 'wed5'),
(2809, 21, 4, NULL, NULL, 1, NULL, 'thr1'),
(2810, 21, 5, NULL, NULL, 1, NULL, 'thr2'),
(2811, 21, 23, NULL, NULL, 1, NULL, 'thr3'),
(2812, 21, 12, NULL, NULL, 1, NULL, 'thr4'),
(2813, 21, 18, NULL, NULL, 1, NULL, 'thr5'),
(2814, 21, 18, NULL, NULL, 1, NULL, 'thr6'),
(2815, 21, 2, NULL, NULL, 1, NULL, 'fri1'),
(2816, 21, 2, NULL, NULL, 1, NULL, 'fri2'),
(2817, 21, 31, NULL, NULL, 1, NULL, 'fri3'),
(2818, 21, 17, NULL, NULL, 1, NULL, 'fri4'),
(2819, 21, 17, NULL, NULL, 1, NULL, 'fri5'),
(2820, 21, 1, NULL, NULL, 1, NULL, 'fri6'),
(2821, 21, 1, NULL, NULL, 1, NULL, 'fri7'),
(2822, 24, 1, NULL, NULL, 1, NULL, 'mon1'),
(2823, 24, 1, NULL, NULL, 1, NULL, 'mon2'),
(2824, 24, 3, NULL, NULL, 1, NULL, 'mon3'),
(2825, 24, 12, NULL, NULL, 1, NULL, 'mon4'),
(2826, 24, 18, NULL, NULL, 1, NULL, 'mon5'),
(2827, 24, 18, NULL, NULL, 1, NULL, 'mon6'),
(2828, 24, 10, NULL, NULL, 1, NULL, 'tue1'),
(2829, 24, 10, NULL, NULL, 1, NULL, 'tue2'),
(2830, 24, 30, NULL, NULL, 1, NULL, 'tue3'),
(2831, 24, 30, NULL, NULL, 1, NULL, 'tue4'),
(2832, 24, 23, NULL, NULL, 1, NULL, 'tue5'),
(2833, 24, 19, NULL, NULL, 1, NULL, 'wed1'),
(2834, 24, 22, NULL, NULL, 1, NULL, 'wed2'),
(2835, 24, 2, NULL, NULL, 1, NULL, 'wed3'),
(2836, 24, 2, NULL, NULL, 1, NULL, 'wed4'),
(2837, 24, 2, NULL, NULL, 1, NULL, 'wed5'),
(2838, 24, 4, NULL, NULL, 1, NULL, 'thr1'),
(2839, 24, 5, NULL, NULL, 1, NULL, 'thr2'),
(2840, 24, 23, NULL, NULL, 1, NULL, 'thr3'),
(2841, 24, 12, NULL, NULL, 1, NULL, 'thr4'),
(2842, 24, 18, NULL, NULL, 1, NULL, 'thr5'),
(2843, 24, 18, NULL, NULL, 1, NULL, 'thr6'),
(2844, 24, 2, NULL, NULL, 1, NULL, 'fri1'),
(2845, 24, 2, NULL, NULL, 1, NULL, 'fri2'),
(2846, 24, 31, NULL, NULL, 1, NULL, 'fri3'),
(2847, 24, 17, NULL, NULL, 1, NULL, 'fri4'),
(2848, 24, 17, NULL, NULL, 1, NULL, 'fri5'),
(2849, 24, 1, NULL, NULL, 1, NULL, 'fri6'),
(2850, 24, 1, NULL, NULL, 1, NULL, 'fri7');

-- --------------------------------------------------------

--
-- Table structure for table `semestars`
--

DROP TABLE IF EXISTS `semestars`;
CREATE TABLE IF NOT EXISTS `semestars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part_of_semestar` enum('1','2') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `semestars`
--

INSERT INTO `semestars` (`id`, `start_time`, `end_time`, `part_of_semestar`) VALUES
(1, '2020-01-18 19:04:56', '0000-00-00 00:00:00', '1'),
(2, '2020-01-18 19:17:04', '0000-00-00 00:00:00', '2');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `social_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_group_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_group_id_fk_idx` (`student_group_id`),
  KEY `student_group_fk_id_idx` (`student_group_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `date_of_birth`, `social_id`, `created_at`, `updated_at`, `student_group_id`, `parent_id`) VALUES
(1, 'Artusss', 'Bothbie', '2005-12-20', '55-307-1675', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 1, 6),
(2, 'Misty', 'Dinis', '2012-01-23', '19-851-8314', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 22, 6),
(3, 'Moe', 'Duddell', '2006-01-20', '70-288-7005', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 4, 8),
(4, 'Elsworth', 'Naper', '2010-05-29', '69-929-9590', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 16, 12),
(5, 'Ephrem', 'Benedit', '2007-07-01', '34-326-1091', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 7, 12),
(6, 'Carey', 'Finnie', '2005-04-08', '75-186-9440', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 1, 12),
(7, 'Zorah', 'Dossetter', '2008-05-21', '34-144-8024', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 10, 14),
(8, 'Sonia', 'Andreini', '2007-08-01', '10-086-6372', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 7, 15),
(9, 'Summer', 'Wetton', '2006-07-12', '53-146-2668', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 4, 17),
(10, 'Mandel', 'Dorin', '2008-08-22', '04-357-5286', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 10, 17),
(11, 'Parsifal', 'Shattock', '2009-03-13', '04-177-6094', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 13, 18),
(12, 'Fonzie', 'Prandini', '2009-02-19', '41-166-4828', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 13, 20),
(13, 'Oliy', 'Crocetto', '2008-04-16', '51-727-1408', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 10, 20),
(14, 'Lettie', 'MacAlpine', '2005-01-15', '26-372-3906', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 1, 20),
(15, 'Joane', 'Hanbidge', '2011-10-20', '87-449-1206', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 19, 22),
(16, 'Sabina', 'Vestica', '2006-08-16', '12-060-7721', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 4, 22),
(17, 'Susan', 'Boundy', '2007-04-08', '60-366-7653', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 7, 25),
(18, 'Cissiee', 'Thunders', '2010-06-07', '05-527-5369', '2020-01-13 08:40:25', '2020-01-15 11:49:04', 16, 25),
(19, 'Carolus', 'Peacop', '2007-07-18', '99-097-2260', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 7, 27),
(20, 'Jaimie', 'Caser', '2011-12-01', '11-753-5955', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 19, 27),
(21, 'Patton', 'Barsham', '2009-08-12', '97-845-6795', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 13, 34),
(22, 'Helaine', 'Heinig', '2006-05-08', '64-402-5078', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 4, 36),
(23, 'Maryjane', 'Leele', '2007-08-01', '99-968-0226', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 7, 40),
(24, 'Natalina', 'Falkous', '2007-02-25', '45-136-6466', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 7, 43),
(25, 'Theo', 'Lilian', '2007-02-06', '53-383-1197', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 7, 43),
(26, 'Reagen', 'Venneur', '2008-03-02', '64-369-5910', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 10, 46),
(27, 'Casandra', 'Floodgate', '2006-12-17', '74-664-2768', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 4, 47),
(28, 'Harry', 'Larne', '2009-07-19', '20-647-1918', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 13, 47),
(29, 'Prissie', 'Sherwen', '2005-02-15', '31-636-2941', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 1, 54),
(30, 'Daune', 'Manby', '2011-06-11', '75-838-0276', '2020-01-13 08:40:26', '2020-01-15 11:49:04', 19, 56),
(31, 'Annemarie', 'Scampion', '2006-08-23', '73-478-7611', '2020-01-13 08:40:26', '2020-01-15 14:24:51', 4, 56),
(32, 'Porty', 'Pindar', '2008-01-25', '28-194-4783', '2020-01-13 08:40:26', '2020-01-15 14:24:51', 10, 65),
(33, 'Ron', 'Burgett', '2008-01-18', '58-191-2263', '2020-01-13 08:40:26', '2020-01-15 14:31:33', 10, 65),
(34, 'Boonie', 'Branchet', '2008-01-24', '68-943-2949', '2020-01-13 08:40:26', '2020-01-15 14:31:33', 10, 65),
(35, 'Andonis', 'Gyde', '2010-04-01', '34-174-2528', '2020-01-13 08:40:26', '2020-01-15 14:33:06', 16, 67),
(36, 'Madelon', 'Leggin', '2009-03-28', '39-236-0896', '2020-01-13 08:40:26', '2020-01-15 14:32:09', 13, 69),
(37, 'Bobine', 'Shallcrass', '2006-03-01', '70-653-6672', '2020-01-13 08:40:26', '2020-01-15 14:29:00', 5, 69),
(38, 'Shurlocke', 'Planks', '2011-06-29', '36-102-7680', '2020-01-13 08:40:26', '2020-01-15 14:33:47', 19, 69),
(39, 'Brandy', 'Buntine', '2008-11-06', '07-050-7865', '2020-01-13 08:40:26', '2020-01-15 14:31:33', 10, 70),
(40, 'Ilyssa', 'Comellini', '2010-08-14', '80-857-7604', '2020-01-13 08:40:26', '2020-01-15 14:33:06', 16, 70),
(41, 'Hubey', 'Duffie', '2010-10-11', '51-298-8247', '2020-01-13 08:40:26', '2020-01-15 14:33:06', 16, 72),
(42, 'Fredericka', 'Yewdell', '2009-03-16', '81-939-8157', '2020-01-13 08:40:26', '2020-01-15 14:32:09', 13, 73),
(43, 'Brandon', 'Cuseck', '2007-03-10', '01-044-6809', '2020-01-13 08:40:26', '2020-01-15 14:30:23', 8, 76),
(44, 'Gal', 'Wyborn', '2006-10-12', '95-889-0457', '2020-01-13 08:40:26', '2020-01-15 14:29:00', 5, 76),
(45, 'Myrlene', 'Creane', '2012-12-19', '13-948-4128', '2020-01-13 08:40:27', '2020-01-15 14:34:18', 22, 80),
(46, 'Arv', 'Mattityahou', '2012-11-29', '65-647-1984', '2020-01-13 08:40:27', '2020-01-15 14:34:18', 22, 82),
(47, 'Merilee', 'Stetson', '2011-08-30', '02-783-5791', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 19, 82),
(48, 'Padraig', 'Mains', '2008-11-29', '68-081-5001', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 10, 89),
(49, 'Wilmette', 'Broske', '2011-10-11', '11-609-1215', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 19, 92),
(50, 'Tabby', 'Sucre', '2009-05-09', '37-883-7103', '2020-01-13 08:40:27', '2020-01-15 14:32:09', 13, 92),
(51, 'Sherwin', 'Alekhov', '2011-05-19', '38-091-3662', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 19, 92),
(52, 'Donna', 'Peyntue', '2011-02-25', '35-183-9132', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 19, 92),
(53, 'Honor', 'Baroc', '2008-11-24', '20-233-2850', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 10, 95),
(54, 'Padriac', 'Schuster', '2008-12-18', '00-389-4544', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 10, 100),
(55, 'Beale', 'Sybry', '2007-01-23', '85-130-9558', '2020-01-13 08:40:27', '2020-01-15 14:30:23', 8, 101),
(56, 'Marketa', 'Wythe', '2011-06-27', '48-331-5900', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 19, 101),
(57, 'Nealson', 'Jopson', '2010-09-30', '07-149-5965', '2020-01-13 08:40:27', '2020-01-15 14:33:06', 16, 101),
(58, 'Louisette', 'Freestone', '2008-01-19', '67-283-9658', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 11, 105),
(59, 'Bird', 'Clynman', '2010-07-03', '60-609-7459', '2020-01-13 08:40:27', '2020-01-15 14:33:06', 17, 105),
(60, 'Jorry', 'Marson', '2012-11-26', '08-539-9665', '2020-01-13 08:40:27', '2020-01-15 14:34:18', 22, 105),
(61, 'Dorothea', 'Thompson', '2011-11-05', '41-815-0180', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 20, 108),
(62, 'Samuele', 'Cartmale', '2008-09-04', '03-457-9572', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 11, 109),
(63, 'Dominick', 'Rau', '2011-11-27', '30-087-4002', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 20, 110),
(64, 'Jase', 'Buglass', '2011-09-11', '75-072-1579', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 20, 111),
(65, 'Davin', 'Hehnke', '2008-05-02', '12-177-1502', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 11, 112),
(66, 'Jacqueline', 'Scola', '2011-07-16', '59-565-7746', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 20, 113),
(67, 'Ertha', 'Utting', '2005-07-21', '33-723-4273', '2020-01-13 08:40:27', '2020-01-15 14:27:49', 1, 114),
(68, 'Quillan', 'Mowsley', '2008-01-17', '56-776-8216', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 11, 115),
(69, 'Bobbie', 'Dowdam', '2007-06-17', '08-828-5216', '2020-01-13 08:40:27', '2020-01-15 14:30:23', 8, 116),
(70, 'Davida', 'Trainor', '2011-06-27', '95-066-4294', '2020-01-13 08:40:27', '2020-01-15 14:33:47', 20, 117),
(71, 'Fred', 'Bulbrook', '2008-03-26', '87-395-5372', '2020-01-13 08:40:27', '2020-01-15 14:31:33', 11, 118),
(72, 'Hilary', 'Dressel', '2006-01-30', '09-660-8349', '2020-01-13 08:40:27', '2020-01-15 14:29:00', 5, 119),
(73, 'Gaspard', 'Plowell', '2005-04-16', '13-966-3667', '2020-01-13 08:40:28', '2020-01-15 14:27:49', 1, 120),
(74, 'Merline', 'Ebsworth', '2007-02-27', '80-014-7658', '2020-01-13 08:40:28', '2020-01-15 14:30:23', 8, 121),
(75, 'Jackie', 'Semken', '2008-06-02', '69-156-5223', '2020-01-13 08:40:28', '2020-01-15 14:31:33', 11, 122),
(76, 'Debbi', 'Meni', '2006-06-18', '95-992-1723', '2020-01-13 08:40:28', '2020-01-15 14:29:00', 5, 123),
(77, 'Randal', 'Leathley', '2009-10-20', '75-156-4151', '2020-01-13 08:40:28', '2020-01-15 14:32:09', 13, 124),
(78, 'Benni', 'Belfelt', '2006-05-22', '80-222-1636', '2020-01-13 08:40:28', '2020-01-15 14:29:00', 5, 125),
(79, 'Dav', 'Robbins', '2005-03-16', '86-789-0335', '2020-01-13 08:40:28', '2020-01-15 14:27:49', 1, 126),
(80, 'Corliss', 'Mulder', '2009-01-30', '95-998-4623', '2020-01-13 08:40:28', '2020-01-15 14:32:09', 13, 127),
(81, 'Deva', 'Tumbridge', '2008-06-23', '20-958-4277', '2020-01-13 08:40:28', '2020-01-15 14:31:33', 11, 128),
(82, 'Allayne', 'Galer', '2012-12-28', '94-909-0668', '2020-01-13 08:40:28', '2020-01-15 14:34:18', 22, 129),
(83, 'Shina', 'Kauble', '2008-02-16', '64-861-4202', '2020-01-13 08:40:28', '2020-01-15 14:31:33', 11, 130),
(84, 'Herc', 'Igo', '2005-07-05', '04-008-1956', '2020-01-13 08:40:28', '2020-01-15 14:27:49', 1, 131),
(85, 'Dew', 'Zecchini', '2009-11-13', '69-440-2005', '2020-01-13 08:40:28', '2020-01-15 14:32:09', 13, 132),
(86, 'Marvin', 'Pridham', '2005-04-26', '40-549-8343', '2020-01-13 08:40:28', '2020-01-15 14:27:49', 2, 133),
(87, 'Hally', 'Amys', '2006-08-11', '76-736-7608', '2020-01-13 08:40:28', '2020-01-15 14:29:00', 5, 134),
(88, 'Reynard', 'Temprell', '2007-06-15', '65-051-6000', '2020-01-13 08:40:28', '2020-01-15 14:30:23', 8, 135),
(89, 'Krystal', 'Fetherston', '2010-12-23', '80-745-7431', '2020-01-13 08:40:28', '2020-01-15 14:33:06', 17, 136),
(90, 'Dion', 'Fincken', '2006-02-06', '16-994-2110', '2020-01-13 08:40:28', '2020-01-15 14:29:00', 5, 137),
(91, 'Gaynor', 'Milsted', '2011-07-15', '63-267-1606', '2020-01-13 08:40:28', '2020-01-15 14:33:47', 20, 138),
(92, 'Amanda', 'Michal', '2011-01-29', '45-727-9322', '2020-01-13 08:40:28', '2020-01-15 14:33:47', 20, 139),
(93, 'Melisandra', 'Nice', '2012-09-24', '62-753-0866', '2020-01-13 08:40:28', '2020-01-15 14:34:18', 22, 140),
(94, 'Emyle', 'Bleything', '2006-06-05', '37-951-2413', '2020-01-13 08:40:28', '2020-01-15 14:29:00', 5, 141),
(95, 'Carole', 'Jewell', '2005-05-10', '68-611-4682', '2020-01-13 08:40:28', '2020-01-15 14:27:49', 2, 142),
(96, 'Kathryne', 'Frears', '2005-11-09', '35-763-6429', '2020-01-13 08:40:28', '2020-01-15 14:27:49', 2, 143),
(97, 'Tabbitha', 'Arents', '2009-06-18', '39-002-4984', '2020-01-13 08:40:28', '2020-01-15 14:32:09', 13, 144),
(98, 'Jedidiah', 'Lotterington', '2007-08-29', '00-279-5942', '2020-01-13 08:40:28', '2020-01-15 14:30:23', 8, 145),
(99, 'Georgianne', 'Impey', '2012-01-10', '41-076-3260', '2020-01-13 08:40:29', '2020-01-15 14:34:18', 23, 146),
(100, 'Arlinda', 'Perle', '2007-10-09', '63-107-9385', '2020-01-13 08:40:29', '2020-01-15 14:30:23', 8, 147),
(101, 'Brucie', 'Reef', '2010-07-19', '41-508-9271', '2020-01-13 08:40:29', '2020-01-15 14:33:06', 17, 148),
(102, 'Saxe', 'Dimitrov', '2010-11-24', '99-694-7132', '2020-01-13 08:40:29', '2020-01-15 14:33:06', 17, 149),
(103, 'Reinald', 'Godmer', '2012-10-09', '59-648-7785', '2020-01-13 08:40:29', '2020-01-15 14:34:18', 23, 150),
(104, 'Tadeo', 'Pykett', '2007-06-06', '65-012-9321', '2020-01-13 08:40:29', '2020-01-15 14:30:23', 8, 151),
(105, 'Carmelina', 'Dudson', '2007-03-10', '21-471-1941', '2020-01-13 08:40:29', '2020-01-15 14:30:23', 9, 152),
(106, 'Willow', 'Mellor', '2011-12-14', '45-919-5715', '2020-01-13 08:40:29', '2020-01-15 14:33:47', 20, 153),
(107, 'Pat', 'Splevin', '2008-08-10', '81-517-8318', '2020-01-13 08:40:29', '2020-01-15 14:31:33', 12, 154),
(108, 'Kelsey', 'Verecker', '2007-05-18', '99-817-0664', '2020-01-13 08:40:29', '2020-01-15 14:30:23', 9, 155),
(109, 'Murvyn', 'Boscher', '2006-03-31', '91-097-2045', '2020-01-13 08:40:29', '2020-01-15 14:29:00', 6, 156),
(110, 'Marabel', 'Sharphurst', '2006-06-27', '85-527-1046', '2020-01-13 08:40:29', '2020-01-15 14:29:00', 6, 157),
(111, 'Cathe', 'Bastable', '2006-09-07', '82-861-0934', '2020-01-13 08:40:29', '2020-01-15 14:29:00', 6, 158),
(112, 'Noach', 'Batcock', '2005-03-17', '87-671-7284', '2020-01-13 08:40:29', '2020-01-15 14:27:49', 2, 159),
(113, 'Meredith', 'Reims', '2011-10-25', '61-206-1217', '2020-01-13 08:40:29', '2020-01-15 14:33:47', 20, 160),
(114, 'Adriana', 'MacNulty', '2011-12-22', '06-455-6678', '2020-01-13 08:40:29', '2020-01-15 14:33:47', 20, 161),
(115, 'Eilis', 'Piecha', '2008-11-28', '98-593-5297', '2020-01-13 08:40:29', '2020-01-15 14:31:33', 12, 162),
(116, 'Frederique', 'Truwert', '2005-01-03', '56-727-7514', '2020-01-13 08:40:29', '2020-01-15 14:27:49', 2, 163),
(117, 'Konstance', 'Wooder', '2012-09-16', '31-354-6883', '2020-01-13 08:40:29', '2020-01-15 14:34:18', 23, 164),
(118, 'Rollin', 'Ockwell', '2005-04-26', '97-800-0196', '2020-01-13 08:40:29', '2020-01-15 14:27:49', 2, 165),
(119, 'Ford', 'Arkley', '2008-10-10', '04-205-5299', '2020-01-13 08:40:29', '2020-01-15 14:31:33', 12, 166),
(120, 'Nathalie', 'Domingues', '2007-10-11', '33-752-3879', '2020-01-13 08:40:29', '2020-01-15 14:30:23', 9, 167),
(121, 'Milzie', 'Treagust', '2010-12-22', '50-073-7048', '2020-01-13 08:40:29', '2020-01-15 14:33:06', 17, 168),
(122, 'Rodd', 'Kobsch', '2011-06-13', '54-818-1584', '2020-01-13 08:40:29', '2020-01-15 14:33:47', 20, 169),
(123, 'Merrie', 'Healey', '2010-05-15', '88-374-5906', '2020-01-13 08:40:29', '2020-01-15 14:33:06', 17, 170),
(124, 'Carola', 'Pinches', '2006-07-02', '09-174-8858', '2020-01-13 08:40:29', '2020-01-15 14:29:00', 6, 171),
(125, 'Marcel', 'Bagot', '2006-02-02', '59-501-9585', '2020-01-13 08:40:30', '2020-01-15 14:29:00', 6, 172),
(126, 'Kingsly', 'Haskew', '2012-06-10', '47-624-6146', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 23, 173),
(127, 'Adah', 'Ivanenko', '2010-04-28', '85-882-5821', '2020-01-13 08:40:30', '2020-01-15 14:33:06', 17, 174),
(128, 'Natalina', 'Barthrop', '2008-12-15', '43-984-0203', '2020-01-13 08:40:30', '2020-01-15 14:31:33', 12, 175),
(129, 'Leelah', 'Chesnut', '2009-01-18', '26-752-0839', '2020-01-13 08:40:30', '2020-01-15 14:32:09', 14, 176),
(130, 'Binnie', 'Exell', '2007-06-10', '31-967-7388', '2020-01-13 08:40:30', '2020-01-15 14:30:23', 9, 177),
(131, 'Verla', 'Gellan', '2011-12-14', '05-409-6024', '2020-01-13 08:40:30', '2020-01-15 14:33:47', 21, 178),
(132, 'Aloysia', 'Newark', '2012-01-19', '06-323-5983', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 23, 179),
(133, 'Fayette', 'Petrou', '2009-03-09', '42-477-6735', '2020-01-13 08:40:30', '2020-01-15 14:32:09', 14, 180),
(134, 'Giustino', 'Arnefield', '2012-10-04', '28-609-6326', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 23, 181),
(135, 'Charissa', 'Dachey', '2012-10-29', '50-675-9611', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 23, 182),
(136, 'Melisandra', 'Fishly', '2011-05-14', '94-000-0996', '2020-01-13 08:40:30', '2020-01-15 14:33:47', 21, 183),
(137, 'Karl', 'MacCawley', '2010-01-14', '66-596-3979', '2020-01-13 08:40:30', '2020-01-15 14:33:06', 17, 184),
(138, 'Ola', 'MacGillivray', '2008-07-03', '23-753-0878', '2020-01-13 08:40:30', '2020-01-15 14:31:33', 12, 185),
(139, 'Nanete', 'Shields', '2009-02-11', '19-457-0024', '2020-01-13 08:40:30', '2020-01-15 14:32:09', 14, 186),
(140, 'Agata', 'O\'Currane', '2012-01-15', '80-358-4626', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 24, 187),
(141, 'Fin', 'Toopin', '2009-03-15', '35-921-5104', '2020-01-13 08:40:30', '2020-01-15 14:32:09', 14, 188),
(142, 'Hilda', 'Glowacki', '2011-03-11', '61-250-9030', '2020-01-13 08:40:30', '2020-01-15 14:33:47', 21, 189),
(143, 'Shellysheldon', 'Lauderdale', '2009-12-10', '12-526-7033', '2020-01-13 08:40:30', '2020-01-15 14:32:09', 14, 190),
(144, 'Hoebart', 'Henricsson', '2012-11-03', '51-308-3840', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 24, 191),
(145, 'James', 'Rainville', '2006-12-22', '50-244-5953', '2020-01-13 08:40:30', '2020-01-15 14:29:00', 6, 192),
(146, 'Malvin', 'Knappett', '2012-05-12', '38-495-3380', '2020-01-13 08:40:30', '2020-01-15 14:34:18', 24, 193),
(147, 'Gerrie', 'Solomonides', '2006-10-14', '02-848-8502', '2020-01-13 08:40:30', '2020-01-15 14:29:00', 6, 194),
(148, 'Florry', 'Satchel', '2006-11-21', '93-724-6549', '2020-01-13 08:40:30', '2020-01-15 14:29:00', 6, 195),
(149, 'Fowler', 'Jermy', '2009-07-31', '09-036-0844', '2020-01-13 08:40:30', '2020-01-15 14:32:09', 14, 196),
(150, 'Stacie', 'Wyon', '2006-09-28', '37-338-9055', '2020-01-13 08:40:30', '2020-01-15 14:29:00', 6, 197),
(151, 'Adrianne', 'Altree', '2011-08-18', '04-486-5621', '2020-01-13 08:40:30', '2020-01-15 14:33:47', 21, 199),
(152, 'Cecilla', 'Philp', '2011-07-31', '98-237-5090', '2020-01-13 08:40:30', '2020-01-15 14:33:47', 21, 198),
(153, 'Penrod', 'Monget', '2007-08-13', '69-927-6590', '2020-01-13 08:40:31', '2020-01-15 14:30:23', 9, 200),
(154, 'Kelwin', 'Cooke', '2006-05-03', '52-649-1170', '2020-01-13 08:40:31', '2020-01-15 14:29:00', 6, 201),
(155, 'Isabel', 'Weepers', '2011-06-05', '02-990-8532', '2020-01-13 08:40:31', '2020-01-15 14:33:47', 21, 202),
(156, 'Berton', 'Balint', '2008-12-25', '37-323-7777', '2020-01-13 08:40:31', '2020-01-15 14:31:33', 12, 203),
(157, 'Dacie', 'Mandrier', '2010-08-28', '24-948-3319', '2020-01-13 08:40:31', '2020-01-15 14:33:06', 18, 204),
(158, 'Brittne', 'Pounds', '2007-01-13', '57-599-5090', '2020-01-13 08:40:31', '2020-01-15 14:30:23', 9, 205),
(159, 'Domenic', 'Milius', '2010-06-28', '62-325-7372', '2020-01-13 08:40:31', '2020-01-15 14:33:06', 18, 206),
(160, 'Nita', 'Sharrard', '2010-11-02', '25-488-9453', '2020-01-13 08:40:31', '2020-01-15 14:33:06', 18, 207),
(161, 'Zorah', 'Brodeur', '2012-08-21', '49-025-1310', '2020-01-13 08:40:31', '2020-01-15 14:34:18', 24, 208),
(162, 'Blanca', 'Gullivent', '2011-11-16', '93-053-1525', '2020-01-13 08:40:31', '2020-01-15 14:33:47', 21, 209),
(163, 'Fredericka', 'Cadwallader', '2009-01-01', '75-512-3317', '2020-01-13 08:40:31', '2020-01-15 14:32:09', 14, 210),
(164, 'Deana', 'Hickisson', '2010-02-19', '50-501-9465', '2020-01-13 08:40:31', '2020-01-15 14:33:06', 18, 211),
(165, 'Dominic', 'Mandel', '2005-02-24', '77-866-7619', '2020-01-13 08:40:31', '2020-01-15 14:27:49', 2, 212),
(166, 'Faith', 'McGlynn', '2008-05-05', '88-648-5259', '2020-01-13 08:40:31', '2020-01-15 14:31:33', 12, 213),
(167, 'Addia', 'Collar', '2008-12-28', '36-342-7902', '2020-01-13 08:40:31', '2020-01-15 14:31:33', 12, 214),
(168, 'Olivero', 'Karmel', '2007-02-25', '26-364-9643', '2020-01-13 08:40:31', '2020-01-15 14:30:23', 9, 215),
(169, 'Romy', 'Frunks', '2008-07-05', '61-368-5395', '2020-01-13 08:40:31', '2020-01-15 14:31:33', 12, 216),
(170, 'Izzy', 'Paulsen', '2010-08-02', '73-392-9474', '2020-01-13 08:40:31', '2020-01-15 14:33:06', 18, 217),
(171, 'Wright', 'Enbury', '2012-01-04', '38-290-0805', '2020-01-13 08:40:31', '2020-01-15 14:34:18', 24, 218),
(172, 'Jolynn', 'Arends', '2012-03-23', '80-270-5292', '2020-01-13 08:40:31', '2020-01-15 14:34:18', 24, 219),
(173, 'Ravid', 'Sewall', '2007-10-14', '59-470-2388', '2020-01-13 08:40:31', '2020-01-15 14:30:23', 9, 220),
(174, 'Salome', 'Tonkes', '2011-10-14', '70-083-7206', '2020-01-13 08:40:31', '2020-01-15 14:33:47', 21, 221),
(175, 'Gilbertine', 'Tremayne', '2007-06-29', '04-235-4321', '2020-01-13 08:40:31', '2020-01-15 14:30:23', 9, 222),
(176, 'Tanner', 'Barradell', '2007-09-22', '05-214-9599', '2020-01-13 08:40:31', '2020-01-15 14:30:23', 9, 223),
(177, 'Taffy', 'Tullot', '2011-08-08', '24-199-7911', '2020-01-13 08:40:31', '2020-01-15 14:33:47', 21, 224),
(178, 'Jermayne', 'Neggrini', '2010-08-01', '39-854-7087', '2020-01-13 08:40:31', '2020-01-15 14:33:06', 18, 225),
(179, 'Hubey', 'Baumber', '2007-11-19', '64-621-2265', '2020-01-13 08:40:32', '2020-01-15 14:30:23', 9, 226),
(180, 'Blithe', 'Aymes', '2005-04-26', '39-457-6205', '2020-01-13 08:40:32', '2020-01-15 14:27:49', 2, 227),
(181, 'Ermengarde', 'Jurries', '2010-04-30', '57-649-8095', '2020-01-13 08:40:32', '2020-01-15 14:33:06', 18, 228),
(182, 'Auguste', 'McMorland', '2010-12-16', '62-647-3876', '2020-01-13 08:40:32', '2020-01-15 14:33:06', 18, 229),
(183, 'Ruddy', 'Twyford', '2012-12-31', '17-377-4923', '2020-01-13 08:40:32', '2020-01-15 14:34:18', 24, 230),
(184, 'Ring', 'Laver', '2007-05-14', '45-517-1351', '2020-01-13 08:40:32', '2020-01-15 14:30:23', 9, 231),
(185, 'Chad', 'Royds', '2010-06-25', '03-583-4578', '2020-01-13 08:40:32', '2020-01-15 14:33:06', 18, 232),
(186, 'Alain', 'Lancaster', '2012-07-04', '86-672-7366', '2020-01-13 08:40:32', '2020-01-15 14:34:18', 24, 233),
(187, 'Florella', 'MacDearmont', '2008-08-03', '30-510-4947', '2020-01-13 08:40:32', '2020-01-15 14:31:33', 12, 234),
(188, 'Emanuel', 'Scholes', '2012-03-17', '86-174-9686', '2020-01-13 08:40:32', '2020-01-15 14:34:18', 24, 235),
(189, 'Wes', 'Baselli', '2005-03-30', '54-364-5249', '2020-01-13 08:40:32', '2020-01-15 14:27:49', 3, 236),
(190, 'Rafi', 'Shewen', '2012-11-25', '85-324-0175', '2020-01-13 08:40:32', '2020-01-15 14:34:18', 24, 237),
(191, 'Ethel', 'Featherston', '2011-10-18', '87-478-7410', '2020-01-13 08:40:32', '2020-01-15 14:33:47', 21, 238),
(192, 'Karon', 'Mainds', '2007-11-08', '76-481-8346', '2020-01-13 08:40:32', '2020-01-15 14:30:23', 9, 239),
(193, 'Colin', 'Noirel', '2005-07-14', '56-376-1021', '2020-01-13 08:40:32', '2020-01-15 14:27:49', 3, 240),
(194, 'Martie', 'Joselovitch', '2007-03-01', '33-162-9657', '2020-01-13 08:40:32', '2020-01-15 14:30:23', 9, 241),
(195, 'Lonny', 'Tytler', '2007-11-11', '85-108-8148', '2020-01-13 08:40:32', '2020-01-15 14:30:23', 9, 242),
(196, 'Anastassia', 'Dessent', '2009-04-07', '34-934-6164', '2020-01-13 08:40:32', '2020-01-15 14:32:09', 15, 243),
(197, 'Ludvig', 'McRuvie', '2011-02-28', '43-812-8126', '2020-01-13 08:40:32', '2020-01-15 14:33:47', 21, 244),
(198, 'Gavan', 'Cantua', '2012-01-29', '05-326-3655', '2020-01-13 08:40:32', '2020-01-15 14:34:18', 24, NULL),
(201, 'Doroteja', 'Stepanov StaniÅ¡iÄ‡', '2010-01-18', '0303030333', '2020-01-16 16:53:50', '2020-01-16 16:53:50', 18, 247),
(202, 'Filip', 'Stepanov', '2006-02-15', '15151551515151', '2020-01-16 16:55:16', '2020-01-16 16:55:16', 6, 247);

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

DROP TABLE IF EXISTS `student_group`;
CREATE TABLE IF NOT EXISTS `student_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_year` year(4) NOT NULL,
  `finish_year` year(4) NOT NULL,
  `main_teacher_id` int(11) DEFAULT NULL,
  `subgroup_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_group_subgroups1_idx` (`subgroup_id`),
  KEY `fk_student_group_users1_idx` (`main_teacher_id`),
  KEY `year_id_fk_idx` (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`id`, `start_year`, `finish_year`, `main_teacher_id`, `subgroup_id`, `created_at`, `updated_at`, `year_id`) VALUES
(1, 2012, 2020, 4, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 8),
(2, 2012, 2020, 7, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 8),
(3, 2012, 2020, 16, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 8),
(4, 2013, 2021, 21, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 7),
(5, 2013, 2021, 24, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 7),
(6, 2013, 2021, 9, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 7),
(7, 2014, 2022, 29, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 6),
(8, 2014, 2022, 30, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 6),
(9, 2014, 2022, 32, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 6),
(10, 2015, 2023, 35, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 5),
(11, 2015, 2023, 37, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 5),
(12, 2015, 2023, 39, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 5),
(13, 2016, 2024, 44, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 4),
(14, 2016, 2024, 48, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 4),
(15, 2016, 2024, 50, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 4),
(16, 2017, 2025, 51, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 3),
(17, 2017, 2025, 58, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 3),
(18, 2017, 2025, 60, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 3),
(19, 2018, 2026, 63, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 2),
(20, 2018, 2026, 64, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 2),
(21, 2018, 2026, 68, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 2),
(22, 2019, 2027, 74, 1, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 1),
(23, 2019, 2027, 79, 2, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 1),
(24, 2019, 2027, 84, 3, '2020-01-15 10:47:59', '2020-01-15 10:47:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subgroups`
--

DROP TABLE IF EXISTS `subgroups`;
CREATE TABLE IF NOT EXISTS `subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `subgroups`
--

INSERT INTO `subgroups` (`id`, `title`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_classes_users1_idx` (`lecturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `title`, `lecturer_id`) VALUES
(1, 'Mathematics', 4),
(2, 'Languages', 7),
(3, 'History', 16),
(4, 'Music', 21),
(5, 'Geography', 24),
(6, 'Literacy', 9),
(7, 'Natural history', 29),
(8, 'Science', 30),
(9, 'History', 32),
(10, 'Physical education', 35),
(11, 'Computer studies', 37),
(12, 'Art', 39),
(13, 'Languages', 44),
(14, 'Languages', 48),
(15, 'Mathematics', 50),
(16, 'Art', 51),
(17, 'Literacy', 58),
(18, 'Science', 60),
(19, 'Physical ', 63),
(20, 'Science', 64),
(21, 'Physical ', 68),
(22, 'Natural history', 74),
(23, 'Citizenship', 79),
(24, 'Science', 84),
(25, 'History', 86),
(26, 'History', 87),
(27, 'Physical education', 88),
(29, 'Computer studies', 93),
(30, 'Computer studies', 97),
(31, 'Graphical Design', 84);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_520_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_roles1_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `role_id`, `password`, `updated_at`, `created_at`, `last_login_at`) VALUES
(2, 'pera', 'peric', 'pera@peric.com', 1, 'pera', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(3, 'mira', 'miric', 'mira@miric.com', 2, 'mira', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(4, 'ana', 'anic', 'ana@anic.com', 3, 'ana', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(5, 'luka', 'lukic', 'luka@lukic.com', 4, 'luka', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(6, 'dejan', 'dekic', 'dejan@dekic.com', 5, 'dejan', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(7, 'Valentine', 'Speenden', 'vspeenden0@home.pl', 3, 'duamXprgXad', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(8, 'Courtney', 'Husthwaite', 'chusthwaite1@marketwatch.com', 5, 'JQBmpE', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(9, 'Olin', 'Willows', 'owillows2@soup.io', 3, 'B3gwvx6VX7Q', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(10, 'Elly', 'Sesser', 'esesser3@ucla.edu', 4, 'AEEKeFh8Cmsu', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(11, 'Laverna', 'Kiellor', 'lkiellor4@zimbio.com', 4, '7hQzLaz', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(12, 'Gregoor', 'Chaundy', 'gchaundy5@sakura.ne.jp', 5, '4vM5VVT9MH', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(13, 'Merilee', 'de Mendoza', 'mdemendoza6@wordpress.org', 4, '0h6XgG5nXB', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(14, 'Karole', 'Dunkerly', 'kdunkerly7@paginegialle.it', 5, 'njtNWTAsGcV', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(15, 'Aymer', 'Jorcke', 'ajorcke8@spotify.com', 5, 'wEFM95e', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(16, 'Wash', 'Eastop', 'weastop9@hao123.com', 3, '1ArxEpjdYRu', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(17, 'Jorey', 'Dary', 'jdarya@gov.uk', 5, '2jfWyG0Ua', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(18, 'Mickey', 'Stollen', 'mstollenb@reverbnation.com', 5, 'BEs44lOSQNC', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(19, 'Frederigo', 'Aindrais', 'faindraisc@google.it', 4, 'YQRT8NU', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(20, 'Sonny', 'Seeman', 'sseemand@google.co.jp', 5, 'vcLm8V', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(21, 'Rahel', 'Giscken', 'rgisckene@rediff.com', 3, '3IL6OM9', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(22, 'Tony', 'Soprano', 'tboornef@newsvine.com', 5, 'Z7qcu0fmL7', '2020-01-10 11:27:28', '2020-01-09 15:16:04', NULL),
(23, 'Garald', 'Rusk', 'gruskg@disqus.com', 4, '9ZFcyH0Lt', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(24, 'Isis', 'Thirkettle', 'ithirkettleh@google.de', 3, 'Cn19NNijD6', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(25, 'Natassia', 'Ciubutaro', 'nciubutaroi@arstechnica.com', 5, 'GrTb16c', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(26, 'Naomi', 'Gauford', 'ngaufordj@freewebs.com', 4, 'HMKsKw4EIia', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(27, 'Jarret', 'Netti', 'jnettik@people.com.cn', 5, 'vVfuixAG', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(28, 'Wallache', 'Coling', 'wcolingl@indiatimes.com', 4, 'buUeiC', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(29, 'Frayda', 'Gutierrez', 'fgutierrezm@taobao.com', 3, 'x7XeRISmEw', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(30, 'Brigitta', 'Millett', 'bmillettn@cnn.com', 3, '0FGE3TQ', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(31, 'Francklyn', 'Fredson', 'ffredsono@cnet.com', 4, 'TJfo15crqE', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(32, 'Vodopad', 'Hilldrop', 'lhilldropp@prnewswire.com', 3, 'T0tsZQ5L', '2020-01-10 11:13:22', '2020-01-09 15:16:04', NULL),
(33, 'Flory', 'Quilkin', 'fquilkinq@nbcnews.com', 4, 'eyhzFvfWeFd', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(34, 'Galina', 'Klausewitz', 'gklausewitzr@liveinternet.ru', 5, 'mfxyXd', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(35, 'Filippa', 'Bresnen', 'fbresnens@youtube.com', 3, 'jzYpyrdEok', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(36, 'Pollyanna', 'Knightley', 'pknightleyt@japanpost.jp', 5, 'Az5TJaR75', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(37, 'Elinor', 'Haylands', 'ehaylandsu@state.tx.us', 3, '5QiePoM', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(38, 'Mickey', 'Hallam', 'mhallamv@weibo.com', 4, 'ezRNf2md', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(39, 'Bird', 'Fidele', 'bfidelew@vkontakte.ru', 3, 'GnXPxfB', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(40, 'Minnnie', 'Glasby', 'mglasbyx@linkedin.com', 5, '5lnBDmB', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(41, 'Obadias', 'Kitchiner', 'okitchinery@patch.com', 4, 'CNuzuW', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(42, 'Alice', 'Thurley', 'athurleyz@army.mil', 4, 'dLPE4YnZy7Ag', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(43, 'Rand', 'Lomax', 'rlomax10@themeforest.net', 5, 'nZCmbJ1RfW', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(44, 'Hamid', 'Kensit', 'hkensit11@naver.com', 3, '9qcok7', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(45, 'Mallissa', 'Ogelsby', 'mogelsby12@google.ca', 4, 'yp5ctn', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(46, 'Jecho', 'Duthie', 'jduthie13@edublogs.org', 5, 'Ask2OZ9Zgyi0', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(47, 'Zaccaria', 'Rawstorn', 'zrawstorn14@china.com.cn', 5, 'U90m4ACxQ', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(48, 'Giovanna', 'Legat', 'glegat15@sitemeter.com', 3, 'E6Zzj6EJVphF', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(49, 'Agnes', 'Wroughton', 'awroughton16@tuttocitta.it', 4, 'mOeE4E7U', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(50, 'Helen-elizabeth', 'Lambersen', 'hlambersen17@woothemes.com', 3, '5dqCiunn', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(51, 'Gusti', 'Sok', 'gamesbury18@globo.com', 3, 'hUyhxoAP1', '2020-01-10 11:24:03', '2020-01-09 15:16:04', NULL),
(52, 'Karole', 'Adderson', 'kadderson19@topsy.com', 4, 'j6T9t9UdDDY1', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(53, 'Opaline', 'Meadway', 'omeadway1a@deliciousdays.com', 4, '8t8V8x4', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(54, 'Brena', 'Hallan', 'bhallan1b@naver.com', 5, 'NVKEgbLgL', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(55, 'Tawnya', 'O\' Markey', 'tomarkey1c@wikia.com', 4, 'w06eAwAaL', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(56, 'Worthington', 'Gynn', 'wgynn1d@clickbank.net', 5, '63ESBtM1', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(57, 'Rick', 'Scheffel', 'rscheffel1e@hibu.com', 4, 's2RA5KGl7qV', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(58, 'Ardath', 'McMillan', 'amcmillan1f@cam.ac.uk', 3, 'ULUYlXAi', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(59, 'Cosmo', 'Metcalfe', 'cmetcalfe1g@pen.io', 4, 'hXWZc8g5qFJ', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(60, 'Myles', 'Haddy', 'mhaddy1h@jigsy.com', 3, 'iW4LVBy', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(61, 'Kamilah', 'Fynes', 'kfynes1i@alexa.com', 4, 'ULRAuKh10c', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(62, 'Ilsa', 'Bawden', 'ibawden1j@sphinn.com', 4, 'W6SlCp5', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(63, 'Nonnah', 'Lucks', 'nlucks1k@jiathis.com', 3, 'ZHpU0juL2gAV', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(64, 'Orelia', 'Aitchison', 'oaitchison1l@paypal.com', 3, 'bDKwXDt6', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(65, 'Obadiah', 'Medlen', 'omedlen1m@newsvine.com', 5, '0GsFejRDJ', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(66, 'Jeffrey', 'Balkwill', 'jbalkwill1n@comcast.net', 5, 'uA5zs6qnO', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(67, 'Pearle', 'Ealles', 'pealles1o@wiley.com', 5, 'DK9WilAUzv2c', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(68, 'Cheri', 'Classic', 'cmeake1p@webnode.com', 3, 'fPLQf6VlP', '2020-01-10 11:25:55', '2020-01-09 15:16:04', NULL),
(69, 'Franklin', 'Baldin', 'fbaldin1q@sourceforge.net', 5, 'wpVCuG', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(70, 'Ines', 'Delves', 'idelves1r@bravesites.com', 5, 'dxT0JaPpOD8', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(71, 'Osgood', 'Osbad', 'okelso1s@tmall.com', 4, 'BMFYGfzEgX1D', '2020-01-10 11:26:54', '2020-01-09 15:16:04', NULL),
(72, 'Clarence', 'Maydway', 'cmaydway1t@baidu.com', 5, 'PPl1tjw6', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(73, 'Catina', 'Quested', 'cquested1u@mysql.com', 5, '8CkRAA0oaS', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(74, 'Jess', 'Semkins', 'jsemkins1v@cbc.ca', 3, 'K6TA2KiEk', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(75, 'Enid', 'Truin', 'etruin1w@phpbb.com', 4, '4DSN10sB', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(76, 'Danie', 'Wearne', 'dwearne1x@kickstarter.com', 5, 'sgzXMl7f', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(77, 'Maegan', 'Done', 'mdone1y@wikia.com', 4, 'goErrRZJ', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(78, 'Luise', 'Tardiff', 'ltardiff1z@barnesandnoble.com', 4, 'KXtCS0', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(79, 'Dedie', 'Springtorpe', 'dspringtorpe20@hostgator.com', 3, 'AcM8IH', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(80, 'Northrup', 'Barnby', 'nbarnby21@hp.com', 5, 'OT0LOHh', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(81, 'Bellina', 'Fosdike', 'bfosdike22@stanford.edu', 4, 'nu1t8tVWOBc', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(82, 'Edvard', 'Pittock', 'epittock23@instagram.com', 5, 'FX6dG3XDJPP', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(83, 'Katerina', 'Ambrosini', 'kambrosini24@e-recht24.de', 4, 'Rack9y0n9W', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(84, 'Bear', 'Medved', 'bdobson25@blogspot.com', 3, 'CInIx6xps4', '2020-01-10 11:36:05', '2020-01-09 15:16:04', NULL),
(85, 'Rodger', 'Ferre', 'rferre26@ehow.com', 4, 'fFAgmjL', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(86, 'Allen', 'Faulconer', 'afaulconer27@cdbaby.com', 3, '06sB5Jn', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(87, 'Luca', 'Catherick', 'lcatherick28@army.mil', 3, '2bKQ8tg1O', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(88, 'Myrtice', 'Stoak', 'mstoak29@earthlink.net', 3, 'clXr1C2ITBz', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(89, 'Arnuad', 'Craighead', 'acraighead2a@yahoo.co.jp', 5, 'oLXqjN', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(90, 'Dorotea', 'Teenan', 'dteenan2b@lycos.com', 3, 'SSVZXM7U5I0', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(91, 'Thatch', 'Soloway', 'tsoloway2c@bandcamp.com', 4, 'vLIrPWVdP', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(92, 'Garrek', 'Clemanceau', 'gclemanceau2d@themeforest.net', 5, '2G4wWYCLk', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(93, 'Gustave', 'Juza', 'gjuza2e@tuttocitta.it', 3, 'BXgSPI', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(94, 'Moselle', 'Itskovitz', 'mitskovitz2f@netlog.com', 4, 'EnQinvdvyE', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(95, 'Marleah', 'Dugget', 'mdugget2g@vk.com', 5, 'ApFIz3', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(96, 'Lita', 'Pendergrast', 'lpendergrast2h@nifty.com', 4, 'gtKQNJaqpJ', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(97, 'Rozanne', 'Wheeler', 'rwheeler2i@princeton.edu', 3, '9Su111wllA', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(98, 'Suzette', 'Benjafield', 'sbenjafield2j@nytimes.com', 4, 'aSGazFlwUwg', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(99, 'Mel', 'Cunney', 'mcunney2k@technorati.com', 4, 'He0JdnBxl', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(100, 'Mitchel', 'Kemmett', 'mkemmett2l@amazon.co.jp', 5, 'rZ8k1G7sF', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(101, 'Quill', 'McFadzean', 'qmcfadzean2m@zimbio.com', 5, 'yA2OH7O', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(102, 'Teddy', 'Dovington', 'tdovington2n@apache.org', 4, 'lMr5KF8', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(103, 'Elwood', 'Dudeney', 'edudeney2o@ehow.com', 4, 'k2uuFsn0', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(104, 'Toddie', 'Condict', 'tcondict2p@instagram.com', 4, 'o9n3G5s', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(105, 'Elmira', 'Leijs', 'eleijs2q@fastcompany.com', 5, '2FpyI1iUqfpD', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(106, 'Hart', 'Mazzia', 'hmazzia2r@bandcamp.com', 4, 'DznYXqL', '2020-01-09 15:16:04', '2020-01-09 15:16:04', NULL),
(108, 'Berkly', 'Bussen', 'bbussen0@cdc.gov', 5, 'apdxPD', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(109, 'Latashia', 'Aspenlon', 'laspenlon1@skyrock.com', 5, '9LGFm9RV3TTv', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(110, 'Milo', 'McCullouch', 'mmccullouch2@seesaa.net', 5, 'TxU3RLqgEP', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(111, 'Antonius', 'Goodridge', 'agoodridge3@fema.gov', 5, 'dyc95DYlm', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(112, 'Jolynn', 'Richmond', 'jrichmond4@walmart.com', 5, 'aIHlikuT4Lk', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(113, 'Amye', 'Pellew', 'apellew5@dagondesign.com', 5, 'YOp7juFZnUuv', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(114, 'Kristien', 'Orae', 'korae6@psu.edu', 5, 'oHsYy1I78yv', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(115, 'Jabez', 'Grayling', 'jgrayling7@bloglovin.com', 5, 'KNTblhMV9c', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(116, 'Cariotta', 'Verrillo', 'cverrillo8@blogtalkradio.com', 5, 'Zsj98C', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(117, 'Betty', 'Rowantree', 'browantree9@stumbleupon.com', 5, '2NExONipB38', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(118, 'Kary', 'Rigmond', 'krigmonda@ibm.com', 5, 'Gm0RTLcyW', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(119, 'Franz', 'Georgeau', 'fgeorgeaub@usda.gov', 5, 'OXXGIj', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(120, 'Alexina', 'Wardroper', 'awardroperc@ning.com', 5, 'DIhIPeKNUN', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(121, 'Emalia', 'Haliburn', 'ehaliburnd@slideshare.net', 5, 'OdYdEY1eCy', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(122, 'Garold', 'Behagg', 'gbehagge@fastcompany.com', 5, 'XfX08xKS3o', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(123, 'Lemmy', 'Brothers', 'lbrothersf@wp.com', 5, '14XCf8P', '2020-01-13 22:45:45', '2020-01-13 22:45:45', NULL),
(124, 'Nevil', 'Poytheras', 'npoytherasg@ustream.tv', 5, 'jPUdiioSO1', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(125, 'Garrek', 'Vedenichev', 'gvedenichevh@infoseek.co.jp', 5, 'mbzLdlGLc', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(126, 'Washington', 'Lockton', 'wlocktoni@google.pl', 5, 'WzBT0gatEI', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(127, 'Maxie', 'MacRury', 'mmacruryj@pagesperso-orange.fr', 5, 'wZdhZ0t', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(128, 'Nesta', 'Russe', 'nrussek@delicious.com', 5, 'fAAM3j', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(129, 'Aurelia', 'Pawley', 'apawleyl@goodreads.com', 5, 'Kvm4JEDqf', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(130, 'Archibaldo', 'Giottoi', 'agiottoim@goodreads.com', 5, 'oD3BYZZ', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(131, 'Alwin', 'Harmant', 'aharmantn@miibeian.gov.cn', 5, 'EL1kuwQl5db', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(132, 'Bernelle', 'Collen', 'bcolleno@hc360.com', 5, 'eMlq4LO', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(133, 'Trev', 'Tingly', 'ttinglyp@jimdo.com', 5, 'ph7S29R0', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(134, 'Juliette', 'Jephcote', 'jjephcoteq@cam.ac.uk', 5, 'd0AJaib1G', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(135, 'Selia', 'Audritt', 'saudrittr@studiopress.com', 5, '90bWdjj8XlJi', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(136, 'Alexio', 'Offner', 'aoffners@over-blog.com', 5, '1bnciM7R63VK', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(137, 'Sheelah', 'Wyer', 'swyert@netscape.com', 5, 'KCXPhTXG', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(138, 'Lizzie', 'Appleyard', 'lappleyardu@ezinearticles.com', 5, 'nqVu3F75LkR', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(139, 'Doti', 'Fronczak', 'dfronczakv@shutterfly.com', 5, 'f0SyeLyFW9Qu', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(140, 'Marlene', 'Hembling', 'mhemblingw@quantcast.com', 5, 'K5Et4ncrmj', '2020-01-13 22:45:46', '2020-01-13 22:45:46', NULL),
(141, 'Giovanna', 'McDonald', 'gmcdonaldx@uol.com.br', 5, 'UdTINjx', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(142, 'Kerr', 'Tilbey', 'ktilbeyy@acquirethisname.com', 5, 'Tq9wPNx', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(143, 'Chane', 'Joy', 'cjoyz@opensource.org', 5, 'GS4Lgp', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(144, 'Fabe', 'Frenchum', 'ffrenchum10@vinaora.com', 5, '4X3q2AUWhxYJ', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(145, 'Vivyanne', 'Kelsall', 'vkelsall11@prlog.org', 5, 'Gi7co57', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(146, 'Quentin', 'Feakins', 'qfeakins12@linkedin.com', 5, 'jamkHEk3y7ZA', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(147, 'Baily', 'Colgrave', 'bcolgrave13@plala.or.jp', 5, 'qLGMAwpX3', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(148, 'Olvan', 'Trainer', 'otrainer14@pen.io', 5, 'ErQ1ZPXO9Ld', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(149, 'Davidde', 'Runge', 'drunge15@uol.com.br', 5, 'PjqUMh1D7X', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(150, 'Krissy', 'Pomphrey', 'kpomphrey16@tripadvisor.com', 5, 'QnU6wkp15', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(151, 'Fair', 'Hazeley', 'fhazeley17@people.com.cn', 5, 'TIRvT7IeDg', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(152, 'Fania', 'Hawkswell', 'fhawkswell18@businessinsider.com', 5, 'lUv8X07', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(153, 'Cyrus', 'Speeks', 'cspeeks19@huffingtonpost.com', 5, 'QqfL8b4NzL', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(154, 'Coral', 'McNae', 'cmcnae1a@cornell.edu', 5, 'EOi4ocXCKg', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(155, 'Patrice', 'Brabin', 'pbrabin1b@wikimedia.org', 5, 'T6yJwi', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(156, 'Fredericka', 'Koche', 'fkoche1c@spiegel.de', 5, 'pUeVJd7UBtRh', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(157, 'Martelle', 'Jakab', 'mjakab1d@thetimes.co.uk', 5, 'xAXX3IZ6k', '2020-01-13 22:45:47', '2020-01-13 22:45:47', NULL),
(158, 'Sheila', 'Cossey', 'scossey1e@discovery.com', 5, '3KQAtr', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(159, 'Adeline', 'Dudney', 'adudney1f@wiley.com', 5, 'sl33gYkaFTr', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(160, 'Leisha', 'Zamboniari', 'lzamboniari1g@imgur.com', 5, 'XXtKs5tujs', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(161, 'Bernadine', 'Cornau', 'bcornau1h@elpais.com', 5, 'JLGQyi', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(162, 'Hermine', 'Lehrahan', 'hlehrahan1i@wsj.com', 5, '3UWs4JN1SwTj', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(163, 'Oralie', 'MacTrustey', 'omactrustey1j@google.com', 5, 'XPpYZaJ5mkh', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(164, 'Dawn', 'Genthner', 'dgenthner1k@amazon.com', 5, 'zy8XqXRUYxZT', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(165, 'Ruperto', 'Gravie', 'rgravie1l@squarespace.com', 5, 'vcNlpxMS50', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(166, 'Giles', 'Kures', 'gkures1m@cargocollective.com', 5, 'LLS4e22mSb3', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(167, 'Cooper', 'Wathan', 'cwathan1n@cbsnews.com', 5, 'Z0sofw4hAn1', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(168, 'Mercedes', 'Dougher', 'mdougher1o@thetimes.co.uk', 5, 'Y5SHJk', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(169, 'Giffie', 'Halson', 'ghalson1p@infoseek.co.jp', 5, 'R6LRURmKavKI', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(170, 'Norina', 'Kingdon', 'nkingdon1q@nationalgeographic.com', 5, 'WfTiIwXtigwz', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(171, 'Shelley', 'Cottam', 'scottam1r@discovery.com', 5, 'dYmuAC2', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(172, 'Dinnie', 'Croose', 'dcroose1s@bizjournals.com', 5, 'ddK7An6zM', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(173, 'Kaitlynn', 'Jukubczak', 'kjukubczak1t@cnet.com', 5, '8MgsoV20g', '2020-01-13 22:45:48', '2020-01-13 22:45:48', NULL),
(174, 'Therine', 'Minchell', 'tminchell1u@meetup.com', 5, 'CPvGQc', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(175, 'Zora', 'Stollhofer', 'zstollhofer1v@liveinternet.ru', 5, 'yJ5i5NlFEi', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(176, 'Deanna', 'Hasnip', 'dhasnip1w@cocolog-nifty.com', 5, 'tfVes6sKTp', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(177, 'Parnell', 'Lovegrove', 'plovegrove1x@nhs.uk', 5, 'W64a5Z', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(178, 'Trstram', 'Thyer', 'tthyer1y@friendfeed.com', 5, '3HlaxipY3D4', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(179, 'Karim', 'Robins', 'krobins1z@domainmarket.com', 5, 'YkDHzt', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(180, 'Loree', 'Fairnington', 'lfairnington20@51.la', 5, '0BG9df7E7', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(181, 'Willow', 'Delahunty', 'wdelahunty21@thetimes.co.uk', 5, 'tN8FrQ', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(182, 'Jerrilee', 'Clewett', 'jclewett22@ask.com', 5, 'SUO9j3ebtyrh', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(183, 'Kelley', 'Flaherty', 'kflaherty23@marriott.com', 5, '8zJGV6KG', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(184, 'Emelyne', 'Aristide', 'earistide24@baidu.com', 5, 'FnknkxANMo', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(185, 'Ericka', 'Wychard', 'ewychard25@merriam-webster.com', 5, 'cul3L13tqow', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(186, 'Ruthie', 'Percy', 'rpercy26@ifeng.com', 5, 'DGwsJCR', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(187, 'Casie', 'Tockell', 'ctockell27@is.gd', 5, 'UBF0Zr1Nt5', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(188, 'Amble', 'Callan', 'acallan28@bandcamp.com', 5, 'foMZRj', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(189, 'Raffarty', 'Jodlkowski', 'rjodlkowski29@netlog.com', 5, 'rH8U6vLD0F', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(190, 'Fredericka', 'Jefferys', 'fjefferys2a@senate.gov', 5, 'bcZzl2O', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(191, 'Debbi', 'Ceci', 'dceci2b@princeton.edu', 5, 'Orz4bd6Dx44N', '2020-01-13 22:45:49', '2020-01-13 22:45:49', NULL),
(192, 'Hort', 'Kubecka', 'hkubecka2c@ycombinator.com', 5, 'Ikwr5qgKLB', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(193, 'Janith', 'Calafate', 'jcalafate2d@pen.io', 5, '7S55Np17fej', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(194, 'Gerardo', 'Quartermain', 'gquartermain2e@tumblr.com', 5, 'JkKvK2nHUBT', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(195, 'Silvio', 'Crinidge', 'scrinidge2f@bandcamp.com', 5, 'BFAcEd', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(196, 'Richie', 'Jodlowski', 'rjodlowski2g@nymag.com', 5, 'HY0BtmT4M6', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(197, 'Eustace', 'Burtwell', 'eburtwell2h@howstuffworks.com', 5, '98gcDyFIfAe', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(198, 'Corabella', 'Dahlen', 'cdahlen2i@histats.com', 5, '7PMzHdE5bJJ', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(199, 'Edgar', 'Bengal', 'ebengal2j@squarespace.com', 5, 'hizG1gejg8pJ', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(200, 'Stearne', 'Gloves', 'sgloves2k@squidoo.com', 5, 't7AwJo2SFQ', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(201, 'Nani', 'Casbourne', 'ncasbourne2l@webnode.com', 5, 'XG1iZUNYs2Y', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(202, 'Lorene', 'Stegell', 'lstegell2m@xing.com', 5, 'Bf36oPC4F1GE', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(203, 'Karin', 'Ruttgers', 'kruttgers2n@bbb.org', 5, 'C4Rpk53YN', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(204, 'Ammamaria', 'Langlois', 'alanglois2o@redcross.org', 5, 'HF44OybJq', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(205, 'Rosana', 'Lindley', 'rlindley2p@surveymonkey.com', 5, 'HqYZZEm', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(206, 'Carry', 'Gounel', 'cgounel2q@bandcamp.com', 5, '1bh0v2K', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(207, 'Fawnia', 'Monteath', 'fmonteath2r@ocn.ne.jp', 5, 'FqBoCG', '2020-01-13 22:45:50', '2020-01-13 22:45:50', NULL),
(208, 'Tommie', 'Fellibrand', 'tfellibrand2s@archive.org', 5, '6nfKXNn', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(209, 'Tim', 'Davidov', 'tdavidov2t@adobe.com', 5, 'lgk99BgRoyi', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(210, 'Ferrel', 'Mickelwright', 'fmickelwright2u@simplemachines.org', 5, 'd0ZslrAdi', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(211, 'Zola', 'Bohea', 'zbohea2v@desdev.cn', 5, 'q0GPK5KY6m4C', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(212, 'Jeramie', 'Dreghorn', 'jdreghorn2w@globo.com', 5, 'pGtd8DivkTa', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(213, 'Karim', 'Bompas', 'kbompas2x@wp.com', 5, 'GMuEF5e', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(214, 'Carlynne', 'Sandever', 'csandever2y@angelfire.com', 5, '6f3NS2Mz', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(215, 'Rowen', 'Petran', 'rpetran2z@google.cn', 5, 'khpss9', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(216, 'Wiatt', 'Juliano', 'wjuliano30@about.me', 5, 'rrBzFzC5JJoh', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(217, 'Tawnya', 'Schindler', 'tschindler31@people.com.cn', 5, 'dJCCSM', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(218, 'Hollyanne', 'Oliveira', 'holiveira32@indiatimes.com', 5, 'LhGBaoBBZ', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(219, 'Ruprecht', 'Pennell', 'rpennell33@mtv.com', 5, 'C0zRwbwlzgk', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(220, 'Chucho', 'Skillington', 'cskillington34@dropbox.com', 5, 'ftkzB8wmsY6B', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(221, 'Hamlen', 'Sindall', 'hsindall35@gravatar.com', 5, '8Fgm6ck9SGzP', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(222, 'Wenda', 'Extill', 'wextill36@java.com', 5, 'JVAaXLySIx', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(223, 'Elwood', 'Leete', 'eleete37@home.pl', 5, 'NQcP7Ni2B', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(224, 'Cassandre', 'Davidowich', 'cdavidowich38@delicious.com', 5, '7oqfTgH', '2020-01-13 22:45:51', '2020-01-13 22:45:51', NULL),
(225, 'Giordano', 'Tixier', 'gtixier39@smugmug.com', 5, 'Um9pew7M', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(226, 'Nonah', 'Scahill', 'nscahill3a@craigslist.org', 5, 'ZDBeQ4zog6eN', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(227, 'Cherry', 'Eastes', 'ceastes3b@eventbrite.com', 5, 'B4bt2X', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(228, 'Suzann', 'Woodburne', 'swoodburne3c@wikia.com', 5, 'p3s8JPwjlM2', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(229, 'Lu', 'Moodie', 'lmoodie3d@wired.com', 5, 'DLA7pJQ1brR', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(230, 'Dorita', 'Paybody', 'dpaybody3e@webnode.com', 5, 'rrrELu', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(231, 'Sam', 'Smithen', 'ssmithen3f@aol.com', 5, 'H1h8WIaW15', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(232, 'Beaufort', 'Ebrall', 'bebrall3g@abc.net.au', 5, 'TnEyD3tr3Ytu', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(233, 'Isabeau', 'Yesipov', 'iyesipov3h@bloglines.com', 5, 'pa5QxTgYr2e4', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(234, 'Dulsea', 'Belmont', 'dbelmont3i@g.co', 5, '32kJ9ZjxsqF', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(235, 'Jacenta', 'Pingstone', 'jpingstone3j@sogou.com', 5, 'WhDCpzP', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(236, 'Shelly', 'Verrall', 'sverrall3k@microsoft.com', 5, 'zZpw7ETYLnlh', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(237, 'Alfi', 'Popley', 'apopley3l@lycos.com', 5, '2f4UkG', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(238, 'Giuseppe', 'Drabble', 'gdrabble3m@europa.eu', 5, 'JhZOO8iMeGUP', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(239, 'Crissy', 'Josowitz', 'cjosowitz3n@squidoo.com', 5, '9HUuHao2', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(240, 'Linea', 'Skillen', 'lskillen3o@mysql.com', 5, 'g7elTNTeB14', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(241, 'Audre', 'Tod', 'atod3p@photobucket.com', 5, 'pUKhnf', '2020-01-13 22:45:52', '2020-01-13 22:45:52', NULL),
(242, 'Clarence', 'Spedroni', 'cspedroni3q@aboutads.info', 5, 'SwEtdX', '2020-01-13 22:45:53', '2020-01-13 22:45:53', NULL),
(243, 'Westley', 'O\'Roan', 'woroan3r@bandcamp.com', 5, 'd37wEokX5', '2020-01-13 22:45:53', '2020-01-13 22:45:53', NULL),
(244, 'Sena', 'Mault', 'smault3s@samsung.com', 5, '5jIh9zf345J', '2020-01-13 22:45:53', '2020-01-13 22:45:53', NULL),
(247, 'Marija', 'Stepanov', 'marija@gmail.com', 5, 'marija', '2020-01-16 16:52:52', '2020-01-16 16:52:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE IF NOT EXISTS `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `title`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_schedules_id` FOREIGN KEY (`schedules_id`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `fk_attendance_students_id` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `fk_certificates_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grades_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `fk_grades_users1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lecturer_subject`
--
ALTER TABLE `lecturer_subject`
  ADD CONSTRAINT `lecturer_subject_ibfk_1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lecturer_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `from_fk` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `to_fk` FOREIGN KEY (`to`) REFERENCES `users` (`id`);

--
-- Constraints for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `role_menu`
--
ALTER TABLE `role_menu`
  ADD CONSTRAINT `menu_id_fk_idx` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  ADD CONSTRAINT `role_id_fk_idx` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedules_semestars1` FOREIGN KEY (`semestar_id`) REFERENCES `semestars` (`id`),
  ADD CONSTRAINT `fk_schedules_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`),
  ADD CONSTRAINT `fk_schedules_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`),
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
  ADD CONSTRAINT `main_teacher_id_fk` FOREIGN KEY (`main_teacher_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `subgroup_id_fk` FOREIGN KEY (`subgroup_id`) REFERENCES `subgroups` (`id`),
  ADD CONSTRAINT `year_id_fk` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_classes_users1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
