-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: commerce
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commodity` (
  `idcommodity` int(11) NOT NULL AUTO_INCREMENT,
  `primaryclassification` varchar(15) NOT NULL,
  `secondaryclassification` varchar(15) NOT NULL,
  `commodityname` varchar(45) NOT NULL,
  `commoditydetail` varchar(250) DEFAULT NULL,
  `commoditynsrc` varchar(45) DEFAULT NULL,
  `commodityprice` double NOT NULL DEFAULT '0',
  `attribute1` varchar(45) DEFAULT NULL,
  `attribute2` varchar(45) DEFAULT NULL,
  `putaway` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcommodity`),
  KEY `commodity_ibfk_1` (`primaryclassification`),
  KEY `commodity_ibfk_2` (`secondaryclassification`),
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`primaryclassification`) REFERENCES `classification` (`classificationname`),
  CONSTRAINT `commodity_ibfk_2` FOREIGN KEY (`secondaryclassification`) REFERENCES `classification` (`classificationname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES (1,'手机与电脑','手机','小米手机1','略','/mall/assets/images/products/digital/1.jpg',999,NULL,NULL,1),(2,'手机与电脑','手机','小米手机2','略','/mall/assets/images/products/digital/1.jpg',888,NULL,NULL,1),(3,'手机与电脑','手机','小米手机3','略','/mall/assets/images/products/digital/1.jpg',777,NULL,NULL,1),(4,'手机与电脑','手机','小米手机4','略','/mall/assets/images/products/digital/1.jpg',1999,NULL,NULL,1),(5,'手机与电脑','手机','小米手机5','略','/mall/assets/images/products/digital/1.jpg',999,NULL,NULL,1),(6,'手机与电脑','手机','小米手机6','略','/mall/assets/images/products/digital/1.jpg',888,NULL,NULL,1),(7,'手机与电脑','手机','小米手机7','略','/mall/assets/images/products/digital/1.jpg',777,NULL,NULL,1),(8,'手机与电脑','手机','小米手机8','略','/mall/assets/images/products/digital/1.jpg',1999,NULL,NULL,1),(9,'手机与电脑','笔记本电脑','华硕电脑1','略',NULL,5999,NULL,NULL,1),(10,'手机与电脑','笔记本电脑','华硕电脑2','略',NULL,7999,NULL,NULL,1);
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-23 13:56:28
