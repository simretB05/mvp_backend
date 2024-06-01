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
-- Dumping data for table `dorm_room`
--

LOCK TABLES `dorm_room` WRITE;
/*!40000 ALTER TABLE `dorm_room` DISABLE KEYS */;
INSERT INTO `dorm_room` VALUES (204,'2','AB2','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',1,345,250),(205,'4','AB4','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',0,345,250),(206,'3','AB3','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',1,345,250),(207,'5','AB5','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"wifi\",\"laundry\"]',1,345,250),(208,'7','B43','2 bed unfurnished',2,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\"]',1,429,250),(209,'8','B48','3 bed unfurnished',3,'[\"bed\",\"kitchen\",\"gym\",\"laundry\",\"wifi\"]',0,629,250),(210,'98','98F','family unfurnished',6,'[\"bed\",\"kitchen\",\"laundry\"]',1,890,250),(211,'45','45F','family unfurnished',6,'[\"bed\",\"kitchen\",\"laundry\"]',1,890,250);
/*!40000 ALTER TABLE `dorm_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (248,'North','[\"bed\",\"kitchen\",\"gym\",\"laundry\"]','12323 6street 67ave',32,'Calgary','AB','T0G','Canada'),(249,'willow tree','[\"bed\",\"kitchen\",\"gym\",\"laundry\"]','12323 6street 67ave',32,'Calgary','AB','T0G','Canada'),(250,'Gamers Ranch','[\"bed\",\"kitchen\",\"gym\",\"laundry\"]','12323 6street 67ave',32,'Calgary','AB','T0G','Canada'),(251,'three start','[\"kitchen\",\"gym\",\"bed\",\"laundry\"]','123 street 1 ave ',32,'Calgary','AB','T0E','Canada');
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dormitory_image`
--

LOCK TABLES `dormitory_image` WRITE;
/*!40000 ALTER TABLE `dormitory_image` DISABLE KEYS */;
INSERT INTO `dormitory_image` VALUES (258,'65e038ae18144201bca4f7139bd306fc.jpg',248),(259,'2d0118586cc54fa1a42f2f643ecde46b.jpg',248),(260,'842fe962941848968905fe4a1e6e91d5.jpg',248),(261,'13d414bfb2e441bdb1f17d17187b8199.jpg',248),(262,'d6b2a943953e475caef1cf5f31c2bde2.jpg',249),(263,'892417a740a546228279d90217ed9fdb.jpg',249),(264,'e413c95702e24dc19872640d79575149.jpg',249),(265,'0a290d0dc998463b9c59d5ae138c0ccf.jpg',249),(266,'da7955352e3247ad964b032db11637cb.jpg',250),(267,'2da1e3b40bfd4e9cb399035739dbc711.jpg',250),(268,'820b3abe4dbc4bad9e99a27e42165b0b.jpg',250),(269,'2ca914c93706483d919a0510ff718ee0.jpg',250),(270,'70d3036e869d4453ab0080e2b7b9b78c.jpg',251),(271,'1668807732f04734ac2714300ebb4fab.jpg',251),(272,'f155c63caede48b7825f4120501fe24e.jpg',251),(273,'c2c489f851bf4c02bc346d2af9b2fa33.jpg',251);
/*!40000 ALTER TABLE `dormitory_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (940,'bed',248),(941,'kitchen',248),(942,'gym',248),(943,'laundry',248),(944,'bed',249),(945,'kitchen',249),(946,'gym',249),(947,'laundry',249),(948,'bed',250),(949,'kitchen',250),(950,'gym',250),(951,'laundry',250),(952,'kitchen',251),(953,'gym',251),(954,'bed',251),(955,'laundry',251);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `room-facility`
--

LOCK TABLES `room-facility` WRITE;
/*!40000 ALTER TABLE `room-facility` DISABLE KEYS */;
INSERT INTO `room-facility` VALUES (757,'bed',204),(758,'kitchen',204),(759,'wifi',204),(760,'laundry',204),(761,'bed',205),(762,'kitchen',205),(763,'wifi',205),(764,'laundry',205),(765,'bed',206),(766,'kitchen',206),(767,'wifi',206),(768,'laundry',206),(769,'bed',207),(770,'kitchen',207),(771,'wifi',207),(772,'laundry',207),(773,'bed',208),(774,'kitchen',208),(775,'gym',208),(776,'laundry',208),(777,'wifi',208),(778,'bed',209),(779,'kitchen',209),(780,'gym',209),(781,'laundry',209),(782,'wifi',209),(783,'bed',210),(784,'kitchen',210),(785,'laundry',210),(786,'bed',211),(787,'kitchen',211),(788,'laundry',211);
/*!40000 ALTER TABLE `room-facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `room_images`
--

LOCK TABLES `room_images` WRITE;
/*!40000 ALTER TABLE `room_images` DISABLE KEYS */;
INSERT INTO `room_images` VALUES (499,'5cb2265438fd40e398c0802f68087775.jpg',204),(500,'bbdb159e2364449fa835af2fcc89d127.jpg',204),(501,'67864bc4e01148f4805799030881f625.jpg',204),(502,'f471b6ffcfae4c00aea2e4d2d410383a.jpg',204),(503,'b3acbcd99ee5411bb3c1cd348d147577.jpg',205),(504,'06c742220bd8492286cbea3bfc6ef2ef.jpg',205),(505,'5f67b27e3f244af09782b8fbefab73d9.jpg',205),(506,'a88d9686b803471a9e8cdcb4af9b2ace.jpg',205),(507,'e274e9c58c284e54852d83d27574534e.jpg',206),(508,'318b286e42cb44318fe934bb123b6f93.jpg',206),(509,'22284bca618143048970132f094954f2.jpg',206),(510,'6596fa309d324a40bff8cced8da12341.jpg',206),(511,'fc2c556eed1f4069b4b4326ab6c9d39b.jpg',207),(512,'cd4503afe81244f5bd2658bc328954b2.jpg',207),(513,'17535dc84d624f568f86d1edd8f6e56c.jpg',207),(514,'a6ee1dadfd324e188865f78a782fdd83.jpg',207),(515,'c1d48f4daa164f87848015337f0baf1f.jpg',208),(516,'034c154a06294c258a53ec9b8779c838.jpg',208),(517,'96199f630df24e4fa40ecaddf92e45e7.jpg',208),(518,'90ad58a5cd4f452e8df4d05281c1b58f.jpg',208),(519,'6c4fa5655abe48e4b5f942f3d59ab127.jpg',209),(520,'f219ead2bf034045b0985ec902a74d50.jpg',209),(521,'be51ea0050d843ce9d9646b153e1dd9d.jpg',209),(522,'92f07959c1dc47238000ae500796d80a.jpg',209),(523,'824d492a97fe4bb79e979d1180d77349.jpg',210),(524,'b72ec8d5c14c4d728a810eeb26745d38.jpg',210),(525,'3e7820ef5f0a413d8360a9d5d9fe6531.jpg',210),(526,'905f3a08ee5943a8a8f21902d6bfe98f.jpg',210),(527,'2c2b8e14c20c492fb8d9f0267ab54b28.jpg',211),(528,'f7a353bb7e1a4d6cb47b765135303159.jpg',211),(529,'4cfcb83f83cb42f89b8a7137ce2cb536.jpg',211),(530,'b4a2cdb75386475489b8dc40f6f81bc2.jpg',211);
/*!40000 ALTER TABLE `room_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (32,'University of Calgary','this is university of Calgary','25ad4fb68ce442f887f0870d52cb78d3.jpg','123 1street 2 ave','Calgary','www.uofcalgary.ca','2345576986','contactuofcalgary@gmail.com','*18EC43D3017F82C470D129964CE7B7831093094F','f381071e-006d-4d67-982b-a06d3d2dfb7d','2024-01-16','eacc1670-4999-4a9d-8202-bd04825ab7b3','AB','T0E','Canada');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `university_session`
--

LOCK TABLES `university_session` WRITE;
/*!40000 ALTER TABLE `university_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `university_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
INSERT INTO `user_rating` VALUES (207,'simretpaulos@gmail.com',73,'simret','this is a very nive dorm',4.0);
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_rating_info`
--

LOCK TABLES `user_rating_info` WRITE;
/*!40000 ALTER TABLE `user_rating_info` DISABLE KEYS */;
INSERT INTO `user_rating_info` VALUES ('simret paulos',318,'simretpaulos@gmail.com','cdc2f1a0-227f-4a19-b292-e51741287255',207);
/*!40000 ALTER TABLE `user_rating_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mvp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09 13:52:16
