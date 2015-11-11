-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: musicnet
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `ACCOUNTREQUEST`
--

DROP TABLE IF EXISTS `ACCOUNTREQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCOUNTREQUEST` (
  `accountrequest_id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `confirmpassword` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `processed` bit(1) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`accountrequest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOUNTREQUEST`
--

LOCK TABLES `ACCOUNTREQUEST` WRITE;
/*!40000 ALTER TABLE `ACCOUNTREQUEST` DISABLE KEYS */;
INSERT INTO `ACCOUNTREQUEST` VALUES (1,'m1','m1','2015-04-23 13:17:00','m1','m1','m1','m1','','ROLE_USER','m1'),(2,'e1','e1','2015-04-23 13:18:00','e1','e1','e1','e1','','ROLE_USER','e1'),(3,'e2','e2','2015-04-23 13:18:00','e2','e2','e2','e2','','ROLE_EVENTMANAGER','e2'),(4,'e3','e3','2015-04-23 13:31:00','e3','e3','e3','e3','','ROLE_EVENTMANAGER','e3');
/*!40000 ALTER TABLE `ACCOUNTREQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADMIN`
--

DROP TABLE IF EXISTS `ADMIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN` (
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `FK_7dgy95egwbrkqpd707tr8ryhn` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN`
--

LOCK TABLES `ADMIN` WRITE;
/*!40000 ALTER TABLE `ADMIN` DISABLE KEYS */;
INSERT INTO `ADMIN` VALUES (1);
/*!40000 ALTER TABLE `ADMIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT`
--

DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT`
--

LOCK TABLES `EVENT` WRITE;
/*!40000 ALTER TABLE `EVENT` DISABLE KEYS */;
INSERT INTO `EVENT` VALUES (1,'c','2015-04-27 13:19:00','c','2015-04-24 13:19:00'),(2,'p','2015-04-10 13:23:00','p','2015-04-09 00:00:00'),(3,'c3','2015-04-27 13:31:00','c3','2015-04-24 13:31:00'),(4,'o1','2015-04-10 13:35:00','o1','2015-04-09 13:35:00');
/*!40000 ALTER TABLE `EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTMANAGER`
--

DROP TABLE IF EXISTS `EVENTMANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENTMANAGER` (
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `FK_ayq1wqkbchybo0e0701r13fjp` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTMANAGER`
--

LOCK TABLES `EVENTMANAGER` WRITE;
/*!40000 ALTER TABLE `EVENTMANAGER` DISABLE KEYS */;
INSERT INTO `EVENTMANAGER` VALUES (7),(8);
/*!40000 ALTER TABLE `EVENTMANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTMANAGERDETAILS`
--

DROP TABLE IF EXISTS `EVENTMANAGERDETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENTMANAGERDETAILS` (
  `event_id` bigint(20) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`person_id`),
  KEY `FK_es7ld1fpoavscg573ysqyv6ds` (`person_id`),
  CONSTRAINT `FK_es7ld1fpoavscg573ysqyv6ds` FOREIGN KEY (`person_id`) REFERENCES `EVENTMANAGER` (`person_id`),
  CONSTRAINT `FK_m0hcga4dq2clq2w6tmj4e1p5h` FOREIGN KEY (`event_id`) REFERENCES `EVENT` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTMANAGERDETAILS`
--

LOCK TABLES `EVENTMANAGERDETAILS` WRITE;
/*!40000 ALTER TABLE `EVENTMANAGERDETAILS` DISABLE KEYS */;
INSERT INTO `EVENTMANAGERDETAILS` VALUES (1,7),(2,7),(3,8),(4,8);
/*!40000 ALTER TABLE `EVENTMANAGERDETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTUSERDETAILS`
--

DROP TABLE IF EXISTS `EVENTUSERDETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENTUSERDETAILS` (
  `event_id` bigint(20) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`person_id`),
  KEY `FK_bts8ocy474srv4ky5u0889uur` (`person_id`),
  CONSTRAINT `FK_bts8ocy474srv4ky5u0889uur` FOREIGN KEY (`person_id`) REFERENCES `MUSICIAN` (`person_id`),
  CONSTRAINT `FK_swkf9rjk3oj9o2c1qbcd5hg0g` FOREIGN KEY (`event_id`) REFERENCES `EVENT` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTUSERDETAILS`
--

LOCK TABLES `EVENTUSERDETAILS` WRITE;
/*!40000 ALTER TABLE `EVENTUSERDETAILS` DISABLE KEYS */;
INSERT INTO `EVENTUSERDETAILS` VALUES (1,3),(2,3),(2,5),(3,5);
/*!40000 ALTER TABLE `EVENTUSERDETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MUSICIAN`
--

DROP TABLE IF EXISTS `MUSICIAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MUSICIAN` (
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `FK_55wrjbxkl7ppfd9q2fwhh12u6` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MUSICIAN`
--

LOCK TABLES `MUSICIAN` WRITE;
/*!40000 ALTER TABLE `MUSICIAN` DISABLE KEYS */;
INSERT INTO `MUSICIAN` VALUES (3),(5);
/*!40000 ALTER TABLE `MUSICIAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MUSICIAN_SKILL`
--

DROP TABLE IF EXISTS `MUSICIAN_SKILL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MUSICIAN_SKILL` (
  `MUSICIAN_person_id` int(11) NOT NULL,
  `skills_skill_id` int(11) NOT NULL,
  PRIMARY KEY (`MUSICIAN_person_id`,`skills_skill_id`),
  UNIQUE KEY `UK_ki47eehfsreips6tltpdpnlgx` (`skills_skill_id`),
  CONSTRAINT `FK_7ypfl3pthnoktwdq5i1my0gd9` FOREIGN KEY (`MUSICIAN_person_id`) REFERENCES `MUSICIAN` (`person_id`),
  CONSTRAINT `FK_ki47eehfsreips6tltpdpnlgx` FOREIGN KEY (`skills_skill_id`) REFERENCES `SKILL` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MUSICIAN_SKILL`
--

LOCK TABLES `MUSICIAN_SKILL` WRITE;
/*!40000 ALTER TABLE `MUSICIAN_SKILL` DISABLE KEYS */;
INSERT INTO `MUSICIAN_SKILL` VALUES (3,1);
/*!40000 ALTER TABLE `MUSICIAN_SKILL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSON`
--

DROP TABLE IF EXISTS `PERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSON` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `dob` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `imagefile` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSON`
--

LOCK TABLES `PERSON` WRITE;
/*!40000 ALTER TABLE `PERSON` DISABLE KEYS */;
INSERT INTO `PERSON` VALUES (1,'2015-04-24 13:15:59','email@email.com','admin','','admin'),(3,'2015-04-23 13:17:00','m1','m1','/healthnet/resources/images/m13.jpeg','m1'),(5,'2015-04-23 13:18:00','e1','e1',NULL,'e1'),(7,'2015-04-23 13:18:00','e2','e2',NULL,'e2'),(8,'2015-04-23 13:31:00','e3','e3',NULL,'e3');
/*!40000 ALTER TABLE `PERSON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'ROLE_EVENTMANAGER');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLEDETAILS`
--

DROP TABLE IF EXISTS `ROLEDETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLEDETAILS` (
  `account_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`account_id`,`role_id`),
  KEY `FK_j18duhudc4aw8evrxp9t2hiu4` (`role_id`),
  CONSTRAINT `FK_6u9xunluulp2vnym9fiabx4p6` FOREIGN KEY (`account_id`) REFERENCES `USERACCOUNT` (`account_id`),
  CONSTRAINT `FK_j18duhudc4aw8evrxp9t2hiu4` FOREIGN KEY (`role_id`) REFERENCES `ROLE` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLEDETAILS`
--

LOCK TABLES `ROLEDETAILS` WRITE;
/*!40000 ALTER TABLE `ROLEDETAILS` DISABLE KEYS */;
INSERT INTO `ROLEDETAILS` VALUES (1,1),(3,2),(5,2),(7,3),(8,3);
/*!40000 ALTER TABLE `ROLEDETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKILL`
--

DROP TABLE IF EXISTS `SKILL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKILL` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `instrument` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKILL`
--

LOCK TABLES `SKILL` WRITE;
/*!40000 ALTER TABLE `SKILL` DISABLE KEYS */;
INSERT INTO `SKILL` VALUES (1,'beginner','guitar','guitar');
/*!40000 ALTER TABLE `SKILL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERACCOUNT`
--

DROP TABLE IF EXISTS `USERACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERACCOUNT` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isenabled` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `FK_ojc89uqe7k0ne6mwhca2v36bu` (`person_id`),
  CONSTRAINT `FK_ojc89uqe7k0ne6mwhca2v36bu` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERACCOUNT`
--

LOCK TABLES `USERACCOUNT` WRITE;
/*!40000 ALTER TABLE `USERACCOUNT` DISABLE KEYS */;
INSERT INTO `USERACCOUNT` VALUES (1,'','admin','admin',1),(3,'','m1','m1',3),(5,'','e1','e1',5),(7,'','e2','e2',7),(8,'','e3','e3',8);
/*!40000 ALTER TABLE `USERACCOUNT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-24 13:45:00
