-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: itcs6160
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `accountID` int(11) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `accountID_UNIQUE` (`accountID`),
  KEY `accounts_personID` (`personID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,11,98.34),(2,12,80),(3,13,154.3),(4,14,256.81),(5,15,11.25),(6,16,249.35),(7,17,141.03),(8,18,60.84),(9,19,5.08),(10,20,98.54);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_drivers`
--

DROP TABLE IF EXISTS `all_drivers`;
/*!50001 DROP VIEW IF EXISTS `all_drivers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_drivers` AS SELECT 
 1 AS `personID`,
 1 AS `name`,
 1 AS `email`,
 1 AS `phoneNumber`,
 1 AS `personType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_payments`
--

DROP TABLE IF EXISTS `all_payments`;
/*!50001 DROP VIEW IF EXISTS `all_payments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_payments` AS SELECT 
 1 AS `paymentID`,
 1 AS `name`,
 1 AS `paymentDate`,
 1 AS `paymentAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_rides`
--

DROP TABLE IF EXISTS `all_rides`;
/*!50001 DROP VIEW IF EXISTS `all_rides`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `all_rides` AS SELECT 
 1 AS `rideID`,
 1 AS `startDateTime`,
 1 AS `endDateTime`,
 1 AS `startLocation`,
 1 AS `endLocation`,
 1 AS `passenger1`,
 1 AS `passenger2`,
 1 AS `driver`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `cartID` int(11) NOT NULL,
  `make` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `numOfSeats` int(11) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  UNIQUE KEY `cartID_UNIQUE` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'Porsche','one-seater',1,1),(2,'Mercedes-Benz','one-seater',1,1),(3,'Ferrari','one-seater',1,1),(4,'Chevrolet','one-seater',1,0),(5,'Porsche','two-seater',2,1),(6,'Mercedes-Benz','two-seater',2,1),(7,'Ferrari','two-seater',2,1),(8,'Chevrolet','two-seater',2,0);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `driverID` int(11) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`driverID`),
  UNIQUE KEY `driverID_UNIQUE` (`driverID`),
  KEY `drivers_personID` (`personID`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,1,'active'),(2,2,'active'),(3,3,'active'),(4,4,'active'),(5,5,'active'),(6,6,'active'),(7,7,'active'),(8,8,'inactive');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `personID` int(11) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `fulltime` tinyint(1) DEFAULT NULL,
  KEY `faculty_personID` (`personID`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (21,'Media Relations',0),(22,'Human Resources',1),(23,'Legal Department',0),(24,'Sales and Marketing',0),(25,'Customer Service',1),(26,'Legal Department',0),(27,'Asset Management',0),(28,'Legal Department',0),(29,'Sales and Marketing',1),(30,'Payroll',1);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `locationID` int(11) NOT NULL,
  `locationName` varchar(100) DEFAULT NULL,
  `locationAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`locationID`),
  UNIQUE KEY `locationID_UNIQUE` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Friday','322 Mary Alexander Dr.'),(2,'Duke','983 Queen Katrina Rd.'),(3,'Portal','763 Alexander Junior Dr.'),(4,'Epic','503 Epic Center Dr.'),(5,'CHHS','805 Mr. Thoms Dr.'),(6,'Soccer Stadium','1981 Soccer St.'),(7,'Denny','983 Denny Rd.'),(8,'Smith','5580 Mr. Smith Dr.'),(9,'Cone','695 Martin Sq.'),(10,'Belk','829 Box St.');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL,
  `accountID` int(11) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentAmount` double DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  UNIQUE KEY `paymentID_UNIQUE` (`paymentID`),
  KEY `payments_accountID` (`accountID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `accounts` (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2019-12-01',42.02),(2,2,'2019-09-20',30.84),(3,3,'2019-07-17',73.45),(4,4,'2018-11-13',63.95),(5,5,'2018-06-11',39.42),(6,6,'2019-11-12',44.81),(7,7,'2019-01-04',40.34),(8,8,'2020-02-28',50.11),(9,9,'2018-04-30',21.56),(10,9,'2018-08-24',59.25);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_balance
AFTER INSERT on payments 
FOR EACH ROW 
BEGIN
  UPDATE accounts
    SET balance = round(balance - new.paymentAmount, 2)
    WHERE accountID = new.accountID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER AFTER_golfcart_update
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    INSERT INTO payments
    VALUES (NEW.paymentID, new.accountID, NOW(), new.paymentAmount);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `personType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `personID_UNIQUE` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Quinn Knox','arcu@euultrices.org','(208) 885-2203','staff'),(2,'Ella Buckner','nascetur@ametorciUt.net','(950) 115-1635','staff'),(3,'Ali Daniels','ante@PraesentluctusCurabitur.com','(208) 567-7096','staff'),(4,'Yuli Lowe','dui.Suspendisse.ac@nisiMauris.net','(546) 406-2031','staff'),(5,'Garrett Glass','dui.semper.et@nisi.co.uk','(311) 828-0153','staff'),(6,'Stella Gregory','a@In.ca','(945) 579-2852','staff'),(7,'Jolie Ortega','nibh@ullamcorper.co.uk','(122) 592-9592','staff'),(8,'Yvette Stout','enim.nec@fringilla.edu','(413) 679-4641','staff'),(9,'Drew Vang','ac.mi@mi.net','(512) 627-3071','staff'),(10,'Reuben Mckenzie','convallis@accumsaninterdum.net','(164) 454-2683','staff'),(11,'Denton Clay','quis@massa.co.uk','(311) 215-5474','student'),(12,'Laurel Hays','nunc.id@ornarefacilisis.net','(759) 297-6914','student'),(13,'Kai Walker','Cras@fermentummetus.com','(257) 546-6945','student'),(14,'Erasmus Frank','libero.et@MorbivehiculaPellentesque.co.uk','(614) 228-5330','student'),(15,'Kessie Holman','laoreet@CrasinterdumNunc.net','(449) 697-7979','student'),(16,'Linus May','nibh.sit.amet@nasceturridiculusmus.edu','(598) 442-0395','student'),(17,'Alexandra Banks','at@adipiscingelitEtiam.ca','(767) 164-1082','student'),(18,'Buckminster Hines','semper.erat.in@pharetrasedhendrerit.co.uk','(809) 380-3706','student'),(19,'Vera Lester','neque.et@molestiedapibus.org','(858) 242-4995','student'),(20,'Tucker Harmon','auctor.velit@at.co.uk','(256) 415-5911','student'),(21,'Octavia Weber','dui.Cum.sociis@Morbimetus.net','(648) 917-4963','faculty'),(22,'Samuel Noel','est.Nunc.laoreet@ornaretortor.co.uk','(352) 269-0890','faculty'),(23,'Raymond Langley','natoque.penatibus.et@loremauctorquis.edu','(301) 756-9041','faculty'),(24,'Mikayla Farrell','tempus.eu.ligula@pede.net','(257) 150-1324','faculty'),(25,'Gary Dickson','at@pedemalesuada.co.uk','(780) 931-1489','faculty'),(26,'Shaeleigh Kirk','quis.tristique@accumsanlaoreet.com','(495) 350-5199','faculty'),(27,'Barclay Mcmillan','id.ante@ipsumCurabitur.edu','(366) 822-7024','faculty'),(28,'Hammett Hawkins','eget@vitaesodalesnisi.edu','(142) 499-5752','faculty'),(29,'Yen Gibbs','id.libero@Sedmalesuadaaugue.co.uk','(754) 889-4121','faculty'),(30,'Penelope Mejia','tempus@arcuVestibulum.net','(416) 537-8484','faculty');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `ratingID` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `ratingDate` date DEFAULT NULL,
  PRIMARY KEY (`ratingID`),
  UNIQUE KEY `ratingID_UNIQUE` (`ratingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,'Driver was rude and drove at an unsafe speed','2019-04-28'),(2,5,'','2019-04-28'),(3,2,'Driver was 15 mins late and we could not finish the whole round','2019-04-28'),(4,3,'Driver smelled bad','2019-04-28'),(5,5,'Amazing driver and knowladgeable about the course','2019-04-28'),(6,4,'Good driver butwas 5 mins late','2019-04-28'),(7,3,'Driver was ok','2019-04-28');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rides` (
  `rideID` int(11) NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `startLocation` int(11) DEFAULT NULL,
  `endLocation` int(11) DEFAULT NULL,
  `paymentID` int(11) DEFAULT NULL,
  `ratingID` int(11) DEFAULT NULL,
  `passenger1` int(11) DEFAULT NULL,
  `passenger2` int(11) DEFAULT NULL,
  `driverID` int(11) DEFAULT NULL,
  `cartID` int(11) DEFAULT NULL,
  PRIMARY KEY (`rideID`),
  UNIQUE KEY `rideID_UNIQUE` (`rideID`),
  KEY `rides_startLocation` (`startLocation`),
  KEY `rides_endLocation` (`endLocation`),
  KEY `rides_paymentID` (`paymentID`),
  KEY `rides_ratingID` (`ratingID`),
  KEY `rides_passenger1` (`passenger1`),
  KEY `rides_passenger2` (`passenger2`),
  KEY `rides_driverID` (`driverID`),
  KEY `rides_cartID` (`cartID`),
  CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`startLocation`) REFERENCES `locations` (`locationID`),
  CONSTRAINT `rides_ibfk_2` FOREIGN KEY (`endLocation`) REFERENCES `locations` (`locationID`),
  CONSTRAINT `rides_ibfk_3` FOREIGN KEY (`paymentID`) REFERENCES `payments` (`paymentID`),
  CONSTRAINT `rides_ibfk_4` FOREIGN KEY (`ratingID`) REFERENCES `ratings` (`ratingID`),
  CONSTRAINT `rides_ibfk_5` FOREIGN KEY (`passenger1`) REFERENCES `person` (`personID`),
  CONSTRAINT `rides_ibfk_6` FOREIGN KEY (`passenger2`) REFERENCES `person` (`personID`),
  CONSTRAINT `rides_ibfk_7` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driverID`),
  CONSTRAINT `rides_ibfk_8` FOREIGN KEY (`cartID`) REFERENCES `carts` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (1,'2019-02-13 12:23:22','2019-12-01 02:19:13',1,2,1,1,11,NULL,1,1),(2,'2018-12-11 09:28:45','2019-09-20 06:54:59',2,3,2,2,12,NULL,2,2),(3,'2018-07-03 21:52:08','2019-07-17 07:13:19',3,4,3,NULL,13,NULL,2,3),(4,'2018-11-01 06:51:20','2018-11-13 14:53:35',4,5,4,3,14,11,3,4),(5,'2018-10-23 08:28:08','2018-06-11 16:00:49',5,6,5,4,15,16,4,5),(6,'2020-01-05 16:55:44','2019-11-12 08:34:01',6,7,6,5,16,18,5,6),(7,'2020-03-03 18:46:26','2019-01-04 10:55:13',7,8,7,6,17,NULL,6,7),(8,'2020-03-31 02:50:37','2020-02-28 20:00:43',8,9,8,NULL,18,11,7,8),(9,'2018-09-22 21:34:55','2018-04-30 17:59:37',9,10,9,7,19,13,8,3),(10,'2018-07-10 15:21:34','2018-08-24 18:12:53',10,1,10,NULL,20,19,8,4);
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `personID` int(11) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  KEY `staff_personID` (`personID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Accounting',1,'Supervisor'),(2,'Research and Development',0,'Driver'),(3,'Finances',1,'Supervisor'),(4,'Sales and Marketing',0,'Manager'),(5,'Public Relations',1,'Supervisor'),(6,'Quality Assurance',0,'Driver'),(7,'Customer Relations',1,'Front Desk'),(8,'Human Resources',0,'Manager'),(9,'Customer Service',0,'Driver'),(10,'Asset Management',0,'Driver');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `personID` int(11) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `gradYear` int(11) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  KEY `student_personID` (`personID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (11,'Accounting',2020,'2003-12-08'),(12,'Media Relations',2018,'1997-11-15'),(13,'Legal Department',2019,'1999-04-05'),(14,'Quality Assurance',2021,'2001-07-13'),(15,'Human Resources',2022,'1998-09-26'),(16,'Sales and Marketing',2018,'2004-03-15'),(17,'Media Relations',2014,'2002-11-21'),(18,'Advertising',2014,'1997-04-01'),(19,'Legal Department',2020,'1995-03-27'),(20,'Advertising',2014,'1998-10-30');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'itcs6160'
--

--
-- Dumping routines for database 'itcs6160'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_payment`(IN ride int, IN account int, IN amount Double)
BEGIN
  set @maxID = (select max(paymentID) from payments);
  insert into payments 
  values ((@maxID+1), account, current_date(), amount);
  update rides
  set paymentID = @maxID+1
  where rideID = ride;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_rating`(IN ride int, IN rating int, IN comment varchar(300))
BEGIN
  set @maxID = (select max(ratingID) from ratings);
  insert into ratings 
  values ((@maxID+1), rating, comment, current_date());
  update rides
  set ratingID = @maxID+1
  where rideID = ride;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_ride` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_ride`(IN startDateTime DateTime, IN endDateTime DateTime, IN startLocation int, IN endLocation int, IN passenger1 int, IN passenger2 int)
BEGIN
  set @maxID = (select max(rideID) from rides);
  insert into rides 
  values ((@maxID+1), startDateTime, endDateTime, startLocation, endLocation, null, null, passenger1, passenger2, null, null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_ride` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_ride`(IN ride int, IN startDate DateTime, IN endDate DateTime, IN sLocation int, IN eLocation int, IN pass1 int, IN pass2 int)
BEGIN
  update rides 
  set startDateTime = startDate, endDateTime = endDate, startLocation = sLocation, endLocation = eLocation, passenger1 = pass1, passenger2 = pass2
  where rideID = ride;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_ride` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_ride`(IN ride INT)
BEGIN
  delete from rides where rideID = ride;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `all_drivers`
--

/*!50001 DROP VIEW IF EXISTS `all_drivers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_drivers` AS select `person`.`personID` AS `personID`,`person`.`name` AS `name`,`person`.`email` AS `email`,`person`.`phoneNumber` AS `phoneNumber`,`person`.`personType` AS `personType` from `person` where `person`.`personID` in (select `drivers`.`personID` from `drivers`) order by `person`.`personID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_payments`
--

/*!50001 DROP VIEW IF EXISTS `all_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_payments` AS select `pa`.`paymentID` AS `paymentID`,`p`.`name` AS `name`,`pa`.`paymentDate` AS `paymentDate`,`pa`.`paymentAmount` AS `paymentAmount` from ((`person` `p` join `accounts` `a` on((`a`.`personID` = `p`.`personID`))) join `payments` `pa` on((`pa`.`accountID` = `a`.`accountID`))) order by `p`.`personID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_rides`
--

/*!50001 DROP VIEW IF EXISTS `all_rides`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_rides` AS select `r`.`rideID` AS `rideID`,`r`.`startDateTime` AS `startDateTime`,`r`.`endDateTime` AS `endDateTime`,`l1`.`locationName` AS `startLocation`,`l2`.`locationName` AS `endLocation`,`p2`.`name` AS `passenger1`,`p3`.`name` AS `passenger2`,`p1`.`name` AS `driver` from ((((((`rides` `r` left join `drivers` `d` on((`d`.`driverID` = `r`.`driverID`))) left join `person` `p1` on((`p1`.`personID` = `d`.`personID`))) join `person` `p2` on((`p2`.`personID` = `r`.`passenger1`))) left join `person` `p3` on((`p3`.`personID` = `r`.`passenger2`))) join `locations` `l1` on((`l1`.`locationID` = `r`.`startLocation`))) join `locations` `l2` on((`l2`.`locationID` = `r`.`endLocation`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-30 21:13:51
