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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dorm_room`
--

LOCK TABLES `dorm_room` WRITE;
/*!40000 ALTER TABLE `dorm_room` DISABLE KEYS */;
INSERT INTO `dorm_room` VALUES (94,'room34','A','1 bed unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"wifi\",\"study room\",\"laundry\"]',1,1234,175),(117,'123 strret','aste','1 bed furnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\"]',1,12345,179),(118,'Aststgd','A12','1 bed unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]',1,1234,179),(119,'AS2','A','1 bed unfurnished',1,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\",\"study room\",\"gym\",\"security\",\"parking\",\"heating\"]',1,12345,179),(120,'Danny','A','1 bed unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"elevator\",\"parking\",\"swimming pool\"]',1,1234,178),(121,'Fegan','A','2 bed unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\"]',1,1234,178),(122,'ATeri','A','studio unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"study room\",\"wifi\"]',1,1234,178),(123,'Ab','A','1 bed unfurnished',1,'[\"bed\"]',0,6788,177),(124,'room3','A','family unfurnished',6,'[\"laundry\",\"gym\"]',1,8907,177),(125,'room4','A','family unfurnished',6,'[\"laundry\",\"gym\"]',1,8907,177),(128,'Aroom','C','studio unfurnished',1,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\"]',1,123,178);
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (174,'dormuo','[\"bed\",\"gym\",\"laundry\",\"study room\",\"wifi\",\"security\",\"parking\",\"air conditioning\",\"elevator\",\"kitchen\",\"cafeteria\",\"garden\",\"swimming pool\"]','dghfh',19,'Airdrie','AB','T0A','Canada'),(175,'dorm12','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\"]','12345 street',21,'Airdrie','AB','T0A','Canada'),(177,'d ','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]','1234trtyfty',12,'Airdrie','AB','T0A','Canada'),(178,'Dorm Lee','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]','1234 street 45 Ave',12,'Barrhead','AB','T0A','Canada'),(179,'Dorm T','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]','1234street 12Ave',12,'Airdrie','AB','T0A','Canada'),(180,'Doorm 2','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\"]','A3',12,'Airdrie','AB','T0A','Canada'),(181,'null','null','null',12,'null','AB','null','Canada'),(182,'Dorm8o','[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\",\"study room\",\"security\",\"parking\",\"elevator\",\"air conditioning\",\"heating\",\"swimming pool\"]','12345 s',12,'Airdrie','AB','T0A','Canada');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_image`
--

LOCK TABLES `dormitory_image` WRITE;
/*!40000 ALTER TABLE `dormitory_image` DISABLE KEYS */;
INSERT INTO `dormitory_image` VALUES (1,'1958be178b19467f96085cfb30ab9906.jpg',177),(2,'5442f8bfeabf45f2ba8fca585dceff5a.jpg',177),(3,'198b71e729e44ca6a1c2e80e2f2b8335.jpg',177),(4,'2623842d392e4727a5360677180bc59b.jpg',177),(5,'595a9e9dedd448a3943cfdc6851c3fb7.png',178),(6,'6b0a2026b19c49d4b2cb8f37f793638a.jpeg',178),(7,'560ba7a879bb4cd18f7007dcd6eef9d4.jpeg',178),(8,'59d806e9949c4722b0f6c1a02e4b2069.jpeg',178),(9,'5cffbe4cdfae498e8d1fd9460a1cbf62.jpg',179),(10,'91f65f8a4a2d4019a5c3b3340e1fff06.jpg',179),(11,'5f186d5bc01c42719542eec3b142690b.jpg',179),(12,'28893132b17d44e2928e92a99ca88d57.jpg',179),(13,'1efc699a3191472396d39548ebf87456.jpg',179),(14,'d2b1b2e17fe84670bc0b330de4a26eca.jpg',180),(15,'4e964a20d1d0421688a680dd42559861.jpg',180),(16,'1c9657b6a63c412798ab2f07ee906fad.jpg',180),(17,'5705cace446b490298610a8e978f5111.jpg',180),(18,'11137a5d553843a790ad4755bbb13d5b.jpg',181),(19,'72ba1f1f76e546d882f4ee932001832a.jpg',181),(20,'b05c52ed05654a90bd027fd87f8e63ee.jpg',181),(21,'a03d45407418422397beb9144fb07aea.jpg',181),(22,'43b750dbb2184c9f85136a5ef9521fc9.jpg',182),(23,'1d81259d226b458fa9fe57dcb09e5ec5.jpg',182),(24,'949b7bef086e48dca4e31bcd184c67a9.jpg',182),(25,'434f7da9a7da4004a7bda83223495fb4.jpg',182);
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
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (548,'bed',174),(549,'gym',174),(550,'laundry',174),(551,'study room',174),(552,'wifi',174),(553,'security',174),(554,'parking',174),(555,'air conditioning',174),(556,'elevator',174),(557,'kitchen',174),(558,'cafeteria',174),(559,'garden',174),(560,'swimming pool',174),(561,'bed',175),(562,'kitchen',175),(563,'gym',175),(564,'laundry',175),(565,'wifi',175),(566,'study room',175),(567,'security',175),(574,'bed',177),(575,'kitchen',177),(576,'gym',177),(577,'laundry',177),(578,'wifi',177),(579,'study room',177),(580,'security',177),(581,'parking',177),(582,'bed',178),(583,'kitchen',178),(584,'gym',178),(585,'laundry',178),(586,'wifi',178),(587,'study room',178),(588,'security',178),(589,'parking',178),(590,'bed',179),(591,'kitchen',179),(592,'gym',179),(593,'laundry',179),(594,'wifi',179),(595,'study room',179),(596,'security',179),(597,'parking',179),(598,'bed',180),(599,'kitchen',180),(600,'gym',180),(601,'laundry',180),(602,'wifi',180),(603,'study room',180),(604,'security',180),(605,'parking',180),(606,'bed',181),(607,'kitchen',181),(608,'gym',181),(609,'laundry',181),(610,'wifi',181),(611,'study room',181),(612,'security',181),(613,'parking',181),(614,'elevator',181),(615,'air conditioning',181),(616,'heating',181),(617,'swimming pool',181),(618,'bed',182),(619,'kitchen',182),(620,'gym',182),(621,'laundry',182),(622,'wifi',182),(623,'study room',182),(624,'security',182),(625,'parking',182),(626,'elevator',182),(627,'air conditioning',182),(628,'heating',182),(629,'swimming pool',182);
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
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room-facility`
--

LOCK TABLES `room-facility` WRITE;
/*!40000 ALTER TABLE `room-facility` DISABLE KEYS */;
INSERT INTO `room-facility` VALUES (222,'bed',94),(223,'kitchen',94),(224,'gym',94),(225,'wifi',94),(226,'study room',94),(227,'laundry',94),(390,'bed',117),(391,'kitchen',117),(392,'gym',117),(393,'laundry',117),(394,'wifi',117),(395,'study room',117),(396,'security',117),(397,'bed',118),(398,'kitchen',118),(399,'gym',118),(400,'laundry',118),(401,'wifi',118),(402,'study room',118),(403,'security',118),(404,'parking',118),(405,'bed',119),(406,'kitchen',119),(407,'wifi',119),(408,'laundry',119),(409,'study room',119),(410,'gym',119),(411,'security',119),(412,'parking',119),(413,'heating',119),(414,'bed',120),(415,'kitchen',120),(416,'gym',120),(417,'laundry',120),(418,'elevator',120),(419,'parking',120),(420,'swimming pool',120),(421,'bed',121),(422,'kitchen',121),(423,'gym',121),(424,'laundry',121),(425,'wifi',121),(426,'bed',122),(427,'kitchen',122),(428,'gym',122),(429,'laundry',122),(430,'study room',122),(431,'wifi',122),(432,'bed',123),(433,'kitchen',123),(434,'gym',123),(435,'laundry',123),(436,'wifi',123),(437,'study room',123),(438,'bed',124),(439,'kitchen',124),(440,'gym',124),(441,'laundry',124),(442,'wifi',124),(443,'study room',124),(444,'parking',124),(445,'mirror',124),(446,'wardrobe',124),(447,'desk',124),(448,'bed',125),(449,'kitchen',125),(450,'gym',125),(451,'wifi',125),(452,'study room',125),(453,'laundry',125),(454,'security',125),(455,'parking',125),(472,'bed',128),(473,'kitchen',128),(474,'gym',128),(475,'laundry',128),(476,'wifi',128),(477,'study room',128),(478,'security',128);
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
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_images`
--

LOCK TABLES `room_images` WRITE;
/*!40000 ALTER TABLE `room_images` DISABLE KEYS */;
INSERT INTO `room_images` VALUES (74,'f9dc3a57be8c4295a01967a41a1c5659.jpg',94),(75,'bd81990e112d4c9783ff48d9cf5a29de.jpg',94),(76,'809369cead6a419b881afcbce0c1a552.jpg',94),(77,'a52c1d77b573456eb7d2d8f07676cb2f.jpeg',94),(166,'3facd29a00c64757b68726b251221c0f.jpg',117),(167,'f2dc03b6a10048c3af24fd16b7c1e401.jpg',117),(168,'1b49b958b36844909324bb42333007e1.jpg',117),(169,'a4accade4e744578886ad6aba981964d.jpg',117),(170,'cc5b1b67319d4cbcba1384371b9c9306.jpg',118),(171,'f5864c8910c64c20837821fc4b0c938e.jpg',118),(172,'d7f6ee5654c248f5a9763aa8f295cd74.jpg',118),(173,'0cb6d12a9a2b423698817fa0ce11825c.jpg',118),(174,'9c54cf3ac9194daea89b4684bdd648da.jpg',119),(175,'41c5505296f04b45af2e27dd63b21dca.jpg',119),(176,'4a26141ad9b94cf5880ff81eff548201.jpg',119),(177,'125c2275d22947d0a75afc7aaf457ada.jpg',119),(178,'582abd0b90da4dd5ad2b69882d122a1f.jpg',120),(179,'4f1a740dfbf64eee8e8d09aeb5f61b34.jpg',120),(180,'bd7b4d5af08d49b0950a54da6da000d1.jpg',120),(181,'eeff8e44d3a441daa027ef7f01830234.jpg',120),(182,'3c05a74556a0441399628667dfc012fd.jpg',121),(183,'54809db5dca94e919f43fbe3a2763023.jpg',121),(184,'a2cc2607e9994fabb7dc0eb34e879a31.jpg',121),(185,'02802f1142994b27bb5b1314177f24a5.jpg',121),(186,'ac6db011ca2e472d980c5fd1e6d1a770.jpg',121),(187,'76a566338d504f389fd6be84063c27ae.jpg',122),(188,'bb615a768fbb44edbac902723d6940d2.jpg',122),(189,'cf409bbaa30d4f05b92ff0cf35506b1c.jpg',122),(190,'6ef9109004624a698b651151372a437a.jpg',122),(191,'efb16765eaff4c90989e873c3fd1e957.jpg',123),(192,'603072db910442ebaa6b4fc2d6ea3a53.jpg',123),(193,'ecc960c3eb7f4c7a8a2b951fa4b37013.png',123),(194,'b502d69a4c5d43eca09910c74efc9902.jpg',123),(195,'11701f66427c4b4f83ca2bb515cf7646.jpeg',124),(196,'419d5a6f29654ee2a01d332520fdfc20.jpg',124),(197,'0a3467367b39401a8d67cd721355b318.jpg',124),(198,'f458c8214e7b48718d1ad115ba25b439.jpg',124),(199,'237eb3b0ce424a74afe4298c95119285.png',125),(200,'24696c81ab3f4dc3880386d13d497384.png',125),(201,'b3d12cb9db6149ba8a88e3750c3ccddd.png',125),(202,'9f3c36ccb2c24d0d8f3430d8c4d7fc05.png',125),(211,'f6d6bf6c11c94e22b8b6b4488f67296c.jpg',128),(212,'6fb02bd0f7534eb0ab220abff362774a.jpg',128),(213,'da2be2b5eaf34f18b9996485e0433827.jpg',128),(214,'9dc088a5c2564611a01ec1b29ac2321d.jpg',128);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (12,'gp','this is bio','7c0a963cc97d463dafed9a74aa78d98a.png','10405 120street 104Av','Grande Prairie','gpuniversity.ca','2043337744','contact@gp.ca','*41BA6B145E7A366D9769989E778CF81A19BF8549','4f65f30b-f89a-4854-bf62-03c4a6c4738f','2023-07-16','19c30656-c551-4a3b-90f2-800ccb70b6d6','AB','T8V','Canada'),(13,'Lake Top University','this is a nice university','24740103d9874586b9c1eaf052ef4930.jpg','10405 120street 104Av','Grande Prairie','laketopUniversy.ca','2043337766','contact@lakeTop.ca','*588A85438CDCE8BC54FBEFED0A8864ACF5D090D2','8b9e392b-073d-42db-adc6-ae0ea3a22cf7','2023-07-21','598ba088-bd14-4b49-8471-73ae1fee1993','AB','T8V','Canada'),(14,'university of lake side','this is the university','e57125eb1c2c4662a5deda614a3c5e05.jpg','10406 102street','Grande Prairie','lakesideuniversity.ca','2043337755','contact@lakeside.ca','*146B05B892FC023E2929FD0B321BEE08CEDF8F26','93fbfe4b-bae8-441c-b258-6d90f18c4fa3','2023-07-21','108261e3-5895-47bb-a8cf-1dbdc51039bf','AB','T8V','Canada'),(15,'university Of Inno Tech','this is the uni of innotech','79d04561b16447429d1fcd9444461fdf.jpg','10405 102 street 106Av','Grande Prairie','innotechuniv.ca','2043337754','contact@innotech.com','*5CFEA954A32E4E525621C4203131EEA796BADC66','0e3b2364-fdd7-4b55-97f5-b5be3767f8cb','2023-07-22','8f985974-433f-40c8-b9b5-f1e7c1a0c3e2','AB','T8V','Canada'),(16,'Addis ababa','this is bio','1dd20d304d84454e821b89a7445dc6ab.jpg','10405 120 street 104 Av','Grande Prairie','gpuni.ca','2043337744','contact.gp.ca','*0A623260004D22014FF0E049889BD347622ADAEB','2fb5f1e3-312e-41e1-8f8c-6866e221490e','2023-07-27','8d085a82-d6a1-4ba2-867a-07ffbb379178','AB','T8v 2W5','canada'),(18,'gopi ','gvfjgh','22db60532a944dcba344c3d930c9b176.jpg','12345ggjjj','Airdrie','universityiopoifr.ca','2043337755','yui@con.ca','*0D70C19A10A0412971148AC9028A81AB1FDB3C7E','6b7eac03-c5ad-4b20-a08c-9feed6f6801b','2023-07-29','51b0352f-ad0d-45e6-baee-ac212e938d7e','AB','T0A','Canada'),(19,'this new','ghjfjg','037fa1c250db49ff9c92af769830b18a.jpg','rdtrytfyfy','Barrhead','thisihghf.ca','2043337744','ghftgftdfg@tess.com','*FF764F09B2B3F95315920A7E41E38187A02A6E5E','aff03ff3-b066-4e6c-848a-9540607a7f06','2023-07-29','c0efb890-b8a9-42f5-a789-069c9fe430a8','AB','T0E','Canada'),(21,'newofU','this is bio','6cb84417f0604498ba3895cee7af7297.jpg','1234566 2 street','Airdrie','uofu@uuty.ca','2043337744','nuofe@tesr.com','*278B380675F88761662DFA6F1EB09850A41C2C56','77491543-a852-44c3-ba27-dacdd75a51b7','2023-07-29','07a31bff-e684-4c92-9137-83793e589e01','AB','T0A','Canada');
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
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_session`
--

LOCK TABLES `university_session` WRITE;
/*!40000 ALTER TABLE `university_session` DISABLE KEYS */;
INSERT INTO `university_session` VALUES (362,12,'4f65f30b-f89a-4854-bf62-03c4a6c4738f');
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
INSERT INTO `user` VALUES (19,'Simret','Paulos','5db5a2c1406e462e872ff90a996b18d9.jpg','81293839','julian@gmail.com','*62486C95FE0B7E9B94D71DF42C64E3B0B148E548','0eaad463-4f6d-4a2c-a058-00e8e5f2edec','Simret','2023-07-15','9a0659a9-1ca7-4f4a-9360-2141d523e40a'),(20,'danel','martin','4e94999ba10249ffaf4ad86d7de7921e.jpg','2043337744','dan@da.com','*99EE8B659198521A20CC7A1A9B62394F8153CBD2','a1bda7af-ab67-46f3-b158-0836edc2e87b','danel','2023-07-15','d53a4e0f-2960-4ce0-a9f7-d1514a6dadb5'),(23,'Micheal ','YoMixc','0f2ccd6b02464fe5bbe9456ee9c037d9.jpg','2043337744','bobs@bob.com','*7B9A472FEBF660AB40C5A5C42D64E8DA8660E1E6','460e373d-ba0b-4be0-8be6-55b2c888949c','Yo','2023-07-15','424ddfc8-9d20-4e24-8c68-b5718f57488c');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating` int(10) unsigned DEFAULT NULL,
  `dormitory_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned DEFAULT NULL,
  `is_booked_complete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rating_FK` (`dormitory_id`),
  KEY `rating_FK_1` (`student_id`),
  CONSTRAINT `rating_FK` FOREIGN KEY (`dormitory_id`) REFERENCES `dormitory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_FK_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_check` CHECK (`rating` = 5 or `rating` = 4 or `rating` = 3 or `rating` = 2 or `rating` = 1 or `rating` = 1 or `rating` = 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
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
INSERT INTO `user_session` VALUES (12,19,'0eaad463-4f6d-4a2c-a058-00e8e5f2edec'),(13,20,'a1bda7af-ab67-46f3-b158-0836edc2e87b'),(15,23,'460e373d-ba0b-4be0-8be6-55b2c888949c');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-03 17:36:09
