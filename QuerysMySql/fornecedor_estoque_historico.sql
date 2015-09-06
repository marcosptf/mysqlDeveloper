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
# Source for table fornecedor_estoque_historico
#

DROP TABLE IF EXISTS `fornecedor_estoque_historico`;
CREATE TABLE `fornecedor_estoque_historico` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) NOT NULL AUTO_INCREMENT,
  `data_cotacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `puc` varchar(255) DEFAULT NULL,
  `pu` varchar(255) DEFAULT NULL,
  `disponibilidade_id` int(1) unsigned DEFAULT NULL,
  `oferta` int(1) unsigned DEFAULT NULL,
  `qtd` int(11) unsigned DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `moeda_custo` varchar(10) DEFAULT NULL,
  `custo` decimal(12,2) DEFAULT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`),
  KEY `historicoDesc` (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
