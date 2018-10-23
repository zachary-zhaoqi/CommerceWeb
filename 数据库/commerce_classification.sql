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
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classification` (
  `idclassification` int(11) NOT NULL AUTO_INCREMENT,
  `classificationgrade` varchar(15) DEFAULT NULL,
  `classificationname` varchar(15) NOT NULL,
  `classificationsrc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idclassification`),
  UNIQUE KEY `classificationname_UNIQUE` (`classificationname`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification`
--

LOCK TABLES `classification` WRITE;
/*!40000 ALTER TABLE `classification` DISABLE KEYS */;
INSERT INTO `classification` VALUES (1,'1','电子数码配件','mall/assets/images/menu-icon1.png'),(2,'2','手机与电脑','mall/assets/images/menu-icon2.png'),(3,'3','家具与厨具','mall/assets/images/menu-icon3.png'),(4,'4','服饰与配饰','mall/assets/images/menu-icon4.png'),(5,'5','运动与户外','mall/assets/images/menu-icon5.png'),(6,'6','珠宝与手表','mall/assets/images/menu-icon6.png'),(7,'7','健康与美容','mall/assets/images/menu-icon7.png'),(8,'8','婴儿','mall/assets/images/menu-icon8.png'),(9,'10','相机','mall/assets/images/menu-icon10.png'),(10,'a','耳机',NULL),(11,'a','移动电源',NULL),(12,'a','智能手环',NULL),(13,'b','手机',NULL),(14,'b','笔记本电脑',NULL),(15,'b','平板电脑',NULL),(16,'c','餐椅',NULL),(17,'c','餐桌',NULL),(18,'c','沙发',NULL),(19,'c','茶几',NULL),(20,'c','椅子',NULL),(21,'d','衣服',NULL),(22,'d','裤子',NULL),(23,'d','大衣',NULL),(24,'d','帽子',NULL),(25,'d','鞋子',NULL),(26,'e','球类',NULL),(27,'e','弓箭',NULL),(28,'e','田类',NULL),(29,'e','径类',NULL),(30,'f','珠宝',NULL),(31,'f','手表',NULL),(32,'h','推车',NULL),(33,'h','奶瓶',NULL),(34,'j','便携相机',NULL),(35,'j','数码相机',NULL),(36,'j','单反',NULL),(37,'j','镜头',NULL);
/*!40000 ALTER TABLE `classification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-23 13:56:27
