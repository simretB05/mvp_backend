-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mvp
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.13-MariaDB

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
-- Table structure for table `dorm_room`
--

DROP TABLE IF EXISTS `dorm_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dorm_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_number` varchar(100) DEFAULT NULL,
  `floor_name` varchar(100) DEFAULT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `facilities` varchar(7000) NOT NULL,
  `avilablity_status` tinyint(1) DEFAULT NULL,
  `monthly_rent` decimal(10,0) DEFAULT NULL,
  `dormitory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dorm_room_un` (`room_number`),
  KEY `dorm_room_FK` (`dormitory_id`),
  CONSTRAINT `dorm_room_FK` FOREIGN KEY (`dormitory_id`) REFERENCES `dormitory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dorm_room_check` CHECK (`room_type` = 'studio unfurnished' or `room_type` = 'studio furnished' or `room_type` = '1 bed unfurnished' or `room_type` = '1 bed furnished' or `room_type` = '2 bed unfurnished ' or `room_type` = '2 bed furnished' or `room_type` = '3 bed furnished' or `room_type` = '3 bed unfurnished' or `room_type` = 'family unfurnished' or `room_type` = 'family furnished'),
  CONSTRAINT `dorm_room_capacity_check` CHECK (`capacity` = 1 or `capacity` = 2 or `capacity` = 3 or `capacity` = 4 or `capacity` = 6)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dorm_room`
--

LOCK TABLES `dorm_room` WRITE;
/*!40000 ALTER TABLE `dorm_room` DISABLE KEYS */;
INSERT INTO `dorm_room` VALUES (204,'2','AB2','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',1,345,250),(205,'4','AB4','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',0,345,250),(206,'3','AB3','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',1,345,250),(207,'5','AB5','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',1,345,250),(208,'7','B43','2 bed unfurnished',2,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\"]',1,429,250),(209,'8','B48','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\"]',0,629,250),(210,'98','98F','family unfurnished',6,'[\"bed\",\"kitchen\",\"laundry\"]',1,890,250),(211,'45','45F','family unfurnished',6,'[\"bed\",\"kitchen\",\"laundry\"]',1,890,250);
/*!40000 ALTER TABLE `dorm_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `facilities` varchar(700) DEFAULT NULL,
  `address` varchar(600) DEFAULT NULL,
  `university_id` int(10) unsigned NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dormitory_un` (`name`),
  KEY `dormitory_FK` (`university_id`),
  CONSTRAINT `dormitory_FK` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (248,'North','[\"bed\",\"kitchen\",\"gym\",\"laundry\"]','12323 6street 67ave',32,'Calgary','AB','T0G','Canada'),(249,'willow tree','[\"bed\",\"kitchen\",\"gym\",\"laundry\"]','12323 6street 67ave',32,'Calgary','AB','T0G','Canada'),(250,'Gamers Ranch','[\"bed\",\"kitchen\",\"gym\",\"laundry\"]','12323 6street 67ave',32,'Calgary','AB','T0G','Canada');
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_image`
--

DROP TABLE IF EXISTS `dormitory_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `images` varchar(7000) DEFAULT NULL,
  `dormitory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dormitory_image_FK_1` (`dormitory_id`),
  CONSTRAINT `dormitory_image_FK_1` FOREIGN KEY (`dormitory_id`) REFERENCES `dormitory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_image`
--

LOCK TABLES `dormitory_image` WRITE;
/*!40000 ALTER TABLE `dormitory_image` DISABLE KEYS */;
INSERT INTO `dormitory_image` VALUES (258,'65e038ae18144201bca4f7139bd306fc.jpg',248),(259,'2d0118586cc54fa1a42f2f643ecde46b.jpg',248),(260,'842fe962941848968905fe4a1e6e91d5.jpg',248),(261,'13d414bfb2e441bdb1f17d17187b8199.jpg',248),(262,'d6b2a943953e475caef1cf5f31c2bde2.jpg',249),(263,'892417a740a546228279d90217ed9fdb.jpg',249),(264,'e413c95702e24dc19872640d79575149.jpg',249),(265,'0a290d0dc998463b9c59d5ae138c0ccf.jpg',249),(266,'da7955352e3247ad964b032db11637cb.jpg',250),(267,'2da1e3b40bfd4e9cb399035739dbc711.jpg',250),(268,'820b3abe4dbc4bad9e99a27e42165b0b.jpg',250),(269,'2ca914c93706483d919a0510ff718ee0.jpg',250);
/*!40000 ALTER TABLE `dormitory_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_kind` varchar(100) DEFAULT NULL,
  `dormitory_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facility_table_FK` (`dormitory_id`),
  CONSTRAINT `facility_table_FK` FOREIGN KEY (`dormitory_id`) REFERENCES `dormitory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=952 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (940,'bed',248),(941,'kitchen',248),(942,'gym',248),(943,'laundry',248),(944,'bed',249),(945,'kitchen',249),(946,'gym',249),(947,'laundry',249),(948,'bed',250),(949,'kitchen',250),(950,'gym',250),(951,'laundry',250);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room-facility`
--

DROP TABLE IF EXISTS `room-facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room-facility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_kind` varchar(100) DEFAULT NULL,
  `room_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_facility_FK` (`room_id`),
  CONSTRAINT `room_facility_FK` FOREIGN KEY (`room_id`) REFERENCES `dorm_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=789 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room-facility`
--

LOCK TABLES `room-facility` WRITE;
/*!40000 ALTER TABLE `room-facility` DISABLE KEYS */;
INSERT INTO `room-facility` VALUES (757,'bed',204),(758,'kitchen',204),(759,'wifi',204),(760,'laundry',204),(761,'bed',205),(762,'kitchen',205),(763,'wifi',205),(764,'laundry',205),(765,'bed',206),(766,'kitchen',206),(767,'wifi',206),(768,'laundry',206),(769,'bed',207),(770,'kitchen',207),(771,'wifi',207),(772,'laundry',207),(773,'bed',208),(774,'kitchen',208),(775,'gym',208),(776,'laundry',208),(777,'wifi',208),(778,'bed',209),(779,'kitchen',209),(780,'gym',209),(781,'laundry',209),(782,'wifi',209),(783,'bed',210),(784,'kitchen',210),(785,'laundry',210),(786,'bed',211),(787,'kitchen',211),(788,'laundry',211);
/*!40000 ALTER TABLE `room-facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_images`
--

DROP TABLE IF EXISTS `room_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `images` varchar(7000) DEFAULT NULL,
  `room_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_images_FK` (`room_id`),
  CONSTRAINT `room_images_FK` FOREIGN KEY (`room_id`) REFERENCES `dorm_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_images`
--

LOCK TABLES `room_images` WRITE;
/*!40000 ALTER TABLE `room_images` DISABLE KEYS */;
INSERT INTO `room_images` VALUES (499,'5cb2265438fd40e398c0802f68087775.jpg',204),(500,'bbdb159e2364449fa835af2fcc89d127.jpg',204),(501,'67864bc4e01148f4805799030881f625.jpg',204),(502,'f471b6ffcfae4c00aea2e4d2d410383a.jpg',204),(503,'b3acbcd99ee5411bb3c1cd348d147577.jpg',205),(504,'06c742220bd8492286cbea3bfc6ef2ef.jpg',205),(505,'5f67b27e3f244af09782b8fbefab73d9.jpg',205),(506,'a88d9686b803471a9e8cdcb4af9b2ace.jpg',205),(507,'e274e9c58c284e54852d83d27574534e.jpg',206),(508,'318b286e42cb44318fe934bb123b6f93.jpg',206),(509,'22284bca618143048970132f094954f2.jpg',206),(510,'6596fa309d324a40bff8cced8da12341.jpg',206),(511,'fc2c556eed1f4069b4b4326ab6c9d39b.jpg',207),(512,'cd4503afe81244f5bd2658bc328954b2.jpg',207),(513,'17535dc84d624f568f86d1edd8f6e56c.jpg',207),(514,'a6ee1dadfd324e188865f78a782fdd83.jpg',207),(515,'c1d48f4daa164f87848015337f0baf1f.jpg',208),(516,'034c154a06294c258a53ec9b8779c838.jpg',208),(517,'96199f630df24e4fa40ecaddf92e45e7.jpg',208),(518,'90ad58a5cd4f452e8df4d05281c1b58f.jpg',208),(519,'6c4fa5655abe48e4b5f942f3d59ab127.jpg',209),(520,'f219ead2bf034045b0985ec902a74d50.jpg',209),(521,'be51ea0050d843ce9d9646b153e1dd9d.jpg',209),(522,'92f07959c1dc47238000ae500796d80a.jpg',209),(523,'824d492a97fe4bb79e979d1180d77349.jpg',210),(524,'b72ec8d5c14c4d728a810eeb26745d38.jpg',210),(525,'3e7820ef5f0a413d8360a9d5d9fe6531.jpg',210),(526,'905f3a08ee5943a8a8f21902d6bfe98f.jpg',210),(527,'2c2b8e14c20c492fb8d9f0267ab54b28.jpg',211),(528,'f7a353bb7e1a4d6cb47b765135303159.jpg',211),(529,'4cfcb83f83cb42f89b8a7137ce2cb536.jpg',211),(530,'b4a2cdb75386475489b8dc40f6f81bc2.jpg',211);
/*!40000 ALTER TABLE `room_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `filename` varchar(600) DEFAULT NULL,
  `address` varchar(600) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `website` varchar(600) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `salt` varchar(150) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `university_un` (`token`),
  UNIQUE KEY `university_un_name` (`name`),
  UNIQUE KEY `university_un_email` (`email`),
  CONSTRAINT `university_check_city` CHECK (`city` in ('Airdrie','Athabasca','Banff','Barrhead','Bashaw','Beaumont','Beaverlodge','Bentley','Black Diamond','Blackfalds','Blairmore','Bon Accord','Bonnyville','Bow Island','Bowden','Boyle','Bragg Creek','Brooks','Calgary','Calmar','Camrose','Canmore','Cardston','Carstairs','Chestermere','Clairmont','Claresholm','Cochrane','Cold Lake','Coronation','Crossfield','Devon','Didsbury','Drayton Valley','Drumheller','Edmonton','Edson','Elk Point','Fairview','Falher','Fort Assiniboine','Fort Macleod','Fort McMurray','Fort Saskatchewan','Fox Creek','Gibbons','Grande Cache','Grande Prairie','Grimshaw','Hanna','High Level','High Prairie','High River','Hinton','Innisfail','Irricana','Jasper','Killam','La Crete','Lacombe','Lamont','Leduc','Legal','Lethbridge','Lloydminster','Manning','Mayerthorpe','Medicine Hat','Millet','Morinville','Nanton','Okotoks','Olds','Onoway','Oyen','Peace River','Penhold','Picture Butte','Pincher Creek','Ponoka','Provost','Raymond','Red Deer','Redcliff','Rimbey','Rocky Mountain House','Saint Paul','Sexsmith','Sherwood Park','Slave Lake','Smoky Lake','Spirit River','Spruce Grove','St. Albert','Stettler','Stony Plain','Strathmore','Sundre','Swan Hills','Sylvan Lake','Taber','Thorsby','Three Hills','Tofield','Trochu','Turner Valley','Two Hills','Valleyview','Vauxhall','Vegreville','Vermilion','Viking','Vulcan','Wainwright','Warburg','Wembley','Westlock','Wetaskiwin','Whitecourt','Zama City'))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (32,'University of Calgary','this is university of Calgary','25ad4fb68ce442f887f0870d52cb78d3.jpg','123 1street 2 ave','Calgary','www.uofcalgary.ca','2345576986','contactuofcalgary@gmail,com','*18EC43D3017F82C470D129964CE7B7831093094F','f381071e-006d-4d67-982b-a06d3d2dfb7d','2024-01-16','eacc1670-4999-4a9d-8202-bd04825ab7b3','AB','T0E','Canada');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_session`
--

DROP TABLE IF EXISTS `university_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `university_id` int(10) unsigned NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `university_session_un` (`token`),
  KEY `university_session_FK` (`university_id`),
  CONSTRAINT `university_session_FK` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_session`
--

LOCK TABLES `university_session` WRITE;
/*!40000 ALTER TABLE `university_session` DISABLE KEYS */;
INSERT INTO `university_session` VALUES (490,32,'f381071e-006d-4d67-982b-a06d3d2dfb7d');
/*!40000 ALTER TABLE `university_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `filename` varchar(600) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `salt` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_un_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating` (
  `room_id` int(10) unsigned DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `message` varchar(900) DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_rating_un` (`user_email`),
  KEY `user_rating_FK` (`room_id`),
  CONSTRAINT `user_rating_FK` FOREIGN KEY (`room_id`) REFERENCES `dorm_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating_info`
--

DROP TABLE IF EXISTS `user_rating_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating_info` (
  `username` varchar(100) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `user_rating_code` varchar(100) DEFAULT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_rating_info_un` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating_info`
--

LOCK TABLES `user_rating_info` WRITE;
/*!40000 ALTER TABLE `user_rating_info` DISABLE KEYS */;
INSERT INTO `user_rating_info` VALUES ('simret',300,'simretpaulos@gmail.com','d6ac8e3c-f8f8-40c0-aaf1-e32b6bab91da',202),('simret',301,'happysimret@gmail.com','a423d70e-2f48-412f-bee8-73568199f9e9',202),('Rose',305,'rose@gmail.com','0c30f68b-893a-4bc3-a8b7-d8d52e14cec8',203),('Rose',308,'rospoe@gmail.com','2801e074-a215-4613-9f29-9ec60b998d95',203),('roszy',309,'roszy@gmail.com','22202373-33b7-4246-bd66-09a28fe3b5b0',202),('Simret',310,'simret4@gmail.com','f86ebc01-e13a-42bc-bc22-98c7ad2c53cb',203),('Hanna',311,'hanna@gmail.com','8f29fa25-399d-490c-94ae-9e1e89382940',203),('yoni Boos',312,'yonibosse@gmail.com','c276f474-6a86-49c4-b3f1-572681edaa35',203),('simvghcg',313,'simret@gmail.com','21a71e64-142d-4281-bbbd-46b37999b30f',202),('petter',314,'petterfg2@gmail.com','1b9a2f5b-785b-4ef9-bd52-c8f7bc7fae42',203);
/*!40000 ALTER TABLE `user_rating_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_session_un` (`token`),
  KEY `user_session_FK` (`user_id`),
  CONSTRAINT `user_session_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mvp'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_dormitory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dormitory`(id_input int unsigned)
    MODIFIES SQL DATA
begin
	delete from dormitory  where id=id_input;
	select row_count();
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_room`(id_input int unsigned)
    MODIFIES SQL DATA
begin
	delete from dorm_room  where id=id_input;
	select row_count();
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_university` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_university`(email_input varchar(100),password_input varchar(150),token_input varchar(100))
    MODIFIES SQL DATA
begin
	 declare uniSalt varchar(150);
     select  salt into uniSalt from university  where  email=email_input and token=token_input;
	 delete from university  where university.password = PASSWORD(CONCAT(password_input,uniSalt));
	 select row_count();
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(email_input varchar(100),password_input varchar(150),token_input varchar(100))
    MODIFIES SQL DATA
begin
	 declare userSalt varchar(150);
     select  salt into userSalt from user  where  email=email_input and token=token_input;
	 delete from user  where user.password = PASSWORD(CONCAT(password_input,userSalt));
	 select row_count();
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_dormitory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_dormitory`(university_id_input int unsigned)
begin
	 select id, convert( name using 'utf8') as name, convert( address  using 'utf8') as address , convert(city  using 'utf8')as city, convert(state  using 'utf8')as state, convert(zip  using 'utf8')as zip,
    convert(country  using 'utf8')as country,convert( facilities  using 'utf8') as facilities 
	 from dormitory where dormitory.university_id =university_id_input 
	 order by id desc ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_rating`()
begin
	
   select  id, room_id, rating, convert(username  USING 'utf8') AS username ,convert(user_email using 'utf8') as user_email,convert(message using 'utf8') as message 
    from user_rating ur order by id desc;   
   
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_rooms`(dormitory_id_input int unsigned)
begin
	 select id ,convert(room_number using 'utf8') as room_number, convert( floor_name using 'utf8') as floor_name, convert( room_type using 'utf8') as room_type , capacity,avilablity_status, monthly_rent ,dormitory_id,convert( facilities  using 'utf8') as facilities 
	 from dorm_room where dorm_room.dormitory_id =dormitory_id_input 
	 order by id  desc ;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_university` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_university`()
begin
	 select id, convert( name using 'utf8') as name, convert( address  using 'utf8') as address , convert(city  using 'utf8')as city, convert(state  using 'utf8')as state, convert(zip  using 'utf8')as zip,
    convert(country  using 'utf8')as country
	 from university
	 order by id desc ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_uni_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_uni_image`()
begin
	 select id, convert( filename  using 'utf8') as filename 
     from university
	 order by id desc ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_dormitory_images` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dormitory_images`()
begin
	 select id ,dormitory_id  ,convert(images using 'utf8') as images 
	 from dormitory_image ;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_every_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_every_room`()
begin
	 select id ,convert(room_number using 'utf8') as room_number, convert( floor_name using 'utf8') as floor_name, convert( room_type using 'utf8') as room_type , capacity,avilablity_status, monthly_rent ,dormitory_id,convert( facilities  using 'utf8') as facilities 
	 from dorm_room  order by id  desc ;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_rooms_image` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_rooms_image`()
begin
	 select id ,room_id  ,convert(images using 'utf8') as images 
	 from room_images
	 order by id  desc ;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_universty_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_universty_info`(university_id_input int unsigned)
begin
	select  id,   CONVERT(name USING 'utf8') AS name,
    CONVERT(bio USING 'utf8') AS bio,
    CONVERT(filename USING 'utf8') AS filename,
    CONVERT(address USING 'utf8') AS address,
    CONVERT(city USING 'utf8') AS city,
    CONVERT(website USING 'utf8') AS website,
    CONVERT(phone_number USING 'utf8') AS phone_number,
    CONVERT(state USING 'utf8') AS state,
    CONVERT(zip USING 'utf8') AS zip,
    CONVERT(country USING 'utf8') AS country,
    CONVERT(email USING 'utf8') AS email,
    CONVERT(password USING 'utf8') AS password

	from university u where  u.id = university_id_input; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_new_dormitory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_new_dormitory`(
        name_input varchar(80),
        address_input varchar(600),
	    city_input varchar(100),
	    state_input varchar(20),
	    zip_input varchar(100),
	    country_input varchar(100),
	    facilities_array_input varchar(800),
        images_array_input varchar(7000),
	    token_input varchar(100))
begin
	declare dormitoryId int unsigned;
    declare universityId int unsigned;
    declare ImageInput varchar(7000) default '';
    declare rows_inserted int unsigned  default 0;
    declare  facilityInput  varchar(100) default '';
   
	select id into universityId from university  where university.token=token_input ;

	insert into dormitory(name,address,city,state,zip,country,facilities,university_id)
	values(name_input,address_input,city_input,state_input,zip_input,country_input,facilities_array_input,universityId);
    
    select  d.id ,convert( d.name using 'utf8')as name, convert(d.address  using 'utf8')as address ,
    convert(d.city  using 'utf8')as city, convert(d.state  using 'utf8')as state, convert(d.zip  using 'utf8')as zip,
    convert(d.country  using 'utf8')as country
    from  dormitory d  inner join university u  on u.id =universityId where u.token =token_input;
    
   	select id into dormitoryId from dormitory where  dormitory.id =last_insert_id() ;

    set facilities_array_input = replace(facilities_array_input, '[','');
    set facilities_array_input = replace(facilities_array_input, ']','');
    set facilities_array_input = replace(facilities_array_input, '"','');
    set facilities_array_input = replace(facilities_array_input, '"','');
   
    while length(facilities_array_input)>0 do
        set facilityInput =  
            trim(substring_index(facilities_array_input, ',', 1));
           
        set facilities_array_input=
              trim(substring(facilities_array_input, length(facilityInput)+2));
             
	     insert into facility(facility_kind,dormitory_id) values(facilityInput,dormitoryId);
	     set rows_inserted = rows_inserted +1;
     end while;
     
    set images_array_input = replace(images_array_input, '[','');
    set images_array_input = replace(images_array_input, ']','');
    set images_array_input= replace(images_array_input, '"','');
    set images_array_input = replace(images_array_input, '"','');
   
    while length(images_array_input)>0 do
        set  ImageInput =  
            trim(substring_index(images_array_input, ',', 1));
           
        set images_array_input=
              trim(substring(images_array_input, length(ImageInput)+2));
             
	     insert into `dormitory_image`  (images,dormitory_id) values(ImageInput,dormitoryId);
	     set rows_inserted = rows_inserted +1;
     end while;
    
    select rows_inserted;
        
   
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insret_new_room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insret_new_room`(
    room_number_input varchar(100), 
    floor_name_input varchar(100), 
    room_type_input varchar(100),
    capacity_input int unsigned,
    avilablity_status_input bool,
    monthly_rent_input decimal,
    facilities_array_input varchar(7000),
    images_array_input varchar(7000),
    dormitory_id_input int unsigned)
    MODIFIES SQL DATA
begin
    declare rows_inserted int unsigned  default 0;
    declare facilityInput varchar(100) default '';
    declare ImageInput varchar(7000) default '';
    declare roomId int unsigned;
    declare dormitoryId int unsigned; 
    
    select id into dormitoryId  from dormitory  where dormitory.id=dormitory_id_input; 
 
   
    insert into `dorm_room`(room_number,floor_name,room_type,capacity,avilablity_status,monthly_rent,facilities,dormitory_id) 
    values(room_number_input,floor_name_input,room_type_input,capacity_input,avilablity_status_input,monthly_rent_input,facilities_array_input,dormitoryId);

    select id into roomId from `dorm_room` where  id=last_insert_id() ;
   
    set facilities_array_input = replace(facilities_array_input, '[','');
    set facilities_array_input = replace(facilities_array_input, ']','');
    set facilities_array_input = replace(facilities_array_input, '"','');
    set facilities_array_input = replace(facilities_array_input, '"','');
   
    while length(facilities_array_input)>0 do
        set facilityInput =  
            trim(substring_index(facilities_array_input, ',', 1));
           
        set facilities_array_input=
              trim(substring(facilities_array_input, length(facilityInput)+2));
             
	     insert into `room-facility` (facility_kind,room_id) values(facilityInput,roomId);
	     set rows_inserted = rows_inserted +1;
     end while;
    
    set images_array_input = replace(images_array_input, '[','');
    set images_array_input = replace(images_array_input, ']','');
    set images_array_input= replace(images_array_input, '"','');
    set images_array_input = replace(images_array_input, '"','');
   
    while length(images_array_input)>0 do
        set  ImageInput =  
            trim(substring_index(images_array_input, ',', 1));
           
        set images_array_input=
              trim(substring(images_array_input, length(ImageInput)+2));
             
	     insert into room_images  (images,room_id) values(ImageInput,roomId);
	     set rows_inserted = rows_inserted +1;
     end while;
    
     select id ,convert(room_number using 'utf8') as room_number, convert( floor_name using 'utf8') as floor_name, convert( room_type using 'utf8') as room_type , capacity,avilablity_status, monthly_rent ,dormitory_id,convert( facilities  using 'utf8') as facilities 
	 from dorm_room where dorm_room.dormitory_id =dormitory_id_input 
	 order by id  desc ;
	commit;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logout_university` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logout_university`(token_input varchar(100))
    MODIFIES SQL DATA
begin
	delete  from university_session  where token=token_input;
    select row_count(); 
    commit;
   
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logout_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logout_user`(token_input varchar(100))
    MODIFIES SQL DATA
begin
	delete  from  user_session  where token=token_input;
    select row_count();
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_rating_value` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_rating_value`(rating_input DECIMAL(5, 2), room_id_input int unsigned, username_input varchar(100),user_email_input varchar (100),message_input varchar(900))
    MODIFIES SQL DATA
begin
	
    insert into user_rating (rating, room_id, username, user_email,message)
    values (rating_input, room_id_input,username_input, user_email_input,message_input);
   
    select  id, room_id, rating, convert(username  USING 'utf8') AS username ,convert(user_email using 'utf8') as user_email ,convert(message using 'utf8') as message 
    from  user_rating ur   where id=last_insert_id(); 

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `singnup_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `singnup_user`(
	username_input varchar(80),
	first_name_input varchar(80),
	last_name_input varchar(80),
	phone_number_input varchar(100),
	email_input varchar(100),
	password_input varchar(100),
	filename_input varchar(600),
	token_input varchar(100),	   
	salt_input varchar(150))
    MODIFIES SQL DATA
begin
	declare userId int unsigned;
	insert into user (
	username,
	first_name,
	last_name,
	phone_number,
	email,
	password,
	filename,
	token,
	created_at,
	salt)
	
	values(
    username_input,
    first_name_input,
    last_name_input,
    phone_number_input,
    email_input,
    PASSWORD(CONCAT(password_input,salt_input)),
    filename_input,
    token_input,
    now(),
    salt_input);
	
    select u.id, convert(u.token using 'utf8') as token  
	from `user` u  where u.id=last_insert_id(); 
    

    select id into userId from `user`  where id= last_insert_id() ;
	insert into  user_session (user_id,token) values(userId,token_input);
	
    select  user_id , convert(token using 'utf8') as token  
	from user_session where id=last_insert_id(); 
	commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `university_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `university_login`(email_input varchar(100),password_input varchar(150))
    MODIFIES SQL DATA
begin
	 declare universityId int unsigned;
	 declare universityToken varchar(100);
	 declare uniSalt varchar(150);
	
	 select  salt into uniSalt from university  where   university.email=email_input;
	 select  id into universityId from university where university.email=email_input and university.password=PASSWORD(concat(password_input,uniSalt)) ;
	 select  token into universityToken from university where university.email=email_input  and university.password=PASSWORD(concat(password_input,uniSalt));

	
	 insert into university_session(university_id,token)
	 values(universityId, universityToken);
	 select u.id  , convert(u.token  using 'utf8') as token
	 from university_session us  inner join university u  on us.university_id =u.id  where us.id=last_insert_id() ; 
	 commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `university_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `university_signup`(name_input varchar(80),
	    bio_input varchar(300),
	    filename_input varchar(600),
	    address_input varchar(600),
	    city_input varchar(100),
	    website_input varchar(600),
	    phone_number_input varchar(100),
	    state_input varchar(20),
	    zip_input varchar(100),
	    country_input varchar(100),
	    email_input varchar(100),
	    password_input varchar(150),
	    token_input varchar(100),
	    salt_input varchar(150))
    MODIFIES SQL DATA
begin
    declare universityId int unsigned;
	insert into university (name,
        bio,
        filename,
        address,
        city,
        website,
        phone_number,
        state,
	    zip,
	    country,
        email,
        password,
        token,
        created_at,
        salt)
	values(name_input,
        bio_input,
        filename_input,
        address_input,
        city_input,
        website_input,
        phone_number_input,
        state_input,
	    zip_input,
	    country_input,
        email_input,
        PASSWORD(CONCAT(password_input,salt_input)),
        token_input,
        now(),
        salt_input);
	 
	    select u.id, convert(u.token using 'utf8') as token  
	    from university u where  id= last_insert_id() ;
	
	    select id into universityId 
	    from  university u  where u.id=last_insert_id();
	
		insert into university_session(university_id,token)
		values( universityId,token_input);
		
	    select  university_id  , convert(token using 'utf8') as token  
		from university_session  where id=last_insert_id(); 
		commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_dormitory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dormitory`(dormitory_id_input varchar(100),name_input varchar(80),
        address_input varchar(600),
	    city_input varchar(100),
	    state_input varchar(20),
	    zip_input varchar(100),
	    country_input varchar(100),
	    facilities_array_input varchar(800),
	    image_id_input int unsigned,
	    file_input varchar(700),
	    token_input varchar(100))
    MODIFIES SQL DATA
begin
     declare dormToken varchar(100);
     declare imageId varchar(700);
    
	 select token into dormToken	 
	 from university  where university.token=token_input;
	
     select id into imageId 
     from dormitory_image  where dormitory_image.id= image_id_input;

	update dormitory  
		set 
		name=ifnull(name_input,name),
		address=ifnull(address_input,address), 
	    city=ifnull(city_input,city),
		state=ifnull(state_input,state),
		zip=ifnull(zip_input,zip),
		country=ifnull(country_input,country),
		facilities =ifnull(facilities_array_input,facilities) 
		
	where id=dormitory_id_input and dormToken= token_input;
    select d.id  from dormitory d  where d.id= dormitory_id_input;
   
    update dormitory_image 
    
    set 
    images =ifnull(file_input,images)
    
    where  id=imageId ;
  	select row_count();

     
 commit;  


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_rooms`(id_input int unsigned,room_number_input varchar(100), 
    floor_name_input varchar(100), 
    room_type_input varchar(100),
    capacity_input int unsigned,
    avilablity_status_input bool,
    monthly_rent_input decimal,
    facilities_array_input varchar(7000),
    image_id_input int unsigned,
    file_input varchar(700))
    MODIFIES SQL DATA
begin
     declare roomId varchar(100);
     declare imageId varchar(700);
    
	 select id into roomId 
	 from dorm_room  where dorm_room.id =id_input;
	
     select id into imageId 
     from room_images  where room_images.id= image_id_input;

	update dorm_room  
		set 
		room_number=ifnull(room_number_input,room_number),
		floor_name=ifnull(floor_name_input,floor_name), 
	    room_type=ifnull(room_type_input,room_type),
		capacity=ifnull(capacity_input,capacity),
		avilablity_status=ifnull(avilablity_status_input,avilablity_status) ,
		monthly_rent=ifnull(monthly_rent_input, monthly_rent),
		facilities =ifnull(facilities_array_input,facilities) 
		
	where id=roomId ;
   
    update room_images  
    
    set 
    images =ifnull(file_input,images)
    
    where  id=imageId ;
  	select row_count();

     
 commit;  


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_university_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_university_info`(uniUpdateInfo jSON, university_id_input int unsigned, token_input varchar(100))
    MODIFIES SQL DATA
BEGIN
    declare nameValue varchar(80);
    declare bioValue varchar(300);
    declare universityProfileUrlValue varchar(600);
    declare addressValue varchar(600);
    declare cityValue varchar(100);
    declare universityWebsiteValue varchar(600);
    declare contactPhoneValue varchar(100);
    declare emailValue varchar(100);
    declare passwordValue varchar(150);
    declare uniSalt varchar(150);

   set @json = CAST(uniUpdateInfo AS CHAR);
    select salt into uniSalt from university where id = university_id_input;

   set nameValue = JSON_VALUE(@json, '$.name'); 
   set bioValue = JSON_VALUE(@json, '$.bio'); 
   set universityProfileUrlValue = JSON_VALUE(@json, '$.university_profile_url');
   set addressValue = JSON_VALUE(@json, '$.address');
   set cityValue = JSON_VALUE(@json, '$.city');
   set universityWebsiteValue = JSON_VALUE(@json, '$.university_website'); 
   set contactPhoneValue = JSON_VALUE(@json, '$.contact_phone');
   set emailValue = JSON_VALUE(@json, '$.email'); 
   set passwordValue = JSON_VALUE(@json, '$.password'); 

    UPDATE university
   set
        name = ifnull(nullif(nameValue,''), name),
        bio = ifnull(nullif(bioValue,''), bio),
        university_profile_url = ifnull(nullif(universityProfileUrlValue,''), university_profile_url),
        address = ifnull(nullif(addressValue,''), address),
        city = ifnull(nullif(cityValue,''), city),
        university_website = ifnull(nullif(universityWebsiteValue,''), university_website),
        contact_phone = ifnull(nullif(contactPhoneValue,''), contact_phone),
        email = ifnull(nullif(emailValue,''), email),
        password = CASE
            WHEN passwordValue IS NOT NULL then PASSWORD(CONCAT(passwordValue, uniSalt))
            ELSE password
        END
    WHERE
        id = university_id_input AND token = token_input;

    SELECT id FROM university WHERE id = university_id_input;
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_info_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_info_update`(userUpdateInfo JSON, user_id_input int unsigned,token_input varchar(100))
    MODIFIES SQL DATA
begin
    declare usernameValue varchar(80);
    declare firstNameValue varchar(80);
    declare lastNameValue varchar(80);
    declare phoneNumberValue varchar(100);
    declare emailValue varchar(100);
    declare passwordValue varchar(100);
    declare userProfileUrlValue varchar(600);
    declare userSalt varchar(150);

   set @json = CAST(userUpdateInfo AS CHAR);
   select salt into userSalt from `user` where id = user_id_input;

   set usernameValue = JSON_VALUE(@json, '$.username');
   set firstNameValue = JSON_VALUE(@json, '$.first_name');
   set lastNameValue = JSON_VALUE(@json, '$.last_name');
   set phoneNumberValue = JSON_VALUE(@json, '$.phone_number');
   set emailValue = JSON_VALUE(@json, '$.email');
   set passwordValue = JSON_VALUE(@json, '$.password');
   set userProfileUrlValue = JSON_VALUE(@json, '$.user_profile_url');

    UPDATE `user`
		   set
		        username = ifnull(nullif(usernameValue, ''), username),
		        first_name = ifnull(nullif(firstNameValue, ''), first_name),
		        last_name = ifnull(nullif(lastNameValue, ''), last_name),
		        phone_number = ifnull(nullif(phoneNumberValue, ''), phone_number),
		        user_profile_url = ifnull(nullif(userProfileUrlValue, ''), user_profile_url),
		        email = ifnull(nullif(emailValue, ''), email),
		        password = CASE
		            when  passwordValue is not null then PASSWORD(CONCAT(passwordValue, userSalt))
		            else password
		         end
   where id = user_id_input AND token = token_input;
   select id from `user` where id = user_id_input;
   commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(email_input varchar(100),password_input varchar(150))
    MODIFIES SQL DATA
begin
	 declare userId int unsigned;
	 declare userToken varchar(100);
	 declare userSalt varchar(150);
	
	 select  salt into userSalt from `user` where   `user`.email=email_input;
	 select  id into userId from `user` where `user`.email=email_input and `user`.password=PASSWORD(concat(password_input,userSalt)) ;
	 select  token into userToken from `user` where `user`.email=email_input  and `user`.password=PASSWORD(concat(password_input,userSalt));

	
	 insert into user_session(user_id,token)
	 values(userId , userToken);
	 select  id , convert(token using 'utf8') as token  
	 from user_session  where id=last_insert_id(); 
	 commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_rating_info_pro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_rating_info_pro`( room_id_input int unsigned ,username_input varchar(100),email_input varchar(100), user_token_input varchar(100))
begin
	insert into user_rating_info (room_id,username,email,user_rating_code)
	values(room_id_input,username_input,email_input,user_token_input );
	select  id, room_id,convert(username  USING 'utf8') AS username ,convert(email using 'utf8') as email ,convert(user_rating_code using 'utf8')  as user_rating_code 
	from  user_rating_info uri   where id=last_insert_id(); 
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_rating_value` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_rating_value`(rating_input decimal, username_input varchar(100),user_email_input varchar (100),message_input varchar(900))
    MODIFIES SQL DATA
begin
	declare roomId int unsigned;
	select room_id into roomId from user_rating_info  where email=user_email_input and username=username_input;


    insert into user_rating (rating, room_id, username, user_email,message)
    values (rating_input,roomId,username_input, user_email_input,message_input);
   
    select  id, room_id, CAST(rating as DECIMAL(3,1)) as rating , convert(username  USING 'utf8') AS username ,convert(user_email using 'utf8') as user_email ,convert(message using 'utf8') as message
    from  user_rating ur   where id=last_insert_id(); 
COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 20:34:55
