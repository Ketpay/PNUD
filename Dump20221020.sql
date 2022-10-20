-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: pnud
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add ao_access',9,'add_ao_access'),(34,'Can change ao_access',9,'change_ao_access'),(35,'Can delete ao_access',9,'delete_ao_access'),(36,'Can view ao_access',9,'view_ao_access'),(37,'Can add ao_need',10,'add_ao_need'),(38,'Can change ao_need',10,'change_ao_need'),(39,'Can delete ao_need',10,'delete_ao_need'),(40,'Can view ao_need',10,'view_ao_need'),(41,'Can add base_metas_estado_tendencia',11,'add_base_metas_estado_tendencia'),(42,'Can change base_metas_estado_tendencia',11,'change_base_metas_estado_tendencia'),(43,'Can delete base_metas_estado_tendencia',11,'delete_base_metas_estado_tendencia'),(44,'Can view base_metas_estado_tendencia',11,'view_base_metas_estado_tendencia'),(45,'Can add base_puntos_referencia',12,'add_base_puntos_referencia'),(46,'Can change base_puntos_referencia',12,'change_base_puntos_referencia'),(47,'Can delete base_puntos_referencia',12,'delete_base_puntos_referencia'),(48,'Can view base_puntos_referencia',12,'view_base_puntos_referencia'),(49,'Can add cw_chemical_trend',13,'add_cw_chemical_trend'),(50,'Can change cw_chemical_trend',13,'change_cw_chemical_trend'),(51,'Can delete cw_chemical_trend',13,'delete_cw_chemical_trend'),(52,'Can view cw_chemical_trend',13,'view_cw_chemical_trend'),(53,'Can add cw_nutrient_trend',14,'add_cw_nutrient_trend'),(54,'Can change cw_nutrient_trend',14,'change_cw_nutrient_trend'),(55,'Can delete cw_nutrient_trend',14,'delete_cw_nutrient_trend'),(56,'Can view cw_nutrient_trend',14,'view_cw_nutrient_trend'),(57,'Can add cw_pathogen_trend',15,'add_cw_pathogen_trend'),(58,'Can change cw_pathogen_trend',15,'change_cw_pathogen_trend'),(59,'Can delete cw_pathogen_trend',15,'delete_cw_pathogen_trend'),(60,'Can view cw_pathogen_trend',15,'view_cw_pathogen_trend'),(61,'Can add cw_trash_trend',16,'add_cw_trash_trend'),(62,'Can change cw_trash_trend',16,'change_cw_trash_trend'),(63,'Can delete cw_trash_trend',16,'delete_cw_trash_trend'),(64,'Can view cw_trash_trend',16,'view_cw_trash_trend'),(65,'Can add eco_status',17,'add_eco_status'),(66,'Can change eco_status',17,'change_eco_status'),(67,'Can delete eco_status',17,'delete_eco_status'),(68,'Can view eco_status',17,'view_eco_status'),(69,'Can add eco_trend',18,'add_eco_trend'),(70,'Can change eco_trend',18,'change_eco_trend'),(71,'Can delete eco_trend',18,'delete_eco_trend'),(72,'Can view eco_trend',18,'view_eco_trend'),(73,'Can add fis_b_bmsy',19,'add_fis_b_bmsy'),(74,'Can change fis_b_bmsy',19,'change_fis_b_bmsy'),(75,'Can delete fis_b_bmsy',19,'delete_fis_b_bmsy'),(76,'Can view fis_b_bmsy',19,'view_fis_b_bmsy'),(77,'Can add fis_meancatch',20,'add_fis_meancatch'),(78,'Can change fis_meancatch',20,'change_fis_meancatch'),(79,'Can delete fis_meancatch',20,'delete_fis_meancatch'),(80,'Can view fis_meancatch',20,'view_fis_meancatch'),(81,'Can add hab_mangrove_extent',21,'add_hab_mangrove_extent'),(82,'Can change hab_mangrove_extent',21,'change_hab_mangrove_extent'),(83,'Can delete hab_mangrove_extent',21,'delete_hab_mangrove_extent'),(84,'Can view hab_mangrove_extent',21,'view_hab_mangrove_extent'),(85,'Can add hab_mangrove_health',22,'add_hab_mangrove_health'),(86,'Can change hab_mangrove_health',22,'change_hab_mangrove_health'),(87,'Can delete hab_mangrove_health',22,'delete_hab_mangrove_health'),(88,'Can view hab_mangrove_health',22,'view_hab_mangrove_health'),(89,'Can add hab_mangrove_trend',23,'add_hab_mangrove_trend'),(90,'Can change hab_mangrove_trend',23,'change_hab_mangrove_trend'),(91,'Can delete hab_mangrove_trend',23,'delete_hab_mangrove_trend'),(92,'Can view hab_mangrove_trend',23,'view_hab_mangrove_trend'),(93,'Can add hab_saltmarsh_extent',24,'add_hab_saltmarsh_extent'),(94,'Can change hab_saltmarsh_extent',24,'change_hab_saltmarsh_extent'),(95,'Can delete hab_saltmarsh_extent',24,'delete_hab_saltmarsh_extent'),(96,'Can view hab_saltmarsh_extent',24,'view_hab_saltmarsh_extent'),(97,'Can add hab_saltmarsh_health',25,'add_hab_saltmarsh_health'),(98,'Can change hab_saltmarsh_health',25,'change_hab_saltmarsh_health'),(99,'Can delete hab_saltmarsh_health',25,'delete_hab_saltmarsh_health'),(100,'Can view hab_saltmarsh_health',25,'view_hab_saltmarsh_health'),(101,'Can add hab_saltmarsh_trend',26,'add_hab_saltmarsh_trend'),(102,'Can change hab_saltmarsh_trend',26,'change_hab_saltmarsh_trend'),(103,'Can delete hab_saltmarsh_trend',26,'delete_hab_saltmarsh_trend'),(104,'Can view hab_saltmarsh_trend',26,'view_hab_saltmarsh_trend'),(105,'Can add le_sector_weight',27,'add_le_sector_weight'),(106,'Can change le_sector_weight',27,'change_le_sector_weight'),(107,'Can delete le_sector_weight',27,'delete_le_sector_weight'),(108,'Can view le_sector_weight',27,'view_le_sector_weight'),(109,'Can add liv_status',28,'add_liv_status'),(110,'Can change liv_status',28,'change_liv_status'),(111,'Can delete liv_status',28,'delete_liv_status'),(112,'Can view liv_status',28,'view_liv_status'),(113,'Can add liv_trend',29,'add_liv_trend'),(114,'Can change liv_trend',29,'change_liv_trend'),(115,'Can delete liv_trend',29,'delete_liv_trend'),(116,'Can view liv_trend',29,'view_liv_trend'),(117,'Can add spp_status',30,'add_spp_status'),(118,'Can change spp_status',30,'change_spp_status'),(119,'Can delete spp_status',30,'delete_spp_status'),(120,'Can view spp_status',30,'view_spp_status'),(121,'Can add spp_trend',31,'add_spp_trend'),(122,'Can change spp_trend',31,'change_spp_trend'),(123,'Can delete spp_trend',31,'delete_spp_trend'),(124,'Can view spp_trend',31,'view_spp_trend'),(125,'Can add tr_sustainability',32,'add_tr_sustainability'),(126,'Can change tr_sustainability',32,'change_tr_sustainability'),(127,'Can delete tr_sustainability',32,'delete_tr_sustainability'),(128,'Can view tr_sustainability',32,'view_tr_sustainability'),(129,'Can add tr_visit_sq_pct_tourism',33,'add_tr_visit_sq_pct_tourism'),(130,'Can change tr_visit_sq_pct_tourism',33,'change_tr_visit_sq_pct_tourism'),(131,'Can delete tr_visit_sq_pct_tourism',33,'delete_tr_visit_sq_pct_tourism'),(132,'Can view tr_visit_sq_pct_tourism',33,'view_tr_visit_sq_pct_tourism'),(133,'Can add Indicadores_empleo',34,'add_indicadores_empleo'),(134,'Can change Indicadores_empleo',34,'change_indicadores_empleo'),(135,'Can delete Indicadores_empleo',34,'delete_indicadores_empleo'),(136,'Can view Indicadores_empleo',34,'view_indicadores_empleo'),(137,'Can add Indicadores_empleo',35,'add_indicadores_ingreso'),(138,'Can change Indicadores_empleo',35,'change_indicadores_ingreso'),(139,'Can delete Indicadores_empleo',35,'delete_indicadores_ingreso'),(140,'Can view Indicadores_empleo',35,'view_indicadores_ingreso'),(141,'Can add Mar_harvest_tonnes',36,'add_mar_harvest_tonnes'),(142,'Can change Mar_harvest_tonnes',36,'change_mar_harvest_tonnes'),(143,'Can delete Mar_harvest_tonnes',36,'delete_mar_harvest_tonnes'),(144,'Can view Mar_harvest_tonnes',36,'view_mar_harvest_tonnes'),(145,'Can add Mar_sustainability_score',37,'add_mar_sustainability_score'),(146,'Can change Mar_sustainability_score',37,'change_mar_sustainability_score'),(147,'Can delete Mar_sustainability_score',37,'delete_mar_sustainability_score'),(148,'Can view Mar_sustainability_score',37,'view_mar_sustainability_score');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$0XgoJUPbdZj8vQrPz8s10H$GAwId4pctAAvBE9kafVPeJbCmSoD1xKTqGPbWPLv8Ig=',NULL,1,'samuel','','','',1,1,'2022-09-28 10:26:29.725996');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5','2022-09-28 10:26:29.951042',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_ao_access`
--

DROP TABLE IF EXISTS `db_pnud_ao_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_ao_access` (
  `anio` bigint DEFAULT NULL,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_ao_access`
--

LOCK TABLES `db_pnud_ao_access` WRITE;
/*!40000 ALTER TABLE `db_pnud_ao_access` DISABLE KEYS */;
INSERT INTO `db_pnud_ao_access` VALUES (2013,0.632,NULL);
/*!40000 ALTER TABLE `db_pnud_ao_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_ao_need`
--

DROP TABLE IF EXISTS `db_pnud_ao_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_ao_need` (
  `anio` bigint DEFAULT NULL,
  `zona` text,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_ao_need`
--

LOCK TABLES `db_pnud_ao_need` WRITE;
/*!40000 ALTER TABLE `db_pnud_ao_need` DISABLE KEYS */;
INSERT INTO `db_pnud_ao_need` VALUES (2007,'Nacional',42.4,1),(2009,'Nacional',33.5,2),(2013,'Nacional',23.9,3),(2018,'Nacional',20.5,4),(2007,'Sechura',27.9,5),(2009,'Sechura',34.1,6),(2013,'Sechura',20.7,7),(2018,'Sechura',25.8,8),(2007,'Vice',41.3,9),(2009,'Vice',41.8,10),(2013,'Vice',50,11),(2018,'Vice',33.4,12);
/*!40000 ALTER TABLE `db_pnud_ao_need` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_base_metas_estado_tendencia`
--

DROP TABLE IF EXISTS `db_pnud_base_metas_estado_tendencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_base_metas_estado_tendencia` (
  `meta` text,
  `submeta` text,
  `capa_datos` text,
  `codigo_idso` text,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_base_metas_estado_tendencia`
--

LOCK TABLES `db_pnud_base_metas_estado_tendencia` WRITE;
/*!40000 ALTER TABLE `db_pnud_base_metas_estado_tendencia` DISABLE KEYS */;
INSERT INTO `db_pnud_base_metas_estado_tendencia` VALUES ('Subsistencia y Economía Costera','Economía','Puntajes de estado económico','eco_status',1),('Subsistencia y Economía Costera','Economía','Puntajes de tendencia económica','eco_trend',2),('Subsistencia y Economía Costera','Economía','Sectores en cada región','le_sector_weight',3),('Subsistencia y Economía Costera','Subsistencia','Puntuaciones  del  estado de los medios de vida','liv_status',4),('Subsistencia y Economía Costera','Subsistencia','Puntuaciones de las tendencias  de  los  medios de vida','liv_trend',5),('Turismo y Recreación',NULL,'Cantidad  y  calidad  de la visita turística ponderada','tr_visit_sq_pct_tourism',6),('Turismo y Recreación',NULL,'Índice de sostenibilidad turística','tr_sustainability',7),('Oportunidades de Pesca Artesanal',NULL,'Oportunidad de pesca artesanal','ao_access',8),('Oportunidades de Pesca Artesanal',NULL,'Necesidad  económica  de la pesca artesanal','ao_need',9),('Provisión de Alimentos','Pesca','Estimaciones de B / Bmsy','fis_b_bmsy',10),('Provisión de Alimentos','Pesca','Datos de captura pesquera','fis_meancatch',11),('Provisión de Alimentos','Maricultura','Toneladas  potenciales  de cosecha de maricultura','mar_capacity',12),('Provisión de Alimentos','Maricultura','Cosecha de maricultura','mar_harvest_tonnes',13),('Provisión de Alimentos','Maricultura','Puntuación de sostenibilidad de la maricultura','mar_sustainability_score',14),('Productos Naturales',NULL,'Puntaje de aceite y harina de pescado','np_fofm_scores',15),('Productos Naturales',NULL,'Valor de cosecha de producto natural relativo','np_harvest_product_weight',16),('Sentido de Pertenencia (SP)','Especies Icónicas (ICO)','Riesgo  de  extinción  de  la UICN','ico_spp_iucn_status',17),('Sentido de Pertenencia (SP)','Lugares Especiales Perdurables (LSP)','Áreas  protegidas  costeras interiores','lsp_prot_area_inland1km',18),('Sentido de Pertenencia (SP)','Lugares Especiales Perdurables (LSP)','Áreas  protegidas  costeras mar adentro','lsp_prot_area_offshore3nm',19),('Sentido de Pertenencia (SP)','Lugares Especiales Perdurables (LSP)','Área interior de 1 km','rgn_area_inland1km',20),('Sentido de Pertenencia (SP)','Lugares Especiales Perdurables (LSP)','Área costa afuera de 3 nm','rgn_area_offshore3nm',21),('Biodiversidad','Especies','Condición  promedio  de  la especie','spp_status',22),('Biodiversidad','Especies','Tendencia promedio de la condición de la especie','spp_trend',23),('Biodiversidad','Hábitats','Condición  del  hábitat  del manglar','hab_mangrove_health',24),('Biodiversidad','Hábitats','Tendencia de  la condición del hábitat del manglar','hab_mangrove_trend',25),('Biodiversidad','Hábitats','Condición del hábitat de la marisma salada','hab_saltmarsh_health',26),('Biodiversidad','Hábitats','Tendencia de  la condición del  hábitat  de  la  marisma salada','hab_saltmarsh_trend',27),('Almacenamiento de carbono (CS) y Protección Costera (CP)',NULL,'Extensión  del  hábitat  del manglar','hab_mangrove_extent',28),('Almacenamiento de carbono (CS) y Protección Costera (CP)',NULL,'Condición  del  hábitat  del manglar','hab_mangrove_health',29),('Almacenamiento de carbono (CS) y Protección Costera (CP)',NULL,'Tendencia de  la condición del hábitat del manglar','hab_mangrove_trend',30),('Almacenamiento de carbono (CS) y Protección Costera (CP)',NULL,'Extensión del hábitat de la marisma salada','hab_saltmarsh_extent',31),('Almacenamiento de carbono (CS) y Protección Costera (CP)',NULL,'Condición del hábitat de la marisma salada','hab_saltmarsh_health',32),('Almacenamiento de carbono (CS) y Protección Costera (CP)',NULL,'Tendencia de  la condición del  hábitat  de  la  marisma salada','hab_saltmarsh_trend',33),('Aguas Limpias',NULL,'Tendencia de contaminación química','cw_chemical_trend',34),('Aguas Limpias',NULL,'Tendencia de la contaminación por nutrientes','cw_nutrient_trend',35),('Aguas Limpias',NULL,'Tendencia de la contaminación por patógenos','cw_pathogen_trend',36),('Aguas Limpias',NULL,'Plásticos marinos','cw_trash_trend',37),('Aguas Limpias',NULL,'Contaminación química costera','po_chemicals_3nm',38),('Aguas Limpias',NULL,'Contaminación de nutrientes','po_nutrientes',39),('Aguas Limpias',NULL,'Contaminación por patógenos','po_pathogens',40),('Aguas Limpias',NULL,'Contaminación  global  de plásticos marinos','po_trash',41);
/*!40000 ALTER TABLE `db_pnud_base_metas_estado_tendencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_base_puntos_referencia`
--

DROP TABLE IF EXISTS `db_pnud_base_puntos_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_base_puntos_referencia` (
  `meta` text,
  `submeta` text,
  `descripcion_punto_referencia` text,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_base_puntos_referencia`
--

LOCK TABLES `db_pnud_base_puntos_referencia` WRITE;
/*!40000 ALTER TABLE `db_pnud_base_puntos_referencia` DISABLE KEYS */;
INSERT INTO `db_pnud_base_puntos_referencia` VALUES ('Subsistencias y economía costeras (LE)','Subsistencias (LIV) (empleos)','Porcentaje máximo de empleo en la serie de tiempo de 10 años (2008-2018) en Piura: 47.70% en 2016',1),('Subsistencias y economía costeras (LE)','Subsistencias (LIV) (salarios)','Valor anual máximo de ingresos en departamentos costeros: 1,939.9 soles en Lima, 2016',2),('Subsistencias y economía costeras (LE)','Economía (ECO)','Tasa máxima de cambio quinquenal del VAB correspondiente a departamentos costeros: Lima = 1.36',3),('Turismo y Recreación (TR)',NULL,'Número máximo de arribos de visitantes nacionales y extranjeros a establecimientos de hospedaje en la provincia de Sechura: 72,077 arribos en 2014',4),('Oportunidad de Pesca Artesanal (AO)',NULL,'0 pobreza',5),('Provisión de Alimentos (FP)','Pesca (FIS)','Valor de B/BMSY11, para el cuál la cosecha es máxima y sostenible. Se penaliza por sobre-captura y sub-captura.',6),('Provisión de Alimentos (FP)','Maricultura (MAR)','Máxima producción sostenible en el espacio considerado como áreas de derechos acuícolas al año 2020: 96,112 ton',7),('Productos Naturales (NP)',NULL,'Biomasa/Biomasa máxima sostenible (B / Bmsy)',8),('Sentido de Lugar (SP)','Especies Icónicas (ICO)','Especies icónicas con categoría UICN Low Concern (baja preocupación).',9),('Sentido de Lugar (SP)','Lugares especiales perdurables (LSP)','30% de áreas marinas - costeras protegidas.',10),('Biodiversidad (BD)','Hábitats (HAB)','Valor de cobertura alcanzado para cada tipo de hábitat en algún año de referencia. Años de referencia según el tipo de hábitat:  Manglar: 1985  Marismas Saladas: 2000',11),('Biodiversidad (BD)','Especies (SPP)','Punto de referencia máximo: Especies existentes con categoría UICN Low Concern (baja preocupación). Punto de referencia mínimo: 75% de las especies están extinguidas (estado catastrófico).',12),('Almacenamiento de Carbono (CS)',NULL,'Valor de cobertura alcanzado para cada tipo de hábitat en algún año de referencia. Años de referencia según el tipo de hábitat:  Manglar: 1985  Marismas Saladas: 2000',13),('Protección Costera (CP)',NULL,'Valor de cobertura alcanzado para cada tipo de hábitat en algún año de referencia. Años de referencia según el tipo de hábitat:  Manglar: 1985  Marismas Saladas: 2000',14),('Aguas Limpias (CW)',NULL,'Contaminación cero para todos los componentes de contaminación.',15);
/*!40000 ALTER TABLE `db_pnud_base_puntos_referencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_cw_chemical_trend`
--

DROP TABLE IF EXISTS `db_pnud_cw_chemical_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_cw_chemical_trend` (
  `anio` bigint DEFAULT NULL,
  `valor` bigint DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_cw_chemical_trend`
--

LOCK TABLES `db_pnud_cw_chemical_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_cw_chemical_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_cw_chemical_trend` VALUES (2021,1,1);
/*!40000 ALTER TABLE `db_pnud_cw_chemical_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_cw_nutrient_trend`
--

DROP TABLE IF EXISTS `db_pnud_cw_nutrient_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_cw_nutrient_trend` (
  `anio` bigint DEFAULT NULL,
  `valor` bigint DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_cw_nutrient_trend`
--

LOCK TABLES `db_pnud_cw_nutrient_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_cw_nutrient_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_cw_nutrient_trend` VALUES (2018,-1,1);
/*!40000 ALTER TABLE `db_pnud_cw_nutrient_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_cw_pathogen_trend`
--

DROP TABLE IF EXISTS `db_pnud_cw_pathogen_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_cw_pathogen_trend` (
  `anio` bigint DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_cw_pathogen_trend`
--

LOCK TABLES `db_pnud_cw_pathogen_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_cw_pathogen_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_cw_pathogen_trend` VALUES (2021,-0.085,1);
/*!40000 ALTER TABLE `db_pnud_cw_pathogen_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_cw_trash_trend`
--

DROP TABLE IF EXISTS `db_pnud_cw_trash_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_cw_trash_trend` (
  `anio` bigint DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_cw_trash_trend`
--

LOCK TABLES `db_pnud_cw_trash_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_cw_trash_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_cw_trash_trend` VALUES (2016,0.47,1);
/*!40000 ALTER TABLE `db_pnud_cw_trash_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_eco_status`
--

DROP TABLE IF EXISTS `db_pnud_eco_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_eco_status` (
  `anio` bigint DEFAULT NULL,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_eco_status`
--

LOCK TABLES `db_pnud_eco_status` WRITE;
/*!40000 ALTER TABLE `db_pnud_eco_status` DISABLE KEYS */;
INSERT INTO `db_pnud_eco_status` VALUES (2014,53.3,1),(2015,100,2),(2016,84.9,3),(2017,21.6,4),(2018,41.6,5),(2019,95.7,6),(2020,40,NULL),(2021,60,NULL),(2022,70.5,NULL),(2023,15,NULL),(2024,90.5,NULL),(2025,16.8,NULL),(2026,12,NULL),(2027,13,NULL);
/*!40000 ALTER TABLE `db_pnud_eco_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_eco_trend`
--

DROP TABLE IF EXISTS `db_pnud_eco_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_eco_trend` (
  `anio` bigint DEFAULT NULL,
  `actividad_economica` text,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_eco_trend`
--

LOCK TABLES `db_pnud_eco_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_eco_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_eco_trend` VALUES (2022,'ACUICULTURA y PESCA',0.27,1),(2022,'TURISMO',0.07,2),(2022,'TRANSPORTE',0.23,3),(2022,'BSP',0.57,4);
/*!40000 ALTER TABLE `db_pnud_eco_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_fis_b_bmsy`
--

DROP TABLE IF EXISTS `db_pnud_fis_b_bmsy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_fis_b_bmsy` (
  `anio` bigint DEFAULT NULL,
  `nombre de especies` text,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_fis_b_bmsy`
--

LOCK TABLES `db_pnud_fis_b_bmsy` WRITE;
/*!40000 ALTER TABLE `db_pnud_fis_b_bmsy` DISABLE KEYS */;
INSERT INTO `db_pnud_fis_b_bmsy` VALUES (2017,'Cynoscion analis',0.31,1),(2017,'Genypterus maculatus',0.34,2),(2017,'Sardinops sagax',0.35,3),(2017,'Albula vulpes',0.36,4),(2017,'Argopecten purpuratus',0.4,5),(2017,'Centengraulis mysticetus',0.42,6),(2017,'Dissostichus eleginoides',0.43,7),(2017,'Mugil cephalus',0.45,8),(2017,'Makaira nigricans',0.46,9),(2017,'Merluccius gayi  peruanus',0.53,10),(2017,'Trichiurus lepturus',0.56,11),(2017,'Scomber japonicus',0.59,12),(2017,'Paralabrax humeralis',0.59,13),(2017,'Isacia conceptionis',0.65,14),(2017,'Coryphaena hippurus',0.77,15),(2017,'Thunnus albacares',0.92,16),(2017,'Istiophorus platypterus',1.02,17),(2017,'Scomberomorus sierra',1.11,18),(2017,'Prionace glauca',1.12,19),(2017,'Katsuwonus pelamis',1.13,20),(2017,'Alopias vulpinus',1.3,21),(2017,'Engraulis ringens',1.35,22),(2017,'Ethmidium maculatum',1.49,23),(2017,'Thunnus alalunga',1.61,24),(2017,'Xiphias gladius',2.27,25);
/*!40000 ALTER TABLE `db_pnud_fis_b_bmsy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_fis_meancatch`
--

DROP TABLE IF EXISTS `db_pnud_fis_meancatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_fis_meancatch` (
  `anio` bigint DEFAULT NULL,
  `tipo` text,
  `valor` bigint DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_fis_meancatch`
--

LOCK TABLES `db_pnud_fis_meancatch` WRITE;
/*!40000 ALTER TABLE `db_pnud_fis_meancatch` DISABLE KEYS */;
INSERT INTO `db_pnud_fis_meancatch` VALUES (2000,'Peces',623819,1),(2001,'Peces',389212,2),(2002,'Peces',395849,3),(2003,'Peces',656787,4),(2004,'Peces',713928,5),(2005,'Peces',497764,6),(2006,'Peces',257843,7),(2007,'Peces',355051,8),(2008,'Peces',322981,9),(2009,'Peces',273631,10),(2010,'Peces',127470,11),(2011,'Peces',305960,12),(2012,'Peces',159760,13),(2013,'Peces',46638,14),(2014,'Peces',58677,15),(2015,'Peces',124149,16),(2016,'Peces',124504,17),(2017,'Peces',186663,18),(2018,'Peces',185380,19),(2019,'Peces',172158,20),(2000,'Invertebrados',2589,21),(2001,'Invertebrados',11683,22),(2002,'Invertebrados',6686,23),(2003,'Invertebrados',10377,24),(2004,'Invertebrados',7614,25),(2005,'Invertebrados',7440,26),(2006,'Invertebrados',15450,27),(2007,'Invertebrados',12504,28),(2008,'Invertebrados',10399,29),(2009,'Invertebrados',11954,30),(2010,'Invertebrados',6792,31),(2011,'Invertebrados',9973,32),(2012,'Invertebrados',30025,33),(2013,'Invertebrados',65266,34),(2014,'Invertebrados',45740,35),(2015,'Invertebrados',40602,36),(2016,'Invertebrados',30736,37),(2017,'Invertebrados',27892,38),(2018,'Invertebrados',37735,39),(2019,'Invertebrados',30570,40);
/*!40000 ALTER TABLE `db_pnud_fis_meancatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_hab_mangrove_extent`
--

DROP TABLE IF EXISTS `db_pnud_hab_mangrove_extent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_hab_mangrove_extent` (
  `anio` bigint DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_hab_mangrove_extent`
--

LOCK TABLES `db_pnud_hab_mangrove_extent` WRITE;
/*!40000 ALTER TABLE `db_pnud_hab_mangrove_extent` DISABLE KEYS */;
INSERT INTO `db_pnud_hab_mangrove_extent` VALUES (2021,7.74,1),(2021,2.99,2),(2021,4.75,3);
/*!40000 ALTER TABLE `db_pnud_hab_mangrove_extent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_hab_mangrove_health`
--

DROP TABLE IF EXISTS `db_pnud_hab_mangrove_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_hab_mangrove_health` (
  `anio` bigint DEFAULT NULL,
  `balneario` text,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_hab_mangrove_health`
--

LOCK TABLES `db_pnud_hab_mangrove_health` WRITE;
/*!40000 ALTER TABLE `db_pnud_hab_mangrove_health` DISABLE KEYS */;
INSERT INTO `db_pnud_hab_mangrove_health` VALUES (1990,'Sechura',0.74,1),(1996,'Sechura',0.66,2),(2000,'Sechura',0.86,3),(2015,'Sechura',1,4),(2021,'Sechura',1,5),(1990,'Vice',0.91,6),(1996,'Vice',0.91,7),(2000,'Vice',1,8),(2015,'Vice',1,9),(2021,'Vice',1,10);
/*!40000 ALTER TABLE `db_pnud_hab_mangrove_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_hab_mangrove_trend`
--

DROP TABLE IF EXISTS `db_pnud_hab_mangrove_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_hab_mangrove_trend` (
  `anio` bigint DEFAULT NULL,
  `balneario` text,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_hab_mangrove_trend`
--

LOCK TABLES `db_pnud_hab_mangrove_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_hab_mangrove_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_hab_mangrove_trend` VALUES (2021,'Sechura',0.36,1),(2021,'Vice',0.16,2);
/*!40000 ALTER TABLE `db_pnud_hab_mangrove_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_hab_saltmarsh_extent`
--

DROP TABLE IF EXISTS `db_pnud_hab_saltmarsh_extent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_hab_saltmarsh_extent` (
  `anio` bigint DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_hab_saltmarsh_extent`
--

LOCK TABLES `db_pnud_hab_saltmarsh_extent` WRITE;
/*!40000 ALTER TABLE `db_pnud_hab_saltmarsh_extent` DISABLE KEYS */;
INSERT INTO `db_pnud_hab_saltmarsh_extent` VALUES (2020,26.09,1);
/*!40000 ALTER TABLE `db_pnud_hab_saltmarsh_extent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_hab_saltmarsh_health`
--

DROP TABLE IF EXISTS `db_pnud_hab_saltmarsh_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_hab_saltmarsh_health` (
  `anio` bigint DEFAULT NULL,
  `valor` bigint DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_hab_saltmarsh_health`
--

LOCK TABLES `db_pnud_hab_saltmarsh_health` WRITE;
/*!40000 ALTER TABLE `db_pnud_hab_saltmarsh_health` DISABLE KEYS */;
INSERT INTO `db_pnud_hab_saltmarsh_health` VALUES (2020,1,1);
/*!40000 ALTER TABLE `db_pnud_hab_saltmarsh_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_hab_saltmarsh_trend`
--

DROP TABLE IF EXISTS `db_pnud_hab_saltmarsh_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_hab_saltmarsh_trend` (
  `anio` bigint DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_hab_saltmarsh_trend`
--

LOCK TABLES `db_pnud_hab_saltmarsh_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_hab_saltmarsh_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_hab_saltmarsh_trend` VALUES (2020,0.013,1);
/*!40000 ALTER TABLE `db_pnud_hab_saltmarsh_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_indicadores_empleo`
--

DROP TABLE IF EXISTS `db_pnud_indicadores_empleo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_indicadores_empleo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` int unsigned DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `porcent_agri_pes` double DEFAULT NULL,
  `porcent_hot_rest` double DEFAULT NULL,
  `porcent_trans_comuni` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `db_pnud_indicadores_empleo_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_indicadores_empleo`
--

LOCK TABLES `db_pnud_indicadores_empleo` WRITE;
/*!40000 ALTER TABLE `db_pnud_indicadores_empleo` DISABLE KEYS */;
INSERT INTO `db_pnud_indicadores_empleo` VALUES (2905,2008,'AREQUIPA',15.5,6.5,9.5),(2906,2009,'AREQUIPA',15.7,6.4,10.2),(2907,2010,'AREQUIPA',15.5,6.9,7.9),(2908,2011,'AREQUIPA',16.8,6.6,10),(2909,2012,'AREQUIPA',13.4,8.1,8.9),(2910,2013,'AREQUIPA',13.9,9.1,7.9),(2911,2014,'AREQUIPA',14.6,8.2,9.1),(2912,2015,'AREQUIPA',15.6,6.9,10.1),(2913,2016,'AREQUIPA',15,7.6,10),(2914,2017,'AREQUIPA',14,8,11.1),(2915,2018,'AREQUIPA',14.6,8.1,9.6),(2916,2008,'CALLAO',1.1,6.9,11.7),(2917,2009,'CALLAO',0.9,8.2,14.2),(2918,2010,'CALLAO',1.1,8.4,11.4),(2919,2011,'CALLAO',1.2,8.3,12.7),(2920,2012,'CALLAO',0.8,7.3,11.8),(2921,2013,'CALLAO',1.1,6.7,11.9),(2922,2014,'CALLAO',0.4,7.8,13),(2923,2015,'CALLAO',1,6.7,13.4),(2924,2016,'CALLAO',0.9,7.5,13.6),(2925,2017,'CALLAO',1.2,7.3,14.7),(2926,2018,'CALLAO',0.7,7.2,14.5),(2927,2008,'ICA',20.2,7.5,9.2),(2928,2009,'ICA',18.6,6.8,10.2),(2929,2010,'ICA',18.5,7.1,10),(2930,2011,'ICA',18.7,6.8,9.9),(2931,2012,'ICA',19.3,7,9.3),(2932,2013,'ICA',18,8.6,10),(2933,2014,'ICA',18.2,8.3,9.4),(2934,2015,'ICA',20.8,7.6,10.5),(2935,2016,'ICA',22.2,9,9.6),(2936,2017,'ICA',17.6,7.8,9.6),(2937,2018,'ICA',17.6,9.1,10.1),(2938,2008,'LA LIBERTAD',27.5,8.3,7.7),(2939,2009,'LA LIBERTAD',26.6,7.4,6.7),(2940,2010,'LA LIBERTAD',26.1,7.3,7.8),(2941,2011,'LA LIBERTAD',26.7,6.3,8.1),(2942,2012,'LA LIBERTAD',25.3,6.9,7),(2943,2013,'LA LIBERTAD',24.3,7.2,6.9),(2944,2014,'LA LIBERTAD',22.8,6.9,8.1),(2945,2015,'LA LIBERTAD',25.2,8.7,7.8),(2946,2016,'LA LIBERTAD',24.9,7.8,8.2),(2947,2017,'LA LIBERTAD',23.1,7.6,9.4),(2948,2018,'LA LIBERTAD',23.5,7.9,8.7),(2949,2008,'LAMBAYEQUE',28,6.5,9.6),(2950,2009,'LAMBAYEQUE',27.9,6.4,8.6),(2951,2010,'LAMBAYEQUE',25.5,5.9,9),(2952,2011,'LAMBAYEQUE',23.9,6.8,10.8),(2953,2012,'LAMBAYEQUE',24,7.1,10.4),(2954,2013,'LAMBAYEQUE',22.4,7.5,10.3),(2955,2014,'LAMBAYEQUE',21.3,6.6,9.7),(2956,2015,'LAMBAYEQUE',22,5.3,9.8),(2957,2016,'LAMBAYEQUE',21.5,6.1,9.6),(2958,2017,'LAMBAYEQUE',20.6,7.2,10.1),(2959,2018,'LAMBAYEQUE',19.7,7.4,12.5),(2960,2008,'MOQUEGUA',28.3,3.5,7.2),(2961,2009,'MOQUEGUA',29,4.2,7.5),(2962,2010,'MOQUEGUA',24.5,5.2,6.6),(2963,2011,'MOQUEGUA',28.8,5.5,6.6),(2964,2012,'MOQUEGUA',25.5,6.4,5.5),(2965,2013,'MOQUEGUA',25.1,7,7),(2966,2014,'MOQUEGUA',27.3,6.1,7.6),(2967,2015,'MOQUEGUA',24.4,6.7,7.3),(2968,2016,'MOQUEGUA',25,6.8,5.8),(2969,2017,'MOQUEGUA',25.3,6.7,7.9),(2970,2018,'MOQUEGUA',23.9,6.9,8.5),(2971,2008,'PIURA',32.8,4.7,8),(2972,2009,'PIURA',30.2,5.7,7.6),(2973,2010,'PIURA',30.9,6.8,7.3),(2974,2011,'PIURA',29.8,7.6,9.2),(2975,2012,'PIURA',29.3,7.1,6.9),(2976,2013,'PIURA',29.9,6.2,7.9),(2977,2014,'PIURA',30.3,6.3,10),(2978,2015,'PIURA',31.8,6.9,8.1),(2979,2016,'PIURA',31.6,7.9,8.2),(2980,2017,'PIURA',29,7,8.1),(2981,2018,'PIURA',29.6,7.2,8.6),(2982,2008,'PROVINCIA DE LIMA',0.8,6.9,11.6),(2983,2009,'PROVINCIA DE LIMA',0.9,8,10.5),(2984,2010,'PROVINCIA DE LIMA',0.9,7.7,11.1),(2985,2011,'PROVINCIA DE LIMA',0.8,7.5,10.4),(2986,2012,'PROVINCIA DE LIMA',0.6,7.3,10.4),(2987,2013,'PROVINCIA DE LIMA',0.9,7.2,10),(2988,2014,'PROVINCIA DE LIMA',0.7,8,9.9),(2989,2015,'PROVINCIA DE LIMA',0.8,7.8,10.8),(2990,2016,'PROVINCIA DE LIMA',0.6,7.4,11),(2991,2017,'PROVINCIA DE LIMA',0.8,8.2,10.5),(2992,2018,'PROVINCIA DE LIMA',0.7,9.7,10.4),(2993,2008,'REGIÓN LIMA',30.7,6.5,7.8),(2994,2009,'REGIÓN LIMA',31.5,6.9,8.8),(2995,2010,'REGIÓN LIMA',29.6,7.2,9),(2996,2011,'REGIÓN LIMA',29.4,6.7,6.7),(2997,2012,'REGIÓN LIMA',29.4,7.6,6.3),(2998,2013,'REGIÓN LIMA',31.1,7.7,7.2),(2999,2014,'REGIÓN LIMA',29.4,9.4,6.7),(3000,2015,'REGIÓN LIMA',32,8.2,8.8),(3001,2016,'REGIÓN LIMA',31.5,8.7,8.7),(3002,2017,'REGIÓN LIMA',31.1,7.7,9.2),(3003,2018,'REGIÓN LIMA',31.1,8.3,7.9),(3004,2008,'TACNA',14.8,8,6.7),(3005,2009,'TACNA',17.2,7.8,8.8),(3006,2010,'TACNA',14.6,6.5,8.4),(3007,2011,'TACNA',14.2,6.5,9.1),(3008,2012,'TACNA',14.5,8.2,9.3),(3009,2013,'TACNA',15.1,8.3,7.8),(3010,2014,'TACNA',17,8.7,8.7),(3011,2015,'TACNA',15.6,7.8,9.2),(3012,2016,'TACNA',16.3,8.6,9.1),(3013,2017,'TACNA',16.7,8.3,9),(3014,2018,'TACNA',16.4,9.4,9.7),(3015,2008,'TUMBES',21.6,9.2,10.7),(3016,2009,'TUMBES',17.7,8.1,10.9),(3017,2010,'TUMBES',16.3,9.7,11.1),(3018,2011,'TUMBES',17.4,8.8,12.7),(3019,2012,'TUMBES',15.3,9.2,14.1),(3020,2013,'TUMBES',14.7,9.3,14),(3021,2014,'TUMBES',16.9,8.5,13),(3022,2015,'TUMBES',16.3,10.2,14.8),(3023,2016,'TUMBES',15.9,8.7,16),(3024,2017,'TUMBES',16.7,8.8,14.1),(3025,2018,'TUMBES',16.2,9.9,13.5),(3026,2008,'ÁNCASH',42.4,6.5,6.7),(3027,2009,'ÁNCASH',38.3,5.2,6.3),(3028,2010,'ÁNCASH',36.4,6.9,6.9),(3029,2011,'ÁNCASH',34.6,8,6.2),(3030,2012,'ÁNCASH',34.2,6.6,6.9),(3031,2013,'ÁNCASH',36.7,6.3,6.7),(3032,2014,'ÁNCASH',36.8,6.8,5.9),(3033,2015,'ÁNCASH',37.7,6.1,7),(3034,2016,'ÁNCASH',37.3,6.4,7),(3035,2017,'ÁNCASH',37.3,7.2,7.7),(3036,2018,'ÁNCASH',39.1,7,7.2);
/*!40000 ALTER TABLE `db_pnud_indicadores_empleo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_indicadores_ingreso`
--

DROP TABLE IF EXISTS `db_pnud_indicadores_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_indicadores_ingreso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` int unsigned DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `ingre_prom_men` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `db_pnud_indicadores_ingreso_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_indicadores_ingreso`
--

LOCK TABLES `db_pnud_indicadores_ingreso` WRITE;
/*!40000 ALTER TABLE `db_pnud_indicadores_ingreso` DISABLE KEYS */;
INSERT INTO `db_pnud_indicadores_ingreso` VALUES (6157,2007,'AMAZONAS',542.3),(6158,2008,'AMAZONAS',641.9),(6159,2009,'AMAZONAS',718.7),(6160,2010,'AMAZONAS',806.2),(6161,2011,'AMAZONAS',784.1),(6162,2012,'AMAZONAS',858.8),(6163,2013,'AMAZONAS',826.1),(6164,2014,'AMAZONAS',857.3),(6165,2015,'AMAZONAS',939.1),(6166,2016,'AMAZONAS',995.4),(6167,2017,'AMAZONAS',967.1),(6168,2018,'AMAZONAS',1033.2),(6169,2007,'APURÍMAC',432.2),(6170,2008,'APURÍMAC',490.1),(6171,2009,'APURÍMAC',519.2),(6172,2010,'APURÍMAC',634),(6173,2011,'APURÍMAC',598.2),(6174,2012,'APURÍMAC',620),(6175,2013,'APURÍMAC',778.2),(6176,2014,'APURÍMAC',841.6),(6177,2015,'APURÍMAC',925.6),(6178,2016,'APURÍMAC',889.4),(6179,2017,'APURÍMAC',900.8),(6180,2018,'APURÍMAC',936.9),(6181,2007,'AREQUIPA',816.5),(6182,2008,'AREQUIPA',985.7),(6183,2009,'AREQUIPA',1051),(6184,2010,'AREQUIPA',1120.4),(6185,2011,'AREQUIPA',1257.8),(6186,2012,'AREQUIPA',1299.7),(6187,2013,'AREQUIPA',1377.3),(6188,2014,'AREQUIPA',1429),(6189,2015,'AREQUIPA',1456.9),(6190,2016,'AREQUIPA',1512.2),(6191,2017,'AREQUIPA',1545),(6192,2018,'AREQUIPA',1644.6),(6193,2007,'AYACUCHO',475.9),(6194,2008,'AYACUCHO',517.7),(6195,2009,'AYACUCHO',576.7),(6196,2010,'AYACUCHO',644.7),(6197,2011,'AYACUCHO',747.9),(6198,2012,'AYACUCHO',750.2),(6199,2013,'AYACUCHO',752.2),(6200,2014,'AYACUCHO',773.5),(6201,2015,'AYACUCHO',904.6),(6202,2016,'AYACUCHO',879.5),(6203,2017,'AYACUCHO',902.2),(6204,2018,'AYACUCHO',959.8),(6205,2007,'CAJAMARCA',472.7),(6206,2008,'CAJAMARCA',550.1),(6207,2009,'CAJAMARCA',649.6),(6208,2010,'CAJAMARCA',724),(6209,2011,'CAJAMARCA',793.4),(6210,2012,'CAJAMARCA',812),(6211,2013,'CAJAMARCA',835.4),(6212,2014,'CAJAMARCA',760.5),(6213,2015,'CAJAMARCA',828.2),(6214,2016,'CAJAMARCA',806.3),(6215,2017,'CAJAMARCA',843.3),(6216,2018,'CAJAMARCA',817.9),(6217,2007,'CALLAO',971.7),(6218,2008,'CALLAO',1097.2),(6219,2009,'CALLAO',1238),(6220,2010,'CALLAO',1219),(6221,2011,'CALLAO',1189.1),(6222,2012,'CALLAO',1329.8),(6223,2013,'CALLAO',1353.3),(6224,2014,'CALLAO',1494.5),(6225,2015,'CALLAO',1528.5),(6226,2016,'CALLAO',1561.1),(6227,2017,'CALLAO',1598.5),(6228,2018,'CALLAO',1526.3),(6229,2007,'CUSCO',584.7),(6230,2008,'CUSCO',650.6),(6231,2009,'CUSCO',756.5),(6232,2010,'CUSCO',775.7),(6233,2011,'CUSCO',888.4),(6234,2012,'CUSCO',973.6),(6235,2013,'CUSCO',1045.1),(6236,2014,'CUSCO',1081.2),(6237,2015,'CUSCO',1025.6),(6238,2016,'CUSCO',1144.6),(6239,2017,'CUSCO',1064.7),(6240,2018,'CUSCO',1189),(6241,2007,'HUANCAVELICA',380.2),(6242,2008,'HUANCAVELICA',426.1),(6243,2009,'HUANCAVELICA',493.6),(6244,2010,'HUANCAVELICA',560.4),(6245,2011,'HUANCAVELICA',614.1),(6246,2012,'HUANCAVELICA',641.9),(6247,2013,'HUANCAVELICA',684.7),(6248,2014,'HUANCAVELICA',622.1),(6249,2015,'HUANCAVELICA',719.9),(6250,2016,'HUANCAVELICA',733.7),(6251,2017,'HUANCAVELICA',709.1),(6252,2018,'HUANCAVELICA',702.5),(6253,2007,'HUÁNUCO',461.1),(6254,2008,'HUÁNUCO',531.6),(6255,2009,'HUÁNUCO',572.8),(6256,2010,'HUÁNUCO',623),(6257,2011,'HUÁNUCO',720.2),(6258,2012,'HUÁNUCO',848.4),(6259,2013,'HUÁNUCO',898.4),(6260,2014,'HUÁNUCO',877.8),(6261,2015,'HUÁNUCO',923.5),(6262,2016,'HUÁNUCO',901.5),(6263,2017,'HUÁNUCO',933.1),(6264,2018,'HUÁNUCO',974.2),(6265,2007,'ICA',704.8),(6266,2008,'ICA',801.7),(6267,2009,'ICA',895.4),(6268,2010,'ICA',924),(6269,2011,'ICA',997),(6270,2012,'ICA',1022.9),(6271,2013,'ICA',1082.3),(6272,2014,'ICA',1187.1),(6273,2015,'ICA',1278.1),(6274,2016,'ICA',1297.3),(6275,2017,'ICA',1363.7),(6276,2018,'ICA',1414.8),(6277,2007,'JUNÍN',679.8),(6278,2008,'JUNÍN',793.5),(6279,2009,'JUNÍN',797.5),(6280,2010,'JUNÍN',795.5),(6281,2011,'JUNÍN',912.7),(6282,2012,'JUNÍN',974.6),(6283,2013,'JUNÍN',1003.8),(6284,2014,'JUNÍN',1044.7),(6285,2015,'JUNÍN',1139.5),(6286,2016,'JUNÍN',1199.3),(6287,2017,'JUNÍN',1135.7),(6288,2018,'JUNÍN',1130.1),(6289,2007,'LA LIBERTAD',819.2),(6290,2008,'LA LIBERTAD',762.9),(6291,2009,'LA LIBERTAD',925.5),(6292,2010,'LA LIBERTAD',889.8),(6293,2011,'LA LIBERTAD',895.5),(6294,2012,'LA LIBERTAD',1000.9),(6295,2013,'LA LIBERTAD',1040.4),(6296,2014,'LA LIBERTAD',1092.4),(6297,2015,'LA LIBERTAD',1128.9),(6298,2016,'LA LIBERTAD',1203.8),(6299,2017,'LA LIBERTAD',1256.5),(6300,2018,'LA LIBERTAD',1268.4),(6301,2007,'LAMBAYEQUE',590),(6302,2008,'LAMBAYEQUE',636.5),(6303,2009,'LAMBAYEQUE',670.7),(6304,2010,'LAMBAYEQUE',707.6),(6305,2011,'LAMBAYEQUE',750.4),(6306,2012,'LAMBAYEQUE',843.6),(6307,2013,'LAMBAYEQUE',835.4),(6308,2014,'LAMBAYEQUE',906),(6309,2015,'LAMBAYEQUE',1000),(6310,2016,'LAMBAYEQUE',1117.1),(6311,2017,'LAMBAYEQUE',1113.2),(6312,2018,'LAMBAYEQUE',1189.7),(6313,2007,'LIMA',1136.7),(6314,2008,'LIMA',1236.1),(6315,2009,'LIMA',1296.8),(6316,2010,'LIMA',1285.8),(6317,2011,'LIMA',1391.9),(6318,2012,'LIMA',1517.2),(6319,2013,'LIMA',1543.2),(6320,2014,'LIMA',1640.4),(6321,2015,'LIMA',1753.1),(6322,2016,'LIMA',1870),(6323,2017,'LIMA',1851.6),(6324,2018,'LIMA',1857.3),(6325,2007,'LORETO',664.5),(6326,2008,'LORETO',727.4),(6327,2009,'LORETO',771.9),(6328,2010,'LORETO',863.9),(6329,2011,'LORETO',888.1),(6330,2012,'LORETO',977.5),(6331,2013,'LORETO',945),(6332,2014,'LORETO',1038),(6333,2015,'LORETO',1107.8),(6334,2016,'LORETO',1062.3),(6335,2017,'LORETO',1167.3),(6336,2018,'LORETO',1166.2),(6337,2007,'MADRE DE DIOS',1090.6),(6338,2008,'MADRE DE DIOS',1251.5),(6339,2009,'MADRE DE DIOS',1412),(6340,2010,'MADRE DE DIOS',1495.3),(6341,2011,'MADRE DE DIOS',1832.6),(6342,2012,'MADRE DE DIOS',1867.4),(6343,2013,'MADRE DE DIOS',1936.4),(6344,2014,'MADRE DE DIOS',1861.4),(6345,2015,'MADRE DE DIOS',1655.5),(6346,2016,'MADRE DE DIOS',1632.9),(6347,2017,'MADRE DE DIOS',1669.3),(6348,2018,'MADRE DE DIOS',1638.7),(6349,2007,'MOQUEGUA',1124.1),(6350,2008,'MOQUEGUA',1328.2),(6351,2009,'MOQUEGUA',1352.5),(6352,2010,'MOQUEGUA',1541.3),(6353,2011,'MOQUEGUA',1564),(6354,2012,'MOQUEGUA',1780.2),(6355,2013,'MOQUEGUA',1826.3),(6356,2014,'MOQUEGUA',1823.7),(6357,2015,'MOQUEGUA',1791.2),(6358,2016,'MOQUEGUA',1818.4),(6359,2017,'MOQUEGUA',1689.7),(6360,2018,'MOQUEGUA',1769.5),(6361,2007,'PASCO',638),(6362,2008,'PASCO',747.6),(6363,2009,'PASCO',806.4),(6364,2010,'PASCO',893.4),(6365,2011,'PASCO',896.6),(6366,2012,'PASCO',834.8),(6367,2013,'PASCO',859.5),(6368,2014,'PASCO',866.1),(6369,2015,'PASCO',892.4),(6370,2016,'PASCO',1000.8),(6371,2017,'PASCO',1051.1),(6372,2018,'PASCO',1055.7),(6373,2007,'PIURA',550.2),(6374,2008,'PIURA',620.5),(6375,2009,'PIURA',759.8),(6376,2010,'PIURA',742.7),(6377,2011,'PIURA',856.6),(6378,2012,'PIURA',887),(6379,2013,'PIURA',890.4),(6380,2014,'PIURA',902.4),(6381,2015,'PIURA',935),(6382,2016,'PIURA',952.3),(6383,2017,'PIURA',1047.5),(6384,2018,'PIURA',1104.3),(6385,2007,'PROVINCIA DE LIMA',1176.7),(6386,2008,'PROVINCIA DE LIMA',1277.5),(6387,2009,'PROVINCIA DE LIMA',1344.8),(6388,2010,'PROVINCIA DE LIMA',1315.9),(6389,2011,'PROVINCIA DE LIMA',1435.2),(6390,2012,'PROVINCIA DE LIMA',1561.6),(6391,2013,'PROVINCIA DE LIMA',1596.9),(6392,2014,'PROVINCIA DE LIMA',1696.8),(6393,2015,'PROVINCIA DE LIMA',1809.9),(6394,2016,'PROVINCIA DE LIMA',1939.9),(6395,2017,'PROVINCIA DE LIMA',1921.1),(6396,2018,'PROVINCIA DE LIMA',1912.7),(6397,2007,'PUNO',412.7),(6398,2008,'PUNO',465.6),(6399,2009,'PUNO',507.5),(6400,2010,'PUNO',588.3),(6401,2011,'PUNO',631.8),(6402,2012,'PUNO',720.7),(6403,2013,'PUNO',806.4),(6404,2014,'PUNO',879.9),(6405,2015,'PUNO',799.5),(6406,2016,'PUNO',856.8),(6407,2017,'PUNO',818.8),(6408,2018,'PUNO',839.8),(6409,2007,'REGIÓN LIMA',764.5),(6410,2008,'REGIÓN LIMA',839.4),(6411,2009,'REGIÓN LIMA',836.7),(6412,2010,'REGIÓN LIMA',981.1),(6413,2011,'REGIÓN LIMA',965.6),(6414,2012,'REGIÓN LIMA',1084.1),(6415,2013,'REGIÓN LIMA',1017),(6416,2014,'REGIÓN LIMA',1073.2),(6417,2015,'REGIÓN LIMA',1185),(6418,2016,'REGIÓN LIMA',1181.6),(6419,2017,'REGIÓN LIMA',1175.4),(6420,2018,'REGIÓN LIMA',1299.5),(6421,2007,'SAN MARTÍN',666.6),(6422,2008,'SAN MARTÍN',774.2),(6423,2009,'SAN MARTÍN',811.1),(6424,2010,'SAN MARTÍN',882.3),(6425,2011,'SAN MARTÍN',993),(6426,2012,'SAN MARTÍN',1032.7),(6427,2013,'SAN MARTÍN',1001.2),(6428,2014,'SAN MARTÍN',1038.2),(6429,2015,'SAN MARTÍN',1098.9),(6430,2016,'SAN MARTÍN',1079.2),(6431,2017,'SAN MARTÍN',1128.8),(6432,2018,'SAN MARTÍN',1175.8),(6433,2007,'TACNA',909.6),(6434,2008,'TACNA',1034.6),(6435,2009,'TACNA',1055),(6436,2010,'TACNA',1125.5),(6437,2011,'TACNA',1135.5),(6438,2012,'TACNA',1244),(6439,2013,'TACNA',1270.5),(6440,2014,'TACNA',1295.2),(6441,2015,'TACNA',1323.2),(6442,2016,'TACNA',1336.6),(6443,2017,'TACNA',1354.2),(6444,2018,'TACNA',1359.4),(6445,2007,'TUMBES',873.5),(6446,2008,'TUMBES',783.4),(6447,2009,'TUMBES',856.2),(6448,2010,'TUMBES',910.7),(6449,2011,'TUMBES',1035.2),(6450,2012,'TUMBES',1117.7),(6451,2013,'TUMBES',1104.5),(6452,2014,'TUMBES',1145.4),(6453,2015,'TUMBES',1165.3),(6454,2016,'TUMBES',1255.5),(6455,2017,'TUMBES',1260.8),(6456,2018,'TUMBES',1338.3),(6457,2007,'UCAYALI',758.8),(6458,2008,'UCAYALI',771.8),(6459,2009,'UCAYALI',851.6),(6460,2010,'UCAYALI',825),(6461,2011,'UCAYALI',963.3),(6462,2012,'UCAYALI',1015.3),(6463,2013,'UCAYALI',1017.5),(6464,2014,'UCAYALI',1007.7),(6465,2015,'UCAYALI',1165.7),(6466,2016,'UCAYALI',1182.6),(6467,2017,'UCAYALI',1166.8),(6468,2018,'UCAYALI',1212),(6469,2007,'ÁNCASH',623.8),(6470,2008,'ÁNCASH',734),(6471,2009,'ÁNCASH',770.8),(6472,2010,'ÁNCASH',869.6),(6473,2011,'ÁNCASH',941.1),(6474,2012,'ÁNCASH',973.5),(6475,2013,'ÁNCASH',1009.1),(6476,2014,'ÁNCASH',1048.7),(6477,2015,'ÁNCASH',1014.4),(6478,2016,'ÁNCASH',1094.9),(6479,2017,'ÁNCASH',1090),(6480,2018,'ÁNCASH',1117);
/*!40000 ALTER TABLE `db_pnud_indicadores_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_le_sector_weight`
--

DROP TABLE IF EXISTS `db_pnud_le_sector_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_le_sector_weight` (
  `anio` bigint DEFAULT NULL,
  `sector` text,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_le_sector_weight`
--

LOCK TABLES `db_pnud_le_sector_weight` WRITE;
/*!40000 ALTER TABLE `db_pnud_le_sector_weight` DISABLE KEYS */;
INSERT INTO `db_pnud_le_sector_weight` VALUES (2022,'Alojamiento y restaurantes',1.45,1),(2022,'Pesca',1.52,2),(2022,'Transporte, almacén, correo y mensajería',2.87,3);
/*!40000 ALTER TABLE `db_pnud_le_sector_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_liv_status`
--

DROP TABLE IF EXISTS `db_pnud_liv_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_liv_status` (
  `anio` bigint DEFAULT NULL,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_liv_status`
--

LOCK TABLES `db_pnud_liv_status` WRITE;
/*!40000 ALTER TABLE `db_pnud_liv_status` DISABLE KEYS */;
INSERT INTO `db_pnud_liv_status` VALUES (2008,63.7,1),(2009,65.2,2),(2010,66.3,3),(2011,70.9,4),(2012,68.2,5),(2013,69.1,6),(2014,72.1,7),(2015,73.2,8),(2016,74.5,9),(2017,73.2,10),(2018,76.1,11);
/*!40000 ALTER TABLE `db_pnud_liv_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_liv_trend`
--

DROP TABLE IF EXISTS `db_pnud_liv_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_liv_trend` (
  `anio` bigint DEFAULT NULL,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL,
  `zona` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_liv_trend`
--

LOCK TABLES `db_pnud_liv_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_liv_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_liv_trend` VALUES (2012,0.5329,NULL,'Vice'),(2013,-0.3129,NULL,'Vice'),(2014,-0.2352,NULL,'Vice'),(2015,-0.1957,NULL,'Vice'),(2016,-0.0648,NULL,'Vice'),(2017,-0.1549,NULL,'Vice'),(2018,-0.0824,NULL,'Vice'),(2012,0.5329,NULL,'Sechura'),(2013,-0.3129,NULL,'Sechura'),(2014,-0.2352,NULL,'Sechura'),(2015,-0.1957,NULL,'Sechura'),(2016,-0.0648,NULL,'Sechura'),(2017,-0.1549,NULL,'Sechura'),(2018,-0.0824,NULL,'Sechura');
/*!40000 ALTER TABLE `db_pnud_liv_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_mar_harvest_tonnes`
--

DROP TABLE IF EXISTS `db_pnud_mar_harvest_tonnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_mar_harvest_tonnes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` int unsigned DEFAULT NULL,
  `zona` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `db_pnud_mar_harvest_tonnes_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_mar_harvest_tonnes`
--

LOCK TABLES `db_pnud_mar_harvest_tonnes` WRITE;
/*!40000 ALTER TABLE `db_pnud_mar_harvest_tonnes` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_pnud_mar_harvest_tonnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_mar_sustainability_score`
--

DROP TABLE IF EXISTS `db_pnud_mar_sustainability_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_mar_sustainability_score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` int unsigned DEFAULT NULL,
  `zona` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `db_pnud_mar_sustainability_score_chk_1` CHECK ((`year` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_mar_sustainability_score`
--

LOCK TABLES `db_pnud_mar_sustainability_score` WRITE;
/*!40000 ALTER TABLE `db_pnud_mar_sustainability_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_pnud_mar_sustainability_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_spp_status`
--

DROP TABLE IF EXISTS `db_pnud_spp_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_spp_status` (
  `anio` bigint DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_spp_status`
--

LOCK TABLES `db_pnud_spp_status` WRITE;
/*!40000 ALTER TABLE `db_pnud_spp_status` DISABLE KEYS */;
INSERT INTO `db_pnud_spp_status` VALUES (2020,0.88,1);
/*!40000 ALTER TABLE `db_pnud_spp_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_spp_trend`
--

DROP TABLE IF EXISTS `db_pnud_spp_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_spp_trend` (
  `anio` double DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_spp_trend`
--

LOCK TABLES `db_pnud_spp_trend` WRITE;
/*!40000 ALTER TABLE `db_pnud_spp_trend` DISABLE KEYS */;
INSERT INTO `db_pnud_spp_trend` VALUES (NULL,-0.00134276,1);
/*!40000 ALTER TABLE `db_pnud_spp_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_tr_sustainability`
--

DROP TABLE IF EXISTS `db_pnud_tr_sustainability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_tr_sustainability` (
  `anio` bigint DEFAULT NULL,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_tr_sustainability`
--

LOCK TABLES `db_pnud_tr_sustainability` WRITE;
/*!40000 ALTER TABLE `db_pnud_tr_sustainability` DISABLE KEYS */;
INSERT INTO `db_pnud_tr_sustainability` VALUES (2015,3.9,1),(2017,4,2),(2019,4.2,3);
/*!40000 ALTER TABLE `db_pnud_tr_sustainability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_pnud_tr_visit_sq_pct_tourism`
--

DROP TABLE IF EXISTS `db_pnud_tr_visit_sq_pct_tourism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_pnud_tr_visit_sq_pct_tourism` (
  `anio` bigint DEFAULT NULL,
  `balneario` text,
  `puntaje` double DEFAULT NULL,
  `id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_pnud_tr_visit_sq_pct_tourism`
--

LOCK TABLES `db_pnud_tr_visit_sq_pct_tourism` WRITE;
/*!40000 ALTER TABLE `db_pnud_tr_visit_sq_pct_tourism` DISABLE KEYS */;
INSERT INTO `db_pnud_tr_visit_sq_pct_tourism` VALUES (2005,'Sechura',0.087,1),(2006,'Sechura',0.107,2),(2007,'Sechura',0.086,3),(2008,'Sechura',0.134,4),(2009,'Sechura',0.126,5),(2010,'Sechura',0.134,6),(2011,'Sechura',0.153,7),(2012,'Sechura',0.201,8),(2013,'Sechura',0.33,9),(2014,'Sechura',0.698,10),(2015,'Sechura',0.522,11),(2016,'Sechura',0.509,12),(2017,'Sechura',0.33,13),(2018,'Sechura',0.336,14),(2019,'Sechura',0.476,15),(2005,'Vice',0.02,16),(2006,'Vice',0.024,17),(2007,'Vice',0.02,18),(2008,'Vice',0.03,19),(2009,'Vice',0.029,20),(2010,'Vice',0.03,21),(2011,'Vice',0.035,22),(2012,'Vice',0.046,23),(2013,'Vice',0.075,24),(2014,'Vice',0.158,25),(2015,'Vice',0.118,26),(2016,'Vice',0.115,27),(2017,'Vice',0.087,28),(2018,'Vice',0.075,29),(2019,'Vice',0.097,30);
/*!40000 ALTER TABLE `db_pnud_tr_visit_sq_pct_tourism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(9,'db_pnud','ao_access'),(10,'db_pnud','ao_need'),(11,'db_pnud','base_metas_estado_tendencia'),(12,'db_pnud','base_puntos_referencia'),(13,'db_pnud','cw_chemical_trend'),(14,'db_pnud','cw_nutrient_trend'),(15,'db_pnud','cw_pathogen_trend'),(16,'db_pnud','cw_trash_trend'),(17,'db_pnud','eco_status'),(18,'db_pnud','eco_trend'),(19,'db_pnud','fis_b_bmsy'),(20,'db_pnud','fis_meancatch'),(21,'db_pnud','hab_mangrove_extent'),(22,'db_pnud','hab_mangrove_health'),(23,'db_pnud','hab_mangrove_trend'),(24,'db_pnud','hab_saltmarsh_extent'),(25,'db_pnud','hab_saltmarsh_health'),(26,'db_pnud','hab_saltmarsh_trend'),(34,'db_pnud','indicadores_empleo'),(35,'db_pnud','indicadores_ingreso'),(27,'db_pnud','le_sector_weight'),(28,'db_pnud','liv_status'),(29,'db_pnud','liv_trend'),(36,'db_pnud','mar_harvest_tonnes'),(37,'db_pnud','mar_sustainability_score'),(30,'db_pnud','spp_status'),(31,'db_pnud','spp_trend'),(32,'db_pnud','tr_sustainability'),(33,'db_pnud','tr_visit_sq_pct_tourism'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-09-28 10:24:58.945058'),(2,'auth','0001_initial','2022-09-28 10:24:59.345361'),(3,'admin','0001_initial','2022-09-28 10:24:59.415405'),(4,'admin','0002_logentry_remove_auto_add','2022-09-28 10:24:59.425011'),(5,'admin','0003_logentry_add_action_flag_choices','2022-09-28 10:24:59.435269'),(6,'contenttypes','0002_remove_content_type_name','2022-09-28 10:24:59.474962'),(7,'auth','0002_alter_permission_name_max_length','2022-09-28 10:24:59.515186'),(8,'auth','0003_alter_user_email_max_length','2022-09-28 10:24:59.535374'),(9,'auth','0004_alter_user_username_opts','2022-09-28 10:24:59.535374'),(10,'auth','0005_alter_user_last_login_null','2022-09-28 10:24:59.575402'),(11,'auth','0006_require_contenttypes_0002','2022-09-28 10:24:59.575402'),(12,'auth','0007_alter_validators_add_error_messages','2022-09-28 10:24:59.585385'),(13,'auth','0008_alter_user_username_max_length','2022-09-28 10:24:59.619391'),(14,'auth','0009_alter_user_last_name_max_length','2022-09-28 10:24:59.655308'),(15,'auth','0010_alter_group_name_max_length','2022-09-28 10:24:59.675010'),(16,'auth','0011_update_proxy_permissions','2022-09-28 10:24:59.685357'),(17,'auth','0012_alter_user_first_name_max_length','2022-09-28 10:24:59.719421'),(18,'authtoken','0001_initial','2022-09-28 10:24:59.755044'),(19,'authtoken','0002_auto_20160226_1747','2022-09-28 10:24:59.784996'),(20,'authtoken','0003_tokenproxy','2022-09-28 10:24:59.790004'),(21,'db_pnud','0001_initial','2022-09-28 10:25:00.075500'),(22,'sessions','0001_initial','2022-09-28 10:25:00.095418'),(23,'db_pnud','0002_indicadores_empleo_indicadores_ingreso','2022-10-11 09:14:36.571828'),(24,'db_pnud','0003_mar_harvest_tonnes','2022-10-12 12:11:20.573921'),(25,'db_pnud','0004_rename_tipo_mar_harvest_tonnes_zona','2022-10-12 12:18:18.028603'),(26,'db_pnud','0005_mar_sustainability_score','2022-10-12 14:26:31.177453'),(27,'db_pnud','0006_liv_trend_zona','2022-10-20 16:35:42.087255');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-20 16:58:57
