-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 08, 2020 at 11:27 AM
-- Server version: 8.0.18
-- PHP Version: 7.0.23

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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `semestar` enum('1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `grades` (`id`, `grade`, `semestar`, `closing`, `student_id`, `lecturer_id`) VALUES
(1, 3, '1', b'0', 1, 4),
(2, 5, '2', b'0', 1, 4),
(3, 4, '2', b'1', 1, 4);

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
(10, 'users', '#'),
(11, 'subjects', '#'),
(12, 'student groups', '#'),
(13, 'schedules', '#'),
(14, 'notifications', '#'),
(15, 'students', '#'),
(16, 'statistic', '#'),
(18, 'grades', '#'),
(19, 'open door', '#'),
(20, 'messages', '#'),
(21, 'notifications', '#'),
(22, 'diary', '#'),
(23, 'certificates', '#'),
(24, 'schedules', '#');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('message','notification') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `parent_student`
--

INSERT INTO `parent_student` (`id`, `parent_id`, `student_id`) VALUES
(1, 6, 1),
(2, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

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
(36, 'attendance_d');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  KEY `fk_role_menu_roles1_idx` (`menu_id`),
  KEY `fk_role_menu_menu1_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_menu`
--

INSERT INTO `role_menu` (`id`, `menu_id`, `role_id`) VALUES
(1, 18, 5),
(2, 19, 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `access`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, NULL),
(3, 1, 3, NULL),
(4, 1, 4, NULL),
(5, 1, 5, NULL),
(6, 1, 6, NULL),
(7, 1, 7, NULL),
(8, 1, 8, NULL),
(9, 1, 9, NULL),
(10, 1, 10, NULL),
(11, 1, 11, NULL),
(12, 1, 12, NULL),
(13, 1, 13, NULL),
(14, 1, 14, NULL),
(15, 1, 15, NULL),
(16, 1, 16, NULL),
(17, 1, 17, NULL),
(18, 1, 18, NULL),
(19, 1, 19, NULL),
(20, 1, 20, NULL),
(21, 1, 21, NULL),
(22, 1, 22, NULL),
(23, 1, 23, NULL),
(24, 1, 24, NULL),
(25, 1, 25, NULL),
(26, 1, 26, NULL),
(27, 1, 27, NULL),
(28, 1, 28, NULL),
(29, 1, 29, NULL),
(30, 1, 30, NULL),
(31, 1, 31, NULL),
(32, 1, 32, NULL),
(33, 1, 33, NULL),
(34, 1, 34, NULL),
(35, 1, 35, NULL),
(36, 1, 36, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
CREATE TABLE IF NOT EXISTS `schedules` (
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
  KEY `fk_schedules_semestars1_idx` (`semestar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `semestars`
--

DROP TABLE IF EXISTS `semestars`;
CREATE TABLE IF NOT EXISTS `semestars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `part_of_semestar` enum('1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `social_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_group_id_fk_idx` (`student_group_id`),
  KEY `student_group_fk_id_idx` (`student_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `date_of_birth`, `social_id`, `student_group_id`) VALUES
(1, 'Luka', 'Topalovic', '1998-12-03', 123456789, 1),
(2, 'Djura', 'Kelj', '2020-01-20', 123456789, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

DROP TABLE IF EXISTS `student_group`;
CREATE TABLE IF NOT EXISTS `student_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_year` year(4) NOT NULL,
  `finish_year` year(4) NOT NULL,
  `main_teacher_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_group_subgroups1_idx` (`subgroup_id`),
  KEY `fk_student_group_users1_idx` (`main_teacher_id`),
  KEY `year_id_fk_idx` (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`id`, `start_year`, `finish_year`, `main_teacher_id`, `subgroup_id`, `year_id`) VALUES
(1, 2012, 2020, 4, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `subgroups`
--

DROP TABLE IF EXISTS `subgroups`;
CREATE TABLE IF NOT EXISTS `subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `subgroups`
--

INSERT INTO `subgroups` (`id`, `title`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_classes_users1_idx` (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `role_id`, `password`, `last_login_at`) VALUES
(2, 'pera', 'peric', 'pera@peric.com', 1, 'pera', NULL),
(3, 'mira', 'miric', 'mira@miric.com', 2, 'mira', NULL),
(4, 'ana', 'anic', 'ana@anic.com', 3, 'ana', NULL),
(5, 'luka', 'lukic', 'luka@lukic.com', 4, 'luka', NULL),
(6, 'dejan', 'dekic', 'dejan@dekic.com', 5, 'dejan', NULL),
(7, 'Valentine', 'Speenden', 'vspeenden0@home.pl', 3, 'duamXprgXad', NULL),
(8, 'Courtney', 'Husthwaite', 'chusthwaite1@marketwatch.com', 5, 'JQBmpE', NULL),
(9, 'Olin', 'Willows', 'owillows2@soup.io', 3, 'B3gwvx6VX7Q', NULL),
(10, 'Elly', 'Sesser', 'esesser3@ucla.edu', 4, 'AEEKeFh8Cmsu', NULL),
(11, 'Laverna', 'Kiellor', 'lkiellor4@zimbio.com', 4, '7hQzLaz', NULL),
(12, 'Gregoor', 'Chaundy', 'gchaundy5@sakura.ne.jp', 5, '4vM5VVT9MH', NULL),
(13, 'Merilee', 'de Mendoza', 'mdemendoza6@wordpress.org', 4, '0h6XgG5nXB', NULL),
(14, 'Karole', 'Dunkerly', 'kdunkerly7@paginegialle.it', 5, 'njtNWTAsGcV', NULL),
(15, 'Aymer', 'Jorcke', 'ajorcke8@spotify.com', 5, 'wEFM95e', NULL),
(16, 'Wash', 'Eastop', 'weastop9@hao123.com', 3, '1ArxEpjdYRu', NULL),
(17, 'Jorey', 'Dary', 'jdarya@gov.uk', 5, '2jfWyG0Ua', NULL),
(18, 'Mickey', 'Stollen', 'mstollenb@reverbnation.com', 5, 'BEs44lOSQNC', NULL),
(19, 'Frederigo', 'Aindrais', 'faindraisc@google.it', 4, 'YQRT8NU', NULL),
(20, 'Sonny', 'Seeman', 'sseemand@google.co.jp', 5, 'vcLm8V', NULL),
(21, 'Rahel', 'Giscken', 'rgisckene@rediff.com', 3, '3IL6OM9', NULL),
(22, 'Tony', 'Boorne', 'tboornef@newsvine.com', 5, 'Z7qcu0fmL7', NULL),
(23, 'Garald', 'Rusk', 'gruskg@disqus.com', 4, '9ZFcyH0Lt', NULL),
(24, 'Isis', 'Thirkettle', 'ithirkettleh@google.de', 3, 'Cn19NNijD6', NULL),
(25, 'Natassia', 'Ciubutaro', 'nciubutaroi@arstechnica.com', 5, 'GrTb16c', NULL),
(26, 'Naomi', 'Gauford', 'ngaufordj@freewebs.com', 4, 'HMKsKw4EIia', NULL),
(27, 'Jarret', 'Netti', 'jnettik@people.com.cn', 5, 'vVfuixAG', NULL),
(28, 'Wallache', 'Coling', 'wcolingl@indiatimes.com', 4, 'buUeiC', NULL),
(29, 'Frayda', 'Gutierrez', 'fgutierrezm@taobao.com', 3, 'x7XeRISmEw', NULL),
(30, 'Brigitta', 'Millett', 'bmillettn@cnn.com', 3, '0FGE3TQ', NULL),
(31, 'Francklyn', 'Fredson', 'ffredsono@cnet.com', 4, 'TJfo15crqE', NULL),
(32, 'Lynnett', 'Hilldrop', 'lhilldropp@prnewswire.com', 3, 'T0tsZQ5L', NULL),
(33, 'Flory', 'Quilkin', 'fquilkinq@nbcnews.com', 4, 'eyhzFvfWeFd', NULL),
(34, 'Galina', 'Klausewitz', 'gklausewitzr@liveinternet.ru', 5, 'mfxyXd', NULL),
(35, 'Filippa', 'Bresnen', 'fbresnens@youtube.com', 3, 'jzYpyrdEok', NULL),
(36, 'Pollyanna', 'Knightley', 'pknightleyt@japanpost.jp', 5, 'Az5TJaR75', NULL),
(37, 'Elinor', 'Haylands', 'ehaylandsu@state.tx.us', 3, '5QiePoM', NULL),
(38, 'Mickey', 'Hallam', 'mhallamv@weibo.com', 4, 'ezRNf2md', NULL),
(39, 'Bird', 'Fidele', 'bfidelew@vkontakte.ru', 3, 'GnXPxfB', NULL),
(40, 'Minnnie', 'Glasby', 'mglasbyx@linkedin.com', 5, '5lnBDmB', NULL),
(41, 'Obadias', 'Kitchiner', 'okitchinery@patch.com', 4, 'CNuzuW', NULL),
(42, 'Alice', 'Thurley', 'athurleyz@army.mil', 4, 'dLPE4YnZy7Ag', NULL),
(43, 'Rand', 'Lomax', 'rlomax10@themeforest.net', 5, 'nZCmbJ1RfW', NULL),
(44, 'Hamid', 'Kensit', 'hkensit11@naver.com', 3, '9qcok7', NULL),
(45, 'Mallissa', 'Ogelsby', 'mogelsby12@google.ca', 4, 'yp5ctn', NULL),
(46, 'Jecho', 'Duthie', 'jduthie13@edublogs.org', 5, 'Ask2OZ9Zgyi0', NULL),
(47, 'Zaccaria', 'Rawstorn', 'zrawstorn14@china.com.cn', 5, 'U90m4ACxQ', NULL),
(48, 'Giovanna', 'Legat', 'glegat15@sitemeter.com', 3, 'E6Zzj6EJVphF', NULL),
(49, 'Agnes', 'Wroughton', 'awroughton16@tuttocitta.it', 4, 'mOeE4E7U', NULL),
(50, 'Helen-elizabeth', 'Lambersen', 'hlambersen17@woothemes.com', 3, '5dqCiunn', NULL),
(51, 'Gusti', 'Amesbury', 'gamesbury18@globo.com', 3, 'hUyhxoAP1', NULL),
(52, 'Karole', 'Adderson', 'kadderson19@topsy.com', 4, 'j6T9t9UdDDY1', NULL),
(53, 'Opaline', 'Meadway', 'omeadway1a@deliciousdays.com', 4, '8t8V8x4', NULL),
(54, 'Brena', 'Hallan', 'bhallan1b@naver.com', 5, 'NVKEgbLgL', NULL),
(55, 'Tawnya', 'O\' Markey', 'tomarkey1c@wikia.com', 4, 'w06eAwAaL', NULL),
(56, 'Worthington', 'Gynn', 'wgynn1d@clickbank.net', 5, '63ESBtM1', NULL),
(57, 'Rick', 'Scheffel', 'rscheffel1e@hibu.com', 4, 's2RA5KGl7qV', NULL),
(58, 'Ardath', 'McMillan', 'amcmillan1f@cam.ac.uk', 3, 'ULUYlXAi', NULL),
(59, 'Cosmo', 'Metcalfe', 'cmetcalfe1g@pen.io', 4, 'hXWZc8g5qFJ', NULL),
(60, 'Myles', 'Haddy', 'mhaddy1h@jigsy.com', 3, 'iW4LVBy', NULL),
(61, 'Kamilah', 'Fynes', 'kfynes1i@alexa.com', 4, 'ULRAuKh10c', NULL),
(62, 'Ilsa', 'Bawden', 'ibawden1j@sphinn.com', 4, 'W6SlCp5', NULL),
(63, 'Nonnah', 'Lucks', 'nlucks1k@jiathis.com', 3, 'ZHpU0juL2gAV', NULL),
(64, 'Orelia', 'Aitchison', 'oaitchison1l@paypal.com', 3, 'bDKwXDt6', NULL),
(65, 'Obadiah', 'Medlen', 'omedlen1m@newsvine.com', 5, '0GsFejRDJ', NULL),
(66, 'Jeffrey', 'Balkwill', 'jbalkwill1n@comcast.net', 5, 'uA5zs6qnO', NULL),
(67, 'Pearle', 'Ealles', 'pealles1o@wiley.com', 5, 'DK9WilAUzv2c', NULL),
(68, 'Cheri', 'Meake', 'cmeake1p@webnode.com', 3, 'fPLQf6VlP', NULL),
(69, 'Franklin', 'Baldin', 'fbaldin1q@sourceforge.net', 5, 'wpVCuG', NULL),
(70, 'Ines', 'Delves', 'idelves1r@bravesites.com', 5, 'dxT0JaPpOD8', NULL),
(71, 'Osgood', 'Kelso', 'okelso1s@tmall.com', 4, 'BMFYGfzEgX1D', NULL),
(72, 'Clarence', 'Maydway', 'cmaydway1t@baidu.com', 5, 'PPl1tjw6', NULL),
(73, 'Catina', 'Quested', 'cquested1u@mysql.com', 5, '8CkRAA0oaS', NULL),
(74, 'Jess', 'Semkins', 'jsemkins1v@cbc.ca', 3, 'K6TA2KiEk', NULL),
(75, 'Enid', 'Truin', 'etruin1w@phpbb.com', 4, '4DSN10sB', NULL),
(76, 'Danie', 'Wearne', 'dwearne1x@kickstarter.com', 5, 'sgzXMl7f', NULL),
(77, 'Maegan', 'Done', 'mdone1y@wikia.com', 4, 'goErrRZJ', NULL),
(78, 'Luise', 'Tardiff', 'ltardiff1z@barnesandnoble.com', 4, 'KXtCS0', NULL),
(79, 'Dedie', 'Springtorpe', 'dspringtorpe20@hostgator.com', 3, 'AcM8IH', NULL),
(80, 'Northrup', 'Barnby', 'nbarnby21@hp.com', 5, 'OT0LOHh', NULL),
(81, 'Bellina', 'Fosdike', 'bfosdike22@stanford.edu', 4, 'nu1t8tVWOBc', NULL),
(82, 'Edvard', 'Pittock', 'epittock23@instagram.com', 5, 'FX6dG3XDJPP', NULL),
(83, 'Katerina', 'Ambrosini', 'kambrosini24@e-recht24.de', 4, 'Rack9y0n9W', NULL),
(84, 'Bear', 'Dobson', 'bdobson25@blogspot.com', 3, 'CInIx6xps4', NULL),
(85, 'Rodger', 'Ferre', 'rferre26@ehow.com', 4, 'fFAgmjL', NULL),
(86, 'Allen', 'Faulconer', 'afaulconer27@cdbaby.com', 3, '06sB5Jn', NULL),
(87, 'Luca', 'Catherick', 'lcatherick28@army.mil', 3, '2bKQ8tg1O', NULL),
(88, 'Myrtice', 'Stoak', 'mstoak29@earthlink.net', 3, 'clXr1C2ITBz', NULL),
(89, 'Arnuad', 'Craighead', 'acraighead2a@yahoo.co.jp', 5, 'oLXqjN', NULL),
(90, 'Dorotea', 'Teenan', 'dteenan2b@lycos.com', 3, 'SSVZXM7U5I0', NULL),
(91, 'Thatch', 'Soloway', 'tsoloway2c@bandcamp.com', 4, 'vLIrPWVdP', NULL),
(92, 'Garrek', 'Clemanceau', 'gclemanceau2d@themeforest.net', 5, '2G4wWYCLk', NULL),
(93, 'Gustave', 'Juza', 'gjuza2e@tuttocitta.it', 3, 'BXgSPI', NULL),
(94, 'Moselle', 'Itskovitz', 'mitskovitz2f@netlog.com', 4, 'EnQinvdvyE', NULL),
(95, 'Marleah', 'Dugget', 'mdugget2g@vk.com', 5, 'ApFIz3', NULL),
(96, 'Lita', 'Pendergrast', 'lpendergrast2h@nifty.com', 4, 'gtKQNJaqpJ', NULL),
(97, 'Rozanne', 'Wheeler', 'rwheeler2i@princeton.edu', 3, '9Su111wllA', NULL),
(98, 'Suzette', 'Benjafield', 'sbenjafield2j@nytimes.com', 4, 'aSGazFlwUwg', NULL),
(99, 'Mel', 'Cunney', 'mcunney2k@technorati.com', 4, 'He0JdnBxl', NULL),
(100, 'Mitchel', 'Kemmett', 'mkemmett2l@amazon.co.jp', 5, 'rZ8k1G7sF', NULL),
(101, 'Quill', 'McFadzean', 'qmcfadzean2m@zimbio.com', 5, 'yA2OH7O', NULL),
(102, 'Teddy', 'Dovington', 'tdovington2n@apache.org', 4, 'lMr5KF8', NULL),
(103, 'Elwood', 'Dudeney', 'edudeney2o@ehow.com', 4, 'k2uuFsn0', NULL),
(104, 'Toddie', 'Condict', 'tcondict2p@instagram.com', 4, 'o9n3G5s', NULL),
(105, 'Elmira', 'Leijs', 'eleijs2q@fastcompany.com', 5, '2FpyI1iUqfpD', NULL),
(106, 'Hart', 'Mazzia', 'hmazzia2r@bandcamp.com', 4, 'DznYXqL', NULL);

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
  ADD CONSTRAINT `fk_role_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_role_menu_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
  ADD CONSTRAINT `fk_schedules_users1` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_student_group1` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`);

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
