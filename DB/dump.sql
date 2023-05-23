-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopp
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'NikitaZ@mail.ru',0,1,1),(2,'zxc@mail.ru',0,1,3);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add site',7,'add_site'),(26,'Can change site',7,'change_site'),(27,'Can delete site',7,'delete_site'),(28,'Can view site',7,'view_site'),(29,'Can add email address',8,'add_emailaddress'),(30,'Can change email address',8,'change_emailaddress'),(31,'Can delete email address',8,'delete_emailaddress'),(32,'Can view email address',8,'view_emailaddress'),(33,'Can add email confirmation',9,'add_emailconfirmation'),(34,'Can change email confirmation',9,'change_emailconfirmation'),(35,'Can delete email confirmation',9,'delete_emailconfirmation'),(36,'Can view email confirmation',9,'view_emailconfirmation'),(37,'Can add social account',10,'add_socialaccount'),(38,'Can change social account',10,'change_socialaccount'),(39,'Can delete social account',10,'delete_socialaccount'),(40,'Can view social account',10,'view_socialaccount'),(41,'Can add social application',11,'add_socialapp'),(42,'Can change social application',11,'change_socialapp'),(43,'Can delete social application',11,'delete_socialapp'),(44,'Can view social application',11,'view_socialapp'),(45,'Can add social application token',12,'add_socialtoken'),(46,'Can change social application token',12,'change_socialtoken'),(47,'Can delete social application token',12,'delete_socialtoken'),(48,'Can view social application token',12,'view_socialtoken'),(49,'Can add item',13,'add_item'),(50,'Can change item',13,'change_item'),(51,'Can delete item',13,'delete_item'),(52,'Can view item',13,'view_item'),(53,'Can add order item',14,'add_orderitem'),(54,'Can change order item',14,'change_orderitem'),(55,'Can delete order item',14,'delete_orderitem'),(56,'Can view order item',14,'view_orderitem'),(57,'Can add order',15,'add_order'),(58,'Can change order',15,'change_order'),(59,'Can delete order',15,'delete_order'),(60,'Can view order',15,'view_order'),(61,'Can add Категорию',16,'add_category'),(62,'Can change Категорию',16,'change_category'),(63,'Can delete Категорию',16,'delete_category'),(64,'Can view Категорию',16,'view_category');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$iWSCnJdFksTo$juTHo/8g3v5NfkRSJXM91qRaq6g0vUNSp7mQqumEN+o=','2023-05-22 22:50:30.895434',0,'NikitaZ','','','NikitaZ@mail.ru',0,1,'2023-05-22 22:50:15.239678'),(2,'pbkdf2_sha256$216000$0U7OLDOvbqlp$hzJmHiY/TU5Tu8Z5Ei0i4p4VWiukiKL2dlQhVxan0GQ=','2023-05-23 07:50:07.696893',1,'admin','','','magnusluckgrey1@mail.ru',1,1,'2023-05-22 22:53:54.838254'),(3,'pbkdf2_sha256$216000$gh6Rpwq2WPzH$3sbMS22tjDJz7nwS0Fq+PvsL6jOzr1SYJTtzB10ALkI=','2023-05-23 07:36:52.087130',0,'zxc','','','zxc@mail.ru',0,1,'2023-05-23 07:36:39.078801');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-22 22:57:49.558813','1','Торты',1,'[{\"added\": {}}]',16,2),(2,'2023-05-22 22:57:51.488054','1','Торт «Котик»',1,'[{\"added\": {}}]',13,2),(3,'2023-05-22 22:58:45.004885','1','Торт «Котик»',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',13,2),(4,'2023-05-23 07:32:18.410223','2','Мороженое',1,'[{\"added\": {}}]',16,2),(5,'2023-05-23 07:32:19.813820','2','Мороженое Пралине Baskin Robbins, 1 л',1,'[{\"added\": {}}]',13,2),(6,'2023-05-23 07:33:11.350608','2','Мороженое Пралине Baskin Robbins, 1 л',2,'[{\"changed\": {\"fields\": [\"Description\", \"Characteristics\"]}}]',13,2),(7,'2023-05-23 07:51:26.575411','3','Сорбет Манго-Маракуйя Monterra, 480 мл',1,'[{\"added\": {}}]',13,2),(8,'2023-05-23 07:52:43.166631','4','Мороженое Клюквенно-малиновый сорбет BRandICE, 500 мл',1,'[{\"added\": {}}]',13,2),(9,'2023-05-23 07:53:10.730330','1','Торты',3,'',16,2),(10,'2023-05-23 07:53:30.529704','1','Торт «Котик»',3,'',13,2),(11,'2023-05-23 07:54:39.519425','3','Торты',1,'[{\"added\": {}}]',16,2),(12,'2023-05-23 07:54:40.973057','5','Торт \"Черничное молоко\" Mirel, 750 г',1,'[{\"added\": {}}]',13,2),(13,'2023-05-23 07:55:48.871846','6','Торт MIREL \"Карамельный на сгущенке\", 700 г',1,'[{\"added\": {}}]',13,2),(14,'2023-05-23 07:56:23.557196','7','Торт МОЙ\"Персиковый йогурт\", 650 г',1,'[{\"added\": {}}]',13,2),(15,'2023-05-23 07:57:20.651701','4','Пирожные',1,'[{\"added\": {}}]',16,2),(16,'2023-05-23 07:57:27.510782','8','Пирожные ассорти Тарты по-французски с заварным кремом Mirel, 280 г',1,'[{\"added\": {}}]',13,2),(17,'2023-05-23 07:58:14.986135','9','Пирожные Mirel Эклеры с заварным кремом, 5 шт., 250 г',1,'[{\"added\": {}}]',13,2),(18,'2023-05-23 07:59:08.395215','10','Профитроли с пломбирным кремом, 180 г, Mirel',1,'[{\"added\": {}}]',13,2),(19,'2023-05-23 08:00:56.916851','10','Профитроли с пломбирным кремом, 180 г, Mirel',2,'[{\"changed\": {\"fields\": [\"Description\", \"Characteristics\"]}}]',13,2),(20,'2023-05-23 08:03:09.238846','5','Торт \"Черничное молоко\" Mirel, 750 г',2,'[{\"changed\": {\"fields\": [\"Characteristics\"]}}]',13,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(16,'shop','category'),(13,'shop','item'),(15,'shop','order'),(14,'shop','orderitem'),(7,'sites','site'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-22 22:49:05.146352'),(2,'auth','0001_initial','2023-05-22 22:49:05.261938'),(3,'account','0001_initial','2023-05-22 22:49:05.587305'),(4,'account','0002_email_max_length','2023-05-22 22:49:05.736114'),(5,'admin','0001_initial','2023-05-22 22:49:05.767996'),(6,'admin','0002_logentry_remove_auto_add','2023-05-22 22:49:05.840562'),(7,'admin','0003_logentry_add_action_flag_choices','2023-05-22 22:49:05.849556'),(8,'contenttypes','0002_remove_content_type_name','2023-05-22 22:49:05.914365'),(9,'auth','0002_alter_permission_name_max_length','2023-05-22 22:49:05.959170'),(10,'auth','0003_alter_user_email_max_length','2023-05-22 22:49:05.990197'),(11,'auth','0004_alter_user_username_opts','2023-05-22 22:49:06.000245'),(12,'auth','0005_alter_user_last_login_null','2023-05-22 22:49:06.044034'),(13,'auth','0006_require_contenttypes_0002','2023-05-22 22:49:06.046034'),(14,'auth','0007_alter_validators_add_error_messages','2023-05-22 22:49:06.055005'),(15,'auth','0008_alter_user_username_max_length','2023-05-22 22:49:06.106797'),(16,'auth','0009_alter_user_last_name_max_length','2023-05-22 22:49:06.150783'),(17,'auth','0010_alter_group_name_max_length','2023-05-22 22:49:06.172840'),(18,'auth','0011_update_proxy_permissions','2023-05-22 22:49:06.182809'),(19,'auth','0012_alter_user_first_name_max_length','2023-05-22 22:49:06.249771'),(20,'sessions','0001_initial','2023-05-22 22:49:06.273821'),(21,'shop','0001_initial','2023-05-22 22:49:06.391612'),(22,'shop','0002_item_image','2023-05-22 22:49:06.567442'),(23,'shop','0003_item_characteristics','2023-05-22 22:49:06.620484'),(24,'shop','0004_auto_20210513_1923','2023-05-22 22:49:06.626481'),(25,'shop','0005_auto_20210513_1924','2023-05-22 22:49:06.631479'),(26,'shop','0006_auto_20210513_1939','2023-05-22 22:49:06.637474'),(27,'shop','0007_auto_20210513_1940','2023-05-22 22:49:06.642472'),(28,'shop','0008_auto_20210513_2116','2023-05-22 22:49:06.650468'),(29,'shop','0009_auto_20210514_1624','2023-05-22 22:49:06.704517'),(30,'shop','0010_orderitem_quantity','2023-05-22 22:49:06.869613'),(31,'shop','0011_auto_20210514_1812','2023-05-22 22:49:06.898596'),(32,'sites','0001_initial','2023-05-22 22:49:06.922583'),(33,'sites','0002_alter_domain_unique','2023-05-22 22:49:06.942570'),(34,'socialaccount','0001_initial','2023-05-22 22:49:07.106708'),(35,'socialaccount','0002_token_max_lengths','2023-05-22 22:49:07.349079'),(36,'socialaccount','0003_extra_data_default_dict','2023-05-22 22:49:07.364073');
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
INSERT INTO `django_session` VALUES ('x7fp26a32ems9b1301z3vy5o9rs7xthn','.eJxVjDsOwjAQRO_iGlnxb20o6TmDtWt7cQA5UpxUiLuTSClAmmrem3mLiOtS49rLHMcsLkKL029HmJ6l7SA_sN0nmaa2zCPJXZEH7fI25fK6Hu7fQcVet7UlYGLDQGdKYIPyyjhLVnlkDxkGYh2CM45L0RiyCTZsgURKOUyD-HwB5uc3sQ:1q1MmV:ZXlQCRwEt4g6FXCZJKHIRgu50TFtU9QQHuUkB3zt8N8','2023-06-06 07:50:07.700235');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (2,'Мороженое','category-2'),(3,'Торты','category'),(4,'Пирожные','category-3');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_item`
--

DROP TABLE IF EXISTS `shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `characteristics` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_item`
--

LOCK TABLES `shop_item` WRITE;
/*!40000 ALTER TABLE `shop_item` DISABLE KEYS */;
INSERT INTO `shop_item` VALUES (2,'Мороженое Пралине Baskin Robbins, 1 л','baskin-robbins-1',500,'Мороженое BASKIN ROBBINS Пралине – это один из классических сортов мороженого от известного российского производителя, неизменно радующего отечественных потребителей отличным качеством продукции на протяжении многих лет. Освежающее лакомство изготовлено на основе натуральных сливок и обладает нежным вкусом и легкой консистенцией. В состав входят орехи пекан в пралине и карамельная прослойка, добавляющие вкусовой композиции свои нотки.','6422182178.webp','<p><span style=\"background-color:rgb(255,255,255);color:rgb(33,37,41);\">Пищевая ценность продукта: 4 белки 12 жиры 31 углеводы 260 ккалПищевая ценность продукта: 4 белки 12 жиры 31 углеводы 260 ккал</span></p>'),(3,'Сорбет Манго-Маракуйя Monterra, 480 мл','-monterra-480',480,'Изысканные рецептуры\r\nнашего мороженого Monterra создаются мастерами, которые любят и знают своё дело. \r\nМы используем натуральные отборные ингредиенты и особые технологии замешивания слоев, чтобы каждый продукт Monterra стал шедевром.','6529608757.webp','<p>Пищевая ценность продукта: 0.8 белки 0.3 жиры 32 углеводы 134 ккал</p>'),(4,'Мороженое Клюквенно-малиновый сорбет BRandICE, 500 мл','-brandice-500',480,'Десерт фруктовый BRandICE \"Клюквенно-малиновый сорбет\" 500 мл.','6559778377.webp','<p>Пищевая ценность продукта: 0 белки 0.0 жиры 32 углеводы 130 ккал</p>'),(5,'Торт \"Черничное молоко\" Mirel, 750 г','mirel-750',424,'«Черничное молоко» ТМ Mirel – это легкий крем на основе молока, кексовый бисквит оттенка черники с молоком и лесная черника в начинке. Первый торт, крем которого изготовлен на основе молока, а не его производных (таких как: сметана, йогурт, сливки и т.д.). Особенности продукта/ полезные добавки: ●  Крем на основе молока ●  Лесная черника в начинке ●  Всего 257 ккал в 100гр● товар хранится в замороженном состоянии','6570923171.webp','<p><strong>Пищевая ценность продукта:</strong> 3.9 белки 14 жиры 28 углеводы 257 ккал</p>'),(6,'Торт MIREL \"Карамельный на сгущенке\", 700 г','mirel-700',350,'Ароматный пористый бисквит с карамельным вкусом без дополнительной пропитки в сочетании с кремом и начинкой из вареной сгущенки не оставят равнодушными всех сладкоежек и любителей вареной сгущенки.','6613921912.webp','<p>Пищевая ценность продукта: 4 белки 14.0 жиры 44 углеводы 320</p>'),(7,'Торт МОЙ\"Персиковый йогурт\", 650 г','650',360,'Классический нежный бисквит, легкий йогуртовый крем и муссовая персиковая начинка.','6249170049.webp','<p>Пищевая ценность продукта: 3.5 белки 8.5 жиры 37 углеводы 240 ккал</p>'),(8,'Пирожные ассорти Тарты по-французски с заварным кремом Mirel, 280 г','-mirel-280',260,'Хрустящие песочные тарталетки по оригинальной французской рецептуре с заварным кремом Patissiere и начинкой с кусочками фруктов и  ягодами.\r\nОсобенности продукта/ полезные добавки:\r\n●    Кусочки манго и пюре из маракуйи в начинке\r\n●    Ягоды вишни в начинке\r\n●    Настоящий заварной крем Patissiere\r\n●    Хрустящая песочная тарталетка по оригинальной рецептуре Pate Sablee','6613921932.webp','<p>Пищевая ценность продукта: 0 белки 0 жиры 0 углеводы 0 ккал</p>'),(9,'Пирожные Mirel Эклеры с заварным кремом, 5 шт., 250 г','mirel-5-250',205,'Классические эклеры с настоящим заварным кремом по оригинальному рецепту французских кондитерских с покрытием из бельгийского шоколада. Невероятно сливочный крем с нотками бурбонской ванили молниеносно окунет Вас в атмосферу Франции. Большое количество молока в рецептуре позволяет придать крему насыщенный сливочный вкус, а технология его приготовления – изысканную легкость.','6613921719.webp','<p>Пищевая ценность продукта: 6.6 белки 21.2 жиры 39.6 углеводы 375 ккал</p>'),(10,'Профитроли с пломбирным кремом, 180 г, Mirel','180-mirel',154,'Удивительно легкое и воздушное заварное тесто и крем с мороженым Пломбир.','6613921930.webp','<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,26,52);\">Пищевая ценность продукта: 6.3 белки 19.1 жиры 30.1 углеводы 318 ккал</span></p>');
/*!40000 ALTER TABLE `shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_item_category`
--

DROP TABLE IF EXISTS `shop_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_item_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_item_category_item_id_category_id_d7f3495b_uniq` (`item_id`,`category_id`),
  KEY `shop_item_category_category_id_6b340432_fk_shop_category_id` (`category_id`),
  CONSTRAINT `shop_item_category_category_id_6b340432_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_item_category_item_id_cc9d4819_fk_shop_item_id` FOREIGN KEY (`item_id`) REFERENCES `shop_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_item_category`
--

LOCK TABLES `shop_item_category` WRITE;
/*!40000 ALTER TABLE `shop_item_category` DISABLE KEYS */;
INSERT INTO `shop_item_category` VALUES (2,2,2),(3,3,2),(4,4,2),(5,5,3),(6,6,3),(7,7,3),(8,8,4),(9,9,4),(10,10,4);
/*!40000 ALTER TABLE `shop_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `ordered_date` datetime(6) NOT NULL,
  `ordered` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_user_id_00aba627_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_order_user_id_00aba627_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` VALUES (1,'2023-05-22 22:58:57.554222','2023-05-22 22:58:57.554222',1,2),(2,'2023-05-23 07:33:58.794469','2023-05-23 07:33:58.794469',1,2);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_items`
--

DROP TABLE IF EXISTS `shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `orderitem_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_order_items_order_id_orderitem_id_b94b293c_uniq` (`order_id`,`orderitem_id`),
  KEY `shop_order_items_orderitem_id_f47f0296_fk_shop_orderitem_id` (`orderitem_id`),
  CONSTRAINT `shop_order_items_order_id_e4e555d9_fk_shop_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `shop_order_items_orderitem_id_f47f0296_fk_shop_orderitem_id` FOREIGN KEY (`orderitem_id`) REFERENCES `shop_orderitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_items`
--

LOCK TABLES `shop_order_items` WRITE;
/*!40000 ALTER TABLE `shop_order_items` DISABLE KEYS */;
INSERT INTO `shop_order_items` VALUES (2,2,2);
/*!40000 ALTER TABLE `shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orderitem`
--

DROP TABLE IF EXISTS `shop_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_orderitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ordered` tinyint(1) NOT NULL,
  `item_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orderitem_item_id_f8b42fc5_fk_shop_item_id` (`item_id`),
  KEY `shop_orderitem_user_id_9172dcce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shop_orderitem_item_id_f8b42fc5_fk_shop_item_id` FOREIGN KEY (`item_id`) REFERENCES `shop_item` (`id`),
  CONSTRAINT `shop_orderitem_user_id_9172dcce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orderitem`
--

LOCK TABLES `shop_orderitem` WRITE;
/*!40000 ALTER TABLE `shop_orderitem` DISABLE KEYS */;
INSERT INTO `shop_orderitem` VALUES (2,0,2,2,1);
/*!40000 ALTER TABLE `shop_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shopp'
--

--
-- Dumping routines for database 'shopp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-23 11:40:07
