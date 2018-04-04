-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ph
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `t_pet`
--

DROP TABLE IF EXISTS `t_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `birthdate` varchar(45) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `ownerId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pet`
--

LOCK TABLES `t_pet` WRITE;
/*!40000 ALTER TABLE `t_pet` DISABLE KEYS */;
INSERT INTO `t_pet` VALUES (1,'Tom Cat','2016-01-01','photo/TomCat.jpg',2),(2,'Teddy Bear','2017-06-06','photo/TeddyBear.jpg',3),(3,'Mickey Mouse','2017-08-06','photo/MickeyMouse.jpg',3),(4,'Puppy Dog','2018-01-01','photo/1516003823666.jpg',2),(6,'Kitty Cat','2018-01-15','photo/1516004181926.jpg',4),(42,'zlzhang\'s dog','2018-01-01','photo/1517397188145.jpg',3),(43,'zhanghailong\'s bear','2018-01-30','photo/1517397601984.jpg',5),(44,'uuuuuuuiiii','2018-01-31','photo/1517551168875.jpg',2),(45,'mickey mouse\'s brother','2018-01-30','photo/1517551940363.jpg',2),(47,'fdsaf','','photo/1517553329982.jpg',2),(48,'泰迪熊','2017-01-01','photo/1517645270188.jpg',5);
/*!40000 ALTER TABLE `t_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_speciality`
--

DROP TABLE IF EXISTS `t_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_speciality` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '专业名',
  `descripton` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_speciality`
--

LOCK TABLES `t_speciality` WRITE;
/*!40000 ALTER TABLE `t_speciality` DISABLE KEYS */;
INSERT INTO `t_speciality` VALUES (1,'Dog_Spec','cure dog'),(2,'Cat_Spec','cure cat'),(3,'cure bear disease',NULL),(4,'cure big disease',NULL),(5,'bbbb',NULL),(6,'dragon_spec','cure a dragon'),(7,'ggg','ggg'),(8,'熊的专业','治疗熊的专业'),(9,'狗的专业','专门治疗狗病'),(10,'大熊猫科','专门治疗大熊猫'),(11,'鸟科','专门治疗鸟');
/*!40000 ALTER TABLE `t_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','admin','admin',NULL,NULL),(2,'customer','cyzhang','cyzhang','15972182029','wuhan'),(3,'customer','zlzhang','zlzhang','1234567890','beijing'),(4,'customer','hlzhang','123456','88888888','whvcse'),(5,'customer','张海龙','123456','15972182029','武汉软件工程职业学院');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vet`
--

DROP TABLE IF EXISTS `t_vet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_vet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vet`
--

LOCK TABLES `t_vet` WRITE;
/*!40000 ALTER TABLE `t_vet` DISABLE KEYS */;
INSERT INTO `t_vet` VALUES (1,'dog_Vet'),(2,'cat_Vet'),(3,'dog_Vet1'),(4,'cat_Vet'),(7,'hlzhang'),(8,'张小阳'),(9,'张辰阳'),(12,'abc'),(13,'ggg'),(16,'张大小'),(17,'张辰阳');
/*!40000 ALTER TABLE `t_vet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vet_speciality`
--

DROP TABLE IF EXISTS `t_vet_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_vet_speciality` (
  `vetId` int(11) NOT NULL,
  `specId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vet_speciality`
--

LOCK TABLES `t_vet_speciality` WRITE;
/*!40000 ALTER TABLE `t_vet_speciality` DISABLE KEYS */;
INSERT INTO `t_vet_speciality` VALUES (1,1),(2,2),(3,1),(4,2),(5,2),(6,1),(6,2),(7,1),(8,2),(9,1),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(11,1),(11,2),(8,1),(10,1),(11,3),(12,1),(13,7),(14,4),(15,6),(16,5),(17,11);
/*!40000 ALTER TABLE `t_vet_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_visit`
--

DROP TABLE IF EXISTS `t_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petId` int(11) NOT NULL,
  `vetId` int(11) NOT NULL,
  `visitdate` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `treatment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_visit`
--

LOCK TABLES `t_visit` WRITE;
/*!40000 ALTER TABLE `t_visit` DISABLE KEYS */;
INSERT INTO `t_visit` VALUES (1,1,1,'2018-01-17','get a cold','drink more hot water'),(2,1,1,'2018-01-17','get a fever','eat some pills'),(3,2,1,'2018-01-17','aaaaaa','bbbbbb'),(4,1,1,'2018-01-17','xxxx','yyyy'),(5,3,1,'2018-01-17','mmmmmm','nnnnnn'),(6,6,1,'2018-01-17','111111111','222222222'),(7,6,2,'2018-01-17','33333','44444'),(8,6,1,'2018-01-17','yyyyyy','zzzzzz'),(9,14,1,'2018-01-17','xxxdd','ddddd'),(10,1,1,'2018-01-18','jjjjjjjjjjjjj','kkkkkkkkkkkkk'),(11,4,7,'2018-01-18','fdsafds','3432142'),(12,2,1,'2018-01-18','fdf','safsad'),(13,1,1,'2018-01-22','fdsaf','fsdafds'),(14,1,1,'2018-01-30','ccccc','vvvvv'),(15,1,2,'2018-02-02','vvvvvvvvvvv','bbbbbbbbbbb'),(16,1,1,'2018-02-02','xxxxxxxxxxxx','ttttttttt'),(17,1,1,'2018-02-02','555555','66666'),(18,1,7,'2018-02-02','!!!!!!!!!!','&&&&&'),(19,47,1,'2018-02-02','666666666','677777777777fasgdaga'),(20,1,1,'2018-02-02','11111','1122222'),(21,44,1,'2018-02-02','',''),(22,42,1,'2018-02-02','hello ','i am zhanghailong\'s dog'),(23,4,1,'2018-02-02','0000000000','0000000000000'),(24,1,1,'2018-02-02','',''),(25,4,1,'2018-02-02','',''),(26,1,1,'2018-02-02','',''),(27,1,1,'2018-02-02','',''),(28,1,1,'2018-02-02','',''),(29,1,7,'2018-02-02','hlzhang','hlzhang'),(30,48,1,'2018-02-03','感冒了','多喝水'),(31,48,1,'2018-02-03','发烧了','吃退烧药');
/*!40000 ALTER TABLE `t_visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-28 15:22:08
