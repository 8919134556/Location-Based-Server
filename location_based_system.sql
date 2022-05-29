-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 03:05 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `location_based_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user_ register', 7, 'add_user_register'),
(26, 'Can change user_ register', 7, 'change_user_register'),
(27, 'Can delete user_ register', 7, 'delete_user_register'),
(28, 'Can view user_ register', 7, 'view_user_register'),
(29, 'Can add send_msg', 8, 'add_send_msg'),
(30, 'Can change send_msg', 8, 'change_send_msg'),
(31, 'Can delete send_msg', 8, 'delete_send_msg'),
(32, 'Can view send_msg', 8, 'view_send_msg');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mainapp', 'user_register'),
(6, 'sessions', 'session'),
(8, 'userapp', 'send_msg');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-23 06:06:45.728217'),
(2, 'auth', '0001_initial', '2022-05-23 06:06:47.954628'),
(3, 'admin', '0001_initial', '2022-05-23 06:06:48.337430'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-23 06:06:48.375069'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-23 06:06:48.411382'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-23 06:06:48.580669'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-23 06:06:48.766039'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-23 06:06:48.825874'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-23 06:06:48.866786'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-23 06:06:49.112348'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-23 06:06:49.120796'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-23 06:06:49.146240'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-23 06:06:49.197554'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-23 06:06:49.237774'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-23 06:06:49.269723'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-23 06:06:49.290904'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-23 06:06:49.331819'),
(18, 'mainapp', '0001_initial', '2022-05-23 06:06:49.415202'),
(19, 'sessions', '0001_initial', '2022-05-23 06:06:49.534975'),
(20, 'mainapp', '0002_auto_20220523_1249', '2022-05-23 07:19:10.596578'),
(21, 'userapp', '0001_initial', '2022-05-23 07:19:10.658237'),
(22, 'userapp', '0002_auto_20220523_1254', '2022-05-23 07:24:44.418981'),
(23, 'userapp', '0003_auto_20220523_1305', '2022-05-23 07:35:55.723553'),
(24, 'userapp', '0004_send_msg_key', '2022-05-23 08:28:03.029125'),
(25, 'userapp', '0005_auto_20220524_1414', '2022-05-24 08:44:24.125371'),
(26, 'userapp', '0006_send_msg_accept', '2022-05-26 06:39:25.024537');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c7ur5e63yg4gg5hx0xjqpkbqyu88hr6l', 'eyJlbWFpbCI6InN1cnlhYW5hbmQ0NTZAZ21haWwuY29tIn0:1nuCkt:jMpJiUFnBbEBAUOwgDyuBK1rT26lcyIWPQ_FDxEE1rI', '2022-06-09 12:38:19.133509'),
('hc27qebhhpgyxrw29gbx5iji93xha62y', 'eyJlbWFpbCI6InN1cnlhYW5hbmQ0NTZAZ21haWwuY29tIn0:1ntper:JUJtaY0yUgczNbSAdWa6j151SwAS716YUgaVYyjzn8k', '2022-06-08 11:58:33.330109');

-- --------------------------------------------------------

--
-- Table structure for table `send_msg`
--

CREATE TABLE `send_msg` (
  `assign_id` int(11) NOT NULL,
  `latt` varchar(500) NOT NULL,
  `longt` varchar(500) NOT NULL,
  `whom` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `datetime_created` datetime(6) NOT NULL,
  `key` varchar(500) DEFAULT NULL,
  `accept` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `send_msg`
--

INSERT INTO `send_msg` (`assign_id`, `latt`, `longt`, `whom`, `content`, `message`, `datetime_created`, `key`, `accept`) VALUES
(33, 'gAAAAABijfQq3qbz4Fkjg9neNXfvKN1P2vl6bv9XVAr_1M2mKIXpe1xCWl-KbMfoQw8lHumxIod6hT3Hz_Yj3ZpzjhzB8dFj8Q==', 'gAAAAABijfQqi5cGiGnY-icycRZ4VZRJ9ub5zBiT5r03Gh9ybExElgjoVjPICRaVE4bKQ6fZhLrrfgXXRbXMFJRYBWkgudGOWg==', 'surya123@gmail.com', 'gAAAAABijfQqv2-AYBD0fQ3ECruxQddP_mU3s9e5n_LlaQMuXSg51KidT1s-rXAFrApRINsnOJMmTrpzF1g6W35MfPx0YpMuYg==', 'gAAAAABijfQq-3d9IlHELittYgstoCy8bK1olytyqvLFVy5Fmx0q8WFyIjGrvWPyRe7BMO8lvkc26J-5UyWFcDrWw4HPMzagzw==', '2022-05-25 14:47:30.417222', 'rLUsSwZ76wLxxF_L_rBhdSVqrPfaDA01AAmN3FJM7k0=', 'Accepted'),
(34, 'gAAAAABijfRvvqyLyJN-Qa47fUr_eyPHtmA2HCBMZ8RzGx9uat1X7LBG9aaDjY4odaClSco7H-G1ht0U9A29rXzLBYoxoOLT8g==', 'gAAAAABijfRv2-u6NaqGEhdKRYocdz3rxak5SCR3rHAFBM_9bDsdIilWg_SGWOa-Q-EXwKHKnlnzyETWDMclyb0NxGD1CUr5ig==', 'surya123anand@gmail.com', 'gAAAAABijfRvMymPeQjIBePgiAhdjPvpA0AuSpwax0G4ZIp6lmDxW6B3FVVAeynNcPsQIHEICA_b43s6372WtM50FN7Nd9Xz6M6fHq5EOJSoA-OeEUSHDLw=', 'gAAAAABijfRvElU1QEmiIcp_6vodKb9tLm0MNWg-IV6IZllnoz5d7PQ_XwZcdYPQ8-YNW1aKpxCuCV7fj_Bx7kVg8t4PxlsZIw==', '2022-05-25 14:48:39.815951', 'GhmAUdkyvZG-x8mKWV2193-Hi0kyb1DknoazuUx2K5A=', 'Accepted'),
(35, 'gAAAAABijfSH5mrHaNlZb21vUZetMQRJDYcIK2mOhcuRznzCcEf8GQe2mJ7OKycUrv6q8t8wRQyhpDVvx42Q3kHEv3jxgCxXlg==', 'gAAAAABijfSHXZ1uIR0qKG3Mb2RCXE6pBCaL1WhuhYOuN494B56LwZCPC9xMnjOPJzqf7zhGrFEoat11guQOKJpZuW3JUePAJQ==', 'suryaanand456@gmail.com', 'gAAAAABijfSHcTAoHiwDpbgjtYM6wHg2YRLk_RoKNizQIQ-bEJNCLIlutlKn2JD27LWBpos9xkDp8Npe9bsh38HpOGKdbVbJfoYdid5LR9CryPZDQGC7fRM=', 'gAAAAABijfSHkropQvIT_qKC38PZ07tnEzB0vQHlDCFjv6tFGjddEWXezkKFDm56OW15bMvHc5J4LDFPoxBPrJkP48J5I_wAcWppy7bx_QLhJ2A3jqkYGUE=', '2022-05-25 14:49:03.297933', 'c6iSLVlyBB0mYfck2t-_etq8s1Dr23QBBijVUE3jne0=', 'Accepted'),
(36, 'gAAAAABijfScx8sDO3NraTFaJHzvGK_F5MbjrH_cfaW8LC-gJeq8YEu-3_B02whYRxB2P2PxcKiLHfORpYHfqgYVPse34Gai9w==', 'gAAAAABijfSctO9b6joh_Cd6kD7G4HryzhN2NQ1D-j8zNd6kbqkLpV4ZGZDfdKFFUU7z1dRZIJAkzKvEV3MXVZqyNBrZtLqiWA==', 'surya123@gmail.com', 'gAAAAABijfScsrva5NaSed2RWPreFGcMzV5qyFl_XhbhlA0TQl5-tloLO16BPQCuXuapooPrhdv733IgpezgFNS29l9Z5xI9E8h9eg0rrd1i8VOXRNVjepA=', 'gAAAAABijfScXWhc1K0vXybufexvMIgXfYLrr9M9ZAis4SdLthEl5rzlhQ5w2280msY9p06exKOtiGaDovU7biOWLnC2t-aCng==', '2022-05-25 14:49:24.861687', 'GHMFSwZRgbgCz0x3-xlA2TXp8aIJWaGLZ1fUt6LjAgE=', NULL),
(37, 'gAAAAABijfSygKbuWUEr2-7YIH57Rqxgfu_Pnj0vt3O7WwCELMV1Ek_29urGSQo7V9mZwUIUfflihx8G6Rto7Ebny7YvqDMI1A==', 'gAAAAABijfSy2o5OODv0usU7VbMOkE3j8HtGTI3iLYrantowDR7ZfW6rS3wHZKN1ckpgCZmZavMCUEmCDhosANKsmEJNNDvSAA==', 'surya123anand@gmail.com', 'gAAAAABijfSyrH4KiM-Z81_tn0_Oioqb0pGzYMia5aVfGHjb_9vxZgKdTr9C1v_KD00qyinKU_4jJKUMZwVr5gbskk0PwlRDYA==', 'gAAAAABijfSylF1ca08vPgNtbH0asAzQzfoDE5R-cnhURuwjkTo5khRCVEB04tH_CMdv5TEbGEZn28JIBE94mOo7_C8f_9X7EVYdtK5W8FOZH9zsFcuY4I4=', '2022-05-25 14:49:46.876873', 'ZDb-MNb8pbERbBqUbp2aUuKSXVHtz5N5goNCs32kvRM=', NULL),
(38, 'gAAAAABijfpS34Z60hHBkOubGUgBoroq9fxO3SHlJe-JYkH02EhLa12ySe2gEN5TM94PQf2Ru6T4qua__HYWAK4mWQW3-9WmXg==', 'gAAAAABijfpSvXIwcy_jQgnPCPw4wsOpcditmqS9kM2XBOYGG1zZaQWowu3ADTXG4CiLOZybHITBPfzrgkDMszNQa6X6Gto1rw==', 'suryaanand456@gmail.com', 'gAAAAABijfpSk9udgh89QEze2vvbnHkY4WpB50feKpsIrxYV5gkXbDDTBAHYKaHuC9wopd2vVwkqww1rSxaOYEbgaXIjfyQu7w==', 'gAAAAABijfpSQs9j2j4lcm46PJbdfygXS_f2z5ew0ktk4kARSzQaF4kHRPhrlAuhJ_ucBafbU9hGWNB4vd2FbBSkugxg8HzsWQ==', '2022-05-25 15:13:46.873003', 'aUYlNnCKZI74eRpnlMTFURdZx47K6qtI3Ny-zTJaAR4=', NULL),
(39, 'gAAAAABijfqFB7eyrWehQD3uTQK4pSA7C5rqiB4EgZfNLDJec3YwlOB1cysHxxk65xm2mdWieE-08JOPZbbuDQe_ONqbk5kHFA==', 'gAAAAABijfqF2JSgEObPXlC68W68A7MJLm6ADxbmp9nAHbIxOhDDHMkxuhWu1YUzl-VlQB2zZdD9Van1_1ZgmhtY27KvBe_m4g==', 'suryaanand456@gmail.com', 'gAAAAABijfqFTUUDBLmWjHQDfSi7qlWuoPmXPhYCkz3v6Xvuia3-CrgACp656N0jx3NXgTnMotfdlPP3V_IjiUZ3UWBvZ58mAg==', 'gAAAAABijfqF4wFZFYzCGBX7uBRUH-04vO2z3XPeQMu3M-vwDMRWiaAzWE5KIU35BEzgrhkeY0TdugHXP8JbBiHcIRTFv4G23g==', '2022-05-25 15:14:37.114249', 'bCg1OFHF8QAD-L_MaqQoLaHpICi6Dagl8MP_Z0iFw1w=', 'Accepted'),
(40, 'gAAAAABijg9v4PYLyBBTib47WBVxorbhJlZjWUqW2uAS1G9_NEQ0nc3PNC3n1ABwJb9jviNDGIcD8_Ey8dE6yAODO9RWLxUyWA==', 'gAAAAABijg9vwUpT8Fa73bWTgt9u34J0xD6EasE7eNBGsI5Mg7SeedT7lWNiAYfbzJNlrrbCfjemGfJmlnFF2fuWvg5h0EO7kA==', 'suryaanand456@gmail.com', 'gAAAAABijg9vydFOSucs4v1cA7pe56ToYBveMAMFntueNccmF-P0h_Oew4ai5FHGTy_JIb1CgjLHFZNgS0cmmHHxFcpT00K1Tg==', 'gAAAAABijg9v_pJ1Wse5DqVxzqn7ChFLxlSS0zD3pz1pFkLaZE9Etmpvc3K1un9ICbHscL7L9wH6sfrftZNCkMPLGXpFLhWPeg==', '2022-05-25 16:43:51.155210', '7abUEqxoSmQWO2Tk2_YvJ8OndvllHzqIaWO-l8ee7P8=', 'Accepted'),
(41, 'gAAAAABijh5VfEl5y17qeCO1aKTiI6dArEgPa_M0nsqnz5_k0pZ5URiXHMtKkDFC9LtqsB8lCSd9TWGNmMDkLMe04-FyHpLOWg==', 'gAAAAABijh5VeC58-pcQiteCp1p_a6FiWwtkMCjojgXIbgJyB8G86GSIgKub5vxj-tBNikXqVkpUYleDX-dt6Cry3kKa7a7Fpw==', 'suryaanand456@gmail.com', 'gAAAAABijh5VRexxN9kRQBDiu5pgvEx5k9YM2Pd75P2gCdYtTp48lqzQBimDs8AmIvBA_AWMcMTPAtXqp_EO3WqsjlMYWpQHSg==', 'gAAAAABijh5V7O24kdc3xEXdCCUt-5XAe55LGFKrBKkQk2yP6PZpbE-vFxQqvAaK6vrZOsUNCQq3nbtmuau9tRWni2beO-VtBA==', '2022-05-25 17:47:25.938973', 'rsK6adjRU3XcdS5pckBYXjd24JDKKVizZZF67zu7S6c=', 'Accepted'),
(42, 'gAAAAABij29zWVbEGwhjUqq_fuhyM0Z8hh1LQxt8Wj1HH1EX3xg_s0ZfhJUxslYR0qshcx1LQzcmE6vRb6orskK6FUDesjNUnA==', 'gAAAAABij29zNH6zzYNnul9QnXRw7eTokttL6sgvV90eWua8Q4K84Q2c7vuulXsnAlw72CoCN8lijakYbcXSBIKFYaOpiRjHKQ==', 'suryaanand456@gmail.com', 'gAAAAABij29zNzNGq2rUpsFyePRWKRn-4k8wWnZN8tPyF4NQQ76PBtjFRp8lvsi54i0oouP3ZNTjHx0rjpMVC7ehiJGWUhYJwe7jUHvU8qqpiqU2tLiW6_4=', 'gAAAAABij29z7jXul2tkBBqVSgS5DDZsXnhn5mSd77AbadVvkaYAzoB71pfIjHnGIxHc2OFwuQRnPL9Q_rc-r5Db2HBROT0Ntw==', '2022-05-26 17:45:47.435912', 'hKmay8jKX1aboLH4bwitKWdPpeV48Yz8BmvYrVo2Qmc=', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `user_register`
--

CREATE TABLE `user_register` (
  `assign_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_lastname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `addres` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `user_phone` bigint(20) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_pwd` varchar(100) NOT NULL,
  `datetime_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_register`
--

INSERT INTO `user_register` (`assign_id`, `user_name`, `user_lastname`, `gender`, `country`, `state`, `city`, `date_of_birth`, `addres`, `pincode`, `user_phone`, `user_email`, `user_pwd`, `datetime_created`) VALUES
(22, 'surya', 'annand', 'Male', 'Australia', 'Queensland', 'Allan', '2022-05-04', 'aefv534163', '522002', 8919134556, 'suryaanand456@gmail.com', 'Anand@123', '2022-05-26 15:55:10.184482'),
(24, 'surya', 'anand', 'Male', 'Australia', 'South Australia', 'Alford', '2022-05-11', 'Acfhgjkl', '522002', 1234567890, 'suryaanand123@gmail.com', 'Anand@123', '2022-05-26 16:12:14.745713'),
(25, 'anand', 'surya', 'Male', 'Austria', 'Tyrol', 'Anras', '2022-05-18', 'afcda', '522002', 9876543210, 'surya@321gmail.com', 'Anand@123', '2022-05-26 16:24:12.680534'),
(26, 'surya', 'anand', 'Male', 'Austria', 'Salzburg', 'Berndorf bei Salzburg', '2022-04-28', 'hdfjgh123', '522003', 4567891230, 'suryaanand123456@gmail.com', 'Anand@123', '2022-05-26 16:26:03.044389');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `send_msg`
--
ALTER TABLE `send_msg`
  ADD PRIMARY KEY (`assign_id`);

--
-- Indexes for table `user_register`
--
ALTER TABLE `user_register`
  ADD PRIMARY KEY (`assign_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `send_msg`
--
ALTER TABLE `send_msg`
  MODIFY `assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_register`
--
ALTER TABLE `user_register`
  MODIFY `assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
