-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dorm_room`
--

LOCK TABLES `dorm_room` WRITE;
/*!40000 ALTER TABLE `dorm_room` DISABLE KEYS */;
INSERT INTO `dorm_room` VALUES (196,'12','si floor2','1 bed unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\",\"elevator\"]',1,1234,246),(197,'13','si floor2','1 bed furnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\",\"elevator\"]',1,1234,246),(198,'16','si floor2','2 bed unfurnished',2,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\",\"elevator\"]',1,1234,246),(201,'12344 dfr','snowyy 123','studio furnished',2,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"security\",\"study room\"]',0,124,247),(202,'12344 dfrrt','snowyy 123','studio furnished',2,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"security\",\"study room\"]',0,124,247),(203,'12344 fdfrrt','snowyy 123','studio furnished',2,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"security\",\"study room\"]',1,124,247);
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
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (242,'calsi next door','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]','1908 12Ave Sw',23,'Calgary','AB','T3C','Canada'),(244,'si-calgary  dorm','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]','1808 12Ave Sw',23,'Calgary','AB','T3C','Canada'),(246,'belisima calgary','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\"]','1234 35street ',23,'Calgary','AB','T3B','Canada'),(247,'chovul','[\"bed\",\"kitchen\",\"gym\",\"study room\",\"wifi\",\"security\",\"air conditioning\",\"parking\",\"swimming pool\",\"heating\"]','deart 123 street 12 ave',29,'Bashaw','AB','T0A','Canada');
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
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_image`
--

LOCK TABLES `dormitory_image` WRITE;
/*!40000 ALTER TABLE `dormitory_image` DISABLE KEYS */;
INSERT INTO `dormitory_image` VALUES (238,'c0148ac3a96c4010b75dcc7814e5d7d3.jpg',242),(239,'ec29cd6090104a57b05cf592afaa5e98.jpg',242),(240,'82d9ea017c83418aa21cb09770b9b1e0.jpg',242),(241,'bd9c73823009463fb6fbb78e0ab364a1.jpg',242),(242,'ea044de8016e46da9e189d1b470847f7.jpg',244),(243,'3666358595294b668b3957cb4cba2466.jpg',244),(244,'8bf7c1dd19b844cbb5d8759b3b4d0a73.jpg',244),(245,'7c57252428564594b9729737430ce25a.jpg',244),(250,'963a0611759a4cc6acf72e3c4c8da432.jpg',246),(251,'3a5e041681464eaabcf5afafc194dc1f.jpg',246),(252,'7ca6aa1ca96c410fab64770058860366.jpg',246),(253,'afb5c5dbeae34a4bbc738a84e7333ec6.jpg',246),(254,'663cf5d2069e4c44ae6539d202198de1.jpg',247),(255,'115cd09f181c4d958b122018110492b7.jpg',247),(256,'9f4117bda8c74930a62c603bdabcb3c5.jpg',247),(257,'da005ff3d045475c9885f046cd76cbd3.jpg',247);
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
) ENGINE=InnoDB AUTO_INCREMENT=940 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (904,'bed',242),(905,'kitchen',242),(906,'gym',242),(907,'laundry',242),(908,'wifi',242),(909,'study room',242),(910,'security',242),(911,'parking',242),(912,'bed',244),(913,'kitchen',244),(914,'gym',244),(915,'laundry',244),(916,'wifi',244),(917,'study room',244),(918,'security',244),(919,'parking',244),(928,'bed',246),(929,'kitchen',246),(930,'gym',246),(931,'laundry',246),(932,'wifi',246),(933,'study room',246),(934,'security',246),(935,'bed',247),(936,'kitchen',247),(937,'gym',247),(938,'laundry',247),(939,'wifi',247);
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
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room-facility`
--

LOCK TABLES `room-facility` WRITE;
/*!40000 ALTER TABLE `room-facility` DISABLE KEYS */;
INSERT INTO `room-facility` VALUES (702,'bed',196),(703,'kitchen',196),(704,'gym',196),(705,'laundry',196),(706,'wifi',196),(707,'study room',196),(708,'security',196),(709,'parking',196),(710,'elevator',196),(711,'bed',197),(712,'kitchen',197),(713,'gym',197),(714,'laundry',197),(715,'wifi',197),(716,'study room',197),(717,'security',197),(718,'parking',197),(719,'elevator',197),(720,'bed',198),(721,'kitchen',198),(722,'gym',198),(723,'laundry',198),(724,'wifi',198),(725,'study room',198),(726,'security',198),(727,'parking',198),(728,'elevator',198),(736,'bed',201),(737,'kitchen',201),(738,'gym',201),(739,'laundry',201),(740,'wifi',201),(741,'security',201),(742,'study room',201),(743,'bed',202),(744,'kitchen',202),(745,'gym',202),(746,'laundry',202),(747,'wifi',202),(748,'security',202),(749,'study room',202),(750,'bed',203),(751,'kitchen',203),(752,'gym',203),(753,'laundry',203),(754,'wifi',203),(755,'security',203),(756,'study room',203);
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
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_images`
--

LOCK TABLES `room_images` WRITE;
/*!40000 ALTER TABLE `room_images` DISABLE KEYS */;
INSERT INTO `room_images` VALUES (467,'294a6f96d6f14a41930c83e967856ab6.jpg',196),(468,'0aa0563324d5475693fff089ff909343.jpg',196),(469,'3b92dc1b694648e4bd7eac244e28241b.jpg',196),(470,'aac5d49984944cf69dd3b94fe2b6721a.jpg',196),(471,'796f8632bc2f48f8b9b1d825838eef04.jpg',197),(472,'190263ad02bd43ea914f62fa608fd850.jpg',197),(473,'40adb60e14574169bf9e83ae8da47405.jpg',197),(474,'bad757f263ea4f5abd7e997d9f7090bb.jpg',197),(475,'1d6f0c1568104d4e890f7a28c6235a06.jpg',198),(476,'3a386d9c61d2494b95ec81f515c3ad96.jpg',198),(477,'33608449d2da4d4ab6ad9aa04ac2c229.jpg',198),(478,'879e022cd98f4b58bf59f207de4186d2.jpg',198),(484,'4e6348da81ce41b295ebd826c142c3e1.jpg',201),(485,'d70d77357a144872abf43166921c862c.jpg',201),(486,'d9a7f963ff374349bbbdf30bd93d0317.jpg',201),(487,'929ab60592024671a26a32a86fcea4ac.jpg',201),(488,'da75933fcd4744eb8c5c2e5afaf0ee08.jpg',201),(489,'414f2b81202d41c6a8fe152d4a05e5ca.jpg',202),(490,'45925ebceb11420ebb73b8c3cc1244b3.jpg',202),(491,'d626bf774d4b439382d151a06704e4d7.jpg',202),(492,'e489998761e341e1b62638039262704b.jpg',202),(493,'fb514eab5f5344e7aa697bc252929817.jpg',202),(494,'c337a97fb19840d0bcd8371687464be9.jpg',203),(495,'26d8a47ab0dd4b2aa190a8d790a19ac8.jpg',203),(496,'e7f67c05cb4740c0a8cdd85fbe2a5776.jpg',203),(497,'79db0b90465e454a82061b7c25cde2ad.jpg',203),(498,'89e418ad5b414281aeab4b5b2dded1c3.jpg',203);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (23,'calgary University','this is calgary University','f9b2137107e14a0a8fc7c429ba505e69.jpg','1234 5th street  12 Ave','Calgary','calgaryuniv.ca','4306789085','contactcalgary.ca','*662B1C9B203BE6008E0A8DCDF9F9EB6EF4548032','0b15cfeb-a76e-4827-9b0a-f1d9dbf1f31f','2023-09-26','7b7d92fe-d7d4-4321-a4ae-a35272e85839','AB','T3A','Canada'),(24,'banff university','this is banff university','a79283abdc7e418eb81261d205965cdd.jpg','123 2street 16 Ave ','Banff','banffuniversity.ca','5678769087','banffcontact.ca','*C971B99BD6A5CD8A99D51D1F4B8B2386A5831234','a2d5137c-85c4-4214-b939-bf825e59e4dd','2023-09-26','27e89ba7-c2e9-4fb3-bbe3-39963d5d69e3','AB','T0G','Canada'),(25,'Athabasca','this is Athabasca','5b77e35a9d424d07bfd7df7d7217111c.jpg','1234 4street 5 Ave','Athabasca','Athabasca.ca','2076789545','Athabascacontact.ca','*9751E0F04C216754F4251885D8EB87DB3FC50546','9e244808-d7f6-4efb-bff6-819da85fa44c','2023-09-26','f78cedaa-cc0a-44b9-8d18-8118ad7e0658','AB','T0G','Canada'),(26,'Beaumont','this is Beaumont','c04f62705251422e80ae8f547a435592.jpg','4536 3street 2Ave','Beaumont','Beaumont.ca','2064567980','Beaumontcontact.ca','*7117B03748634F03F914CDA64F71076772505758','3371c79e-7d81-49a6-99c1-07c45bd2edfd','2023-09-26','2d7b459d-e48b-442d-95bd-858ab2ede617','AB','T0B','Canada'),(27,'Bentley university','Bentley university','e6dc01ec7527456db5cec15352a25a2d.jpg','1234 4street 12Ave','Bentley','Bentley.ca','3456789876','Bentleycontact.ca','*6E7531437374AB22487FC800464F94D2C980A822','4d852c3f-3325-4a52-9665-b32da2430877','2023-09-26','65bfa52c-c140-4e88-8984-cb53c8b02847','AB','T0A','Canada'),(28,'wills','this is the amazing uni','5b184b11c77d46b181b1062ee9f21e6e.jpg','12345 12 street 14 AVE','Bashaw','www.willis.ca','2876087653','imfowill@will.ca','*DA73F71C202A24AE4F8CC5B3ECBE76D01E09FD21','9395701a-132c-40f0-a992-7d8412abcf80','2023-11-02','0d5f1037-3a8d-4e3e-bbd9-4bb6abebffd8','AB','T0E','Canada'),(29,'University  of Chovilia','this is the University of Choviliha','a01c529e157c40a29e2208a2a34015c1.jpg','12435 12 street 12 Ave','Banff','www.chovilama.ca ','2045638792','contact@chovila.ca','*439C7DE472109892F63C3A2BAE42DAEEAD62CEC1','2696d9d5-c533-4b73-819a-5af8f10762f1','2023-11-03','b5ade35a-1716-4088-b7dc-b449e925e745','AB','T0G','Canada');
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
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_session`
--

LOCK TABLES `university_session` WRITE;
/*!40000 ALTER TABLE `university_session` DISABLE KEYS */;
INSERT INTO `university_session` VALUES (461,29,'2696d9d5-c533-4b73-819a-5af8f10762f1');
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
  `rating` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_rating_un` (`user_email`),
  KEY `user_rating_FK` (`room_id`),
  CONSTRAINT `user_rating_FK` FOREIGN KEY (`room_id`) REFERENCES `dorm_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
INSERT INTO `user_rating` VALUES (202,'happysimret@gmail.com',47,'simret','The university dormitory has been disappointing due to its cleanliness and sanitary conditions. The rooms often lack proper cleanliness, and communal spaces aren’t well-maintained. This has resulted in discomfort and health concerns among residents. Despite raising concerns, the administration\'s response to these issues has been slow, impacting our living standards negatively. Improvement in hygiene standards is crucial for residents\' well-being.',1),(202,'bobio@example.com',48,'Bob Johnson','My stay at the university dormitory has been alright. The rooms and facilities are functional but could use some improvements in terms of maintenance. While the amenities provided meet basic needs, there are occasional issues that take time to be addressed. It\'s an average living space, suitable for those seeking a standard accommodation option during their university years.',4),(202,'daniel@example.com',49,'Daniel XI','Residing in the university dormitory has been concerning, primarily due to the inadequate security measures in place. The safety of residents seems compromised as there have been instances of unauthorized access to the premises.',4),(202,'marry@example.com',50,'Marry Row Johnson','Living in the university dormitory has been an absolute delight! The rooms are modern, spacious, and well-maintained. The amenities provided are top-notch, and the dormitory staff is friendly and helpful. The community atmosphere fosters great friendships, and the location is convenient for accessing campus resources. I highly recommend it!',5),(202,'lululaiui@example.com',59,'Lula Gezue','Living in the university dormitory has been the best experiance! ',5),(202,'Lulite@example.com',63,'Lulite Abebe','Living in the university dormitory has been the best experiance! ',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating_info`
--

LOCK TABLES `user_rating_info` WRITE;
/*!40000 ALTER TABLE `user_rating_info` DISABLE KEYS */;
INSERT INTO `user_rating_info` VALUES ('simret',300,'simretpaulos@gmail.com','d6ac8e3c-f8f8-40c0-aaf1-e32b6bab91da',202),('simret',301,'happysimret@gmail.com','a423d70e-2f48-412f-bee8-73568199f9e9',202),('Rose',305,'rose@gmail.com','0c30f68b-893a-4bc3-a8b7-d8d52e14cec8',203),('Rose',308,'rospoe@gmail.com','2801e074-a215-4613-9f29-9ec60b998d95',203),('roszy',309,'roszy@gmail.com','22202373-33b7-4246-bd66-09a28fe3b5b0',202),('Simret',310,'simret4@gmail.com','f86ebc01-e13a-42bc-bc22-98c7ad2c53cb',203);
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
   
    select  id, room_id, rating, convert(username  USING 'utf8') AS username ,convert(user_email using 'utf8') as user_email ,convert(message using 'utf8') as message
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

-- Dump completed on 2023-11-27 13:03:43
