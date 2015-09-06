/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:busca de peï¿½as no site rpmdobrasil.com.br
*@desc:criaï¿½ï¿½o da nova tabela de pecas e catalogo
********************************************************************/

/* adicionar colunas na tabela de fornecedor */
alter table fornecedor add sigla_pais varchar(255) default null after tipo;
select * from fornecedor limit 1;




/* MySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySqlMySql  */


/**********************************************************
* criação da tabela catalogo                              *
***********************************************************/
drop table if exists catalogo;
CREATE TABLE `catalogo` (
  `catalogo_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `fornecedor_id` int(4) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) ,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;
select * from catalogo;




/**********************************************************
* criação da tabela catalogo_pecas_historico
***********************************************************/
drop table if exists catalogo_pecas_historico;
CREATE TABLE `catalogo_pecas_historico` (
  `catalogo_id` int(4) unsigned NOT NULL,
  `pu` varchar(255) DEFAULT NULL,   
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `partnumber` varchar(100) NOT NULL,
  `catalogo_tipo` varchar(1) NOT NULL,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`,`pu`,`marca_id`,`historico_id`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;
select * from catalogo_pecas_historico;



/**********************************************************
* criação da tabela fornecedor_estoque                    *
***********************************************************/
drop table if exists fornecedor_estoque;
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




/**********************************************************
* criação da tabela fornecedor_estoque_historico          *
***********************************************************/
drop table if exists fornecedor_estoque_historico;
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
  `mostra_preco` int(1) unsigned DEFAULT '0',  
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`),
  KEY `historicoDesc` (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from fornecedor_estoque_historico;



drop table if exists fornecedor_estoque_historico_tmp;
CREATE TABLE `fornecedor_estoque_historico_tmp` (
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
  `mostra_preco` int(1) unsigned DEFAULT '0',  
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`),
  KEY `historicoDesc` (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from fornecedor_estoque_historico_tmp;


/**********************************************************
* criação da tabela fornecedor_marca                      *
***********************************************************/
drop table if exists fornecedor_marca;
CREATE TABLE `fornecedor_marca` (
  `Marca` varchar(255) DEFAULT NULL,
  `Empresa` varchar(255) DEFAULT NULL,
  `marca_id` int(6) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from fornecedor_marca;





/**********************************************************
* criação da tabela fornecedor_contato                    *
***********************************************************/
drop table if exists fornecedor_contato;
CREATE TABLE `fornecedor_contato` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `contato_id` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`contato_id`,`fornecedor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8;
select * from fornecedor_contato;





/**********************************************************
* criação da tabela fornecedor_novo                       *
***********************************************************/
drop table if exists fornecedor_novo;
CREATE TABLE `fornecedor_novo` (
  `fornecedor_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `loteiro` int(1) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
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
select * from fornecedor_novo;





/**********************************************************
* criação da tabela pecas   modelo com chave primaria                         *
***********************************************************/
/* estrutura antiga 
CREATE TABLE `pecas` (
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(100) NOT NULL,
  `pu` varchar(255) DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `preco_fornecedor_id` decimal(12,2) NOT NULL,
  `disponibilidade_id` int(1) DEFAULT NULL,
  `disponibilidade_fornecedor_id` int(1) DEFAULT NULL,
  `oferta` int(1) DEFAULT NULL,
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
*/

drop table if exists pecas;
CREATE TABLE `pecas` (
  `partnumber` varchar(100) NOT NULL,
  `marca_id` int(6) unsigned NOT NULL,
  `puc` varchar(100) NOT NULL,
  `pu` varchar(255) DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `preco_fornecedor_id` int(6),  /* id do fornecedor q tem o melhor preço  */
  `disponibilidade_id` int(1) DEFAULT NULL,
  `disponibilidade_fornecedor_id` int(6),  /* id do fornecedor q possui a melhor disponibilidade */
  `oferta` int(1) DEFAULT NULL,
  `tem_fornecedor` int(1) DEFAULT 0,
    PRIMARY KEY (`pu`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select * from pecas limit 1;




/******************************************************
* criação da tabela fornecedor_contato_meios          *
*******************************************************/
drop table if exists fornecedor_contato_meios;
CREATE TABLE IF NOT EXISTS `fornecedor_contato_meios` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `contato_id` INT(3) NOT NULL ,
  `meio_id` INT(2) NOT NULL AUTO_INCREMENT ,
  `meio_tipo` VARCHAR(255) NULL DEFAULT NULL ,
  `meio_valor` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`meio_id`, `fornecedor_id`, `contato_id`)
CHARSET=utf8  );
select * from fornecedor_contato_meios;
  


/**********************************************************
* criaï¿½ï¿½o da tabela pecas   modelo com chave primaria  *
***********************************************************/
/* funï¿½ï¿½o para dar carga na tabela de pecas */
SELECT atualizaPecasFunction();

select * from pecas;


/**********************************************************
* criaï¿½ï¿½o da tabela catalogo                              *
***********************************************************/
drop table if exists catalogo;
CREATE TABLE `catalogo` (
  `catalogo_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `fornecedor_id` int(4) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) ,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

/*  carga de dados na tabela catalogo */
insert into catalogo
(fornecedor_id,nome,descricao)
select 
fornecedor_id,nome,'carga de dados da tabela fornecedor_estoque_historico'
from fornecedor
where lower(tipo)='c';

select * from catalogo;



/**********************************************************
* criaï¿½ï¿½o da tabela catalogo_pecas_historico
***********************************************************/
drop table if exists catalogo_pecas_historico;
CREATE TABLE `catalogo_pecas_historico` (
  `catalogo_id` int(4) unsigned NOT NULL,
  `pu` varchar(255) DEFAULT NULL,   
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `partnumber` varchar(100) NOT NULL,
  `catalogo_tipo` varchar(1) NOT NULL,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`,`pu`,`marca_id`,`historico_id`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

/* query para dar carga na tabela de catalogo_pecas_historico */
insert into `catalogo_pecas_historico` 
(`catalogo_id`,`marca_id`,`pu`,`partnumber`,`catalogo_tipo`,data_cadastro)
select 
oferta.fornecedor_id,marca_id,partnumber_unico,referencia,'C',data_insercao
from oferta
join fornecedor on fornecedor.fornecedor_id=oferta.fornecedor_id
where fornecedor.tipo='C';

select * from catalogo_pecas_historico;





/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
********************************************************************/
drop function if exists atualizaPecasFunction;
CREATE FUNCTION atualizaPecasFunction()
RETURNS varchar(255)

deterministic
begin
declare count1,count2,count3 int;
declare dado,dados varchar(255);

/* conta quantos registros ja estistem */
select count(pu) into count1 from pecas;

/* carga de dados a partir da tabela fornecedor_estoque_historico */
replace into pecas
(partnumber,marca_id,puc,pu,moeda_preco,preco,disponibilidade_id,oferta,tem_fornecedor)
select 
f.partnumber,f.marca_id,f.puc,f.pu,f.moeda_preco,f.preco,
case 
     when f.qtd >0 then     
     1     
     else     
     0     
end as disponibilidade,
case 
     when f.preco >0 and f.qtd >0 and f.mostra_preco=1 and f.oferta=1 then
     1
     else
     0                                                            
end as ofertas,
'1' as tem_fornecedor
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo;

/* carga de dados a partir da tabela catalogo_pecas_historico */
replace into pecas
(partnumber,marca_id,puc,pu)
select      cph.partnumber,cph.marca_id,            
            replace((replace((replace(cph.pu,' ','')),'-','')),'/','') as puc,
            cph.pu
from        catalogo_pecas_historico as cph;


/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preï¿½o */
UPDATE pecas as pc
SET    pc.preco_fornecedor_id=1 
WHERE  pc.pu in (select   feh.pu 
                            from     fornecedor_estoque_historico as feh
                            where     feh.preco >0
                            and       feh.qtd   >0                            
                            and       pc.pu=feh.pu                            
                            and       pc.marca_id=feh.marca_id                            
                            group  by feh.fornecedor_id,feh.pu,feh.marca_id
                            order by  feh.preco asc
                          );

/* query para atualizar a preco.disponibilidade_fornecedor_id com os fornecedores de melhor disponibilidade */
UPDATE pecas as pc
SET    pc.disponibilidade_fornecedor_id=1 
WHERE  pc.pu in (select    feh.pu 
                            from      fornecedor_estoque_historico as feh
                            where     feh.qtd   >0                            
                            and       feh.disponibilidade_id =1                            
                            and       pc.pu=feh.pu                            
                            and       pc.marca_id=feh.marca_id                            
                            group  by feh.fornecedor_id,feh.pu,feh.marca_id
                          );

/* conta quantos foram atualizados */
select count(pu) into count2 from pecas;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " PeÃ§as foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);
						  

/* retorna quantos registros foram afetados e finaliza a funï¿½ï¿½o */
RETURN dados;
end;

select atualizaPecasFunction();




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de ornecedor_estoque_historico
********************************************************************/
drop function if exists atualizaFEH;
CREATE FUNCTION atualizaFEH()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

/* query com criterio de fornecedor */
insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,mostra_preco)
select 
oferta.fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,
case 
     when status_id=2 then     
     1     
     else     
     0     
end as oferta,
qtd,moeda_preco,preco,moeda_custo,custo,'Atualizaï¿½ï¿½o de Estrutura de BD MySql.',
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
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,mostra_preco)
select 
fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,mostra_preco
from fornecedor_estoque_historico;

update fornecedor_estoque_historico
set    ultimo=0; 

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

set dados   = "Tabela fornecedor_estoque_historico Atualizada!";
	  
RETURN dados;
end;


/* para fazer a chamada da function atualizaFEH() */
drop table if exists fornecedor_estoque_historico_tmp;
CREATE TABLE `fornecedor_estoque_historico_tmp` (
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
  `mostra_preco` int(1) unsigned DEFAULT '0',  
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`),
  KEY `historicoDesc` (`fornecedor_id`,`partnumber`,`marca_id`,`historico_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
select atualizaFEH();



/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de oferta.partnumber_unico_compacto
********************************************************************/
drop function if exists geraPUC;
CREATE FUNCTION geraPUC()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

insert into debug
(id,partnumber_unico_compacto)
select
oferta_id,partnumber_unico
from oferta
order by oferta_id asc;

update oferta
set partnumber_unico_compacto=(select
replace((replace((replace(partnumber_unico_compacto,' ','')),'-','')),'/','')
from debug as d
where d.id=oferta.oferta_id);

set dados   = "Tabela fornecedor_estoque_historico Atualizada!";
	  
RETURN dados;
end;

drop table if exists debug;
create table debug(
  id int auto_increment primary key,
  partnumber_unico_compacto character varying(150)
);
select geraPUC();




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:view para buscar peï¿½ar na home do site
********************************************************************/
/* query que ira trazer todas as peï¿½as colocando a prioridade na disponibilidade */
drop view if exists busca_pecas_disponibilidade;
CREATE VIEW busca_pecas_disponibilidade AS 
SELECT          p.marca_id,
				m.nome,
                p.puc,
                p.pu,
                p.moeda_preco,
                p.preco,
				case 
					when preco=0 then
					   'Sob Consulta'
					when preco>0 then
						preco
				end as descricao,		
                p.preco_fornecedor_id,
                p.disponibilidade_id,
                p.disponibilidade_fornecedor_id,
                p.oferta
FROM            pecas as p
left join       marca as m on p.marca_id = m.marca_id
order by        pu asc,oferta desc,disponibilidade_id desc;
select * from busca_pecas_disponibilidade limit 1;


/* query que irï¿½ trazer peï¿½as colocando a prioridade por menor preï¿½o */
drop view if exists busca_pecas_preco;
CREATE VIEW busca_pecas_preco AS 
SELECT          p.marca_id,
				m.nome,
                p.puc,
                p.pu,
                p.moeda_preco,
                p.preco,
				case 
					when preco=0 then
					   'Sob Consulta'
					when preco>0 then
						preco
				end as descricao,				
                p.preco_fornecedor_id,
                p.disponibilidade_id,
                p.disponibilidade_fornecedor_id,
                p.oferta
FROM            pecas as p
left join       marca as m on p.marca_id = m.marca_id
GROUP BY        p.marca_id DESC, pu
ORDER BY        p.marca_id DESC, pu,preco DESC;
select * from busca_pecas_preco limit 1;





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
            
        replace into pecas
        SET marca_id                      = new.marca_id,
            puc                           = new.puc,
            pu                            = new.pu,
            moeda_preco                   = new.moeda_preco,
            preco                         = new.preco;

END;

CREATE TRIGGER atualizaPecasTriggerFEHUpdate AFTER update ON fornecedor_estoque_historico
FOR EACH ROW
BEGIN
        replace into pecas
        SET marca_id                      = new.marca_id,
            puc                           = new.puc,
            pu                            = new.pu,
            moeda_preco                   = new.moeda_preco,
            preco                         = new.preco;
END;




