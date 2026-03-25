-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: galaxy2
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'galaxy');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add cinema',7,'add_cinema'),(26,'Can change cinema',7,'change_cinema'),(27,'Can delete cinema',7,'delete_cinema'),(28,'Can view cinema',7,'view_cinema'),(29,'Can add movie',8,'add_movie'),(30,'Can change movie',8,'change_movie'),(31,'Can delete movie',8,'delete_movie'),(32,'Can view movie',8,'view_movie'),(33,'Can add cinema image',9,'add_cinemaimage'),(34,'Can change cinema image',9,'change_cinemaimage'),(35,'Can delete cinema image',9,'delete_cinemaimage'),(36,'Can view cinema image',9,'view_cinemaimage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$2Q5QuXeb8CktjATeNqnZSZ$eg90M0rh+26NTEw5upe3s4GabRADTXw8TCrHFPlyMr4=','2025-04-27 17:35:26.094803',1,'hp','','','phanthiaimy1306@gmail.com',1,1,'2025-04-27 17:33:20.342170'),(2,'pbkdf2_sha256$870000$sGpk3KZKuxoYYU8ZT599xr$2tsWd0aqfqXEtLYwzO3UEsDkWalq2mac8DQZeEHT3rI=','2025-04-27 17:38:27.568223',1,'aimy','','','phanthiaimy123@gmail.com',1,1,'2025-04-27 17:37:36.516238');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL DEFAULT 'TP.HCM',
  `phone` varchar(20) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Galaxy Nguyễn Du','116 Nguyễn Du','Quận 1','TP.HCM','028-3823-1234',10.772682,106.698333),(2,'Galaxy Tân Bình','246 Nguyễn Hồng Đào','Tân Bình','TP.HCM','028-3812-3456',10.803889,106.635833),(3,'Galaxy Quang Trung','Lotte Mart Quang Trung','Gò Vấp','TP.HCM','028-3895-6789',10.835556,106.665556),(4,'Galaxy Kinh Dương Vương','718bis Kinh Dương Vương','Bình Tân','TP.HCM','028-3876-5432',10.745778,106.616944),(5,'Galaxy Nguyễn Văn Quá','119B Nguyễn Văn Quá','Quận 12','TP.HCM','028-3888-9999',10.827222,106.628611),(6,'Galaxy Trung Chánh','TTVH Q12, Quốc lộ 22','Hóc Môn','TP.HCM','028-3777-8888',10.865556,106.592778),(7,'Galaxy Linh Trung','20 Đường số 16, Linh Trung','Thủ Đức','TP.HCM','028-3666-7777',10.869167,106.760833),(8,'Galaxy Sala','Sari Town Sala, Quận 2','Thủ Thiêm','TP.HCM','028-3555-6666',10.770556,106.7225),(9,'Galaxy Vinhomes','Vinhomes Central Park, Bình Thạnh','Bình Thạnh','TP.HCM','028-3999-8888',10.794056,106.722778),(10,'Galaxy Phạm Văn Đồng','Hiệp Bình Chánh, Thủ Đức','Thủ Đức','TP.HCM','028-3222-4444',10.843611,106.713333),(11,'Galaxy An Dương Vương','99 An Dương Vương, Quận 5','Quận 5','TP.HCM','028-3333-5555',10.757778,106.681389),(12,'Galaxy Lê Văn Việt','Vincom Lê Văn Việt, Quận 9','Quận 9','TP.HCM','028-3666-9999',10.844722,106.788056),(13,'Galaxy Nguyễn Du','116 Nguyễn Du','Quận 1','TP.HCM','028-3823-1234',10.772682,106.698333),(14,'Galaxy Tân Bình','246 Nguyễn Hồng Đào','Tân Bình','TP.HCM','028-3812-3456',10.803889,106.635833),(15,'Galaxy Quang Trung','Lotte Mart Quang Trung','Gò Vấp','TP.HCM','028-3895-6789',10.835556,106.665556),(16,'Galaxy Kinh Dương Vương','718bis Kinh Dương Vương','Bình Tân','TP.HCM','028-3876-5432',10.745778,106.616944),(17,'Galaxy Nguyễn Văn Quá','119B Nguyễn Văn Quá','Quận 12','TP.HCM','028-3888-9999',10.827222,106.628611),(18,'Galaxy Trung Chánh','TTVH Q12, Quốc lộ 22','Hóc Môn','TP.HCM','028-3777-8888',10.865556,106.592778),(19,'Galaxy Linh Trung','20 Đường số 16, Linh Trung','Thủ Đức','TP.HCM','028-3666-7777',10.869167,106.760833),(20,'Galaxy Sala','Sari Town Sala, Quận 2','Thủ Thiêm','TP.HCM','028-3555-6666',10.770556,106.7225),(21,'Galaxy Vinhomes','Vinhomes Central Park, Bình Thạnh','Bình Thạnh','TP.HCM','028-3999-8888',10.794056,106.722778),(22,'Galaxy Phạm Văn Đồng','Hiệp Bình Chánh, Thủ Đức','Thủ Đức','TP.HCM','028-3222-4444',10.843611,106.713333),(23,'Galaxy An Dương Vương','99 An Dương Vương, Quận 5','Quận 5','TP.HCM','028-3333-5555',10.757778,106.681389),(24,'Galaxy Lê Văn Việt','Vincom Lê Văn Việt, Quận 9','Quận 9','TP.HCM','028-3666-9999',10.844722,106.788056);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_images`
--

DROP TABLE IF EXISTS `cinema_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cinema_id` int NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `cinema_images_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_images`
--

LOCK TABLES `cinema_images` WRITE;
/*!40000 ALTER TABLE `cinema_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-27 17:39:31.102811','1','galaxy',1,'[{\"added\": {}}]',3,2),(2,'2025-04-27 17:40:07.999186','1','galaxy',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'maps','cinema'),(9,'maps','cinemaimage'),(8,'maps','movie'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-21 11:49:47.772747'),(2,'auth','0001_initial','2025-04-21 11:49:50.086817'),(3,'admin','0001_initial','2025-04-21 11:49:50.616897'),(4,'admin','0002_logentry_remove_auto_add','2025-04-21 11:49:50.638835'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-21 11:49:50.655791'),(6,'contenttypes','0002_remove_content_type_name','2025-04-21 11:49:50.872320'),(7,'auth','0002_alter_permission_name_max_length','2025-04-21 11:49:51.041440'),(8,'auth','0003_alter_user_email_max_length','2025-04-21 11:49:51.094298'),(9,'auth','0004_alter_user_username_opts','2025-04-21 11:49:51.111251'),(10,'auth','0005_alter_user_last_login_null','2025-04-21 11:49:51.314436'),(11,'auth','0006_require_contenttypes_0002','2025-04-21 11:49:51.323375'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-21 11:49:51.339965'),(13,'auth','0008_alter_user_username_max_length','2025-04-21 11:49:51.597345'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-21 11:49:51.826370'),(15,'auth','0010_alter_group_name_max_length','2025-04-21 11:49:51.866261'),(16,'auth','0011_update_proxy_permissions','2025-04-21 11:49:51.889200'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-21 11:49:52.142949'),(18,'sessions','0001_initial','2025-04-21 11:49:52.239342'),(19,'maps','0001_initial','2025-04-21 11:52:53.979150'),(20,'maps','0002_remove_cinema_city','2025-04-21 12:06:59.033754'),(21,'maps','0003_movie_cinemaimage','2025-04-21 12:20:20.947054'),(22,'maps','0004_movie_actors_movie_country_movie_director_and_more','2025-04-25 05:57:42.893108'),(23,'maps','0005_cinema_description','2025-04-27 16:50:33.588981');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('i3i0lgbffkh99fr8v4q6vpycsh1eusj5','.eJxVjEEOwiAQRe_C2hCHwpS6dO8ZyEwHpGogKe3KeHfbpAvd_vfef6tA65LD2uIcJlEXZdTpd2Man7HsQB5U7lWPtSzzxHpX9EGbvlWJr-vh_h1kanmrGRkBjCHrQNIZLTseBkyeYkIzgmULIiDeS0-Sus71G-GUEK1hcerzBenKOJE:1u95xT:GGCyMj5peoSGEOwsjJISW1nMB-Il3QhTVvJT_GBJcq8','2025-05-11 17:38:27.625171');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps_cinema`
--

DROP TABLE IF EXISTS `maps_cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maps_cinema` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `district` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps_cinema`
--

LOCK TABLES `maps_cinema` WRITE;
/*!40000 ALTER TABLE `maps_cinema` DISABLE KEYS */;
INSERT INTO `maps_cinema` VALUES (1,'Galaxy Nguyễn Du','116 Nguyễn Du','Quận 1','028-3823-1234',10.774076575141168,106.69453983336385,'Là rạp chiếu đầu tiên và đông khách nhất trong hệ thống, Galaxy Nguyễn Du chính thức đi vào hoạt động từ ngày 20/5/2005 và được xem là một trong những cụm rạp mang tiêu chuẩn quốc tế hiện đại bậc nhất đầu tiên xuất hiện tại Việt Nam. Galaxy Nguyễn Du là một trong những rạp chiếu phim tiên phong mang đến cho khán giả những trải nghiệm phim chiếu rạp tốt nhất.    Galaxy Nguyễn Du gồm 5 phòng chiếu với hơn 1000 chỗ ngồi, trong đó có 1 phòng chiếu phim 3D và 4 phòng chiếu phim 2D, với hơn 1000 chỗ ngồi được thiết kế tinh tế giúp khách hàng có thể xem những bộ phim hay một cách thoải mái và thuận tiện nhất. Chất lượng hình ảnh rõ nét, âm thanh Dolby 7.1 cùng màn hình chiếu kỹ thuật 3D và Digital vô cùng sắc mịn, mang đến một không gian giải trí vô cùng sống động.   Bên cạnh đó, với lợi thế gần khu vực sầm uất bậc nhất ở trung tâm thành phố, bãi để xe rộng rãi, có tiệm cafe ngoài trời – đây là nơi cực thu hút bạn trẻ đến xem phim và check-in.'),(2,'Galaxy Tân Bình','246 Nguyễn Hồng Đào','Tân Bình','028-3812-3456',10.790545739721011,106.64068143879109,'Galaxy Tân Bình, hay còn được các Stars quen gọi là “Galaxy Nguyễn Hồng Đào” do tọa lạc tại số 246 Nguyễn Hồng Đào, Q.TB, Tp.HCM.   Với diện tích hơn 3000 m2 gồm 5 phòng chiếu , Galaxy Tân Bình được đánh giá như một thế giới Hollywood thu nhỏ của TP.HCM. Cùng sự hỗ trợ tư vấn thiết kế và lắp đặt bởi các chuyên gia của Tập đoàn Warner Bros đến từ Hollywood, các phòng chiếu 2D và 3D với màn hình chiếu sắc nét và dàn âm thanh Dolby 7.1 bậc nhất tại Việt Nam. Đây là cụm rạp chiếu phim đầu tiên của Galaxy được trang bị hệ thống âm thanh Dolby 7.1 và hệ thống chiếu phim Digital khiến chất lượng hình ảnh và âm thanh của những bộ phim hay càng sống động, tuyệt vời bậc nhất. Galaxy Tân Bình là một trong những cụm rạp đông khách nhất của Galaxy Cinema và luôn cập nhật nhanh chóng nhất những bộ phim mới để phục vụ cho nhu cầu của khán giả. '),(3,'Galaxy Quang Trung','Lầu 3, TTTM CoopMart Foodcosa số 304A, Quang Trung, P.11','Gò Vấp','028-3895-6789',10.834767189366023,106.66235038712026,'Đây là cụm rạp chiếu phim thứ 5 của Galaxy Cinema nằm tại con đường trung tâm nhộn nhịp nhất của quận Gò Vấp, kết hợp cùng khu ăn uống và mua sắm của Co.opmart FoodCosa, tạo nên một địa điểm giải trí phức hợp tiện lợi và đầy sôi động.   Galaxy Quang Trung mang đến một không gian điện ảnh mới với công nghệ chiếu phim đạt tiêu chuẩn Hollywood. Hệ thống âm thanh Dolby 7.1 sống động kết hợp cùng hiệu ứng hình ảnh Digital sắc nét sẽ mang đến những trải nghiệm điện ảnh trọn vẹn nhất. Ngoài ra, với 7 phòng chiếu gồm hơn 1.000 chỗ ngồi sẽ luôn phục vụ khán giả với mức giá vô cùng hợp lý bởi đội ngũ nhân viên chuyên nghiệp và tận tình. Galaxy Quang Trung luôn cập nhật nhanh chóng những bom tấn phim mới nhất, phim hay nhất để phục vụ cho các mọt phim Việt Nam.'),(4,'Galaxy Kinh Dương Vương','718bis Kinh Dương Vương','Bình Tân','028-3876-5432',10.749481096896517,106.62880781184653,'Galaxy Kinh Dương Vương là cụm rạp chiếu phim đầu tiên và duy nhất tại khu vực quận 6 tính cho đến năm 2016.   Ngay từ lúc khai trương vào năm 2013, nơi đây đã có 7 phòng chiếu được thiết kế theo tiêu chuẩn quốc tế với khoảng cách ghế ngồi rộng rãi. Bên cạnh đó, hệ thống âm thanh Dolby 7.1, màn hình chiếu kỹ thuật 3D và Digital vô cùng mịn, sắc nét đến từng phút giây mang đến những trải nghiệm phim hay cực đỉnh.   Sự ra đời của Galaxy Kinh Dương Vương thỏa khao khát từ lâu của các tín đồ điện ảnh. Chỉ mới đây thôi, cư dân Q.6 và các vùng lân cận muốn thưởng thức một bộ phim mới tại rạp bắt buộc phải lặn lội vào trung tâm. Đặc biệt, chỉ qua 3 ngày đầu tiên khai trương, rạp đã đạt mức vé bán kỷ lục là hơn 16.000 vé.'),(5,'Galaxy Nguyễn Văn Quá','119B Nguyễn Văn Quá','Quận 12','028-3888-9999',10.84722644924794,106.63421492705507,'Tọa lạc ở 119B Nguyễn Văn Quá, Galaxy Nguyễn Văn Quá sở hữu vị trí “vàng” gần cầu Chợ Cầu, hết sức thuận tiện cho việc đi lại và thưởng thức phim hay. Cũng như các rạp Galaxy Cinema khác, Galaxy Nguyễn Văn Quá được đầu tư công nghệ hiện đại, thiết bị tân tiến và xây dựng đúng theo tiêu chuẩn quốc tế. Với 7 phòng chiếu, Galaxy Nguyễn Văn Quá trình chiếu đủ hai định dạng 2D & 3D phục vụ tối đa nhu cầu của khách hàng. Màn hình sắc nét và hệ thống âm thanh vòm Dolby 7.1 hiện đại sẽ mang đến những trải nghiệm sống động như thật. Từ nay, có thêm một địa chỉ để thưởng thức những bộ phim mới xuất sắc trong và ngoài nước rồi nhé. Nhanh chân đến ngay Galaxy Nguyễn Văn Quá - 119B Nguyễn Văn Quá để nhận ưu đãi nào các bạn!'),(6,'Galaxy Trung Chánh','TTVH Quận 12, Số 09 Quốc Lộ 22, P. Trung Mỹ Tây','Quận 12','028-3777-8888',10.855386051361224,106.60832875109507,'Tọa lạc ở Trung tâm văn hóa Quận 12 – Số 09, Quốc Lộ 22, Phường Trung Mỹ Tây , Quận 12, TPHCM. Cũng như các rạp Galaxy Cinema khác, Galaxy Trung Chánh có hệ thống rạp chiếu phim được xây dựng theo tiêu chuẩn quốc tế. Các phòng chiếu với hai định dạng 2D & 3D đáp ứng tối đa nhu cầu khán giả. Màn hình sắc nét và hệ thống âm thanh vòm Dolby 7.1 hiện đại sẽ mang đến những trải nghiệm sống động như thật. Ngoài ra, các “đặc sản” đã từng giúp thương hiệu Galaxy Cinema “nổi đình nổi đám” như không gian trẻ trung, dịch vụ thân thiện, giá cả cực kỳ “kinh tế” cũng là ưu điểm không thể bỏ qua. Với sự xuất hiện của Galaxy Trung Chánh, các fan điện ảnh khu vực Hóc Môn và Quận 12 sẽ có thêm một lựa chọn vui chơi giải trí không-thể-chối-từ. Từ nay, các bạn không phải đi xa hoặc tiếc nuối vì đã lỡ bỏ một bộ phim hay/ phim mới nhé.'),(7,'Galaxy Linh Trung','Tầng trệt, TTTM Co.opXtra Linh Trung, số 934 Quốc Lộ 1A, Phường Linh Trung','Thủ Đức','028-3666-7777',10.867935761903517,106.77679160371952,'Nhằm tiếp tục mang đến cho khách hàng thêm một địa điểm đáp ứng nhu cầu giải trí và mong muốn thưởng thức những phim mới nhất, phim hay nhất của Việt Nam và thế giới, Galaxy Cinema Linh Trung chính thức ra mắt tại Thủ Đức vào ngày 10.01.2020. Được xem như là trái tim của khu vực Đông Bắc quận Thủ Đức, Galaxy Linh Trung sở hữu vị trí vàng khi tọa lạc tại Co.opXtra Linh Trung, số 934 Quốc Lộ 1A, P.Linh Trung, Thủ Đức, Tp.HCM. Galaxy Linh Trung trang bị 5 phòng chiếu với gần 700 ghế được xây dựng theo tiêu chuẩn quốc tế, mỗi rạp đều được tích hợp hệ thống âm thanh vòm Dolby 7.1. Hứa hẹn sẽ đem đến cho các tín đồ điện ảnh trải nghiệm hình ảnh sống động và âm thanh chân thực tuyệt đối.'),(8,'Galaxy Sala','Tầng 3, Thiso Mall Sala, 10 Mai Chí Thọ, Phường Thủ Thiêm','Quận 2','028-3555-6666',10.771553405573686,106.72182121557047,'Galaxy Sala tọa lạc tại tầng 3, Thiso Mall Sala, 10 Mai Chí Thọ, Phường Thủ Thiêm, Thành phố Thủ Đức. Galaxy Sala nằm giữa khu đô thị Sala hiện đại bậc nhất thành phố Hồ Chí Minh, là nơi giới trẻ tụ tập giải trí vui chơi sau những giờ học tập và làm việc căng thẳng. Tại tầng 3 khu phức hợp Thiso Mall Sala gồm hàng loạt thương hiệu đình đám, Galaxy Sala sở hữu thiết kế mới lạ, độc đáo chưa-từng-có, là màn lột xác bất ngờ đến từ thương hiệu Galaxy Cinema đang bước sang tuổi 20. Đối với các fan trung thành của Galaxy Cinema, Galaxy Sala chắc chắn là mang đến rất nhiều “lần đầu tiên”! Galaxy Sala là cụm rạp chiếu phim đầu tiên của Galaxy Cinema cũng như đầu tiên trên toàn quốc sở hữu phòng chiếu IMAX Laser. Sở hữu công nghệ hiện đại, vượt trội hơn hẳn màn hình IMAX thông thường, phòng chiếu IMAX Laser có độ sắc nét chuẩn quốc tế cùng hệ thống âm thanh 12 kênh tối ưu, giúp trải nghiệm điện ảnh trở nên vô cùng chân thật. Ngoài ra, ghế ngồi được bọc da mang lại cảm giác thoải mái tuyệt vời, chắc chắn sẽ khiến Stars có một buổi xem phim đáng nhớ. Còn gì hạnh phúc hơn khi thưởng thức các siêu phẩm phim hay phim mới sẽ ra mắt… tại phòng chiếu IMAX Laser ở Galaxy Sala.  Theo hướng cầu Ba Son hoặc hầm Thủ Thiêm chỉ mất 5 phút từ trung tâm thành phố Hồ Chí Minh, Galaxy Sala chắc chắn sẽ trở thành điểm check-in thường trực của giới trẻ Sài Gòn trong năm 2024.'),(9,'Galaxy Huỳnh Tấn Phát','1362 Huỳnh Tấn Phát, khu phố 1, Phường Phú Mỹ, Quận 7','Quận 7','028-3222-4444',10.712518445247543,106.73660893383989,'Tọa lạc tại lầu 2 siêu thị Coopmart - 1362 Đường Huỳnh Tấn Phát, Khu phố 1, Phường Phú Mỹ, Quận 7, TPHCM, rạp chiếu phim Galaxy Huỳnh Tấn Phát được xây dựng theo tiêu chuẩn quốc tế với hệ thống phòng chiếu định dạng 2D & 3D đáp ứng tốt nhất nhu cầu xem phim của khán giả. Màn hình sắc nét và hệ thống âm thanh vòm Dolby 7.1 hiện đại mang đến những trải nghiệm sống động như thật.   Mục tiêu của Galaxy Huỳnh Tấn Phát là giúp dân cư ở khu vực quận 7, thị trấn Nhà Bè và khu vực lân cận có nhiều lựa chọn vui chơi giải trí hơn. Với giá vé hợp túi tiền, phim hay phim mới được cập nhật liên tục, không gian trẻ trung và nhân viên thân thiện, chắc chắn đây sẽ là một trải nghiệm mới lạ và tuyệt vời.'),(10,'Galaxy Trường Chinh','Co.opMart TTTM Thắng Lợi, 2 Đ. Trường Chinh, P, Tân Phú','Tân Phú','028-3666-9999',11.017636134684231,106.88915171482132,'Tọa lạc tại Tầng 3 - Co.opMart TTTM Thắng Lợi - Số 2 Trường Chinh, Tây Thạnh, Tân Phú; Galaxy Trường Chinh sở hữu vị trí vô cùng thuận lợi, dễ dàng thu hút các bạn trẻ tại Tân Phú, Tân Bình, Gò Vấp, Quận 12, Hóc Môn…   Galaxy Trường Chinh là rạp chiếu phim đầu tiên trong hệ thống Galaxy Cinema thiết kế theo phong cách mới – Movie Station. Chắc chắn, các Stars sẽ bất ngờ và choáng ngợp trước không gian rạp chiếu phim nay biến thành Trạm Tàu Điện Ảnh tiêu chuẩn, đưa khán giả du hành khắp vũ trụ phim hay.   Nổi tiếng với giao diện trẻ trung, góc nào cũng có thể “sống ảo”, Galaxy Trường Chinh trình làng hai khu check-in mới cứng! Đó là toa tàu điện ngầm và chiếc đồng hồ siêu khủng - biểu tượng mới của Galaxy Cinema. Cầm vé tại Ticket Station, lấy bắp nước ở Popcorn Station và cùng khám phá những xứ sở mới lạ trên đoàn tàu Galaxy Cinema.   Với 6 phòng chiếu – Toa Tàu được xây dựng theo chuẩn quốc tế cùng màn hình tối tân và hệ thống âm thanh Dolby 7.1 sống động như thật, Galaxy Trường Chinh sẽ đem đến những trải nghiệm phim hay phim mới vô cùng đặc sắc và thú vị. Rạp cũng nâng cấp sơ đồ ghế ngồi chuẩn – chỉnh hơn, giúp các Stars thoải mái nhất có thể.'),(11,'Galaxy Parc Mall Q8','Tầng 4 TTTM Parc Mall, 547-549 Tạ Quang Bửu, Phường 4, Quận 8','Quận 8','028-3344-5555',10.740943421072535,106.67870281349131,'Tọa lạc tại Tầng 4 TTTM Parc Mall, 547-549 Tạ Quang Bửu, Phường 4, Quận 8, TPHCM; Galaxy Parc Mall Q8 sở hữu thiết kế đầy tâm huyết với môi trường, đem công viên vào mall. Đến với Galaxy Parc Mall Q8 để đắm chìm vào không gian rạp chiếu phim đậm chất xanh, trải nghiệm vừa thưởng thức điện ảnh vừa chill với thiên nhiên. Galaxy Parc Mall Q8 mang phong cách tối giản, tinh tế và sang trọng. Hệ thống rạp hiện đại với 7 phòng chiếu và gần 1000 ghế bọc da êm ái. Rạp sở hữu công nghệ trình chiếu tối tân nhất với máy chiếu Laser cùng màn hình sắc nét chuẩn quốc tế, hệ thống âm thanh vòm Dolby 7.1. Đặc biệt, Galaxy Parc Mall Q8 là cụm rạp đầu tiên của Galaxy Cinema và cũng là đầu tiên tại Việt Nam sở hữu phòng chiếu thiết kế dành riêng cho gia đình Cine de Kids cùng khu vực vui chơi trẻ em Cine de Play. Rạp còn có khu ẩm thực CineMunch Eatery phục vụ nhiều combo đặc biệt, hứa hẹn đáp ứng đầy đủ nhu cầu của ba mẹ và các bé.    Với thế mạnh về dịch vụ, đội ngũ nhân viên Galaxy Parc Mall Q8 được Galaxy Cinema đào tạo kĩ lưỡng, luôn cố gắng hết sức để mang đến trải nghiệm tốt nhất. Galaxy Parc Mall Q8 luôn cập nhật nhanh nhất sớm nhất các bộ phim mới, phim hay, phim gia đình… từ Hollywood và châu Á. Mùa bom tấn cuối năm sắp đến, ghé ngay Galaxy Parc Mall Q8 để trải nghiệm điện ảnh trong không gian gia đình đậm chất xanh. Galaxy Parc Mall Q8 - Tầng 4 TTTM Parc Mall, 547-549 Tạ Quang Bửu, Phường 4, Quận 8, TPHCM hân hạnh phục vụ quý khách từ 04.09.2024.');
/*!40000 ALTER TABLE `maps_cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps_cinemaimage`
--

DROP TABLE IF EXISTS `maps_cinemaimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maps_cinemaimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `cinema_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maps_cinemaimage_cinema_id_df9ff628_fk_maps_cinema_id` (`cinema_id`),
  CONSTRAINT `maps_cinemaimage_cinema_id_df9ff628_fk_maps_cinema_id` FOREIGN KEY (`cinema_id`) REFERENCES `maps_cinema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps_cinemaimage`
--

LOCK TABLES `maps_cinemaimage` WRITE;
/*!40000 ALTER TABLE `maps_cinemaimage` DISABLE KEYS */;
INSERT INTO `maps_cinemaimage` VALUES (1,'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-nguyen-du-1_1698051240852.jpg',1),(2,'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-nguyen-du-2_1698051251352.jpg',1),(3,'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-nguyen-du-3_1698051255427.jpg',1),(4,'https://cdn.galaxycine.vn/media/2023/10/23/galaxy-nguyen-du-4_1698051246666.jpg',1),(5,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tan-binh-2_1557134155796.jpg',2),(6,'https://cdn.galaxycine.vn/media/2023/11/22/1_1700639852832.jpg',2),(7,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tan-binh-1_1557134148145.jpg',2),(8,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tan-binh-3_1557133920863.jpg',2),(9,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-quang-trung-1_1557133544324.jpg',3),(10,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-quang-trung-2_1557133786398.jpg',3),(11,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-quang-trung-3_1557133790242.jpg',3),(12,'https://cdn.galaxycine.vn/media/2023/11/22/2_1700640675099.jpg',3),(13,'https://cdn.galaxycine.vn/media/2025/4/16/kdv-4_1744775318378.jpg',4),(14,'https://cdn.galaxycine.vn/media/2025/4/16/kdv-3_1744775328968.jpg',4),(15,'https://cdn.galaxycine.vn/media/2025/4/16/kdv-1_1744775323718.jpg',4),(16,'https://cdn.galaxycine.vn/media/2025/4/16/kdv-2_1744775334249.jpg',4),(17,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-nguyen-van-qua-2_1698747051873.jpg',5),(18,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-nguyen-van-qua-5_1698747068418.jpg',5),(19,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-nguyen-van-qua-3_1698747056362.jpg',5),(20,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-nguyen-van-qua-4_1698747063538.jpg',5),(21,'https://cdn.galaxycine.vn/media/2023/11/22/2_1700638871113.jpg',6),(22,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tc-02_1557133669536.jpg',6),(23,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tc-01_1557133665388.jpg',6),(24,'https://cdn.galaxycine.vn/media/2019/5/6/rapgiave-hinhrap-tc-03_1557133911768.jpg',6),(25,'https://cdn.galaxycine.vn/media/2023/11/22/3_1700637490340.jpg',7),(26,'https://cdn.galaxycine.vn/media/2023/11/22/4_1700637494798.jpg',7),(27,'https://cdn.galaxycine.vn/media/2023/11/22/1_1700637478799.jpg',7),(28,'https://cdn.galaxycine.vn/media/2023/11/22/2_1700637484818.jpg',7),(29,'https://cdn.galaxycine.vn/media/2023/12/25/4_1703500565605.jpg',8),(30,'https://cdn.galaxycine.vn/media/2023/12/25/2_1703500555704.jpg',8),(31,'https://cdn.galaxycine.vn/media/2023/12/25/4_1703500565605.jpg',8),(32,'https://cdn.galaxycine.vn/media/2023/12/25/3_1703500560520.jpg',8),(33,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-hunh-tan-phat-1_1698739170568.jpg',9),(34,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-hunh-tan-phat-3_1698739179653.jpg',9),(35,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-hunh-tan-phat-2_1698739175395.jpg',9),(36,'https://cdn.galaxycine.vn/media/2023/10/31/galaxy-hunh-tan-phat-4_1698739183585.jpg',9),(37,'https://cdn.galaxycine.vn/media/2023/11/22/2_1700636434005.JPG',10),(38,'https://cdn.galaxycine.vn/media/2023/11/22/3_1700636438090.JPG',10),(39,'https://cdn.galaxycine.vn/media/2023/11/22/4_1700636442680.JPG',10),(40,'https://cdn.galaxycine.vn/media/2023/11/22/1_1700636429766.JPG',10),(41,'https://cdn.galaxycine.vn/media/2024/10/1/parcmall-4_1727752221364.jpg',11),(42,'https://cdn.galaxycine.vn/media/2024/10/1/parcmall-1_1727752232321.jpg',11),(43,'https://cdn.galaxycine.vn/media/2024/10/1/parcmall-2_1727752246198.jpg',11),(44,'https://cdn.galaxycine.vn/media/2024/10/1/parcmall-5_1727752226205.jpg',11);
/*!40000 ALTER TABLE `maps_cinemaimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps_movie`
--

DROP TABLE IF EXISTS `maps_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maps_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `duration` int NOT NULL,
  `release_date` date NOT NULL,
  `poster_url` varchar(255) NOT NULL,
  `actors` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `production_company` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(200) DEFAULT NULL,
  `vote_count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps_movie`
--

LOCK TABLES `maps_movie` WRITE;
/*!40000 ALTER TABLE `maps_movie` DISABLE KEYS */;
INSERT INTO `maps_movie` VALUES (1,'Godzilla x Kong: The New Empire','Kong và Godzilla - hai sinh vật vĩ đại huyền thoại, hai kẻ thủ truyền kiếp sẽ cùng bắt tay thực thi một sứ mệnh chung mang tính sống còn để bảo vệ nhân loại, và trận chiến gắn kết chúng với loài người mãi mãi sẽ bắt đầu',115,'2024-03-29','https://th.bing.com/th/id/OIP.vObPGxs6suBIq3-v_HOKZgHaLH?rs=1&pid=ImgDetMain','Alexander Skarsgård, Millie Bobby Brown','Mỹ','Adam Wingard','Hành động, Khoa học viễn tưởng','Legendary Entertainment','https://www.youtube.com/watch?v=lV1OOlGwExM',7),(2,'Kung Fu Panda 4','Sau khi Po được chọn trở thành Thủ lĩnh tinh thần của Thung lũng Bình Yên, Po cần tìm và huấn luyện một Chiến binh Rồng mới, trong khi đó một mụ phù thủy độc ác lên kế hoạch triệu hồi lại tất cả những kẻ phản diện mà Po đã đánh bại về cõi linh hồn.',94,'2024-03-08','https://th.bing.com/th/id/R.d8bc35d03c560f34354fe65d89ae04a6?rik=D%2bLBGD36iQp5Vg&riu=http%3a%2f%2fwww.impawards.com%2f2024%2fposters%2fkung_fu_panda_four_ver3.jpg&ehk=7qXFRWzJkvlRts6PSDMCReX%2blO4%2fw%2b%2frg1KfAh4wkfM%3d&risl=&pid=ImgRaw&r=0','Jack Black, Angelina Jolie, Dustin Hoffman','Mỹ','Mark Osborne, John Stevenson','Hoạt hình, Hài hước','DreamWorks Animation','https://www.youtube.com/watch?v=_inKs4eeHiI',8),(3,'Dune: Part Two','\"Dune: Hành Tinh Cát - Phần 2\" sẽ tiếp tục khám phá hành trình đậm chất thần thoại của Paul Atreides khi anh đồng hành cùng Chani và những người Fremen trên chặng đường trả thù những kẻ đã hủy hoại gia đình mình. Đối mặt với những lựa chọn giữa tình yêu của cuộc đời mình và số phận của vũ trụ, Paul phải ngăn chặn viễn cảnh tương lai tồi tệ chỉ mình anh nhìn thấy',165,'2024-02-28','https://th.bing.com/th/id/OIP.YrrkdAkHtSHvPOzOUyQ_EwHaK3?rs=1&pid=ImgDetMain','Timothée Chalamet, Zendaya, Rebecca Ferguson','Mỹ','Denis Villeneuve','Khoa học viễn tưởng, Hành động','Legendary Entertainment, Warner Bros.','https://www.youtube.com/watch?v=Way9Dexny3w',9),(4,'Quỷ Nhập Tràng','Lấy bối cảnh tại một ngôi làng hẻo lánh, người dân nơi đây bị ám ảnh bởi những truyền thuyết rùng rợn về ma quỷ và bùa ngải. Bộ phim kể về một cặp vợ chồng làm nghề mai táng, cuộc sống bình yên của họ bỗng chốc bị đảo lộn khi phát hiện một cỗ quan tài vô chủ ở trên mảnh đất nhà mình.',120,'2025-03-07','https://cinematone.info/public/poster/250107200729_Quy-Nhap-Trang_qMXxw.jpg','Khả Như, Quang Tuấn','Việt Nam','Pom Nguyễn','Kinh dị','Đang cập nhật','https://www.youtube.com/watch?v=XsPl7SbL2kg',7),(5,'Chốt Đơn','Bộ phim kể về Hoàng Linh, giám đốc của một công ty Livestream đang trên đà phát triển, tình cờ gặp ông An \"newbie\", một nhân viên lớn tuổi mới bước vào nghề. Chính sự khác biệt thế hệ đã tạo nên những tràng cười sảng khoái cho khán giả.',110,'2025-03-07','https://cdn.tuoitre.vn/471584752817336320/2024/12/26/poster-1735211041845360059462.jpg','Quyền Linh, Nguyễn Thúc Thùy Tiên, Hồng Đào, Hồng Vân, Lê Lộc','Việt Nam','Namcito, Bảo Nhân','Hài hước, Tình cảm','Đang cập nhật','https://www.youtube.com/watch?v=FWOuq8Blpcc',6),(6,'Một Bộ Phim Minecraft','Chuyện phim theo chân bốn kẻ lập dị bất ngờ bị cuốn vào Overworld – vùng đất kỳ diệu của những khối vuông, nơi trí tưởng tượng là chìa khóa sống còn. Dưới sự dẫn dắt của một bậc thầy chế tác bí ẩn, họ phải chinh phục thế giới này để tìm đường về nhà.',100,'2025-04-04','https://th.bing.com/th/id/OIP.LLqzNZnhrEPYiRlbeACgdgHaK-?rs=1&pid=ImgDetMain','Jason Momoa, Jack Black, Emma Myers, Sebastian Eugene Hansen, Danielle Brooks','Mỹ','Đang cập nhật','Hoạt hình, Hài hước','Mojang Studios','https://www.youtube.com/watch?v=c7FisB876Ek',7),(7,'Kayara: Cô Bé Chiến Binh','Phim hoạt hình kể về Kayara, một thiếu nữ xinh đẹp và mạnh mẽ, quyết tâm trở thành nữ sứ giả đầu tiên của Đế chế Inca. Trên hành trình đầy thử thách, cô gái phải vượt qua nhiều khó khăn để bảo vệ thành phố Vàng khỏi những nguy cơ khai thác và cứu bạn bè, gia đình khỏi những mối đe dọa bất ngờ.',95,'2025-04-04','https://th.bing.com/th/id/OIP.ypcExShj2K4l1_UOnVsN8QHaK-?rs=1&pid=ImgDetMain','Đang cập nhật','Đang cập nhật','Đang cập nhật','Hoạt hình, Phiêu lưu','Đang cập nhật','https://www.youtube.com/watch?v=9MFHYvdtrRw',7),(8,'Tìm Xác: Ma Không Đầu','Tìm xác: Ma không đầu sẽ đưa người xem vào hành trình của bộ đôi Tiến Luật và Ngô Kiến Huy, với nghề nghiệp “độc lạ” hốt xác và lái xe cứu thương, hứa hẹn mang đến những tràng cười không ngớt cho khán giả qua hành trình tìm xác có một không hai trên màn ảnh Việt.',105,'2025-04-18','https://th.bing.com/th/id/OIP.0It4kyVeYmpj4ZXIZO0-CgHaJN?rs=1&pid=ImgDetMain','Tiến Luật, Ngô Kiến Huy, NSND Hồng Vân, NSƯT Hữu Châu, NSƯT Đại Nghĩa, Thanh Hương, Hoàng Mèo, Nghệ sĩ Phi Phụng, Phan Vũ','Việt Nam','Đang cập nhật','Hài hước, Kinh dị','Đang cập nhật','https://www.youtube.com/watch?v=yDTjLeDf0Yg',7),(9,'Thám Tử Kiên: Kỳ Án Không Đầu','Phim lấy bối cảnh thời nhà Nguyễn khoảng 200 năm trước, theo chân nhân vật Thám tử Kiên và bà Hai Mẫn sau ba năm kể từ các biến cố của Người vợ cuối cùng. Khi nhân vật Nga mất tích dẫn đến những lời đồn đại liên quan tới ma da và những cái xác không đầu trôi dạt vào bờ, thám tử Kiên phải vào cuộc để lý giải những bí ẩn.',110,'2025-04-30','https://metiz.vn/media/poster_film/350x495-ttk.jpg','Quốc Huy, Đinh Ngọc Diệp, Quốc Anh, Minh Anh, Anh Phạm','Việt Nam','Victor Vũ','Kinh dị, Trinh thám','Đang cập nhật','https://www.youtube.com/watch?v=CAMVa3I6FUQ',7);
/*!40000 ALTER TABLE `maps_movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-28 22:17:20
