/*******************************************************************************
*Marcos Paulo
*Script de subida de todas as tabelas necessárias para as novas telas desenvolvidas pelo cido no CotF
*26/10/2012
********************************************************************************/



/*Table structure for table `fornecedores_A` */


drop table if exists fornecedores_A;
CREATE TABLE `fornecedores_A` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `linha_resposta_id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `nome_fornecedor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `apelido` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `partnumber` varchar(255) NOT NULL,
  `pu` varchar(50) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `historico_id` int(1) DEFAULT NULL,
  `peso_KG` decimal(11,6) DEFAULT NULL,
  `peso_tot_KG` decimal(11,6) DEFAULT '0.000000',
  `peso_LB` decimal(11,6) DEFAULT NULL,
  `peso_tot_LB` decimal(11,6) DEFAULT '0.000000',
  `nome_marca` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `data_cotacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `puc` varchar(100) DEFAULT NULL,
  `disponibilidade` int(4) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `qtd_linha_resposta` int(11) DEFAULT NULL,
  `moeda_preco` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `p3min` decimal(10,2) DEFAULT NULL,
  `p7min` decimal(10,2) DEFAULT NULL,
  `l3min` decimal(10,2) DEFAULT NULL,
  `l7min` decimal(10,2) DEFAULT NULL,
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
  `moeda_custo` varchar(255) DEFAULT NULL,
  `moeda_custo_id` char(3) DEFAULT NULL,
  `moeda_preco_id` char(3) DEFAULT NULL,
  `custo` decimal(10,2) DEFAULT NULL,
  `moeda_frete_id` varchar(5) DEFAULT NULL,
  `frete` varchar(3) DEFAULT NULL,
  `frete_valor` decimal(10,2) DEFAULT NULL,
  `frete_tempo` int(3) DEFAULT NULL,
  `moeda_frete_nacional_id` decimal(10,2) DEFAULT NULL,
  `prazo_frete_nacional` int(3) DEFAULT NULL,
  `frete_nacional` decimal(10,2) DEFAULT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `contato_id` int(11) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `obs` text,
  `data_cadastro` datetime DEFAULT NULL,
  `vinculado` int(1) DEFAULT NULL,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `i_federal_lucro_nacional` decimal(10,2) DEFAULT NULL,
  `i_federal_lucro_internacional` decimal(10,2) DEFAULT NULL,
  `i_federal_simples_nacional` decimal(10,2) DEFAULT NULL,
  `i_federal_simples_internacional` decimal(10,2) DEFAULT NULL,
  `icms_venda_rpm` decimal(10,2) DEFAULT NULL,
  `ipi_bbi` decimal(10,2) DEFAULT NULL,
  `icms_compra_bbi` decimal(10,2) DEFAULT NULL,
  `pickup_bbi` decimal(10,4) DEFAULT NULL,
  `valor_nota_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_servico_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_07_a_10_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_25_a_30_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_dhl` int(1) DEFAULT NULL,
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
  `metodo_importacao` int(1) DEFAULT NULL,
  `melhor_met_import_MDD` int(1) DEFAULT NULL,
  `melhor_met_import_RPM` int(1) DEFAULT NULL,
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
  `m5_disponibilidade` decimal(10,2) DEFAULT '0.00',
  `preco_fob_unit_brl` decimal(10,2) DEFAULT '0.00',
  `preco_fob_tot_brl` decimal(10,2) DEFAULT '0.00',
  `icms_estado` decimal(10,2) DEFAULT '0.00',
  `rpm_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`,`linha_resposta_id`,`fornecedor_id`,`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Table structure for table `fornecedores_B` */


drop table if exists fornecedores_B;
CREATE TABLE `fornecedores_B` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `linha_resposta_id` int(11) NOT NULL,
  `interchange` varchar(3) DEFAULT NULL,
  `origem_interchange` varchar(255) DEFAULT NULL,
  `pu_interchange` int(1) DEFAULT NULL,
  `marca_id_interchange` int(1) DEFAULT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `nome_fornecedor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `apelido` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `partnumber` varchar(255) NOT NULL,
  `pu` varchar(50) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `historico_id` int(1) DEFAULT NULL,
  `peso_KG` decimal(11,6) DEFAULT NULL,
  `peso_tot_KG` decimal(11,6) DEFAULT '0.000000',
  `peso_LB` decimal(11,6) DEFAULT NULL,
  `peso_tot_LB` decimal(11,6) DEFAULT '0.000000',
  `nome_marca` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `data_cotacao` datetime DEFAULT NULL,
  `puc` varchar(100) DEFAULT NULL,
  `disponibilidade` int(4) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `qtd_linha_resposta` int(11) DEFAULT NULL,
  `moeda_preco` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `p3min` decimal(10,2) DEFAULT NULL,
  `p7min` decimal(10,2) DEFAULT NULL,
  `l3min` decimal(10,2) DEFAULT NULL,
  `l7min` decimal(10,2) DEFAULT NULL,
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
  `aliquota_ipi` decimal(10,2) DEFAULT NULL,
  `moeda_custo` varchar(255) DEFAULT NULL,
  `moeda_custo_id` char(3) DEFAULT NULL,
  `moeda_preco_id` char(3) DEFAULT NULL,
  `custo` decimal(10,2) DEFAULT NULL,
  `moeda_frete_id` varchar(5) DEFAULT NULL,
  `frete` varchar(3) DEFAULT NULL,
  `frete_valor` decimal(10,2) DEFAULT NULL,
  `frete_tempo` int(3) DEFAULT NULL,
  `prazo_frete_nacional` int(3) DEFAULT NULL,
  `frete_nacional` decimal(10,2) DEFAULT NULL,
  `moeda_frete_nacional_id` varchar(5) DEFAULT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `contato_id` int(11) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `obs` text,
  `data_cadastro` datetime DEFAULT NULL,
  `vinculado` int(1) DEFAULT NULL,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `i_federal_lucro_nacional` decimal(10,2) DEFAULT NULL,
  `i_federal_lucro_internacional` decimal(10,2) DEFAULT NULL,
  `i_federal_simples_nacional` decimal(10,2) DEFAULT NULL,
  `i_federal_simples_internacional` decimal(10,2) DEFAULT NULL,
  `icms_venda_rpm` decimal(10,2) DEFAULT NULL,
  `ipi_bbi` decimal(10,2) DEFAULT NULL,
  `icms_compra_bbi` decimal(10,2) DEFAULT NULL,
  `pickup_bbi` decimal(10,4) DEFAULT NULL,
  `valor_nota_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_servico_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_07_a_10_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_25_a_30_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_dhl` int(1) DEFAULT NULL,
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
  `metodo_importacao` int(1) DEFAULT NULL,
  `melhor_met_import_MDD` int(1) DEFAULT NULL,
  `melhor_met_import_RPM` int(1) DEFAULT NULL,
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
  `m5_disponibilidade` decimal(10,2) DEFAULT '0.00',
  `preco_fob_unit_brl` decimal(10,2) DEFAULT '0.00',
  `preco_fob_tot_brl` decimal(10,2) DEFAULT '0.00',
  `icms_estado` decimal(10,2) DEFAULT '0.00',
  `rpm_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`,`linha_resposta_id`,`fornecedor_id`,`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Table structure for table `fornecedores_C` */


drop table if exists fornecedores_C;
CREATE TABLE `fornecedores_C` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `linha_resposta_id` int(11) NOT NULL,
  `interchange` varchar(3) DEFAULT NULL,
  `origem_interchange` varchar(255) DEFAULT NULL,
  `pu_interchange` int(1) DEFAULT NULL,
  `marca_id_interchange` int(1) DEFAULT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `nome_fornecedor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `apelido` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `partnumber` varchar(255) NOT NULL,
  `pu` varchar(50) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `historico_id` int(1) DEFAULT NULL,
  `peso_KG` decimal(11,6) DEFAULT NULL,
  `peso_tot_KG` decimal(11,6) DEFAULT '0.000000',
  `peso_LB` decimal(11,6) DEFAULT NULL,
  `peso_tot_LB` decimal(11,6) DEFAULT '0.000000',
  `nome_marca` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `data_cotacao` datetime DEFAULT NULL,
  `puc` varchar(100) DEFAULT NULL,
  `disponibilidade` int(4) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `qtd_linha_resposta` int(11) DEFAULT NULL,
  `moeda_preco` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `p3min` decimal(10,2) DEFAULT NULL,
  `p7min` decimal(10,2) DEFAULT NULL,
  `l3min` decimal(10,2) DEFAULT NULL,
  `l7min` decimal(10,2) DEFAULT NULL,
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
  `aliquota_ipi` decimal(10,2) DEFAULT NULL,
  `moeda_custo` varchar(255) DEFAULT NULL,
  `moeda_custo_id` char(3) DEFAULT NULL,
  `moeda_preco_id` char(3) DEFAULT NULL,
  `custo` decimal(10,2) DEFAULT NULL,
  `moeda_frete_id` varchar(5) DEFAULT NULL,
  `frete` varchar(3) DEFAULT NULL,
  `frete_valor` decimal(10,2) DEFAULT NULL,
  `frete_tempo` int(3) DEFAULT NULL,
  `prazo_frete_nacional` int(3) DEFAULT NULL,
  `frete_nacional` decimal(10,2) DEFAULT NULL,
  `moeda_frete_nacional_id` varchar(5) DEFAULT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `contato_id` int(11) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `obs` text,
  `data_cadastro` datetime DEFAULT NULL,
  `vinculado` int(1) DEFAULT NULL,
  `tipo_negocio` varchar(255) DEFAULT NULL,
  `i_federal_lucro_nacional` decimal(10,2) DEFAULT NULL,
  `i_federal_lucro_internacional` decimal(10,2) DEFAULT NULL,
  `i_federal_simples_nacional` decimal(10,2) DEFAULT NULL,
  `i_federal_simples_internacional` decimal(10,2) DEFAULT NULL,
  `icms_venda_rpm` decimal(10,2) DEFAULT NULL,
  `ipi_bbi` decimal(10,2) DEFAULT NULL,
  `icms_compra_bbi` decimal(10,2) DEFAULT NULL,
  `pickup_bbi` decimal(10,4) DEFAULT NULL,
  `valor_nota_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_servico_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_07_a_10_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_25_a_30_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_bbi` decimal(10,4) DEFAULT NULL,
  `taxa_peso_albrecht_dhl` int(1) DEFAULT NULL,
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
  `metodo_importacao` int(1) DEFAULT NULL,
  `melhor_met_import_MDD` int(1) DEFAULT NULL,
  `melhor_met_import_RPM` int(1) DEFAULT NULL,
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
  `m5_disponibilidade` decimal(10,2) DEFAULT '0.00',
  `preco_fob_unit_brl` decimal(10,2) DEFAULT '0.00',
  `preco_fob_tot_brl` decimal(10,2) DEFAULT '0.00',
  `icms_estado` decimal(10,2) DEFAULT '0.00',
  `rpm_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_export_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`,`linha_resposta_id`,`fornecedor_id`,`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Table structure for table `fornecedores_cotf_exportacao` */


drop table if exists fornecedores_cotf_exportacao;
CREATE TABLE `fornecedores_cotf_exportacao` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `linha_resposta_id` int(4) NOT NULL,
  `fornecedor_id` int(4) NOT NULL,
  `pu` varchar(100) NOT NULL DEFAULT '',
  `marca_id` int(6) NOT NULL,
  `historico_id` int(4) NOT NULL AUTO_INCREMENT,
  `preco` decimal(10,2) DEFAULT '0.00',
  `rpm_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_vv_unit_brl` decimal(10,2) DEFAULT '0.00',
  `rpm_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `mdd_lucro_unit_brl` decimal(10,2) DEFAULT '0.00',
  `ipi` decimal(10,2) DEFAULT '0.00',
  `icms` decimal(10,2) DEFAULT '0.00',
  `grupo_f` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`,`linha_resposta_id`,`fornecedor_id`,`pu`,`marca_id`,`historico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `fornecedores_cotf_importacao` */


drop table if exists fornecedores_cotf_importacao;
CREATE TABLE `fornecedores_cotf_importacao` (
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



/*Table structure for table `fornecedores_cotf_nacional` */


drop table if exists fornecedores_cotf_nacional;
CREATE TABLE `fornecedores_cotf_nacional` (
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



/*Table structure for table `linha_resposta` */


drop table if exists linha_resposta;
CREATE TABLE `linha_resposta` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `linha_resposta_id` int(11) NOT NULL AUTO_INCREMENT,
  `pu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `partnumber` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `qtde_item_cotacao` int(11) DEFAULT NULL,
  `disponibilidade` int(5) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `ipi` decimal(10,2) DEFAULT NULL,
  `moeda_preco` varchar(20) DEFAULT NULL,
  `obs` text,
  `timestamp` datetime DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `nome_fornecedor` varchar(255) DEFAULT NULL,
  `empresa` int(1) DEFAULT NULL,
  `lucro_mdd` decimal(10,2) DEFAULT NULL,
  `lucro_rpm` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`,`linha_resposta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Table structure for table `linha_resposta_vinculado` */


drop table if exists linha_resposta_vinculado;
CREATE TABLE `linha_resposta_vinculado` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `linha_resposta_id` int(11) NOT NULL AUTO_INCREMENT,
  `pu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `partnumber` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `qtde_item_cotacao` int(11) DEFAULT NULL,
  `disponibilidade` int(5) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `ipi` decimal(10,2) DEFAULT NULL,
  `moeda_preco` varchar(20) DEFAULT NULL,
  `obs` text,
  `timestamp` datetime DEFAULT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `nome_fornecedor` varchar(255) DEFAULT NULL,
  `empresa` int(1) DEFAULT NULL,
  `lucro_mdd` decimal(10,2) DEFAULT NULL,
  `lucro_rpm` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`,`linha_resposta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Table structure for table `proposta` */


drop table if exists proposta;
CREATE TABLE `proposta` (
  `proposta_id` int(11) NOT NULL,
  `proposta_cod` varchar(23) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `contato` varchar(255) NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `uf` varchar(20) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `imposto` varchar(255) NOT NULL,
  `suframa` varchar(3) NOT NULL,
  `icms_suframa` decimal(10,2) NOT NULL,
  `ipi_suframa` decimal(10,2) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `aceita_importacao` varchar(3) NOT NULL,
  `usuario` int(2) unsigned NOT NULL,
  `status` int(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `usuario_cadastro` int(2) unsigned DEFAULT '0',
  `nota` text,
  `data_abertura` datetime DEFAULT NULL,
  `usuario_abertura` int(11) DEFAULT NULL,
  `icms_estado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`proposta_id`,`revisao`),
  KEY `i1` (`data_cadastro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



/*Table structure for table `proposta_enviada` */


drop table if exists proposta_enviada;
CREATE TABLE `proposta_enviada` (
  `proposta_id` int(15) NOT NULL,
  `proposta_cod` varchar(23) DEFAULT NULL,
  `revisao` int(4) unsigned zerofill DEFAULT NULL,
  `enviada` int(1) DEFAULT NULL,
  PRIMARY KEY (`proposta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Table structure for table `proposta_itens` */



drop table if exists proposta_itens;
CREATE TABLE `proposta_itens` (
  `proposta_id` int(11) NOT NULL,
  `revisao` int(4) unsigned zerofill NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_partnumber` varchar(255) DEFAULT NULL,
  `pu` varchar(255) DEFAULT NULL,
  `item_marca` varchar(255) DEFAULT NULL,
  `item_marca_id` int(11) DEFAULT NULL,
  `item_qtd` int(4) DEFAULT NULL,
  `item_obs` text,
  `data_cadastro` datetime NOT NULL,
  `marcas_aceitas` varchar(255) DEFAULT '0',
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL DEFAULT '0.00',
  `preco_fornecedor_id` int(6) DEFAULT NULL,
  `disponibilidade` int(3) DEFAULT NULL,
  `oferta` int(1) DEFAULT NULL,
  `pais` varchar(55) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `imposto` int(11) DEFAULT NULL,
  `tipo_imposto` int(11) DEFAULT NULL,
  PRIMARY KEY (`proposta_id`,`revisao`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;






alter table fornecedor_estoque_historico add m1_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m1_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m1_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m1_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m1_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_export_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_export_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_export_lucro_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_export_lucro_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add peso_kg decimal(10,2) default 0;


alter table fornecedor_estoque_historico add m5_custo_tot_inter_brl decimal(10,2) default 0 after m4_custo_tot_inter_brl;
alter table fornecedor_estoque_historico add mdd_m5_vv_unit_brl decimal(10,2) default 0 after mdd_m4_vv_unit_brl;
alter table fornecedor_estoque_historico add rpm_m5_vv_unit_7_brl decimal(10,2) default 0 after rpm_m4_vv_unit_18_brl;
alter table fornecedor_estoque_historico add rpm_m5_vv_unit_12_brl decimal(10,2) default 0 after rpm_m5_vv_unit_7_brl;
alter table fornecedor_estoque_historico add rpm_m5_vv_unit_18_brl decimal(10,2) default 0 after rpm_m5_vv_unit_12_brl;
alter table fornecedor_estoque_historico add mdd_m5_lucro_tot_brl decimal(10,2) default 0 after mdd_m4_lucro_tot_brl;
alter table fornecedor_estoque_historico add rpm_m5_lucro_tot_7_brl decimal(10,2) default 0 after rpm_m4_lucro_tot_7_brl;
alter table fornecedor_estoque_historico add rpm_m5_lucro_tot_12_brl decimal(10,2) default 0 after rpm_m4_lucro_tot_12_brl;
alter table fornecedor_estoque_historico add rpm_m5_lucro_tot_18_brl decimal(10,2) default 0 after rpm_m4_lucro_tot_18_brl;
alter table fornecedor_estoque_historico add m5_custo_tot_imp_brl decimal(10,2) default 0 after m4_custo_tot_imp_brl;
alter table fornecedor_estoque_historico add m5_disponibilidade decimal(10,2) default 0 after m4_disponibilidade;


alter table fornecedor_estoque_historico add mdd_m1_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m5_custo_imp decimal(10,2) default 0 after mdd_m4_custo_imp;
alter table fornecedor_estoque_historico add rpm_m1_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m5_custo_imp decimal(10,2) default 0 after rpm_m4_custo_imp;




/*Table structure for table `global_conf` */

drop table if exists global_conf;
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



drop table if exists metodos_importacao;
CREATE TABLE `metodos_importacao` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `metodo` varchar(20) DEFAULT NULL,
  `ativo` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



/*Data for the table `metodos_importacao` */
insert  into `metodos_importacao`(`id`,`metodo`,`ativo`) values (1,'BBI 25-30 Preço FOB',0),(2,'BBI 25-30 Peso',0),(3,'BBI 7-10 Peso',0),(4,'POMPÉIA ALBRECHT',1),(5,'ALBRECHT DHL',1),(6,'DHL 5',0);


drop table metodos_importacao;
CREATE TABLE `dhl_zonas` (
  `peso_kg` decimal(7,2) NOT NULL,
  `zona1` float(10,2) unsigned NOT NULL,
  `zona2` float(10,2) unsigned NOT NULL,
  `zona3` float(10,2) unsigned NOT NULL,
  `zona4` float(10,2) unsigned NOT NULL,
  `zona5` float(10,2) unsigned NOT NULL,
  `zona6` float(10,2) unsigned NOT NULL,
  `zona7` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`peso_kg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



/*Data for the table `dhl_zonas` */



insert  into `dhl_zonas`(`peso_kg`,`zona1`,`zona2`,`zona3`,`zona4`,`zona5`,`zona6`,`zona7`) values ('0.00',57.00,63.00,79.00,85.00,92.00,94.00,145.00),('1.00',65.00,78.00,89.00,99.00,103.00,110.00,169.00),('2.00',80.00,108.00,108.00,129.00,125.00,141.00,216.00),('3.00',96.00,138.00,128.00,159.00,147.00,172.00,263.00),('4.00',112.00,168.00,148.00,187.00,170.00,203.00,310.00),('5.00',127.00,197.00,167.00,216.00,192.00,234.00,357.00),('6.00',143.00,227.00,187.00,241.00,214.00,265.00,404.00),('7.00',159.00,256.00,207.00,266.00,236.00,296.00,451.00),('8.00',175.00,286.00,226.00,291.00,258.00,327.00,498.00),('9.00',190.00,316.00,246.00,316.00,280.00,358.00,545.00),('10.00',206.00,345.00,266.00,341.00,302.00,389.00,592.00),('11.00',222.00,375.00,286.00,366.00,325.00,420.00,639.00),('12.00',237.00,404.00,305.00,391.00,347.00,451.00,686.00),('13.00',253.00,434.00,325.00,416.00,369.00,482.00,733.00),('14.00',269.00,463.00,345.00,441.00,391.00,514.00,780.00),('15.00',284.00,493.00,364.00,466.00,413.00,545.00,827.00),('16.00',300.00,522.00,384.00,491.00,435.00,576.00,874.00),('17.00',316.00,552.00,404.00,516.00,457.00,607.00,921.00),('18.00',331.00,581.00,423.00,541.00,480.00,638.00,968.00),('19.00',347.00,611.00,443.00,566.00,502.00,669.00,1015.00),('20.00',363.00,640.00,463.00,591.00,524.00,700.00,1062.00),('21.00',375.00,664.00,487.00,610.00,557.00,723.00,1107.00),('22.00',386.00,687.00,511.00,628.00,590.00,746.00,1151.00),('23.00',398.00,710.00,536.00,647.00,623.00,770.00,1195.00),('24.00',410.00,733.00,560.00,666.00,657.00,793.00,1239.00),('25.00',422.00,757.00,585.00,685.00,690.00,816.00,1283.00),('26.00',433.00,780.00,609.00,703.00,723.00,839.00,1328.00),('27.00',445.00,803.00,633.00,722.00,756.00,863.00,1372.00),('28.00',457.00,826.00,658.00,741.00,790.00,886.00,1416.00),('29.00',469.00,850.00,682.00,760.00,823.00,909.00,1460.00),('30.00',481.00,873.00,707.00,779.00,856.00,933.00,1504.00),('31.00',492.00,896.00,731.00,797.00,889.00,956.00,1548.00),('32.00',504.00,919.00,755.00,816.00,922.00,979.00,1593.00),('33.00',516.00,943.00,780.00,835.00,956.00,1002.00,1637.00),('34.00',528.00,966.00,804.00,854.00,989.00,1026.00,1681.00),('35.00',540.00,989.00,829.00,872.00,1022.00,1049.00,1725.00),('36.00',551.00,1013.00,853.00,891.00,1055.00,1072.00,1769.00),('37.00',563.00,1036.00,877.00,910.00,1088.00,1095.00,1813.00),('38.00',575.00,1059.00,902.00,929.00,1122.00,1119.00,1858.00),('39.00',587.00,1082.00,926.00,947.00,1155.00,1142.00,1902.00),('40.00',598.00,1106.00,951.00,966.00,1188.00,1165.00,1946.00),('41.00',610.00,1129.00,975.00,985.00,1221.00,1189.00,1990.00),('42.00',622.00,1152.00,999.00,1004.00,1254.00,1212.00,2034.00),('43.00',634.00,1175.00,1024.00,1022.00,1288.00,1235.00,2079.00),('44.00',646.00,1199.00,1048.00,1041.00,1321.00,1258.00,2123.00),('45.00',657.00,1222.00,1073.00,1060.00,1354.00,1282.00,2167.00),('46.00',669.00,1245.00,1097.00,1079.00,1387.00,1305.00,2211.00),('47.00',681.00,1268.00,1121.00,1097.00,1421.00,1328.00,2255.00),('48.00',693.00,1292.00,1146.00,1116.00,1454.00,1351.00,2299.00),('49.00',705.00,1315.00,1170.00,1135.00,1487.00,1375.00,2344.00),('50.00',716.00,1338.00,1195.00,1154.00,1520.00,1398.00,2388.00),('51.00',728.00,1360.00,1218.00,1172.00,1553.00,1420.00,2427.00),('52.00',739.00,1381.00,1242.00,1190.00,1587.00,1443.00,2467.00),('53.00',750.00,1403.00,1266.00,1208.00,1620.00,1465.00,2507.00),('54.00',761.00,1424.00,1290.00,1226.00,1653.00,1488.00,2546.00),('55.00',773.00,1445.00,1314.00,1244.00,1686.00,1510.00,2586.00),('56.00',784.00,1467.00,1338.00,1263.00,1719.00,1533.00,2625.00),('57.00',795.00,1488.00,1362.00,1281.00,1753.00,1555.00,2665.00),('58.00',807.00,1510.00,1386.00,1299.00,1786.00,1577.00,2704.00),('59.00',818.00,1531.00,1410.00,1317.00,1819.00,1600.00,2744.00),('60.00',829.00,1552.00,1434.00,1335.00,1852.00,1622.00,2783.00),('61.00',840.00,1574.00,1458.00,1353.00,1885.00,1645.00,2823.00),('62.00',852.00,1595.00,1482.00,1371.00,1919.00,1667.00,2863.00),('63.00',863.00,1617.00,1506.00,1390.00,1952.00,1690.00,2902.00),('64.00',874.00,1638.00,1530.00,1408.00,1985.00,1712.00,2942.00),('65.00',885.00,1660.00,1554.00,1426.00,2018.00,1735.00,2981.00),('66.00',897.00,1681.00,1578.00,1444.00,2052.00,1757.00,3021.00),('67.00',908.00,1702.00,1602.00,1462.00,2085.00,1780.00,3060.00),('68.00',919.00,1724.00,1626.00,1480.00,2118.00,1802.00,3100.00),('69.00',931.00,1745.00,1650.00,1498.00,2151.00,1824.00,3140.00),('70.00',942.00,1767.00,1674.00,1517.00,2184.00,1847.00,3179.00);



