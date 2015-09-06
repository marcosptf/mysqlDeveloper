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

/*Table structure for table `global_conf` */

CREATE TABLE `global_conf` (
  `I_federal_lucro_nacional` decimal(10,2) DEFAULT NULL,
  `I_federal_lucro_internacional` decimal(10,2) DEFAULT NULL,
  `I_federal_simples_nacional` decimal(10,2) DEFAULT NULL,
  `I_federal_simples_internacional` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
