# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: 50.28.33.189    Database: wedelhas_devel2
# ------------------------------------------------------
# Server version 5.1.62-cll

DROP DATABASE IF EXISTS `wedelhas_devel2`;
CREATE DATABASE `wedelhas_devel2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wedelhas_devel2`;

#
# Source for table catalogo
#

DROP TABLE IF EXISTS `catalogo`;
CREATE TABLE `catalogo` (
  `catalogo_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`catalogo_id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
