/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Botão comprar
*@desc:Funcao para atualizar o valor de venda de acordo com a porcentagem do 
*imposto na tabela FEH && Pecas
Fórmula:
********************************************************************/
drop procedure if exists cargaPrecoImposto; 

CREATE PROCEDURE `cargaPrecoImposto`()
begin

SET @margemVenda0       = 0.40,
    @margemVenda5       = 0.30,
    @margemVenda30      = 0.25,
    @margemVenda50      = 0.20,
    @margemVenda100     = 0.15,
    @margemVenda200     = 0.12,
    @impostoVendaFederal= 0.06,
    @margemVendaTMP     = 0;

drop table fornecedor_estoque_historico_tmp;
CREATE table if not exists  `fornecedor_estoque_historico_tmp` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `pu` varchar(100) DEFAULT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) NOT NULL AUTO_INCREMENT,
  `data_cotacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `puc` varchar(100) DEFAULT NULL,
  `partnumber` varchar(100) NOT NULL,
  `disponibilidade_id` int(1) unsigned DEFAULT NULL,
  `oferta` int(1) unsigned DEFAULT NULL,
  `qtd` int(11) unsigned DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `p3` decimal(12,2),
  `p7` decimal(12,2),
  `p12` decimal(12,2),
  `p18` decimal(12,2),
  `preco_simp` decimal(12,2) NOT NULL,
  `aliquota_ipi` decimal(6,2) NOT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',  
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`pu`,`marca_id`,`historico_id`),
  KEY `i2` (`ultimo`,`fornecedor_id`),
  KEY `i1` (`pu`,`marca_id`,`ultimo`,`partnumber`,`puc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


drop table pecas_tmp;
CREATE table if not exists `pecas_tmp` (
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(100) NOT NULL,
  `pu` varchar(100) DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',
  `preco` decimal(10,2) NOT NULL,
  `p3` decimal(12,2),
  `p7` decimal(12,2),
  `p12` decimal(12,2),
  `p18` decimal(12,2),
  `preco_fornecedor` decimal(10,2) NOT NULL,
  `preco_fornecedor_id` int(6),  /* id do fornecedor q tem o melhor preco  */
  `disponibilidade_id` int(1) DEFAULT NULL,
  `disponibilidade_fornecedor_id` int(6),  /* id do fornecedor q possui a melhor disponibilidade */
  `oferta` int(1) DEFAULT NULL,
  `tem_fornecedor` int(1) DEFAULT 0,
  `ts` timestamp not null DEFAULT now(),
    PRIMARY KEY (`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

truncate table fornecedor_estoque_historico_tmp;
truncate table pecas_tmp;


insert into fornecedor_estoque_historico_tmp
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,p3,p7,p12,p18,
origem,mostra_preco)
select 
/*feh.fornecedor_id,feh.partnumber,feh.marca_id,feh.data_cotacao,feh.pu,feh.puc,
feh.disponibilidade_id,feh.oferta,feh.qtd,feh.moeda_preco, */
feh.preco,
case 
    when feh.preco >=200000 then
       (select @margemVendaTMP:=@margemVenda200)

    when feh.preco >=100000 then
       (select @margemVendaTMP:=@margemVenda100)

    when feh.preco >=50000 then
        (select @margemVendaTMP:=@margemVenda50)

    when feh.preco >=30000 then
        (select @margemVendaTMP:=@margemVenda30)

    when feh.preco >=5000 then
        (select @margemVendaTMP:=@margemVenda5)

    when feh.preco >0 then
        (select @margemVendaTMP:=@margemVenda0)

end as margemVenda,






feh.origem,feh.mostra_preco
from      fornecedor_estoque_historico as feh
left join fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
where     feh.preco   >0
and       feh.ultimo  =1;









update      fornecedor_estoque_historico     as feh,
            fornecedor_estoque_historico_tmp as tmp 
set         feh.p3       = tmp.p3,
            feh.p7       = tmp.p7,
            feh.p12      = tmp.p12,
            feh.p18      = tmp.p18
where       feh.pu       = tmp.pu;


insert into pecas_tmp
(partnumber,marca_id,puc,pu,moeda_preco,mostra_preco,preco,p3,p7,p12,p18,preco_fornecedor,
preco_fornecedor_id,disponibilidade_id,disponibilidade_fornecedor_id,oferta,tem_fornecedor,ts)
select 
partnumber,marca_id,puc,pu,moeda_preco,mostra_preco,preco,
case 
    when preco >0 then
    (preco + (preco * 0.03))
    else
    '0.00'
end   as p3,
case 
    when preco >0 then
    (preco + (preco * 0.07))
    else
    '0.00'
end   as p7,
case 
    when preco >0 then
    (preco + (preco * 0.12))
    else
    '0.00'
end   as p12,
case 
    when preco >0 then
    (preco + (preco * 0.18))
    else
    '0.00'
end   as p18,
preco_fornecedor,preco_fornecedor_id,disponibilidade_id,disponibilidade_fornecedor_id,oferta,tem_fornecedor,ts
from   pecas;

update      pecas     as pc,
            pecas_tmp as tmp 
set         pc.p3       =tmp.p3,
            pc.p7       =tmp.p7,
            pc.p12      =tmp.p12,
            pc.p18      =tmp.p18
where       pc.pu       =tmp.pu;

truncate table fornecedor_estoque_historico_tmp;
truncate table pecas_tmp;

end;


#call cargaPrecoImposto();


