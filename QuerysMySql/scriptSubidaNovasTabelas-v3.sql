/**********************************************************
* @autor:Marcos Paulo
* @since:04/05/2012
* @desc:Novas tabelas para a versao 3.0 do sistema Rpm          
***********************************************************/


/**********************************************************
* relacao das novas tabelas          			  *
***********************************************************
select * from catalogo;
select * from catalogo_pecas_historico;
select * from fornecedor_estoque;
select * from fornecedor_estoque_historico;
select * from fornecedor_estoque_historico_tmp;
select * from fornecedor_marca;
select * from pecas;
select * from fornecedor_novo;
select * from fornecedor_contato;
select * from fornecedor_contato_meios;

drop table if exists catalogo;
drop table if exists catalogo_pecas_historico;
drop table if exists fornecedor_estoque;
drop table if exists fornecedor_estoque_historico;
drop table if exists fornecedor_estoque_historico_tmp;
drop table if exists fornecedor_marca;
drop table if exists pecas;
drop table if exists fornecedor_novo;
drop table if exists fornecedor_contato;
drop table if exists fornecedor_contato_meios;

drop function if exists cargaTabelaPecas;
drop function if exists cargaTabelaFEH;
drop function if exists cargaTabelaCatalogo;
drop function if exists cargaTabelaCPH;
drop function if exists cargaTabelaFCM;
drop function if exists cargaTabelaFM;
drop trigger  if exists atualizaPecasTriggerFEHInsert;
drop procedure cargaTabelaPecasTrigger;
*/



/* MySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySql  */

use wedelhas_homolog;


/* adicionar colunas na tabela de fornecedor */
alter table fornecedor add sigla_pais varchar(255) default null after tipo;

/* adicionar colunas na tabela cesta_cotacao  */
alter table cesta_cotacao add `moeda_preco` varchar(10) DEFAULT NULL;
alter table cesta_cotacao add `mostra_preco` int(1) unsigned DEFAULT '0';
alter table cesta_cotacao add `preco` decimal(12,2) NOT NULL DEFAULT '0';
alter table cesta_cotacao add `preco_fornecedor_id` int(6);
alter table cesta_cotacao add `disponibilidade_id` int(1) DEFAULT NULL;
alter table cesta_cotacao add `disponibilidade_fornecedor_id` int(6);
alter table cesta_cotacao add `oferta` int(1) DEFAULT NULL;
alter table cesta_cotacao add `tem_fornecedor` int(1) DEFAULT 0;

/* adicionar colunas na tabela cotacao_itens  */
alter table cotacao_itens add `moeda_preco` varchar(10) DEFAULT NULL;
alter table cotacao_itens add `mostra_preco` int(1) unsigned DEFAULT '0' ;
alter table cotacao_itens add `preco` decimal(12,2) NOT NULL DEFAULT '0';
alter table cotacao_itens add `preco_fornecedor_id` int(6);
alter table cotacao_itens add `disponibilidade_id` int(1) DEFAULT NULL;
alter table cotacao_itens add `disponibilidade_fornecedor_id` int(6);
alter table cotacao_itens add `oferta` int(1) DEFAULT NULL;
alter table cotacao_itens add `tem_fornecedor` int(1) DEFAULT 0;


/* alteração do timpo de campo a ser ultilizado no carrinho de compras */
alter table cotacao_eliminadas  modify cotacao_codigo varchar(255);
alter table cotacao             modify cotacao_codigo varchar(255);



/**********************************************************
* criacao da tabela catalogo                              *
***********************************************************/
CREATE TABLE `catalogo` (
  `catalogo_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `fornecedor_id` int(4) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) ,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;
select * from catalogo limit 1;




/**********************************************************
* criacao da tabela catalogo_pecas_historico
***********************************************************/
CREATE TABLE `catalogo_pecas_historico` (
  `catalogo_id` int(4) unsigned NOT NULL,
  `pu` varchar(255) DEFAULT NULL,   
  `puc` varchar(255) DEFAULT NULL,   
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `partnumber` varchar(100) NOT NULL,
  `catalogo_tipo` varchar(1) NOT NULL,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`,`pu`,`marca_id`,`historico_id`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;
select * from catalogo_pecas_historico limit 1;



/**********************************************************
* criacao da tabela fornecedor_estoque                    *
***********************************************************/
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
select * from fornecedor_estoque limit 1;



/**********************************************************
* criacao da tabela fornecedor_estoque_historico          *
***********************************************************/
CREATE TABLE `fornecedor_estoque_historico` (
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
select * from fornecedor_estoque_historico limit 1;




CREATE TABLE `fornecedor_estoque_historico_tmp` (
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
select * from fornecedor_estoque_historico_tmp limit 1;



/**********************************************************
* criacao da tabela fornecedor_marca                      *
***********************************************************/
CREATE TABLE `fornecedor_marca` (
  `Marca` varchar(255) DEFAULT NULL,
  `Empresa` varchar(255) DEFAULT NULL,
  `marca_id` int(6) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from fornecedor_marca limit 1;





/**********************************************************
* criacao da tabela fornecedor_contato                    *
***********************************************************/
CREATE TABLE `fornecedor_contato` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `contato_id` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`contato_id`,`fornecedor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8;
select * from fornecedor_contato limit 1;





/**********************************************************
* criação da tabela fornecedor_novo                       *
***********************************************************/
CREATE TABLE `fornecedor_novo` (
  `fornecedor_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `loteiro` int(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT now(),
  `pais` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cod_postal` varchar(45) DEFAULT NULL,
  `matriz_filial` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`fornecedor_id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;
select * from fornecedor_novo limit 1;





/**********************************************************
* criacao da tabela pecas   modelo com chave primaria                         *
***********************************************************/
CREATE TABLE `pecas` (
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(100) NOT NULL,
  `pu` varchar(100) DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',
  `preco` decimal(10,2) NOT NULL,
  `preco_fornecedor` decimal(10,2) NOT NULL,
  `preco_fornecedor_id` int(6),  /* id do fornecedor q tem o melhor preco  */
  `disponibilidade_id` int(1) DEFAULT NULL,
  `disponibilidade_fornecedor_id` int(6),  /* id do fornecedor q possui a melhor disponibilidade */
  `oferta` int(1) DEFAULT NULL,
  `tem_fornecedor` int(1) DEFAULT 0,
  `ts` timestamp not null DEFAULT now(),
    PRIMARY KEY (`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from pecas limit 1;




/**********************************************************
* criacao da tabela pecas   modelo com chave primaria                         *
***********************************************************/
CREATE TABLE `pecas_tmp` (
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(100) NOT NULL,
  `pu` varchar(100) DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',
  `preco` decimal(10,2) NOT NULL,
  `preco_fornecedor` decimal(10,2) NOT NULL,
  `preco_fornecedor_id` int(6),  /* id do fornecedor q tem o melhor preco  */
  `disponibilidade_id` int(1) DEFAULT NULL,
  `disponibilidade_fornecedor_id` int(6),  /* id do fornecedor q possui a melhor disponibilidade */
  `oferta` int(1) DEFAULT NULL,
  `tem_fornecedor` int(1) DEFAULT 0,
  `ts` timestamp not null DEFAULT now(),
    PRIMARY KEY (`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from pecas_tmp limit 1;





/******************************************************
* criacao da tabela fornecedor_contato_meios          *
*******************************************************/
CREATE TABLE IF NOT EXISTS `fornecedor_contato_meios` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `contato_id` INT(3) NOT NULL ,
  `meio_id` INT(2) NOT NULL AUTO_INCREMENT ,
  `meio_tipo` VARCHAR(255) NULL DEFAULT NULL ,
  `meio_valor` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`meio_id`, `fornecedor_id`, `contato_id`));
select * from fornecedor_contato_meios limit 1;
  





/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
********************************************************************/
CREATE FUNCTION cargaTabelaPecas()
RETURNS varchar(255)

deterministic
begin
declare count1,count2,count3 int;
declare dado,dados varchar(255);

/* conta quantos registros ja estistem */
select count(pu) into count1 from pecas;

/* carga de dados a partir da tabela catalogo_pecas_historico */
insert ignore into pecas
(partnumber,marca_id,puc,pu,mostra_preco,tem_fornecedor)
select      cph.partnumber,
            cph.marca_id,            
            replace((replace((replace(cph.pu,' ','')),'-','')),'/','') as puc,
            cph.pu,
            '0',
            '0'
from        catalogo_pecas_historico as cph;



/* 
sugestão de nova query para carga inicial de pu e marca a partir da feh:
carga de dados a partir da tabela fornecedor_estoque_historico */
replace into pecas
(partnumber,marca_id,puc,pu,moeda_preco,preco_fornecedor,disponibilidade_id,oferta,tem_fornecedor,mostra_preco)
select 
f.partnumber,f.marca_id,f.puc,f.pu,'',0.00,3,0,1,0
from fornecedor_estoque_historico as f
where f.ultimo=1
group by f.pu,f.marca_id;

/*
200.000 = 25%
Acima de 100.000 = 30%
Acima de 50.00 = 35%
Normal = 40%
*/

/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço */
replace into pecas
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta)
select       
pu,marca_id,partnumber,puc,fornecedor_id,min(preco),
case    
    when  preco > 200000 then (preco * 1.25)
    when  preco > 100000 then (preco * 1.3)
    when  preco > 50000  then (preco * 1.35)
    else  (preco * 1.4)
end as preco,
moeda_preco,mostra_preco,oferta
from         fornecedor_estoque_historico
where        ultimo=1
and          mostra_preco=1   
and          preco >0
and          qtd >0 
group by     pu,marca_id;





/* query para atualizar a pecas.disponibilidade_fornecedor_id com os fornecedores de melhor disponibilidade */
insert into pecas
(pu,puc,marca_id,partnumber,disponibilidade_fornecedor_id,disponibilidade_id)
select    pu,puc,marca_id,partnumber,fornecedor_id,disponibilidade_id
from      fornecedor_estoque_historico
where     ultimo=1
and       mostra_preco=1
and       preco >0
and       qtd   >0
group by  pu,marca_id
order by  pu,marca_id,disponibilidade_id asc
ON DUPLICATE KEY UPDATE disponibilidade_fornecedor_id = VALUES(disponibilidade_fornecedor_id), disponibilidade_id=VALUES(disponibilidade_id);



/* conta quantos foram atualizados */
select count(pu) into count2 from pecas;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);
						  

/* retorna quantos registros foram afetados e finaliza a função */
RETURN dados;
end;





/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
********************************************************************/
CREATE procedure cargaTabelaPecasTrigger(pPU varchar(50),pMARCAID int(10))
begin

/* 
sugestão de nova query para carga inicial de pu e marca a partir da feh:
carga de dados a partir da tabela fornecedor_estoque_historico */
replace into pecas
(partnumber,marca_id,puc,pu,moeda_preco,preco_fornecedor,disponibilidade_id,oferta,tem_fornecedor,mostra_preco)
select 
f.partnumber,f.marca_id,f.puc,f.pu,'',0.00,3,0,1,0
from fornecedor_estoque_historico as f
where f.ultimo=1
and   f.pu=pPU
and   f.marca_id=pMarcaID
group by f.pu,f.marca_id;

/*
200.000 = 25%
Acima de 100.000 = 30%
Acima de 50.00 = 35%
Normal = 40%
*/

/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço */
replace into pecas
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,tem_fornecedor)
select       
pu,marca_id,partnumber,puc,fornecedor_id,preco,
case    
    when  preco > 200000 then (preco * 1.25)
    when  preco > 100000 then (preco * 1.3)
    when  preco > 50000  then (preco * 1.35)
    else  (preco * 1.4)
end as preco_venda,
moeda_preco,mostra_preco,
case    
    when  oferta >= 1 then 1
    else  0
end as oferta,
'1'
from         fornecedor_estoque_historico
where        ultimo=1
and          mostra_preco=1   
and          preco >0
and          qtd >0 
and          pu=pPU
and          marca_id=pMarcaID
order by     preco asc
limit        1;


/* query para atualizar a pecas.disponibilidade_fornecedor_id com os fornecedores de melhor disponibilidade */
insert into pecas
(pu,puc,marca_id,partnumber,disponibilidade_fornecedor_id,disponibilidade_id)
select    pu,puc,marca_id,partnumber,fornecedor_id,disponibilidade_id
from      fornecedor_estoque_historico
where     ultimo=1
and       mostra_preco=1
and       preco >0
and       qtd   >0
and       pu=pPU
and       marca_id=pMarcaID
group by  pu,marca_id
order by  pu,marca_id,disponibilidade_id asc
ON DUPLICATE KEY UPDATE disponibilidade_fornecedor_id = VALUES(disponibilidade_fornecedor_id), disponibilidade_id=VALUES(disponibilidade_id);

end;









/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de ornecedor_estoque_historico
********************************************************************/
CREATE FUNCTION cargaTabelaFEH()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

/* query com criterio de fornecedor */
insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,
origem,mostra_preco)
select 
oferta.fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,
case 
     when status_id=2 or status_id=1 then     
     1     
     else     
     0     
end as oferta,
qtd,moeda_custo,custo,'Atualização de Estrutura de BD MySql.',
case 
     when status_id=1 then     
     1     
     else     
     0     
end as mostra_preco
from oferta
join fornecedor on fornecedor.fornecedor_id=oferta.fornecedor_id
where fornecedor.tipo='F';

insert into fornecedor_estoque_historico_tmp
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,
origem,mostra_preco)
select 
fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,
origem,mostra_preco
from fornecedor_estoque_historico;

update fornecedor_estoque_historico
set    ultimo=0; 
/*
UPDATE fornecedor_estoque_historico as feh
SET    feh.ultimo=1 
WHERE  feh.fornecedor_id = feh.fornecedor_id
AND    feh.partnumber    = feh.partnumber
AND    feh.marca_id      = feh.marca_id
AND    feh.historico_id  = (select max(feht.historico_id) 
                            from fornecedor_estoque_historico_tmp as feht                                                       
                            where feh.fornecedor_id=feht.fornecedor_id                            
                            and   feh.marca_id=feht.marca_id                            
                            and   feh.partnumber=feht.partnumber
                            order by feht.historico_id asc                            
                            limit 1
                          )
ORDER BY historico_id asc;
*/
set dados   = "Tabela fornecedor_estoque_historico Atualizada!";
	  
RETURN dados;
end;






  
/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de catalogo
********************************************************************/
CREATE FUNCTION cargaTabelaCatalogo()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

insert into catalogo
(fornecedor_id,nome,descricao)
select 
fornecedor_id,nome,'carga de dados da tabela fornecedor_estoque_historico'
from fornecedor
where lower(tipo)='c';

set dados   = "Tabela catalogo Atualizada!";
	  
RETURN dados;
end;


  
/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de catalogo_pecas_historico
********************************************************************/
CREATE FUNCTION cargaTabelaCPH()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

insert into `catalogo_pecas_historico` 
(`catalogo_id`,`marca_id`,`pu`,`partnumber`,`catalogo_tipo`,data_cadastro)
select 
oferta.fornecedor_id,marca_id,partnumber_unico,referencia,'C',data_insercao
from oferta
join fornecedor on fornecedor.fornecedor_id=oferta.fornecedor_id
where fornecedor.tipo='C'
group by marca_id,partnumber_unico
order by data_insercao desc;

set dados   = "Tabela catalogo_pecas_historico Atualizada!";
	  
RETURN dados;
end;




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de fornecedor_contato_meios
********************************************************************/
CREATE FUNCTION cargaTabelaFCM()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

insert into fornecedor_contato_meios
(fornecedor_id,contato_id,meio_tipo,meio_valor)
select      fornecedor_id,contato_id,
            case
                when flm.telefones <> '' and flm.email <> '' then
                'Email / Telefone'
                when flm.telefones =  '' and flm.email <> '' then
                'Email'
                when flm.telefones <>  '' and flm.email = '' then
                'Telefone'
            end  as tipo,  
            CONCAT(flm.telefones,' / ',flm.email) as dados  
from        for_lf_marca       as flm
left join   fornecedor_contato as fc on lower(fc.nome)=lower(flm.empresa);

set dados   = "Tabela catalogo Atualizada!";
	  
RETURN dados;
end;




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de fornecedor_marca
********************************************************************/
CREATE FUNCTION cargaTabelaFM()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

replace into fornecedor_marca
(marca_id,marca,empresa)
SELECT      
distinct(m.marca_id),m.nome AS nome_marca,f.nome AS empresa_fornecedor
FROM        fornecedor_estoque_historico AS o
INNER JOIN  marca as m ON m.marca_id=o.marca_id
INNER JOIN  fornecedor as f ON f.fornecedor_id=o.fornecedor_id;

set dados   = "Tabela fornecedor_marca Atualizada!";
	  
RETURN dados;
end;
  
/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Trigger Mysql na tabela pecas
*@desc:trigger para dar carga na tabela pecas toda vez que houver uma alteraï¿½ï¿½o de dados 
*nas tabelas fornecedor_estoque_historico e catalogo
********************************************************************/
CREATE TRIGGER atualizaPecasTriggerFEHInsert AFTER INSERT ON fornecedor_estoque_historico
FOR EACH ROW
BEGIN
        if  new.marca_id >0 and new.puc <> '' then           

            replace into pecas
            set     partnumber         = new.partnumber,
                    marca_id           = new.marca_id,
                    puc                = new.puc,
                    pu                 = new.pu;                    
            call cargaTabelaPecasTrigger(new.pu,new.marca_id);

        end if;  
END;




/*******************************************************************************/
/*******************************************************************************/
/***********************Carga de Dados MySql************************************/
/*******************************************************************************/
/*******************************************************************************/

/*  carga de dados na tabela catalogo */
select cargaTabelaCatalogo();


/* query para dar carga na tabela de catalogo_pecas_historico */
select cargaTabelaCPH();


/* atualiza tabela de fornecedor_estoque_historico  */
truncate table fornecedor_estoque_historico_tmp;
select cargaTabelaFEH();


/* carga na tabela fornecedor_contato_meios */
select cargaTabelaFCM();


/* carga na tabela fornecedor_marca n existe  */
select cargaTabelaFM();


/* carga na tabela fornecedor_contato n existe 
select cargaTabelaFC(); <falta criar>
o renato ira fazer um dump de devel para a subida
*/

/* carga na tabela fornecedor_novo n existe 
select cargaTabelaFN(); <falta criar>
o renato ira fazer um dump de devel para a subida
*/

/* carga na tabela pecas */
select cargaTabelaPecas();













