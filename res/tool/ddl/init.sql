USE `sakai`;

--
-- Table structure for table `RES_LINKS`
--

DROP TABLE IF EXISTS `RES_LINKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RES_LINKS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RES_LINKS`
--

LOCK TABLES `RES_LINKS` WRITE;
/*!40000 ALTER TABLE `RES_LINKS` DISABLE KEYS */;
INSERT INTO `RES_LINKS` VALUES (4,'163','http://www.163.com');
/*!40000 ALTER TABLE `RES_LINKS` ENABLE KEYS */;
UNLOCK TABLES;