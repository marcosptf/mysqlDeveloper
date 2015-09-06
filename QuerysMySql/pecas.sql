/*
SQLyog Ultimate v8.55 
MySQL - 5.1.61 : Database - rpm_controlex
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rpm_controlex` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rpm_controlex`;

/*Table structure for table `pecas` */

CREATE TABLE `pecas` (
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(100) NOT NULL,
  `pu` varchar(100) NOT NULL DEFAULT '',
  `moeda_preco` varchar(10) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',
  `preco` decimal(10,2) NOT NULL,
  `p3` decimal(10,2) DEFAULT NULL,
  `p7` decimal(10,2) DEFAULT NULL,
  `p12` decimal(10,2) DEFAULT NULL,
  `p18` decimal(10,2) DEFAULT NULL,
  `f_id_simples` decimal(10,2) DEFAULT NULL,
  `f_id_lucro` decimal(10,2) DEFAULT NULL,
  `preco_fornecedor` decimal(10,2) NOT NULL,
  `preco_fornecedor_id` int(6) DEFAULT NULL,
  `disponibilidade_id` int(1) DEFAULT NULL,
  `disponibilidade_fornecedor_id` int(6) DEFAULT NULL,
  `oferta` int(1) DEFAULT NULL,
  `tem_fornecedor` int(1) DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `origem` char(1) NOT NULL DEFAULT 'C',
  PRIMARY KEY (`pu`,`marca_id`),
  KEY `i1` (`marca_id`,`puc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
