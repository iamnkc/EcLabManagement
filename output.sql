-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: elm
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add packet',1,'add_packet'),(2,'Can change packet',1,'change_packet'),(3,'Can delete packet',1,'delete_packet'),(4,'Can view packet',1,'view_packet'),(5,'Can add issue_detail',2,'add_issue_detail'),(6,'Can change issue_detail',2,'change_issue_detail'),(7,'Can delete issue_detail',2,'delete_issue_detail'),(8,'Can view issue_detail',2,'view_issue_detail'),(9,'Can add component',3,'add_component'),(10,'Can change component',3,'change_component'),(11,'Can delete component',3,'delete_component'),(12,'Can view component',3,'view_component'),(13,'Can add review',4,'add_review'),(14,'Can change review',4,'change_review'),(15,'Can delete review',4,'delete_review'),(16,'Can view review',4,'view_review'),(17,'Can add component_detail',5,'add_component_detail'),(18,'Can change component_detail',5,'change_component_detail'),(19,'Can delete component_detail',5,'delete_component_detail'),(20,'Can view component_detail',5,'view_component_detail'),(21,'Can add student',6,'add_student'),(22,'Can change student',6,'change_student'),(23,'Can delete student',6,'delete_student'),(24,'Can view student',6,'view_student'),(25,'Can add pre_order',7,'add_pre_order'),(26,'Can change pre_order',7,'change_pre_order'),(27,'Can delete pre_order',7,'delete_pre_order'),(28,'Can view pre_order',7,'view_pre_order'),(29,'Can add due',8,'add_due'),(30,'Can change due',8,'change_due'),(31,'Can delete due',8,'delete_due'),(32,'Can view due',8,'view_due'),(33,'Can add request',9,'add_request'),(34,'Can change request',9,'change_request'),(35,'Can delete request',9,'delete_request'),(36,'Can view request',9,'view_request'),(37,'Can add cart',10,'add_cart'),(38,'Can change cart',10,'change_cart'),(39,'Can delete cart',10,'delete_cart'),(40,'Can view cart',10,'view_cart'),(41,'Can add log entry',11,'add_logentry'),(42,'Can change log entry',11,'change_logentry'),(43,'Can delete log entry',11,'delete_logentry'),(44,'Can view log entry',11,'view_logentry'),(45,'Can add permission',12,'add_permission'),(46,'Can change permission',12,'change_permission'),(47,'Can delete permission',12,'delete_permission'),(48,'Can view permission',12,'view_permission'),(49,'Can add group',13,'add_group'),(50,'Can change group',13,'change_group'),(51,'Can delete group',13,'delete_group'),(52,'Can view group',13,'view_group'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add content type',15,'add_contenttype'),(58,'Can change content type',15,'change_contenttype'),(59,'Can delete content type',15,'delete_contenttype'),(60,'Can view content type',15,'view_contenttype'),(61,'Can add session',16,'add_session'),(62,'Can change session',16,'change_session'),(63,'Can delete session',16,'delete_session'),(64,'Can view session',16,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$tW3twz7UsUoZ$OQGAfo6qIGd9EjchkNEFnWZqFDDpxf/GfqlYKaOb4Cg=','2018-10-25 12:28:48.571448',1,'group3','','','',1,1,'2018-10-25 12:28:32.067498'),(2,'pbkdf2_sha256$120000$p6M6l8sPSC5G$ApZg6ST8th2nolKJHCntfwrvqF27p8Z1kXST9oNuhsQ=',NULL,0,'Raja_Yalla','','','',0,1,'2018-10-25 12:34:25.000000'),(3,'pbkdf2_sha256$120000$GAagNV9Xejau$rZtOLNCikc+3d1ZzH6LyK/Si8HfW2C1B6hshVe5LUgE=',NULL,0,'Surya','','','',0,1,'2018-10-25 12:36:01.000000'),(4,'pbkdf2_sha256$120000$XkJAZnB5u8mA$bWsW2RM9KlYOPptMjdueF5Bbmaut6xQ9Fab+I75WM44=',NULL,0,'iamkalyan','','','',0,1,'2018-10-25 12:36:32.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-25 12:34:25.829814','2','Raja_Yalla',1,'[{\"added\": {}}]',14,1),(2,'2018-10-25 12:35:06.411901','2','Raja_Yalla',2,'[]',14,1),(3,'2018-10-25 12:36:01.684238','3','Surya',1,'[{\"added\": {}}]',14,1),(4,'2018-10-25 12:36:07.606362','3','Surya',2,'[]',14,1),(5,'2018-10-25 12:36:32.623700','4','iamkalyan',1,'[{\"added\": {}}]',14,1),(6,'2018-10-25 12:36:36.681646','4','iamkalyan',2,'[]',14,1),(7,'2018-10-25 12:56:56.244987','S20160020160','Student object (S20160020160)',1,'[{\"added\": {}}]',6,1),(8,'2018-10-25 12:58:09.323934','S20160010020','Student object (S20160010020)',1,'[{\"added\": {}}]',6,1),(9,'2018-10-25 12:58:53.819089','s20160010094','Student object (s20160010094)',1,'[{\"added\": {}}]',6,1),(10,'2018-10-25 12:59:33.451595','1','component_detail object (1)',1,'[{\"added\": {}}]',5,1),(11,'2018-10-25 12:59:51.618473','2','component_detail object (2)',1,'[{\"added\": {}}]',5,1),(12,'2018-10-25 13:00:25.336798','3','component_detail object (3)',1,'[{\"added\": {}}]',5,1),(13,'2018-10-25 13:01:26.384171','6cef7e54-c042-45c8-a546-4297a2912e3a','component object (6cef7e54-c042-45c8-a546-4297a2912e3a)',1,'[{\"added\": {}}]',3,1),(14,'2018-10-25 13:01:37.780433','ec909029-d5c8-49e2-a54c-bf1a1057c331','component object (ec909029-d5c8-49e2-a54c-bf1a1057c331)',1,'[{\"added\": {}}]',3,1),(15,'2018-10-25 13:01:48.023028','a431a9c3-8a5e-4a0c-bacf-345e4eb6457d','component object (a431a9c3-8a5e-4a0c-bacf-345e4eb6457d)',1,'[{\"added\": {}}]',3,1),(16,'2018-10-25 13:02:00.275279','42c9b0d1-c27e-4a6a-96fe-2aa2ae5e4feb','component object (42c9b0d1-c27e-4a6a-96fe-2aa2ae5e4feb)',1,'[{\"added\": {}}]',3,1),(17,'2018-10-25 13:02:10.407828','551a2c2c-bfdb-4d27-a967-050feab3347d','component object (551a2c2c-bfdb-4d27-a967-050feab3347d)',1,'[{\"added\": {}}]',3,1),(18,'2018-10-25 13:02:21.782915','dd6f642b-da68-4156-bf34-395285613e9a','component object (dd6f642b-da68-4156-bf34-395285613e9a)',1,'[{\"added\": {}}]',3,1),(19,'2018-10-25 13:03:32.479475','1','issue_detail object (1)',1,'[{\"added\": {}}]',2,1),(20,'2018-10-25 13:05:48.405241','1','packet object (1)',1,'[{\"added\": {}}]',1,1),(21,'2018-10-25 13:06:01.204174','2','packet object (2)',1,'[{\"added\": {}}]',1,1),(22,'2018-10-25 13:07:57.405433','53bc8306-c8e1-450e-b49f-f1681f9011b9','component object (53bc8306-c8e1-450e-b49f-f1681f9011b9)',1,'[{\"added\": {}}]',3,1),(23,'2018-10-25 13:08:46.547480','3','packet object (3)',1,'[{\"added\": {}}]',1,1),(24,'2018-10-25 13:09:14.008037','1','cart object (1)',1,'[{\"added\": {}}]',10,1),(25,'2018-10-25 13:09:33.507781','2','cart object (2)',1,'[{\"added\": {}}]',10,1),(26,'2018-10-25 13:09:45.798468','3','cart object (3)',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'admin','logentry'),(13,'auth','group'),(12,'auth','permission'),(14,'auth','user'),(15,'contenttypes','contenttype'),(10,'eclabmanagement','cart'),(3,'eclabmanagement','component'),(5,'eclabmanagement','component_detail'),(8,'eclabmanagement','due'),(2,'eclabmanagement','issue_detail'),(1,'eclabmanagement','packet'),(7,'eclabmanagement','pre_order'),(9,'eclabmanagement','request'),(4,'eclabmanagement','review'),(6,'eclabmanagement','student'),(16,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-25 12:27:05.880649'),(2,'auth','0001_initial','2018-10-25 12:27:13.045587'),(3,'admin','0001_initial','2018-10-25 12:27:14.650588'),(4,'admin','0002_logentry_remove_auto_add','2018-10-25 12:27:14.693425'),(5,'admin','0003_logentry_add_action_flag_choices','2018-10-25 12:27:14.737920'),(6,'contenttypes','0002_remove_content_type_name','2018-10-25 12:27:15.776294'),(7,'auth','0002_alter_permission_name_max_length','2018-10-25 12:27:15.876986'),(8,'auth','0003_alter_user_email_max_length','2018-10-25 12:27:15.988711'),(9,'auth','0004_alter_user_username_opts','2018-10-25 12:27:16.031528'),(10,'auth','0005_alter_user_last_login_null','2018-10-25 12:27:16.512261'),(11,'auth','0006_require_contenttypes_0002','2018-10-25 12:27:16.545798'),(12,'auth','0007_alter_validators_add_error_messages','2018-10-25 12:27:16.588710'),(13,'auth','0008_alter_user_username_max_length','2018-10-25 12:27:16.947520'),(14,'auth','0009_alter_user_last_name_max_length','2018-10-25 12:27:17.059122'),(15,'eclabmanagement','0001_initial','2018-10-25 12:27:31.985353'),(16,'sessions','0001_initial','2018-10-25 12:27:32.507113');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('zea259zlws32d2wzkt2cagghsyuwfjsd','MTBhMjJiMzEzMzY3Njc4NGY2MDcwMDYxMDNhNjcwM2E4Nzk3YjdkYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkyOGI3MDMyMzg2YzM1MGQ2YjdjZmU0OWNmNjViMzRkZTAwYTE0ZTYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-11-08 12:28:48.605207');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_cart`
--

DROP TABLE IF EXISTS `eclabmanagement_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `comp_id_id` int(11) NOT NULL,
  `roll_no_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eclabmanagement_cart_comp_id_id_046cfbb2_fk_eclabmana` (`comp_id_id`),
  KEY `eclabmanagement_cart_roll_no_id_f7438d00_fk_eclabmana` (`roll_no_id`),
  CONSTRAINT `eclabmanagement_cart_comp_id_id_046cfbb2_fk_eclabmana` FOREIGN KEY (`comp_id_id`) REFERENCES `eclabmanagement_component_detail` (`comp_id`),
  CONSTRAINT `eclabmanagement_cart_roll_no_id_f7438d00_fk_eclabmana` FOREIGN KEY (`roll_no_id`) REFERENCES `eclabmanagement_student` (`roll_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_cart`
--

LOCK TABLES `eclabmanagement_cart` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_cart` DISABLE KEYS */;
INSERT INTO `eclabmanagement_cart` VALUES (1,1,1,'s20160010094'),(2,2,2,'s20160010094'),(3,30,3,'s20160010094');
/*!40000 ALTER TABLE `eclabmanagement_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_component`
--

DROP TABLE IF EXISTS `eclabmanagement_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_component` (
  `uniq_id` varchar(40) NOT NULL,
  `status` varchar(200) NOT NULL,
  `comp_id_id` int(11) NOT NULL,
  PRIMARY KEY (`uniq_id`),
  KEY `eclabmanagement_comp_comp_id_id_8dc5ad76_fk_eclabmana` (`comp_id_id`),
  CONSTRAINT `eclabmanagement_comp_comp_id_id_8dc5ad76_fk_eclabmana` FOREIGN KEY (`comp_id_id`) REFERENCES `eclabmanagement_component_detail` (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_component`
--

LOCK TABLES `eclabmanagement_component` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_component` DISABLE KEYS */;
INSERT INTO `eclabmanagement_component` VALUES ('42c9b0d1-c27e-4a6a-96fe-2aa2ae5e4feb','not_issued',2),('53bc8306-c8e1-450e-b49f-f1681f9011b9','not_issued',3),('551a2c2c-bfdb-4d27-a967-050feab3347d','not_issued',2),('6cef7e54-c042-45c8-a546-4297a2912e3a','not_issued',1),('a431a9c3-8a5e-4a0c-bacf-345e4eb6457d','not_issued',1),('dd6f642b-da68-4156-bf34-395285613e9a','not_issued',2),('ec909029-d5c8-49e2-a54c-bf1a1057c331','not_issued',1);
/*!40000 ALTER TABLE `eclabmanagement_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_component_detail`
--

DROP TABLE IF EXISTS `eclabmanagement_component_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_component_detail` (
  `comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(200) NOT NULL,
  `count` int(11) NOT NULL,
  `type_of_comp` varchar(200) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_component_detail`
--

LOCK TABLES `eclabmanagement_component_detail` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_component_detail` DISABLE KEYS */;
INSERT INTO `eclabmanagement_component_detail` VALUES (1,'raspberrypi_3',3,'raspberry',1,3500),(2,'raspberrypi_2',3,'raspberry',1,2500),(3,'10k_ohm',100,'resistor',0,5);
/*!40000 ALTER TABLE `eclabmanagement_component_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_due`
--

DROP TABLE IF EXISTS `eclabmanagement_due`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_due` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `comp_id_id` int(11) NOT NULL,
  `packet_id_id` int(11) NOT NULL,
  `roll_no_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eclabmanagement_due_comp_id_id_627e2aee_fk_eclabmana` (`comp_id_id`),
  KEY `eclabmanagement_due_packet_id_id_c8592526_fk_eclabmana` (`packet_id_id`),
  KEY `eclabmanagement_due_roll_no_id_63de6184_fk_eclabmana` (`roll_no_id`),
  CONSTRAINT `eclabmanagement_due_comp_id_id_627e2aee_fk_eclabmana` FOREIGN KEY (`comp_id_id`) REFERENCES `eclabmanagement_component_detail` (`comp_id`),
  CONSTRAINT `eclabmanagement_due_packet_id_id_c8592526_fk_eclabmana` FOREIGN KEY (`packet_id_id`) REFERENCES `eclabmanagement_packet` (`id`),
  CONSTRAINT `eclabmanagement_due_roll_no_id_63de6184_fk_eclabmana` FOREIGN KEY (`roll_no_id`) REFERENCES `eclabmanagement_student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_due`
--

LOCK TABLES `eclabmanagement_due` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_due` DISABLE KEYS */;
/*!40000 ALTER TABLE `eclabmanagement_due` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_issue_detail`
--

DROP TABLE IF EXISTS `eclabmanagement_issue_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_issue_detail` (
  `packet_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_date` date NOT NULL,
  `returned_date` date DEFAULT NULL,
  `no_of_days` int(11) NOT NULL,
  `fine_p_day` int(11) NOT NULL,
  `roll_no_id` varchar(15) NOT NULL,
  PRIMARY KEY (`packet_id`),
  KEY `eclabmanagement_issu_roll_no_id_910adb49_fk_eclabmana` (`roll_no_id`),
  CONSTRAINT `eclabmanagement_issu_roll_no_id_910adb49_fk_eclabmana` FOREIGN KEY (`roll_no_id`) REFERENCES `eclabmanagement_student` (`roll_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_issue_detail`
--

LOCK TABLES `eclabmanagement_issue_detail` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_issue_detail` DISABLE KEYS */;
INSERT INTO `eclabmanagement_issue_detail` VALUES (1,'2018-10-25',NULL,20,2,'S20160020160');
/*!40000 ALTER TABLE `eclabmanagement_issue_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_packet`
--

DROP TABLE IF EXISTS `eclabmanagement_packet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_packet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `packet_id_id` int(11) NOT NULL,
  `uniq_id_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eclabmanagement_pack_packet_id_id_647e1c06_fk_eclabmana` (`packet_id_id`),
  KEY `eclabmanagement_pack_uniq_id_id_fd329cb3_fk_eclabmana` (`uniq_id_id`),
  CONSTRAINT `eclabmanagement_pack_packet_id_id_647e1c06_fk_eclabmana` FOREIGN KEY (`packet_id_id`) REFERENCES `eclabmanagement_issue_detail` (`packet_id`),
  CONSTRAINT `eclabmanagement_pack_uniq_id_id_fd329cb3_fk_eclabmana` FOREIGN KEY (`uniq_id_id`) REFERENCES `eclabmanagement_component` (`uniq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_packet`
--

LOCK TABLES `eclabmanagement_packet` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_packet` DISABLE KEYS */;
INSERT INTO `eclabmanagement_packet` VALUES (1,1,1,'42c9b0d1-c27e-4a6a-96fe-2aa2ae5e4feb'),(2,1,1,'a431a9c3-8a5e-4a0c-bacf-345e4eb6457d'),(3,10,1,'53bc8306-c8e1-450e-b49f-f1681f9011b9');
/*!40000 ALTER TABLE `eclabmanagement_packet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_pre_order`
--

DROP TABLE IF EXISTS `eclabmanagement_pre_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_pre_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `issued_packet_id` varchar(20) NOT NULL,
  `comp_id_id` int(11) NOT NULL,
  `roll_no_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eclabmanagement_pre__comp_id_id_0e8e1295_fk_eclabmana` (`comp_id_id`),
  KEY `eclabmanagement_pre__roll_no_id_d73a2425_fk_eclabmana` (`roll_no_id`),
  CONSTRAINT `eclabmanagement_pre__comp_id_id_0e8e1295_fk_eclabmana` FOREIGN KEY (`comp_id_id`) REFERENCES `eclabmanagement_component_detail` (`comp_id`),
  CONSTRAINT `eclabmanagement_pre__roll_no_id_d73a2425_fk_eclabmana` FOREIGN KEY (`roll_no_id`) REFERENCES `eclabmanagement_student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_pre_order`
--

LOCK TABLES `eclabmanagement_pre_order` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_pre_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `eclabmanagement_pre_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_request`
--

DROP TABLE IF EXISTS `eclabmanagement_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_comp` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `approval_status` varchar(200) NOT NULL,
  `roll_no_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eclabmanagement_requ_roll_no_id_9918aafa_fk_eclabmana` (`roll_no_id`),
  CONSTRAINT `eclabmanagement_requ_roll_no_id_9918aafa_fk_eclabmana` FOREIGN KEY (`roll_no_id`) REFERENCES `eclabmanagement_student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_request`
--

LOCK TABLES `eclabmanagement_request` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `eclabmanagement_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_review`
--

DROP TABLE IF EXISTS `eclabmanagement_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avg_rating` double NOT NULL,
  `no_of_reviews` int(11) NOT NULL,
  `comp_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eclabmanagement_revi_comp_id_id_f51eece5_fk_eclabmana` (`comp_id_id`),
  CONSTRAINT `eclabmanagement_revi_comp_id_id_f51eece5_fk_eclabmana` FOREIGN KEY (`comp_id_id`) REFERENCES `eclabmanagement_component_detail` (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_review`
--

LOCK TABLES `eclabmanagement_review` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `eclabmanagement_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eclabmanagement_student`
--

DROP TABLE IF EXISTS `eclabmanagement_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eclabmanagement_student` (
  `roll_no` varchar(15) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `regis_year` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `curr_year` int(11) NOT NULL,
  `regis_deg` varchar(20) NOT NULL,
  `regis_deg_dur` int(11) NOT NULL,
  `curr_sem` int(11) NOT NULL,
  `blood_grp` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `eclabmanagement_student_user_id_579d0fab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eclabmanagement_student`
--

LOCK TABLES `eclabmanagement_student` WRITE;
/*!40000 ALTER TABLE `eclabmanagement_student` DISABLE KEYS */;
INSERT INTO `eclabmanagement_student` VALUES ('S20160010020','Pawan Kalyan','','Dakkata',2016,'M',3,'B.Tech',3,5,'B-','pawankalyan.d16@iiits.in','9585756555',4),('s20160010094','Surya Teja','','Achanta',2016,'M',3,'B.Tech',3,5,'B-','suryateja.a16@iiits.in','9181716151',3),('S20160020160','Raja','','Yalla',2016,'M',3,'B.Tech',3,5,'B-','rajayalla98@gmail.com','7995601638',2);
/*!40000 ALTER TABLE `eclabmanagement_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-25 21:09:47
