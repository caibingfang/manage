DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `sort` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (16,'Dashboard','index.html',NULL,NULL,'2018-05-30 09:22:16','2018-05-30 09:22:16',NULL,NULL,1),(17,'UI Elements','ui-elements.html',NULL,NULL,'2018-05-30 09:22:16','2018-05-30 09:22:16',NULL,NULL,2),(18,'Forms','form.html',NULL,NULL,'2018-05-30 09:22:16','2018-05-30 09:22:16',NULL,NULL,5),(19,'Charts','chart.html',NULL,NULL,'2018-05-30 09:26:14','2018-05-30 09:26:14',NULL,NULL,3),(20,'Tabs & Panels','tab-panel.html',NULL,NULL,'2018-05-30 09:26:14','2018-05-30 09:26:14',NULL,NULL,4),(21,'系统管理',NULL,NULL,NULL,'2018-05-30 09:26:14','2018-05-30 09:26:14',NULL,NULL,6),(22,'用户管理','ajax/user/list',NULL,21,'2018-05-30 09:26:14','2018-05-30 09:26:14',NULL,NULL,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `gender` tinyint(2) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;