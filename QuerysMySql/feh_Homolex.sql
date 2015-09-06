/*
SQLyog Ultimate v8.55 
MySQL - 5.1.61 : Database - rpm_homolex
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rpm_homolex` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rpm_homolex`;

/*Table structure for table `fornecedor_estoque_historico` */

CREATE TABLE `fornecedor_estoque_historico` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `pu` varchar(100) NOT NULL DEFAULT '',
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) NOT NULL AUTO_INCREMENT,
  `marca_origem` varchar(255) DEFAULT NULL,
  `data_cotacao` timestamp NULL DEFAULT NULL,
  `puc` varchar(100) DEFAULT NULL,
  `partnumber` varchar(100) NOT NULL,
  `disponibilidade_id` int(1) unsigned DEFAULT NULL,
  `oferta` int(1) unsigned DEFAULT NULL,
  `qtd` int(11) unsigned DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `p3` decimal(10,2) DEFAULT NULL,
  `p7` decimal(10,2) DEFAULT NULL,
  `p12` decimal(10,2) DEFAULT NULL,
  `p18` decimal(10,2) DEFAULT NULL,
  `l3` decimal(10,2) DEFAULT NULL,
  `l7` decimal(10,2) DEFAULT NULL,
  `l12` decimal(10,2) DEFAULT NULL,
  `l18` decimal(10,2) DEFAULT NULL,
  `margem_lucro` decimal(10,2) DEFAULT NULL,
  `vc_imp_bbi_25_30_fob` decimal(10,2) DEFAULT NULL,
  `vc_imp_bbi_25_30_peso` decimal(10,2) DEFAULT NULL,
  `vc_imp_bbi_7_10` decimal(10,2) DEFAULT NULL,
  `vc_imp_alemanha` decimal(10,2) DEFAULT NULL,
  `preco_simp` decimal(10,2) DEFAULT NULL,
  `aliquota_ipi` decimal(6,2) DEFAULT NULL,
  `moeda_custo` varchar(10) DEFAULT NULL,
  `moeda_custo_id` decimal(10,2) DEFAULT NULL,
  `moeda_preco_id` char(5) DEFAULT NULL,
  `custo` decimal(12,2) DEFAULT NULL,
  `frete` varchar(3) DEFAULT NULL,
  `frete_valor` decimal(10,2) DEFAULT NULL,
  `frete_tempo` int(3) DEFAULT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `contato_id` int(11) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',
  `obs` text,
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `carga_id` int(5) unsigned DEFAULT NULL,
  `m1_custo_tot_inter_brl` decimal(10,2) DEFAULT '0.00',
  `m2_custo_tot_inter_brl` decimal(10,2) DEFAULT '0.00',
  `m3_custo_tot_inter_brl` decimal(10,2) DEFAULT '0.00',
  `m4_custo_tot_inter_brl` decimal(10,2) DEFAULT '0.00',
  `m5_custo_tot_inter_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m1_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m2_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m3_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m4_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m5_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m1_vv_unit_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m1_vv_unit_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m1_vv_unit_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m2_vv_unit_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m2_vv_unit_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m2_vv_unit_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m3_vv_unit_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m3_vv_unit_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m3_vv_unit_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m4_vv_unit_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m4_vv_unit_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m4_vv_unit_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m5_vv_unit_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m5_vv_unit_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m5_vv_unit_18_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m1_lucro_tot_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m2_lucro_tot_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m3_lucro_tot_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m4_lucro_tot_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_m5_lucro_tot_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m1_lucro_tot_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m2_lucro_tot_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m3_lucro_tot_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m4_lucro_tot_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m5_lucro_tot_7_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m1_lucro_tot_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m2_lucro_tot_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m3_lucro_tot_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m4_lucro_tot_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m5_lucro_tot_12_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m1_lucro_tot_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m2_lucro_tot_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m3_lucro_tot_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m4_lucro_tot_18_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_m5_lucro_tot_18_brl` decimal(10,2) DEFAULT '0.00',
  `m1_custo_tot_imp_brl` decimal(10,2) DEFAULT '0.00',
  `m2_custo_tot_imp_brl` decimal(10,2) DEFAULT '0.00',
  `m3_custo_tot_imp_brl` decimal(10,2) DEFAULT '0.00',
  `m4_custo_tot_imp_brl` decimal(10,2) DEFAULT '0.00',
  `m5_custo_tot_imp_brl` decimal(10,2) DEFAULT '0.00',
  `m1_disponibilidade` int(4) DEFAULT '0',
  `m2_disponibilidade` int(4) DEFAULT '0',
  `m3_disponibilidade` int(4) DEFAULT '0',
  `m4_disponibilidade` int(4) DEFAULT '0',
  `m5_disponibilidade` int(4) DEFAULT '0',
  `peso_kg` decimal(10,2) DEFAULT '0.00',
  `rpm_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`fornecedor_id`,`pu`,`marca_id`,`historico_id`),
  KEY `i2` (`ultimo`,`fornecedor_id`),
  KEY `i1` (`pu`,`marca_id`,`ultimo`,`partnumber`,`puc`),
  KEY `i3` (`partnumber`,`fornecedor_id`,`marca_id`),
  KEY `carga_id` (`carga_id`,`fornecedor_id`,`pu`,`marca_id`),
  KEY `i4` (`ultimo`,`puc`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
