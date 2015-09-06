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
# Source for table fornecedor_estoque
#

DROP TABLE IF EXISTS `fornecedor_estoque`;
CREATE TABLE `fornecedor_estoque` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(255) DEFAULT NULL,
  `pu` varchar(255) DEFAULT NULL,
  `disponibilidade_id` int(11) unsigned DEFAULT NULL,
  `qtd` int(11) unsigned DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `moeda_custo` varchar(10) DEFAULT NULL,
  `custo` decimal(12,2) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `produto_id` varchar(255) DEFAULT NULL,
  `data_cotacao` datetime DEFAULT NULL,
  `oferta` int(1) NOT NULL DEFAULT '0',
  `mostra_preco` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`partnumber`,`marca_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1120113 DEFAULT CHARSET=utf8;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
