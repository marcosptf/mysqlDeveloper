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

/*Table structure for table `global_conf` */

CREATE TABLE `global_conf` (
  `i_federal_lucro_nacional` decimal(10,4) DEFAULT NULL,
  `i_federal_lucro_internacional` decimal(10,4) DEFAULT NULL,
  `i_federal_simples_nacional` decimal(10,4) DEFAULT NULL,
  `i_federal_simples_internacional` decimal(10,4) DEFAULT NULL,
  `icms_venda_rpm` decimal(10,4) DEFAULT NULL,
  `icms_compra_bbi` decimal(10,4) DEFAULT NULL,
  `pickup_bbi` decimal(10,4) DEFAULT NULL,
  `valor_nota_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_servico_bbi` decimal(10,2) DEFAULT NULL,
  `taxa_peso_07_a_10_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_25_a_30_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_bbi` decimal(10,4) DEFAULT NULL,
  `ipi_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_dolar` decimal(10,4) DEFAULT NULL,
  `taxa_euro` decimal(10,4) DEFAULT NULL,
  `taxa_libra` decimal(10,4) DEFAULT NULL,
  `taxa_cambio` decimal(10,4) DEFAULT NULL,
  `icms_compra_albrecht` decimal(10,4) DEFAULT NULL,
  `pickup_pompeia` decimal(10,4) DEFAULT NULL,
  `comissao_ernest` decimal(10,4) DEFAULT NULL,
  `prazo_importacao_m1` int(3) DEFAULT NULL,
  `prazo_importacao_m2` int(3) DEFAULT NULL,
  `prazo_importacao_m3` int(3) DEFAULT NULL,
  `prazo_importacao_m4` int(3) DEFAULT NULL,
  `taxa_peso_albrecht_dhl` decimal(10,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `global_conf` */

insert  into `global_conf`(`i_federal_lucro_nacional`,`i_federal_lucro_internacional`,`i_federal_simples_nacional`,`i_federal_simples_internacional`,`icms_venda_rpm`,`icms_compra_bbi`,`pickup_bbi`,`valor_nota_bbi`,`taxa_servico_bbi`,`taxa_peso_07_a_10_bbi`,`taxa_peso_25_a_30_bbi`,`taxa_peso_albrecht_bbi`,`ipi_bbi`,`taxa_dolar`,`taxa_euro`,`taxa_libra`,`taxa_cambio`,`icms_compra_albrecht`,`pickup_pompeia`,`comissao_ernest`,`prazo_importacao_m1`,`prazo_importacao_m2`,`prazo_importacao_m3`,`prazo_importacao_m4`,`taxa_peso_albrecht_dhl`) values ('0.0600','0.0400','0.0900','0.0600','0.1800','0.1800','50.0000','0.3000','0.80','75.0000','32.0000','40.0000','0.1200','2.2000','2.9000','3.3000','50.0000','0.0300','70.0000','0.1000',50,40,30,20,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
