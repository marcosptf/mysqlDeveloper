/*******************************************************************************
*Nota estrutura da Tabela FEH com todos os desmembramentos de precos e importacao
********************************************************************************/
CREATE  TABLE IF NOT EXISTS `fornecedor_estoque_historico` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `pu` VARCHAR(100) NOT NULL DEFAULT '' ,
  `marca_id` INT(6) UNSIGNED NOT NULL ,
  `historico_id` INT(4) NOT NULL AUTO_INCREMENT ,
  `marca_origem` VARCHAR(255) NULL DEFAULT NULL ,
  `data_cotacao` TIMESTAMP NULL DEFAULT NULL ,
  `puc` VARCHAR(100) NULL DEFAULT NULL ,
  `partnumber` VARCHAR(100) NOT NULL ,
  `disponibilidade_id` INT(1) UNSIGNED NULL DEFAULT NULL ,
  `oferta` INT(1) UNSIGNED NULL DEFAULT NULL ,
  `qtd` INT(11) UNSIGNED NULL DEFAULT NULL ,
  `moeda_preco` VARCHAR(10) NULL DEFAULT NULL ,
  `preco` DECIMAL(12,2) NOT NULL ,
  `margem_lucro` DECIMAL(10,2) NULL DEFAULT NULL ,
  `preco_simp` DECIMAL(10,2) NULL DEFAULT NULL ,
  `aliquota_ipi` DECIMAL(6,2) NULL DEFAULT NULL ,
  `moeda_preco_id` CHAR(5) NULL DEFAULT NULL ,
  `frete` VARCHAR(3) NULL DEFAULT NULL ,
  `frete_valor` DECIMAL(10,2) NULL DEFAULT NULL ,
  `frete_tempo` INT(3) NULL DEFAULT NULL ,
  `usuario_id` INT(3) NULL DEFAULT NULL ,
  `contato_id` INT(11) NULL DEFAULT NULL ,
  `origem` VARCHAR(100) NULL DEFAULT NULL ,
  `mostra_preco` INT(1) UNSIGNED NULL DEFAULT '0' ,
  `obs` TEXT NULL DEFAULT NULL ,
  `ultimo` INT(1) UNSIGNED NOT NULL DEFAULT '0' ,
  `ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `carga_id` INT(5) UNSIGNED NULL DEFAULT NULL ,
  `peso_kg` DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `deletar` INT(1) NULL DEFAULT NULL ,
  PRIMARY KEY (`fornecedor_id`, `pu`, `marca_id`, `historico_id`) ,
  INDEX `i2` (`ultimo` ASC, `fornecedor_id` ASC) ,
  INDEX `i1` (`pu` ASC, `marca_id` ASC, `ultimo` ASC, `partnumber` ASC, `puc` ASC) ,
  INDEX `i3` (`partnumber` ASC, `fornecedor_id` ASC, `marca_id` ASC) ,
  INDEX `carga_id` (`carga_id` ASC, `fornecedor_id` ASC, `pu` ASC, `marca_id` ASC) ,
  INDEX `i4` (`ultimo` ASC, `puc` ASC, `marca_id` ASC) )
ENGINE = MyISAM DEFAULT CHARACTER SET = utf8;





/*******************************************************************************
*Querys para retirar todas as colunas de FEH que não fazem mais parte da sua estrutura
********************************************************************************/
alter table fornecedor_estoque_historico drop `m1_custo_tot_inter_brl` ;
alter table fornecedor_estoque_historico drop `m2_custo_tot_inter_brl` ;
alter table fornecedor_estoque_historico drop `m3_custo_tot_inter_brl` ;
alter table fornecedor_estoque_historico drop `m4_custo_tot_inter_brl` ;
alter table fornecedor_estoque_historico drop `m5_custo_tot_inter_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m1_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m2_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m3_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m4_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m5_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m1_vv_unit_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m1_vv_unit_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m1_vv_unit_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m2_vv_unit_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m2_vv_unit_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m2_vv_unit_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m3_vv_unit_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m3_vv_unit_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m3_vv_unit_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m4_vv_unit_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m4_vv_unit_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m4_vv_unit_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m5_vv_unit_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m5_vv_unit_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m5_vv_unit_18_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m1_lucro_tot_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m2_lucro_tot_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m3_lucro_tot_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m4_lucro_tot_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m5_lucro_tot_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m1_lucro_tot_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m2_lucro_tot_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m3_lucro_tot_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m4_lucro_tot_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m5_lucro_tot_7_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m1_lucro_tot_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m2_lucro_tot_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m3_lucro_tot_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m4_lucro_tot_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m5_lucro_tot_12_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m1_lucro_tot_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m2_lucro_tot_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m3_lucro_tot_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m4_lucro_tot_18_brl` ;
alter table fornecedor_estoque_historico drop `rpm_m5_lucro_tot_18_brl` ;
alter table fornecedor_estoque_historico drop `m1_custo_tot_imp_brl` ;
alter table fornecedor_estoque_historico drop `m2_custo_tot_imp_brl` ;
alter table fornecedor_estoque_historico drop `m3_custo_tot_imp_brl` ;
alter table fornecedor_estoque_historico drop `m4_custo_tot_imp_brl` ;
alter table fornecedor_estoque_historico drop `m5_custo_tot_imp_brl` ;
alter table fornecedor_estoque_historico drop `m1_disponibilidade` ;
alter table fornecedor_estoque_historico drop `m2_disponibilidade` ;
alter table fornecedor_estoque_historico drop `m3_disponibilidade` ;
alter table fornecedor_estoque_historico drop `m4_disponibilidade` ;
alter table fornecedor_estoque_historico drop `m5_disponibilidade` ;
alter table fornecedor_estoque_historico drop `rpm_export_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_export_vv_unit_brl` ;
alter table fornecedor_estoque_historico drop `rpm_export_lucro_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_export_lucro_unit_brl` ;
alter table fornecedor_estoque_historico drop `mdd_m1_custo_imp` ;
alter table fornecedor_estoque_historico drop `mdd_m2_custo_imp` ;
alter table fornecedor_estoque_historico drop `mdd_m3_custo_imp` ;
alter table fornecedor_estoque_historico drop `mdd_m4_custo_imp` ;
alter table fornecedor_estoque_historico drop `mdd_m5_custo_imp` ;
alter table fornecedor_estoque_historico drop `rpm_m1_custo_imp` ;
alter table fornecedor_estoque_historico drop `rpm_m2_custo_imp` ;
alter table fornecedor_estoque_historico drop `rpm_m3_custo_imp` ;
alter table fornecedor_estoque_historico drop `rpm_m4_custo_imp` ;
alter table fornecedor_estoque_historico drop `rpm_m5_custo_imp` ;
alter table fornecedor_estoque_historico drop `vc_imp_bbi_25_30_fob` ;
alter table fornecedor_estoque_historico drop `vc_imp_bbi_25_30_peso` ;
alter table fornecedor_estoque_historico drop `vc_imp_bbi_7_10` ;
alter table fornecedor_estoque_historico drop `vc_imp_alemanha` ;
alter table fornecedor_estoque_historico drop `moeda_custo` ;
alter table fornecedor_estoque_historico drop `moeda_custo_id` ;
alter table fornecedor_estoque_historico drop `custo` ;




/*******************************************************************************
*Nova tabela feh_importacao
********************************************************************************/
CREATE TABLE IF NOT EXISTS `feh_importacao` (
  `fornecedor_id`           INT(4) UNSIGNED NOT NULL ,
  `pu`                      VARCHAR(100) NOT NULL DEFAULT '' ,
  `marca_id`                INT(6) UNSIGNED NOT NULL ,
  `historico_id`            INT(4) NOT NULL AUTO_INCREMENT ,
  `metodo_id`               INT(1) NOT NULL ,
  `custo_tot_inter_brl`     DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `mdd_vv_unit_brl`         DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `rpm_vv_unit_7_brl`       DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `rpm_vv_unit_12_brl`      DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `rpm_vv_unit_18_brl`      DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `mdd_lucro_tot_brl`       DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `rpm_lucro_tot_7_brl`     DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `rpm_lucro_tot_12_brl`    DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `rpm_lucro_tot_18_brl`    DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `custo_tot_imp_brl`       DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `disponibilidade`         DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `custo_imp`               DECIMAL(10,2) NULL DEFAULT '0.00' ,
  PRIMARY KEY (`fornecedor_id`, `pu`, `marca_id`, `historico_id`, `metodo_id`))
ENGINE = MyISAM DEFAULT CHARACTER SET = utf8;




/*******************************************************************************
*Nova tabela feh_importacao
********************************************************************************/
CREATE TABLE IF NOT EXISTS `feh_nacional` (
  `fornecedor_id`           INT(4) UNSIGNED NOT NULL ,
  `pu`                      VARCHAR(100) NOT NULL DEFAULT '' ,
  `marca_id`                INT(6) UNSIGNED NOT NULL ,
  `historico_id`            INT(4) NOT NULL AUTO_INCREMENT ,
  `p3`                      DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `p7`                      DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `p12`                     DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `p18`                     DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `l3`                      DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `l7`                      DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `l12`                     DECIMAL(10,2) NULL DEFAULT '0.00' ,
  `l18`                     DECIMAL(10,2) NULL DEFAULT '0.00' ,  
  PRIMARY KEY (`fornecedor_id`, `pu`, `marca_id`, `historico_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;



/*******************************************************************************
*Nova tabela feh_importacao
********************************************************************************/
CREATE TABLE if not exists `feh_exportacao` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `pu` varchar(100) NOT NULL DEFAULT '',
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) NOT NULL AUTO_INCREMENT,
  `preco` decimal(10,2) DEFAULT '0.00',
  `rpm_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `ipi` decimal(10,2) DEFAULT '0.00',
  `icms` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`fornecedor_id`,`pu`,`marca_id`,`historico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




