-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: evaluation_system
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.2

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
-- Table structure for table `action_plan`
--

DROP TABLE IF EXISTS `action_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_plan` text NOT NULL,
  `language` enum('es_MX','pt_BR') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_plan`
--

LOCK TABLES `action_plan` WRITE;
/*!40000 ALTER TABLE `action_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensured_grade` tinyint(4) NOT NULL,
  `mensurer_grade` tinyint(4) NOT NULL,
  `measured_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answer_measured1_idx` (`measured_id`),
  KEY `fk_answer_question1_idx` (`question_id`),
  KEY `fk_answer_evaluation1_idx` (`evaluation_id`),
  CONSTRAINT `fk_answer_measured1` FOREIGN KEY (`measured_id`) REFERENCES `measured` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_evaluation1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competence` varchar(45) NOT NULL,
  `question_matter` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `gap` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
/*!40000 ALTER TABLE `competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence_evaluation_type`
--

DROP TABLE IF EXISTS `competence_evaluation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence_evaluation_type` (
  `competence_id` int(11) NOT NULL,
  `evaluation_type_id` int(11) NOT NULL,
  PRIMARY KEY (`competence_id`,`evaluation_type_id`),
  KEY `fk_section_has_evaluation_type_evaluation_type1_idx` (`evaluation_type_id`),
  KEY `fk_section_has_evaluation_type_section1_idx` (`competence_id`),
  CONSTRAINT `fk_section_has_evaluation_type_section1` FOREIGN KEY (`competence_id`) REFERENCES `competence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_evaluation_type_evaluation_type1` FOREIGN KEY (`evaluation_type_id`) REFERENCES `evaluation_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence_evaluation_type`
--

LOCK TABLES `competence_evaluation_type` WRITE;
/*!40000 ALTER TABLE `competence_evaluation_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `competence_evaluation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_send_mensured` datetime DEFAULT NULL,
  `date_send_mensurer` datetime DEFAULT NULL,
  `measured_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evaluation_measured1_idx` (`measured_id`),
  CONSTRAINT `fk_evaluation_measured1` FOREIGN KEY (`measured_id`) REFERENCES `measured` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation_action_plan`
--

DROP TABLE IF EXISTS `evaluation_action_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_action_plan` (
  `evaluation_id` int(11) NOT NULL,
  `action_plan_id` int(11) NOT NULL,
  PRIMARY KEY (`evaluation_id`,`action_plan_id`),
  KEY `fk_evaluation_has_action_plan_action_plan1_idx` (`action_plan_id`),
  KEY `fk_evaluation_has_action_plan_evaluation1_idx` (`evaluation_id`),
  CONSTRAINT `fk_evaluation_has_action_plan_evaluation1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluation_has_action_plan_action_plan1` FOREIGN KEY (`action_plan_id`) REFERENCES `action_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation_action_plan`
--

LOCK TABLES `evaluation_action_plan` WRITE;
/*!40000 ALTER TABLE `evaluation_action_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation_action_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation_type`
--

DROP TABLE IF EXISTS `evaluation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation_type`
--

LOCK TABLES `evaluation_type` WRITE;
/*!40000 ALTER TABLE `evaluation_type` DISABLE KEYS */;
INSERT  IGNORE INTO `evaluation_type` VALUES (1,'Colaborador'),(2,'Gestor');
/*!40000 ALTER TABLE `evaluation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measured`
--

DROP TABLE IF EXISTS `measured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measured` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(70) NOT NULL,
  `language` enum('es_MX','pt_BR') NOT NULL,
  `measurer_id` int(11) DEFAULT NULL,
  `evaluation_type_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_measured_measured1_idx` (`measurer_id`),
  KEY `fk_measured_evaluation_type1_idx` (`evaluation_type_id`),
  KEY `fk_measured_profile1_idx` (`profile_id`),
  CONSTRAINT `fk_measured_evaluation_type1` FOREIGN KEY (`evaluation_type_id`) REFERENCES `evaluation_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_measured_profile_type1` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measured`
--

LOCK TABLES `measured` WRITE;
/*!40000 ALTER TABLE `measured` DISABLE KEYS */;
INSERT  IGNORE INTO `measured` VALUES (1,'andre.andrade@titansgroup.com.br','pt_BR',NULL,2,2),(2,'alessandra@titansgroup.com.br','pt_BR',1,2,2),(3,'cristiane.cara@titansgroup.com.br','pt_BR',1,2,2),(4,'joao.victor@titansgroup.com.br','pt_BR',1,2,2),(5,'mauricio.coppede@titansgroup.com.br','pt_BR',1,2,2),(6,'pedro@titansgroup.com.br','pt_BR',1,2,2),(7,'rogelio.nascimento@titansgroup.com.br','pt_BR',1,2,2),(8,'sergio.oliveira@titansgroup.com.br','pt_BR',1,2,2),(9,'tatiana.libois@titansgroup.com.br','pt_BR',1,1,1),(10,'daniela.macedo@titansgroup.com.br','pt_BR',3,2,2),(11,'claudio.souza@titansgroup.com.br','pt_BR',4,2,2),(12,'gabriel.moraes@titansgroup.com.br','pt_BR',4,2,2),(13,'henrique.angeli@titansgroup.com.br','pt_BR',4,2,2),(14,'jose.sanchez@titansgroup.com.br','',4,1,1),(15,'raymundo.benavides@titansgroup.com.br','',4,1,1),(16,'renata.gierun@titansgroup.com.br','pt_BR',4,2,2),(17,'raphael.iarussi@titansgroup.com.br','pt_BR',5,1,1),(18,'yago.mello@titansgroup.com.br','pt_BR',5,1,1),(19,'antonio.graeff@titansgroup.com.br','pt_BR',6,2,2),(20,'carlos.freitas@titansgroup.com.br','pt_BR',6,2,2),(21,'fernanda@titansgroup.com.br','pt_BR',6,1,1),(22,'breno@titansgroup.com.br','pt_BR',7,2,2),(23,'claudia.paulino@titansgroup.com.br','',8,1,1),(24,'Jordi.Perez@titansgroup.com.br','',8,2,2),(25,'recepcao@titansgroup.com.br','pt_BR',2,1,1),(26,'jenifer.flores@titansgroup.com.br','',10,1,1),(27,'renata.puosso@titansgroup.com.br','pt_BR',10,1,1),(28,'vanessa.souza@titansgroup.com.br','pt_BR',10,1,1),(29,'richardson.borges@titansgroup.com.br','pt_BR',13,1,1),(30,'sandra.garcia@titansgroup.com.br','',13,1,1),(31,'franco.degan@titansgroup.com.br','pt_BR',12,1,1),(32,'renan.pieroni@titansgroup.com.br','pt_BR',12,1,1),(33,'eduardo.bernardes@titansgroup.com.br','pt_BR',11,1,1),(34,'gilmar.sobral@titansgroup.com.br','pt_BR',11,1,1),(35,'javier.salas@titansgroup.com.br','',11,1,1),(36,'juliana.veronez@titansgroup.com.br','pt_BR',11,1,1),(37,'michelle.scavassa@titansgroup.com.br','pt_BR',11,2,2),(38,'victor.torres@titansgroup.com.br','',11,2,2),(39,'anderson.sa@titansgroup.com.br','pt_BR',19,2,2),(40,'caio.wendel@titansgroup.com.br','pt_BR',19,2,2),(41,'daniel.vainsencher@titansgroup.com.br','pt_BR',19,2,2),(42,'fabio.rudge@titansgroup.com.br','pt_BR',19,1,1),(43,'guilherme.monaco@titansgroup.com.br','pt_BR',19,2,2),(44,'leandro.bertolini@titansgroup.com.br','pt_BR',19,2,2),(45,'leonel.perez@titansgroup.com.br','',19,1,1),(46,'ricardo.banffy@titansgroup.com.br','pt_BR',19,2,2),(47,'tatiane.fukuda@titansgroup.com.br','pt_BR',19,2,2),(48,'leandro.dandrea@titansgroup.com.br','pt_BR',20,2,2),(49,'roberta.gimenez@titansgroup.com.br','pt_BR',20,1,1),(50,'ronaldo.ferreira@titansgroup.com.br','pt_BR',20,1,1),(51,'shlomi.asaf@titansgroup.com.br','pt_BR',20,1,1),(52,'eduardo.furtado@titansgroup.com.br','pt_BR',16,2,2),(53,'luciana.marques@titansgroup.com.br','pt_BR',16,2,2),(54,'marcia.kawaguti@titansgroup.com.br','pt_BR',16,2,2),(55,'Michel@titansgroup.com.br','pt_BR',16,2,2),(56,'talita@titansgroup.com.br','pt_BR',16,2,2),(57,'vanesa.forcelledo@titansgroup.com.br','',16,1,1),(58,'celio.ferreira@titansgroup.com.br','pt_BR',22,1,1),(59,'dario.solis@titansgroup.com.br','',22,1,1),(60,'karina.placheski@titansgroup.com.br','pt_BR',22,1,1),(61,'mara.costa@titansgroup.com.br','pt_BR',22,1,1),(62,'frida.ruiseco@titansgroup.com.br','',24,1,1),(63,'bianca.renata@titansgroup.com.br','pt_BR',37,2,2),(64,'cid.barros@titansgroup.com.br','pt_BR',37,1,1),(65,'lais.matsushita@titansgroup.com.br','pt_BR',37,1,1),(66,'monica.fantin@titansgroup.com.br','pt_BR',37,1,1),(67,'alexandrina.barnabe@titansgroup.com.br','pt_BR',63,1,1),(68,'aline.cavalheiro@titansgroup.com.br','pt_BR',63,1,1),(69,'ana.gabbia@titansgroup.com.br','pt_BR',63,1,1),(70,'andre.tordin@titansgroup.com.br','pt_BR',63,1,1),(71,'andrea.migliorini@titansgroup.com.br','pt_BR',63,1,1),(72,'daniel.sardela@titansgroup.com.br','pt_BR',63,1,1),(73,'erika.cavalheiro@titansgroup.com.br','pt_BR',63,1,1),(74,'felipe.bravo@titansgroup.com.br','pt_BR',63,1,1),(75,'filipe.ferreira@titansgroup.com.br','pt_BR',63,1,1),(76,'guisely.passos@titansgroup.com.br','pt_BR',63,1,1),(77,'henrique.silva@titansgroup.com.br','pt_BR',63,1,1),(78,'juliana.sena@titansgroup.com.br','pt_BR',63,1,1),(79,'karin.simoes@titansgroup.com.br','pt_BR',63,1,1),(80,'kelly.cristina@titansgroup.com.br','pt_BR',63,1,1),(81,'lidiane.santos@titansgroup.com.br','pt_BR',63,1,1),(82,'rafael.galvao@titansgroup.com.br','pt_BR',63,1,1),(83,'ronaldo.paula@titansgroup.com.br','pt_BR',63,1,1),(84,'tamara.travessin@titansgroup.com.br','pt_BR',63,1,1),(85,'thiara.silva@titansgroup.com.br','pt_BR',63,1,1),(86,'waldemar.filho@titansgroup.com.br','pt_BR',63,1,1),(87,'axel.ochoa@titansgroup.com.br','',38,1,1),(88,'eduardo.ramirez@titansgroup.com.br','',38,1,1),(89,'daniele.almeida@titansgroup.com.br','pt_BR',39,1,1),(90,'emilio.neto@titansgroup.com.br','pt_BR',39,1,1),(91,'erick.bessa@titansgroup.com.br','pt_BR',39,1,1),(92,'fernando.rossetto@titansgroup.com.br','pt_BR',39,1,1),(93,'mateus.reis@titansgroup.com.br','pt_BR',39,1,1),(94,'vitor.leonel@titansgroup.com.br','pt_BR',39,1,1),(95,'daniel.nishio@titansgroup.com.br','pt_BR',40,1,1),(96,'gabriel.kope@titansgroup.com.br','pt_BR',40,1,1),(97,'helio.andrade@titansgroup.com.br','pt_BR',40,1,1),(98,'jardel.moraes@titansgroup.com.br','pt_BR',40,1,1),(99,'pedro.spagiari@titansgroup.com','pt_BR',40,1,1),(100,'aecio.lima@titansgroup.com.br','pt_BR',41,1,1),(101,'alexandre.barbieri@titansgroup.com.br','pt_BR',41,1,1),(102,'cesar.canassa@titansgroup.com.br','pt_BR',41,1,1),(103,'diogo.autilio@titansgroup.com.br','pt_BR',41,1,1),(104,'erick.wilder@titansgroup.com.br','pt_BR',41,1,1),(105,'fernando.cezar@titansgroup.com.br','pt_BR',41,1,1),(106,'fernando.nazario@titansgroup.com.br','pt_BR',41,1,1),(107,'filipe.waitman@titansgroup.com.br','pt_BR',41,1,1),(108,'george.kussumoto@titansgroup.com.br','pt_BR',41,1,1),(109,'gustavo.neto@titansgroup.com.br','pt_BR',41,1,1),(110,'jayson.reis@titansgroup.com.br','pt_BR',41,1,1),(111,'leonardo.fedalto@titansgroup.com.br','pt_BR',41,1,1),(112,'marcelo.caetano@titansgroup.com.br','pt_BR',41,1,1),(113,'osvaldo.neto@titansgroup.com.br','pt_BR',41,1,1),(114,'paulo.cirilo@titansgroup.com.br','pt_BR',41,1,1),(115,'pedro.palhares@titansgroup.com.br','pt_BR',41,1,1),(116,'rafael.martins@titansgroup.com.br','pt_BR',41,1,1),(117,'rodrigo.chacon@titansgroup.com.br','pt_BR',41,1,1),(118,'bruno.tikami@titansgroup.com','pt_BR',43,1,1),(119,'daniel.debonzi@titansgroup.com.br','pt_BR',43,1,1),(120,'pedro.werneck@titansgroup.com.br','pt_BR',43,1,1),(121,'rafael.reimberg@titansgroup.com.br','pt_BR',43,1,1),(122,'ricardo.pereira@titansgroup.com.br','pt_BR',43,1,1),(123,'valdir.calixto@titansgroup.com.br','pt_BR',43,1,1),(124,'wianey.batista@titansgroup.com.br','pt_BR',43,1,1),(125,'adriano.araujo@titansgroup.com.br','pt_BR',44,1,1),(126,'bruno.feitosa@titansgroup.com.br','pt_BR',44,1,1),(127,'carla.gouveia@titansgroup.com.br','pt_BR',44,1,1),(128,'ederson.luiz@titansgroup.com.br','pt_BR',44,1,1),(129,'edgar.sandi@titansgroup.com.br','pt_BR',44,1,1),(130,'fred.campos@titansgroup.com','pt_BR',44,1,1),(131,'gelso.rocha@titansgroup.com.br','pt_BR',44,1,1),(132,'levi.ferreira@titansgroup.com.br','pt_BR',44,1,1),(133,'lirio.kuhnen@titansgroup.com.br','pt_BR',44,1,1),(134,'marcos.santana@titansgroup.com.br','pt_BR',44,1,1),(135,'pedro.silva@titansgroup.com.br','pt_BR',44,1,1),(136,'rafael.zanini@titansgroup.com.br','pt_BR',44,1,1),(137,'raphael.ramos@titansgroup.com.br','pt_BR',44,1,1),(138,'raphael.saez@titansgroup.com.br','pt_BR',44,1,1),(139,'silvio.neto@titansgroup.com.br','pt_BR',44,1,1),(140,'felipe.prenholato@titansgroup.com.br','pt_BR',46,1,1),(141,'guilherme.fabricio@titansgroup.com.br','pt_BR',46,1,1),(142,'gustavo.armelin@titansgroup.com.br','pt_BR',46,1,1),(143,'luiz.honda@titansgroup.com.br','pt_BR',46,1,1),(144,'mauro.baraldi@titansgroup.com.br','pt_BR',46,1,1),(145,'reinaldo.sanches@titansgroup.com.br','pt_BR',46,1,1),(146,'renato.lipi@titansgroup.com.br','pt_BR',46,1,1),(147,'thiago.hiromi@titansgroup.com.br','pt_BR',46,1,1),(148,'tomas.correa@titansgroup.com.br','pt_BR',46,1,1),(149,'caio.borges@titansgroup.com.br','pt_BR',47,1,1),(150,'debora@titansgroup.com.br','pt_BR',47,1,1),(151,'deferson.lima@titansgroup.com.br','pt_BR',47,1,1),(152,'evandro.simao@titansgroup.com.br','pt_BR',47,1,1),(153,'silvana@titansgroup.com.br','pt_BR',47,1,1),(154,'valdir.junior@titansgroup.com.br','pt_BR',47,1,1),(155,'anacaroline@titansgroup.com.br','pt_BR',48,1,1),(156,'davis.sousa@titansgroup.com.br','pt_BR',48,1,1),(157,'rafael.bosco@titansgroup.com.br','pt_BR',48,1,1),(158,'wesley.alves@titansgroup.com.br','pt_BR',48,1,1),(159,'aline@titansgroup.com.br','pt_BR',52,1,1),(160,'cassia@titansgroup.com.br','pt_BR',52,1,1),(161,'alexandre.gomes@titansgroup.com.br','pt_BR',53,1,1),(162,'bruno.fernandes@titansgroup.com.br','pt_BR',53,1,1),(163,'ane.silva@titansgroup.com.br','pt_BR',54,1,1),(164,'carol.perina@titansgroup.com.br','pt_BR',54,2,2),(165,'alejandra.cordova@titansgroup.com.br','',55,1,1),(166,'bruno.garcini@titansgroup.com.br','',55,1,1),(167,'bianca.viegas@titansgroup.com.br','pt_BR',56,1,1),(168,'fernanda.kovacic@titansgroup.com.br','pt_BR',56,1,1),(169,'katia@titansgroup.com.br','pt_BR',56,1,1),(170,'rodrigo.lima@titansgroup.com.br','pt_BR',164,1,1),(171,'tatiane.oliveira@titansgroup.com.br','pt_BR',164,1,1),(172,'avaliacao@titansgroup.com.br','pt_BR',NULL,1,3);
/*!40000 ALTER TABLE `measured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT  IGNORE INTO `profile` VALUES (1,'Avaliado'),(2,'Avaliador'),(3,'Admin');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_code` int(11) NOT NULL,
  `question_content` text NOT NULL,
  `language` enum('es_MX','pt_BR') NOT NULL,
  `competence_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_question_section1_idx` (`competence_id`),
  CONSTRAINT `fk_question_question_section1` FOREIGN KEY (`competence_id`) REFERENCES `competence` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-12 20:26:48
