/* query para trazer o rendimento dos operadores/atendentes em cotaÃ§Ãµes */
select        u.id,concat('Atendente ',u.nome) as Atendente,
              (select count(ct.cotacao_id) from cotacao as ct where ct.data_cadastro > '2013-01-01' and ct.usuario=u.id and status=1 ) as cotacaoAberta,
              (select count(ct.cotacao_id) from cotacao as ct where ct.data_cadastro > '2013-01-01' and ct.usuario=u.id and status=2 ) as cotacaoAtendida,
              (select count(ct.cotacao_id) from cotacao as ct where ct.data_cadastro > '2013-01-01' and ct.usuario=u.id and status=3 ) as cotacaoEnviada,
              (select count(ct.cotacao_id) from cotacao as ct where ct.data_cadastro > '2013-01-01' and ct.usuario=u.id and status=4 ) as cotacaoCancelada,
              (select count(ct.cotacao_id) from cotacao as ct where ct.data_cadastro > '2013-01-01' and ct.usuario=u.id and status=5 ) as cotacaoPedido,
              (select count(ct.cotacao_id) from cotacao as ct where ct.data_cadastro > '2013-01-01' and ct.usuario=u.id) as cotacaoTotal
from          cotacao as c
left join     usuarios u on c.usuario=u.id
where         c.data_cadastro > '2013-01-01'
and           u.id <> ''
group by      u.id
order by      u.nome;

ALTER TABLE fornecedor_estoque_historico ADD frete VARCHAR( 3 ) COLLATE utf8_general_ci NULL AFTER custo;
ALTER TABLE fornecedor_estoque_historico ADD frete_valor DECIMAL( 10,2 ) COLLATE utf8_general_ci NULL AFTER frete;
ALTER TABLE fornecedor_estoque_historico ADD frete_tempo INT( 3 ) COLLATE utf8_general_ci NULL AFTER frete_valor;

/* select que traz todas as tabelas deum determinado schema mysql */
SELECT DISTINCT TABLE_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE COLUMN_NAME like '%origem%';

alter table oferta add partnumber_unico_compacto varchar(255) after partnumber_unico;
select * from oferta;
select partnumber_unico from oferta;
REPLACE(post_content, 'olddomain.com', 'newdomain.com')
select
partnumber_unico,
replace((replace((replace(partnumber_unico,'*','')),'-','')),'/','') as dados

replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(partnumber_unico,'*',''),'"',''),'@',''),'#',''),'$',''),'%',''),'¨',''),'&',''),'(',''),')',''),'-',''),'+',''),'=',''),'§',''),'ª',''),'º',''),'°',''),'[',''),'{',''),'}',''),']',''),'?','')

replace(partnumber_unico,'--','-')
replace(partnumber_unico,'"','')
replace(partnumber_unico,'@','')
replace(partnumber_unico,'#','')
replace(partnumber_unico,'$','')
replace(partnumber_unico,'%','')
replace(partnumber_unico,'¨','')
replace(partnumber_unico,'&','')
replace(partnumber_unico,'(','')
replace(partnumber_unico,')','')
replace(partnumber_unico,'-','')
replace(partnumber_unico,'+','')
replace(partnumber_unico,'=','')
replace(partnumber_unico,'§','')
replace(partnumber_unico,'ª','')
replace(partnumber_unico,'º','')
replace(partnumber_unico,'°','')
replace(partnumber_unico,'[','')
replace(partnumber_unico,'{','')
replace(partnumber_unico,'}','')
replace(partnumber_unico,']','')
replace(partnumber_unico,'?','')

update interchange_debug set a=substring(a,2,(length(a)-1)) where a regexp '^[^1-9]|[^a-z]';

from oferta;

create table debug(
id int auto_increment primary key,
partnumber_unico_compacto character varying(150)
);

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

select oferta_id,partnumber_unico,partnumber_unico_compacto from oferta order by oferta_id asc;

drop table debug;

select * from debug;
select * from oferta
select * from cotacao
select * from cotacao_itens



insert into prv_modulos_x_usuario
(modulo,usuario,permissao)
select id,2797,1 from prv_modulos where id not in (select modulo from prv_modulos_x_usuario where usuario=2797);

mysql -version




--adicionar ip ao banco
insert into visitorwhitelist
(visitIP,visitObs)
values
('201.81.18.215','RPM Matriz');
select * from visitorwhitelist;



''' Change Log Sistema Rpm HomologaÃ§Ã£o '''

=== HistÃ³rico de versÃµes ===

AlteraÃ§Ã£o realizada por: rpmgitrenato
Data :24/04/2012

 AlteraÃ§ao de chamada a banco na classe usuario


AlteraÃ§Ã£o realizada por: rpmgitrenato
Data :24/04/2012

 Adicionando arquivos para o repositÃ³rio de HomologaÃ§Ã£o



/******************************************************************************/
-->url amigÃ¡vel nas busca

A partir dos resultados de pesquisa, o sistema deve gerar URLs amigÃ¡veis
( [domÃ­nio principal]/rolamento-[marca]-[pu] )
para acessar a pÃ¡gina de detalhes do produto.
Ã‰ a mesma url utilizada no mapeamento do google.


prazo de entrega:
imediata
sob consulta
em ate 5 dias

preÃ§o:
em oferta
sob consulta

formaÃ§Ã£o de preÃ§o:
valor passado pelo fornecedor + preco de venda + impostos


CREATE  TABLE IF NOT EXISTS `wedelhas_devel2`.`pecas_novo` (
  `partnumber` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL ,
  `marca_id` INT(6) UNSIGNED NOT NULL,
  `puc` VARCHAR(100) NOT NULL ,
  `pu` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `moeda_preco` VARCHAR(10) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `preco` DECIMAL(12,2) NOT NULL ,
  `disponibilidade_id` INT(1) NULL ,
  `oferta` INT(1) NULL ,
  PRIMARY KEY (`partnumber`, `marca_id`) ,
  UNIQUE INDEX `unicidade2` (`pu` ASC, `marca_id` ASC, `preco` ASC) ,
  INDEX `referencia` (`partnumber` ASC) ,
  INDEX `marca_produto` (`marca_id` ASC) ,
  INDEX `convergencia1` (`marca_id` ASC, `pu` ASC, `preco` ASC) ,
  INDEX `oferta` (`marca_id` ASC, `partnumber` ASC, `preco` ASC) ,
  INDEX `marca_pn` (`marca_id` ASC, `pu` ASC) ,
  INDEX `partnumber_unico` (`pu` ASC KEY_BLOCK_SIZE=2048) ,
  INDEX `puc_busca` (`marca_id` ASC, `preco` ASC) )
ENGINE = MyISAM
AUTO_INCREMENT = 1120113
DEFAULT CHARACTER SET = utf8

select replace('*dados','*','') as dados;
select replace('#dados','*','') as dados;

select
replace(replace((replace((replace(referencia,'*','')),'#','')),'.',''),'"','')
 as dados
from oferta;

SELECT "fono" REGEXP "^f";
show tables

select *
from oferta
group by referencia,marca_id
order by referencia,marca_id

drop table fornecedor_estoque_historico;
CREATE TABLE IF NOT EXISTS `fornecedor_estoque_historico` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `partnumber` VARCHAR(100) NOT NULL ,
  `marca_id` INT(6) UNSIGNED NOT NULL,
  `historico_id` INT(4) NOT NULL auto_increment,
  `data_cotacao` timestamp NOT NULL DEFAULT now() ,
  `puc` VARCHAR(255) NULL ,
  `pu` VARCHAR(255) CHARACTER SET 'latin1' NULL ,
  `disponibilidade_id` INT(1) UNSIGNED NULL ,
  `oferta` INT(1) UNSIGNED NULL DEFAULT NULL ,
  `qtd` INT(11) UNSIGNED NULL ,
  `moeda_preco` VARCHAR(10) CHARACTER SET 'latin1' NULL ,
  `preco` DECIMAL(12,2) NOT NULL ,
  `moeda_custo` VARCHAR(10) CHARACTER SET 'latin1' NULL ,
  `custo` DECIMAL(12,2) ,
  `usuario_id` INT(3) NULL ,
  `origem` VARCHAR(100) NULL ,
  PRIMARY KEY (`fornecedor_id`, `partnumber`, `marca_id`, `historico_id`) );

select * from fornecedor_estoque_historico;

partnumber,
marca_id,
historico_id,
data_cotacao,
puc,
pu,
disponibilidade_id,
oferta,
qtd,
moeda_preco,
preco,
moeda_custo,
custo,
usuario_id,
origem

use wedelhas_devel2;
select * from oferta;
select * from fornecedor_estoque_historico;

/* trazer de cada cotaÃ§Ã£o, sÃ³ a mais atual  */
select * 
from oferta;



drop table fornecedor_estoque_historico;
CREATE TABLE IF NOT EXISTS `fornecedor_estoque_historico` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `partnumber` VARCHAR(100) NOT NULL ,
  `marca_id` INT(6) UNSIGNED NOT NULL,
  `historico_id` INT(4) NOT NULL auto_increment,
  `data_cotacao` timestamp NOT NULL DEFAULT now() ,
  `puc` VARCHAR(255) NULL ,
  `pu` VARCHAR(255) CHARACTER SET 'latin1' NULL ,
  `disponibilidade_id` INT(1) UNSIGNED NULL ,
  `oferta` INT(1) UNSIGNED NULL DEFAULT NULL ,
  `qtd` INT(11) UNSIGNED NULL ,
  `moeda_preco` VARCHAR(10) CHARACTER SET 'latin1' NULL ,
  `preco` DECIMAL(12,2) NOT NULL ,
  `moeda_custo` VARCHAR(10) CHARACTER SET 'latin1' NULL ,
  `custo` DECIMAL(12,2) ,
  `usuario_id` INT(3) NULL ,
  `origem` VARCHAR(100) NULL ,
  PRIMARY KEY (`fornecedor_id`, `partnumber`, `marca_id`, `historico_id`) );






select distinct fornecedor_id,partnumber,marca_id,historico_id;
select distinct fornecedor_id,partnumber,marca_id,historico_id;

select historico_id,fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,origem
from fornecedor_estoque_historico
where fornecedor_id=30 and marca_id=111 and partnumber='22328 CCK/C3W33' 
#and historico_id=max(historico_id) 
#group by fornecedor_id,partnumber,marca_id
#having historico_id=max(historico_id)
/* (
                        select max(historico_id) 
                        from   fornecedor_estoque_historico
                        where fornecedor_id=30 and marca_id=111 and partnumber='22328 CCK/C3W33'
                     )
*/                     
order by historico_id asc
limit 10;



select f.*
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo
where f.fornecedor_id=30 and f.marca_id=111 and f.partnumber='22328 CCK/C3W33';


select count(historico_id) from fornecedor_estoque_historico where historico_id>1 order by historico_id desc;
select * from fornecedor_estoque_historico where historico_id>1 order by historico_id desc;
select * from fornecedor_estoque;



insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem)
select 
fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,oferta_id,qtd,moeda_preco,
preco,moeda_custo,custo,'AtualizaÃ§Ã£o de Estrutura de BD MySql.'
from oferta

insert into fornecedor_estoque
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem)
select 
fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,oferta_id,qtd,moeda_preco,
preco,moeda_custo,custo,'AtualizaÃ§Ã£o de Estrutura de BD MySql.'
from oferta

insert into fornecedor_estoque
(fornecedor_id,partnumber,marca_id,data_cotacao,puc,pu,
disponibilidade_id,qtd,moeda_preco,preco,moeda_custo,custo)
select 
f.fornecedor_id,f.partnumber,f.marca_id,f.data_cotacao,f.puc,f.pu,
f.disponibilidade_id,f.qtd,f.moeda_preco,f.preco,f.moeda_custo,f.custo
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo;

select * from fornecedor_estoque;




SELECT        pu,MAX(data_cadastro) AS max_mark, 
              COUNT(DISTINCT cotacao_id)-1 AS total_pu, 
              DATEDIFF(CURDATE(),MAX(data_cadastro)) AS dias_diferenca, 
              IF(COUNT(DISTINCT cotacao_id)-1=0,'3', 
              IF(DATEDIFF(CURDATE(),MAX(data_cadastro))<6,'1','2')) AS recencia,
              /* cotacao do item anterior */               
              (select item_partnumber from cotacao_itens order by data_cadastro asc limit 1) as item_anterior,
              (select data_cadastro from cotacao_itens order by data_cadastro asc limit 1) as data_item_anterior

FROM          cotacao_itens 
WHERE         data_cadastro > DATE_SUB(NOW(),INTERVAL 30 DAY) 
and           pu='63320-C3'
GROUP BY      pu 
ORDER BY      pu, dias_diferenca

select * from cotacao_itens
select * from cotacao order by data_cadastro desc


SELECT pu,data_cadastro, IF(DATEDIFF(CURDATE(),data_cadastro)<6,,) AS count_dif, COUNT(DATEDIFF(CURDATE(),data_cadastro)) AS count_diff, IF(COUNT(DATEDIFF(CURDATE(),data_cadastro)>1),'1','2') AS recencia FROM cotacao_itens WHERE data_cadastro > DATE_SUB(NOW(),INTERVAL 30 DAY) AND pu = '63320-C-3' GROUP BY pu


/* query para trazer a recencia */
SELECT              pu,data_cadastro, 
                    COUNT(DATEDIFF(CURDATE(),data_cadastro)) AS count_diff, 
                    IF(     
                            (SELECT             count(pu)
                            FROM                cotacao_itens 
                            WHERE               data_cadastro > DATE_SUB(NOW(),INTERVAL 5 DAY) 
                            AND                 pu = '63320-C-3' 
                            GROUP BY            pu,cotacao_id
                            limit               1)>1
                            ,
                               '1'                            
                            ,
                             case 
                                  when  
                                        (SELECT             count(pu) 
                                        FROM                cotacao_itens 
                                        WHERE               data_cadastro > DATE_SUB(NOW(),INTERVAL 30 DAY) 
                                        AND                 pu = '63320-C-3' 
                                        GROUP BY            pu,cotacao_id
                                        limit               1)>0  then   '2'                                                                                                                     

                                  else
                                        '3'
                                        
                             end           

                            ) AS recencia

FROM                cotacao_itens 
WHERE               data_cadastro > DATE_SUB(NOW(),INTERVAL 30 DAY) 
AND                 pu = '63320-C-3' 
GROUP BY            pu,cotacao_id


SELECT              pu
FROM                cotacao_itens 
WHERE               data_cadastro > DATE_SUB(NOW(),INTERVAL 30 DAY) 
AND                 pu = '63320-C-3' 
GROUP BY            pu,cotacao_id



insert into fornecedor_estoque
(fornecedor_id,partnumber,marca_id,data_cotacao,puc,pu,
disponibilidade_id,qtd,moeda_preco,preco,moeda_custo,custo)
select 
f.fornecedor_id,f.partnumber,f.marca_id,f.data_cotacao,f.puc,f.pu,
f.disponibilidade_id,f.qtd,f.moeda_preco,f.preco,f.moeda_custo,f.custo
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo;








/******************************************************
* carga de dados da tabela fornecedor_estoque_historico*
*******************************************************/  
/* query antiga */
insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,ultimo)
select 
fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,status_id,qtd,moeda_preco,
preco,moeda_custo,custo,'Atualização de Estrutura de BD MySql.',
/* campo ultimo sidnei rodou no php */
from oferta;




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
qtd,moeda_preco,preco,moeda_custo,custo,'Atualização de Estrutura de BD MySql.',
case 
     when status_id=1 then     
     1     
     else     
     0     
end as mostra_preco
from oferta
join fornecedor on fornecedor.fornecedor_id=oferta.fornecedor_id
where fornecedor.tipo='F';


/* query para dar carga na coluna ultimo */

truncate table fornecedor_estoque_historico_tmp;

insert into fornecedor_estoque_historico_tmp
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,mostra_preco)
select 
fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,mostra_preco
from fornecedor_estoque_historico;

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


truncate table fornecedor_estoque_historico_tmp;






/******************************************************
*  carga de dados na tabela pecas                *
*******************************************************/
SELECT atualizaPecasFunction();





/******************************************************
*  carga de dados na tabela catalogo                *
*******************************************************/
insert into catalogo
(fornecedor_id,nome,descricao)
select 
fornecedor_id,nome,'carga de dados da tabela fornecedor_estoque_historico'
from fornecedor
where lower(tipo)='c';




/******************************************************
*  carga de dados na tabela catalogo_pecas_historico
*******************************************************/
insert into `catalogo_pecas_historico` 
(`catalogo_id`,`marca_id`,`pu`,`partnumber`,`catalogo_tipo`,data_cadastro)
select 
oferta.fornecedor_id,marca_id,partnumber_unico,referencia,'C',data_insercao
from oferta
join fornecedor on fornecedor.fornecedor_id=oferta.fornecedor_id
where fornecedor.tipo='C';
select * from catalogo_pecas_historico;



pegar data de um campo timestamp
select        catalogo_id,
              fornecedor_id,
              nome,
              descricao,
              concat(substr(data_cadastro,9,2),'/',substr(data_cadastro,6,2),'/',substr(data_cadastro,1,4)) as data
from          catalogo;

partnumber



SELECT                          o.*,
                                m.nome as Marca,
                                f.nome as Empresa
FROM                            fornecedor_estoque_historico as o
INNER JOIN                      marca as m ON m.marca_id=o.marca_id
INNER JOIN                      catalogo as f ON f.fornecedor_id=o.fornecedor_id
WHERE                           o.puc like '6200'
GROUP BY                        o.pu,
                                o.marca_id,
                                o.fornecedor_id 
ORDER BY                        o.pu,
                                o.marca_id,
                                o.fornecedor_id;


SELECT          cph.pu as referencia,
                cph.pu as partnumber,
                m.nome as Marca, 
                c.nome as Empresa,
                concat(substr(cph.data_cadastro,9,2),'/',substr(cph.data_cadastro,6,2),'/',substr(cph.data_cadastro,1,4)) as data_insercao
FROM            catalogo_pecas_historico as cph
INNER JOIN      marca as m ON m.marca_id=cph.marca_id
INNER JOIN      catalogo as c ON c.catalogo_id=cph.catalogo_id
WHERE           cph.pu like '6200'
GROUP BY        cph.pu,
                cph.marca_id,
                cph.catalogo_id 
ORDER BY        cph.pu,cph.marca_id,cph.catalogo_id;



drop table catalogo_pecas_historico;

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



truncate table catalogo_pecas_historico;
select cargaTabelaCatalogo();
select * from catalogo_pecas_historico;

Inserir campo fornecedor_id na tabela fornecedor_marca e trazer os ids respectivos da tabela fornecedor. Apagar o campo Empresa após isso. 

select empresa,marca,marca_id,fornecedor_id,distribuidor,loteiro from fornecedor_marca group by fornecedor_id;

select                      for_lf_marca.Empresa as EMPRESA,
                            for_lf_marca.Endereco as ENDERECO,
                            for_lf_marca.Telefones as TELEFONE,
                            for_lf_marca.Contato as CONTATO,
                            for_lf_marca.`E-MAILS` as EMAIL  
from                        for_lf_marca 
where                       for_lf_marca.Marca='$marca' 
ORDER BY                    for_lf_marca.Empresa,for_lf_marca.Endereco








SELECT          p.marca_id,
                                m.nome                  as marca,
                                p.puc                   as partnumber_unico_compacto,
                                p.pu                    as partnumber_unico,
                                p.partnumber            as referencia,
                                p.moeda_preco,
                                p.preco,
                                p.preco_fornecedor_id,
                                p.disponibilidade_fornecedor_id,
                                p.oferta                  as status_id,
                                p.mostra_preco,
                                (case 
                                            when p.preco >0 and p.disponibilidade_id >0 then
                                            1      
                                            when p.preco =0 and p.disponibilidade_id >0 then      
                                            2      
                                            else      
                                            3      
                                end) as situacao_id,
                                p.disponibilidade_id								
from 			(`pecas` `p` 
left join 		`marca` `m` on((`p`.`marca_id` = `m`.`marca_id`)))
where           p.puc like '1234%'
GROUP BY 		p.marca_id DESC, p.pu,p.mostra_preco desc,p.preco asc
ORDER BY 		p.pu asc,p.mostra_preco desc,p.preco asc,tem_fornecedor desc,p.disponibilidade_id desc,m.nome asc


update fornecedor_estoque_historico set p3=0,p7=0,p12=0,p18=0,l3=0,l7=0,l12=0,l18=0;
            select          feh.fornecedor_id,
                            feh.pu,
                            feh.marca_id,
                            feh.historico_id,
                            feh.data_cotacao,
                            feh.puc,
                            feh.partnumber,
                            feh.disponibilidade_id,
                            feh.oferta,
                            feh.qtd,
                            feh.moeda_preco,
                            feh.preco,
                            feh.p3,
                            feh.p7,
                            feh.p12,
                            feh.p18,
                            feh.l3,
                            feh.l7,
                            feh.l12,
                            feh.l18,
                            feh.preco_simp,
                            feh.aliquota_ipi,
                            feh.moeda_custo,
                            feh.custo,
                            feh.frete,
                            feh.frete_valor,
                            feh.frete_tempo,
                            feh.usuario_id,
                            feh.contato_id,
                            feh.origem,
                            feh.mostra_preco,
                            feh.obs,
                            fnd.aliquota_icms,
                            fnd.tributacao,
                            feh.ultimo

            from            fornecedor_estoque_historico as feh
            left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
            where           feh.preco   >0
            and             feh.ultimo  =1;

#traz todos os registros de pecas que as colunas porcentagens estão vom valor menor que o valor normal
#20.440
select      feh.pu,feh.marca_id,feh.preco,feh.p3,feh.p7,feh.p12,feh.p18,feh.fornecedor_id,f.aliquota_icms,margem_lucro
from        fornecedor_estoque_historico as feh,fornecedor as f
where        (preco >= p3
 or          preco >= p7
 or          preco >= p12
 or          preco >= p18)
and         preco >0
and         ultimo=1;

#valores corretos
#90.064
select      feh.pu,feh.marca_id,feh.preco,feh.p3,feh.p7,feh.p12,feh.p18,feh.fornecedor_id,f.aliquota_icms
from        fornecedor_estoque_historico as feh,fornecedor as f
where       (feh.preco <= p3
or          feh.preco <= p7
or          feh.preco <= p12
or          feh.preco <= p18)
and         feh.preco >0
and         feh.ultimo=1
and         feh.fornecedor_id=f.fornecedor_id;

select * from fornecedor_estoque_historico limit 10;
select * from fornecedor_estoque_historico limit 10;
select * from fornecedor limit 10;
select * from enquadramento_imposto limit 10;
select * from cotacao order by cotacao_id desc;









/*  carga de pecas nas colunas p3 / p7 / p12 / p18      */

update pecas set p3=0,p7=0,p12=0,p18=0;

/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço */
replace into pecas
(pu,marca_id,partnumber,puc,f_id_simples,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta)
select       
pu,marca_id,partnumber,puc,fornecedor_id,preco,preco,
moeda_preco,mostra_preco,oferta
from         fornecedor_estoque_historico
where        ultimo=1
and          mostra_preco=1   
and          preco >0
and          qtd >0 
group by     pu,marca_id;


update      pecas as pc
set         pc.p3=(
                select      min(feh.p3)
                from        fornecedor_estoque_historico as feh
                where       feh.ultimo=1
                and         feh.mostra_preco=1   
                and         feh.preco >0
                and         feh.qtd >0
                and         pc.pu=feh.pu   
                and         pc.marca_id=feh.marca_id   
                group by    feh.pu,feh.marca_id
                limit       1
),
           pc.p7=(
                select      min(feh.p7)
                from        fornecedor_estoque_historico as feh
                where       feh.ultimo=1
                and         feh.mostra_preco=1   
                and         feh.preco >0
                and         feh.qtd >0
                and         pc.pu=feh.pu   
                and         pc.marca_id=feh.marca_id   
                group by    feh.pu,feh.marca_id
                limit       1
),
            pc.p12=(
                select      min(feh.p12)
                from        fornecedor_estoque_historico as feh
                where       feh.ultimo=1
                and         feh.mostra_preco=1   
                and         feh.preco >0
                and         feh.qtd >0
                and         pc.pu=feh.pu   
                and         pc.marca_id=feh.marca_id   
                group by    feh.pu,feh.marca_id
                limit       1
),
           pc.p18=(
                select      min(feh.p18)
                from        fornecedor_estoque_historico as feh
                where       feh.ultimo=1
                and         feh.mostra_preco=1   
                and         feh.preco >0
                and         feh.qtd >0
                and         pc.pu=feh.pu   
                and         pc.marca_id=feh.marca_id   
                group by    feh.pu,feh.marca_id
                limit       1
)
where        pc.mostra_preco=1   
and          pc.preco >0;

select preco,p3,p7,p12,p18 from pecas where preco>0;
UPDATE cesta_cotacao SET pais ='BR', uf ='SP', imposto ='3' WHERE sessao ='968f277e80d29ac15e2245370335e2a2';
UPDATE cesta_cotacao SET pais ='', uf ='', imposto ='0' WHERE sessao ='968f277e80d29ac15e2245370335e2a2';
select * from cesta_cotacao order by data_cadastro desc;
select * from cesta_cotacao where sessao='968f277e80d29ac15e2245370335e2a2';
select uf, imposto, pais from cesta_cotacao where sessao='968f277e80d29ac15e2245370335e2a2';

select partnumber, partnumber as referencia, marca_id, puc as partnumber_unico_compacto, pu as partnumber_unico, moeda_preco, mostra_preco,preco, p3 as preco, disponibilidade_id, oferta from pecas where pu='6200' and marca_id=269 order by oferta,disponibilidade_id asc limit 1

select * from cesta_cotacao order by data_cadastro desc;
select * from cesta_cotacao where sessao='1c4438a1c18b94c64daf8156ff93f45e';
select * from cotacao order by data_cadastro desc;
select * from cotacao_itens order by data_cadastro desc;
select * from fornecedor_estoque_historico where margem_lucro > 0;

SELECT 		    item_id,
                                                            item_peca_id,
                                                            item_partnumber,
                                                            pu,
                                                            item_dentro_catalogo,
                                                            item_qtd,
                                                            item_marca,
                                                            item_id,
                                                            item_obs,
                                                            status_id,
                                                            moeda_preco,
                                                            mostra_preco,
                                                            p3 as preco,
                                                            preco_fornecedor_id,
                                                            disponibilidade_id,
                                                            disponibilidade_fornecedor_id,
                                                            oferta,
                                                            item_fornecedor
                                        FROM                cesta_cotacao 
                                        WHERE               sessao = 'ab8f61ee2940a66a1ba0d33a87e5fb0d'





select feh.fornecedor_id,
                            feh.pu,
                            feh.marca_id,
                            feh.historico_id,
                            feh.data_cotacao,
                            feh.puc,
                            feh.partnumber,
                            feh.disponibilidade_id,
                            feh.oferta,
                            feh.qtd,
                            feh.moeda_preco,
                            feh.preco,
                            feh.p3,
                            feh.p7,
                            feh.p12,
                            feh.p18,
                            feh.l3,
                            feh.l7,
                            feh.l12,
                            feh.l18,
                            feh.preco_simp,
                            feh.aliquota_ipi,
                            feh.moeda_custo,
                            feh.custo,
                            feh.frete,
                            feh.frete_valor,
                            feh.frete_tempo,
                            feh.usuario_id,
                            feh.contato_id,
                            feh.origem,
                            feh.mostra_preco,
                            feh.obs,
                            fnd.aliquota_icms,
                            fnd.tributacao,                            
                            feh.ultimo,
                            fnd.pais_sigla
            from            fornecedor_estoque_historico as feh
            left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
            left join       paises                       as pai on lower(fnd.pais_sigla)=lower(pai.sigla_pais)  
            where           feh.preco   >0
            and             feh.ultimo  =1
            and             pai.continente='European';

select count(*) from fornecedor where pais_sigla='' or pais_sigla=null;
select * from fornecedor where (pais_sigla='' or pais_sigla=null) and tipo='F';
select * from paises;

update      fornecedor_estoque_historico
set         vc_imp_bbi_25_30_fob =null,
            vc_imp_bbi_25_30_peso=null,
            vc_imp_bbi_7_10      =null,
            vc_imp_alemanha      =null; 





alter table fornecedor_estoque_historico add m1_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m1_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_brl decimal(10,2) default 0;
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













select feh.fornecedor_id,
                            feh.pu,
                            feh.marca_id,
                            feh.historico_id,
                            feh.data_cotacao,
                            feh.puc,
                            feh.partnumber,
                            feh.disponibilidade_id,
                            feh.oferta,
                            feh.qtd,
                            feh.moeda_preco,
                            feh.preco,
                            feh.p3,
                            feh.p7,
                            feh.p12,
                            feh.p18,
                            feh.l3,
                            feh.l7,
                            feh.l12,
                            feh.l18,
                            feh.preco_simp,
                            feh.aliquota_ipi,
                            feh.moeda_custo,
                            feh.custo,
                            feh.frete,
                            feh.frete_valor,
                            feh.frete_tempo,
                            feh.usuario_id,
                            feh.contato_id,
                            feh.origem,
                            feh.mostra_preco,
                            feh.obs,
                            fnd.aliquota_icms,
                            fnd.tributacao,                            
                            feh.ultimo,
                            (
                                select      case 
                                                    when (pps.peso_KG < 0 or pps.peso_KG is null or pps.peso_KG) then 
                                                        0 
                                                    else 
                                                        pps.peso_KG 
                                                    end 
                                from        pecas_peso as pps
                                where       pps.marca_id=feh.marca_id
                                and         pps.pu      =feh.pu  
                                limit       1

                            ) as peso
            from            fornecedor_estoque_historico as feh
            left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
            where           feh.preco   >0
            and             feh.ultimo  =1
            and             lower(fnd.pais_sigla)='us';

select feh.fornecedor_id,
                            feh.pu,
                            feh.marca_id,
                            feh.historico_id,
                            feh.data_cotacao,
                            feh.puc,
                            feh.partnumber,
                            feh.disponibilidade_id,
                            feh.oferta,
                            feh.qtd,
                            feh.moeda_preco,
                            feh.preco,
                            feh.p3,
                            feh.p7,
                            feh.p12,
                            feh.p18,
                            feh.l3,
                            feh.l7,
                            feh.l12,
                            feh.l18,
                            feh.preco_simp,
                            feh.aliquota_ipi,
                            feh.moeda_custo,
                            feh.custo,
                            feh.frete,
                            feh.frete_valor,
                            feh.frete_tempo,
                            feh.usuario_id,
                            feh.contato_id,
                            feh.origem,
                            feh.mostra_preco,
                            feh.obs,
                            fnd.aliquota_icms,
                            fnd.tributacao,
                            fnd.pais_sigla,                            
                            feh.ultimo
            from            fornecedor_estoque_historico as feh
            left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
            left join       paises                       as pai on fnd.pais_sigla=pai.sigla_pais
            where           feh.preco   >0
            and             fnd.pais_sigla in(   
                                    select      sigla_pais 
                                    from        paises 
                                    where lower(continente)='european'
                                    )
            and             feh.ultimo  =1;


select feh.fornecedor_id,
                            feh.pu,
                            feh.marca_id,
                            feh.historico_id,
                            feh.data_cotacao,
                            feh.puc,
                            feh.partnumber,
                            feh.disponibilidade_id,
                            feh.oferta,
                            feh.qtd,
                            feh.moeda_preco,
                            feh.preco,
                            feh.p3,
                            feh.p7,
                            feh.p12,
                            feh.p18,
                            feh.l3,
                            feh.l7,
                            feh.l12,
                            feh.l18,
                            feh.preco_simp,
                            feh.aliquota_ipi,
                            feh.moeda_custo,
                            feh.custo,
                            feh.frete,
                            feh.frete_valor,
                            feh.frete_tempo,
                            feh.usuario_id,
                            feh.contato_id,
                            feh.origem,
                            feh.mostra_preco,
                            feh.obs,
                            fnd.aliquota_icms,
                            fnd.tributacao,
                            fnd.pais_sigla,                            
                            feh.ultimo,
                                            (
                                                select      case 
                                                                    when (pps.peso_KG < 0 or pps.peso_KG is null or pps.peso_KG='') then 
                                                                        0 
                                                                    else 
                                                                        pps.peso_KG 
                                                                    end 
                                                from        pecas_peso as pps
                                                where       pps.marca_id=feh.marca_id
                                                and         pps.pu      =feh.pu  
                                                limit       1

                                            ) as peso
            from            fornecedor_estoque_historico as feh
            inner join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
            inner join       paises                       as pai on fnd.pais_sigla=pai.sigla_pais
            where           feh.preco   >0
            and             fnd.pais_sigla in(   
                                    select      sigla_pais 
                                    from        paises 
                                    where lower(continente)='european'
                                    )
            and             feh.ultimo  =1;





select feh.fornecedor_id,
                                    feh.pu,
                                    feh.marca_id,
                                    feh.historico_id,
                                    feh.data_cotacao,
                                    feh.puc,
                                    feh.partnumber,
                                    feh.disponibilidade_id,
                                    feh.oferta,
                                    feh.qtd,
                                    feh.moeda_preco,
                                    feh.preco,
                                    feh.p3,
                                    feh.p7,
                                    feh.p12,
                                    feh.p18,
                                    feh.l3,
                                    feh.l7,
                                    feh.l12,
                                    feh.l18,
                                    feh.preco_simp,
                                    feh.aliquota_ipi,
                                    feh.moeda_custo,
                                    feh.custo,
                                    feh.frete,
                                    feh.frete_valor,
                                    feh.frete_tempo,
                                    feh.usuario_id,
                                    feh.contato_id,
                                    feh.origem,
                                    feh.mostra_preco,
                                    feh.obs,
                                    fnd.aliquota_icms,
                                    fnd.tributacao,
                                    fnd.pais_sigla,                            
                                    feh.ultimo,
                                            (
                                                select      case 
                                                                    when (pps.peso_KG < 0 or pps.peso_KG is null or pps.peso_KG='') then 
                                                                        0 
                                                                    else 
                                                                        pps.peso_KG 
                                                                    end 
                                                from        pecas_peso as pps
                                                where       pps.marca_id=feh.marca_id
                                                and         pps.pu      =feh.pu  
                                                limit       1

                                            ) as peso
                    from            fornecedor_estoque_historico as feh
                    left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
                    left join       paises                       as pai on fnd.pais_sigla=pai.sigla_pais
                    where           feh.preco   >0
                    and             fnd.pais_sigla in(   

'AL',
'DE',
'AD',
'AT',
'BE',
'BG',
'VA',
'HR',
'DK',
'SK',
'SI',
'ES',
'EE',
'FI',
'FR',
'GI',
'GB',
'GR',
'NL',
'HU',
'IE',
'IS',
'IT',
'LV',
'LI',
'LT',
'LU',
'MK',
'MT',
'MD',
'MC',
'NO',
'PL',
'PT',
'CZ',
'RO',
'RU',
'SE',
'CH',
'TR',
'UA',
'BA',
'BY',
'CY',
'FO',
'GG',
'G',
'IM',
'ME',
'SM',
'RS'
                                            )
                    and             feh.ultimo  =1;



select * from pecas_peso;

update  fornecedor_estoque_historico as feh,
        pecas_peso                   as pps
set     feh.peso_kg  = pps.peso_KG
where   feh.pu       = pps.pu
and     feh.marca_id = pps.marca_id;

select * from fornecedor_estoque_historico where peso_kg>0;

231-600-y-m-b-w-45	118	231/600YMBW45	231600ymbw45	67	205000.00	205000.00	R$ 	1	0	F	1	2012-06-08 18:00:24	1	1	1221290.11	1277441.38	1355334.15

select  *    
from    fornecedor_estoque_historico 
where   puc='231600ymbw45'
and     marca_id='118';








INSERT INTO `fornecedor_estoque_historico` (`fornecedor_id`, `marca_id`, `historico_id`, `data_cotacao`, `puc`,pu, `partnumber`, `disponibilidade_id`, `oferta`, `qtd`, `moeda_preco`, `preco`, `frete_valor`, `origem`, `mostra_preco`, `ultimo`)
VALUES
 (544, 111, 1, '2012-07-30 00:00:00', '23080CCC3W33', '23080-C-C-C-3-W-33','23080 CC/C3W33', 0, 1, 16, 'R$', 13627.19, NULL, 'Manual - Renato', 1, 1),
 (545, 127, 1, '2012-07-30 00:00:00', '22234CCKW33', '22234-C-C-K-W-33','22234 CCK/W33', 3, 1, 10, 'R$', 1692.00, 169.20, 'Manual - Renato', 1, 1),
 (545, 127, 1, '2012-07-30 00:00:00', '22244CCKW33', '22244-C-C-K-W-33','22244 CCK/W33', 3, 1, 6, 'R$', 3540.00, 354.00, 'Manual - Renato', 1, 1);

#select * from fornecedor_estoque_historico where fornecedor_id=544 and marca_id=111 and historico_id=1;
select * from fornecedor_estoque_historico where fornecedor_id=545 and marca_id=127 and historico_id=1;

update fornecedor_estoque_historico set p3 ='19467.4142857', l3 ='4088.157', margem_lucro ='0.3' where pu ='23080-C-C-C-3-W-33' and marca_id ='111' and historico_id ='1' and fornecedor_id ='544' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p7 ='17543.0491954', l7 ='30116.5661287', margem_lucro ='0.3' where pu ='23080-C-C-C-3-W-33' and marca_id ='111' and historico_id ='1' and fornecedor_id ='544' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p12 ='18612.7473171', l12 ='31122.0085756', margem_lucro ='0.3' where pu ='23080-C-C-C-3-W-33' and marca_id ='111' and historico_id ='1' and fornecedor_id ='544' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p18 ='20082.1747368', l18 ='32503.1689895', margem_lucro ='0.3' where pu ='23080-C-C-C-3-W-33' and marca_id ='111' and historico_id ='1' and fornecedor_id ='544' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p3 ='2603.07692308', l3 ='676.8', margem_lucro ='0.4' where pu ='22234-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p7 ='2567.17241379', l7 ='3934.83586207', margem_lucro ='0.4' where pu ='22234-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p12 ='2723.70731707', l12 ='4081.89170732', margem_lucro ='0.4' where pu ='22234-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p18 ='2938.73684211', l18 ='4283.9', margem_lucro ='0.4' where pu ='22234-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p3 ='5446.15384615', l3 ='1416', margem_lucro ='0.4' where pu ='22244-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p7 ='5371.03448276', l7 ='8233.6662069', margem_lucro ='0.4' where pu ='22244-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p12 ='5698.53658537', l12 ='8541.43121951', margem_lucro ='0.4' where pu ='22244-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;
update fornecedor_estoque_historico set p18 ='6148.42105263', l18 ='8964.20315789', margem_lucro ='0.4' where pu ='22244-C-C-K-W-33' and marca_id ='127' and historico_id ='1' and fornecedor_id ='545' and preco >0;

select      * 
from        fornecedor_estoque_historico 
where       (fornecedor_id=545 or fornecedor_id=544) 
and         (marca_id=127 or marca_id=111) 
and         historico_id=1
and         (pu='23080-C-C-C-3-W-33' or pu='22234-C-C-K-W-33' or pu='22244-C-C-K-W-33');










/*******************************************************************************
*query original de busca de pecas
********************************************************************************/
SELECT          p.marca_id,
                                m.nome                  as marca,
                                p.puc                   as partnumber_unico_compacto,
                                p.pu                    as partnumber_unico,
                                p.partnumber            as referencia,
                                p.moeda_preco,
                                p.{$pImposto} as preco,
                                p.preco_fornecedor_id,
                                p.disponibilidade_fornecedor_id,
                                p.oferta                  as status_id,
                                p.mostra_preco,
                                (case 
                                            when p.preco >0 and p.disponibilidade_id >0 then
                                            1      
                                            when p.preco =0 and p.disponibilidade_id >0 then      
                                            2      
                                            else      
                                            3      
                                end) as situacao_id,
                                p.disponibilidade_id
from 			`pecas` `p` 
left join 		`marca` `m` on `p`.`marca_id` = `m`.`marca_id`
where                   p.marca_id='$marca_id'
and                     p.puc like '$compara'
$where_oferta			
GROUP BY 		p.marca_id DESC, p.pu,p.mostra_preco desc,p.preco asc
ORDER BY 		p.pu asc,p.mostra_preco desc,p.preco asc,tem_fornecedor desc,p.disponibilidade_id desc,m.nome asc 
$limit

/*******************************************************************************
*query de oferta  - preco desc
********************************************************************************/
SELECT          p.marca_id,
                                m.nome                  as marca,
                                p.puc                   as partnumber_unico_compacto,
                                p.pu                    as partnumber_unico,
                                p.partnumber            as referencia,
                                p.moeda_preco,
                                p.p3 as preco,
                                p.preco_fornecedor_id,
                                p.disponibilidade_fornecedor_id,
                                p.oferta                  as status_id,
                                p.mostra_preco,
                                (case 
                                            when p.preco >0 and p.disponibilidade_id >0 then
                                            1      
                                            when p.preco =0 and p.disponibilidade_id >0 then      
                                            2      
                                            else      
                                            3      
                                end) as situacao_id,
                                p.disponibilidade_id
from 			`pecas` `p` 
left join 		`marca` `m` on `p`.`marca_id` = `m`.`marca_id`
where                   p.oferta=1 
and                     p.puc like '%6200%'
GROUP BY 		p.marca_id DESC, p.pu,p.mostra_preco desc,p.preco asc
ORDER BY 		p.pu asc,p.mostra_preco desc,p.preco desc,tem_fornecedor desc,p.disponibilidade_id desc,m.nome asc;




/*******************************************************************************
*query para PU sem marca Exatamente
********************************************************************************/
1) PU sem marca: 
- Exatamente:
    1. Preço (Decrescente)
        - com preço: traz 3 do menor preço  <???>
        - sem preço: (para mostrar preço =>3 fornecedores com Qtd > 0 para atualizações a partir do dia 07/08/2012) = Preço SOB CONSULTA
    2. Disponibilidade (Crescente)
    3. Data de atualização (Decrescente)
    4. Qtd em estoque (Decrescente) <esta coluna ñ existe>

SELECT          p.marca_id,
                m.nome                  as marca,
                p.puc                   as partnumber_unico_compacto,
                p.pu                    as partnumber_unico,
                p.partnumber            as referencia,
                p.moeda_preco,
                p.p3 as preco,
                p.preco_fornecedor_id,
                p.disponibilidade_fornecedor_id,
                p.oferta                  as status_id,
                p.mostra_preco,
                (case 
                            when p.preco >0 and p.disponibilidade_id >0 then
                            1      
                            when p.preco =0 and p.disponibilidade_id >0 then      
                            2      
                            else      
                            3      
                end) as situacao_id,
                p.disponibilidade_id,
                p.quantidade
from 			`pecas` `p` 
left join 		`marca` `m` on `p`.`marca_id` = `m`.`marca_id`
where                   p.puc='6200'
GROUP BY 		p.marca_id DESC, p.pu,p.mostra_preco desc,p.preco asc
ORDER BY 		p.pu asc,p.mostra_preco desc,p.preco asc,tem_fornecedor desc,p.disponibilidade_id asc,m.nome asc,p.ts desc,p.quantidade desc;

select * from pecas;
select * from fornecedor_estoque_historico;

/****************************************************
*criacao e carga da coluna quantidade da tabela pecas
*****************************************************/
alter table pecas add quantidade int default 0;
update   pecas as pc,
         fornecedor_estoque_historico as feh
set      pc.quantidade=feh.qtd
where    pc.pu        =feh.pu
and      pc.marca_id  =feh.marca_id;
select * from pecas;



/*******************************************************************************
*query para PU sem marca Começa com
********************************************************************************/
- Começa com:
    1. Preço
        - com preço: traz ilimitados do menor preço 
        - sem preço: (para mostrar preço =>10 fornecedores com Qtd > 0 para atualizações a partir do dia 07/08/2012) = Preço SOB CONSULTA
    2. Disponibilidade: 
    3. Data de atualização
    4. Qtd em estoque <esta coluna ñ existe>
- ITENS DE CATÁLOGO VEM POR ÚLTIMO, com "Começa com"

select (121 + 137);

SELECT          p.marca_id,
                m.nome                  as marca,
                p.puc                   as partnumber_unico_compacto,
                p.pu                    as partnumber_unico,
                p.partnumber            as referencia,
                p.moeda_preco,
                p.p3 as preco,
                p.preco_fornecedor_id,
                p.disponibilidade_fornecedor_id,
                p.oferta                  as status_id,
                p.mostra_preco,
                (case 
                            when p.preco >0 and p.disponibilidade_id >0 then
                            1      
                            when p.preco =0 and p.disponibilidade_id >0 then      
                            2      
                            else      
                            3      
                end) as situacao_id,
                p.disponibilidade_id
from 			`pecas` `p` 
left join 		`marca` `m` on `p`.`marca_id` = `m`.`marca_id`
where                   p.marca_id='111'
and                     p.puc like '6200%'
GROUP BY 		p.marca_id DESC, p.pu,p.mostra_preco desc,p.preco asc
ORDER BY 		p.pu asc,p.mostra_preco desc,p.preco asc,tem_fornecedor desc,p.disponibilidade_id asc,p.ts desc,m.nome asc,p.quantidade desc;

union

select
marca_id,
'' as marca,
replace((replace((replace(partnumber,' ','')),'-','')),'/','') as partnumber_unico_compacto,
pu as partnumber_unico,
partnumber as referencia,
'' as moeda_preco,
'' as preco,
'' as preco_fornecedor_id,
'' as disponibilidade_fornecedor_id,
'' as status_id,
'' as mostra_preco,
'' as situacao_id,
'' as disponibilidade_id
from catalogo_pecas_historico
where                   marca_id='111'
and                     pu like '6200%';




     - Exatamente:
          1. Preço (Decrescente)
               - com preço: traz 3 do menor preço 
               - sem preço: (para mostrar preço =>3 fornecedores com Qtd > 0 para atualizações a partir do dia 07/08/2012) = Preço SOB CONSULTA
          2. Disponibilidade (Crescente)
          3. Data de atualização (Decrescente)
          4. Qtd em estoque (Decrescente)

Campos em Pecas
- pN
- puc
- pu
- p3,7,12,18
- mostra_preco (1/0)
- disponibilidade (menor disponibilidade _id dos fornecedores deste pu/marca: 1/2/3 = Imediata / em ate 5 dias / Sob consulta)
- data_atualizacao (data mais atual de cadastro na feh para este pu/marca)
- qtd_estoque (somatoria das qtds em estoque dos fornecedores deste pu/marca)
Carga em Pecas a partir de FEH:
- qtd > 0;
- tem_fornecedor deixa de existir
- origem: F ou C (Fornecedor - que contribuiu com o Preço ou com a Disponibilidade ou com a data de Atualização - ou Catalogo)
select 
- origem_id: fornecedor_id ou catalogo_id, dependendo da origem

Consulta

truncate table pecas;
select cargaTabelaPecas();
select * from pecas;
select * from pecas where preco >0;

--1° carga catalogo 537.976
--2° carga feh      661.177
--3° carga feh      661.177 =>melhor disponibilidade
--4° carga feh      661.177 =>melhor preco e maior data de cadastro

select * from catalogo;
select * from catalogo_pecas_historico;
select * from fornecedor_estoque_historico;
select * from fornecedor_estoque_historico where preco >0;

PECAS 	carga de FEH 	FEH
p3 	minimo entre 	p3 	`mdd_m1_vv_unit_brl` 	`mdd_m2_vv_unit_brl` 	`mdd_m3_vv_unit_brl` 	`mdd_m4_vv_unit_brl`
p7 	minimo entre 	p7 	`rpm_m1_vv_unit_7_brl` 	`rpm_m2_vv_unit_7_brl` 	`rpm_m3_vv_unit_7_brl` 	`rpm_m4_vv_unit_7_brl`
p12 	minimo entre 	p12 	`rpm_m1_vv_unit_12_brl` `rpm_m2_vv_unit_12_brl` `rpm_m3_vv_unit_12_brl` `rpm_m4_vv_unit_12_brl`
p18 	minimo entre 	p18 	`rpm_m1_vv_unit_18_brl` `rpm_m2_vv_unit_18_brl` `rpm_m3_vv_unit_18_brl` `rpm_m4_vv_unit_18_brl`

replace into pecas
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,origem,origem_id,data_cadastro,tem_fornecedor,p3,p7,p12,p18,quantidade)
select       
pu,marca_id,partnumber,puc,fornecedor_id,min(preco),preco,
moeda_preco,mostra_preco,oferta,'F',historico_id,max(data_cotacao),1,p3,p7,p12,p18,qtd
from         fornecedor_estoque_historico
where        ultimo=1
and          mostra_preco=1   
and          preco >0
and          qtd >0 
group by     pu,marca_id;

select      feh.fornecedor_id,
            feh.qtd,
            feh.preco,
            feh.p3,
            feh.p7,
            feh.p12,
            feh.p18,
            feh.ultimo
from            fornecedor_estoque_historico as feh
left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join       paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where           feh.preco   >0
and             fnd.pais_sigla in(   
                        select      sigla_pais 
                        from        paises 
                        where lower(continente)='european'
                        )
and             feh.ultimo  =1;




select      feh.fornecedor_id,
            feh.qtd,
            feh.preco,
            feh.p3,
            feh.p7,
            feh.p12,
            feh.p18,
            feh.l3,
            feh.l7,
            feh.l12,
            feh.l18,
            feh.ultimo
from            fornecedor_estoque_historico as feh
left join       fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
where           feh.preco   >0
and             feh.ultimo  =1
and             lower(fnd.pais_sigla)='us';

select * from fornecedor where fornecedor_id=67;

--query para zerar todos os fornecedores que não sao do brasil em pecas
update      pecas
set         p3 ='0.00',
            p7 ='0.00',
            p12='0.00',
            p18='0.00'
where       preco_fornecedor_id in(
                select      feh.fornecedor_id
                from        fornecedor_estoque_historico as feh
                left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
                left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
                where       lower(fnd.pais_sigla) in(   
                                        select      lower(sigla_pais)
                                        from        paises 
                                        where lower(continente)='european'
                                        )
                or         lower(fnd.pais_sigla)='us'
                group by   feh.fornecedor_id
);


--query para verficar carga realizada em todos os fornecedores do exterior

select      fnd.pais_sigla,feh.*
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       feh.preco>0
and         feh.qtd>0
and         feh.ultimo=1
and         lower(fnd.pais_sigla)='us';
-- and         lower(continente)='european';

and         (lower(fnd.pais_sigla)='us'
or          lower(continente)='european');


update  global_conf set taxa_servico_bbi='0.8';

SELECT * FROM global_conf;


--group by   feh.fornecedor_id;


select * from fornecedor;


select * from fornecedor where (aliquota_icms='' or aliquota_icms='' );

update fornecedor_estoque_historico set m2_custo_tot_inter_brl ='3594.8', mdd_m2_vv_unit_brl ='5482.10989011', mdd_m2_lucro_tot_brl ='1393.92', m2_custo_tot_imp_brl ='0' where pu = '5217-a-2-r-s' and marca_id = '416' and historico_id = '1' and fornecedor_id = '67' and preco > 0 and ultimo = 1;


--query para zerar todos os valores de feh
update      fornecedor_estoque_historico
set         p3 ='0.00',
            p7 ='0.00',
            p12='0.00',
            p18='0.00',
            l3 ='0.00',
            l7 ='0.00',
            l12='0.00',
            l18='0.00',
            m1_custo_tot_inter_brl='0.00',
            m2_custo_tot_inter_brl='0.00',
            m3_custo_tot_inter_brl='0.00',
            m4_custo_tot_inter_brl='0.00',
            mdd_m1_vv_unit_brl='0.00',
            mdd_m2_vv_unit_brl='0.00',
            mdd_m3_vv_unit_brl='0.00',
            mdd_m4_vv_unit_brl='0.00',
            rpm_m1_vv_unit_7_brl='0.00',
            rpm_m1_vv_unit_12_brl='0.00',
            rpm_m1_vv_unit_18_brl='0.00',
            rpm_m2_vv_unit_7_brl='0.00',
            rpm_m2_vv_unit_12_brl='0.00',
            rpm_m2_vv_unit_18_brl='0.00',
            rpm_m3_vv_unit_7_brl='0.00',
            rpm_m3_vv_unit_12_brl='0.00',
            rpm_m3_vv_unit_18_brl='0.00',
            rpm_m4_vv_unit_7_brl='0.00',
            rpm_m4_vv_unit_12_brl='0.00',
            rpm_m4_vv_unit_18_brl='0.00',
            mdd_m1_lucro_tot_brl='0.00',
            mdd_m2_lucro_tot_brl='0.00',
            mdd_m3_lucro_tot_brl='0.00',
            mdd_m4_lucro_tot_brl='0.00',
            rpm_m1_lucro_tot_7_brl='0.00',
            rpm_m2_lucro_tot_7_brl='0.00',
            rpm_m3_lucro_tot_7_brl='0.00',
            rpm_m4_lucro_tot_7_brl='0.00',
            rpm_m1_lucro_tot_12_brl='0.00',
            rpm_m2_lucro_tot_12_brl='0.00',
            rpm_m3_lucro_tot_12_brl='0.00',
            rpm_m4_lucro_tot_12_brl='0.00',
            rpm_m1_lucro_tot_18_brl='0.00',
            rpm_m2_lucro_tot_18_brl='0.00',
            rpm_m3_lucro_tot_18_brl='0.00',
            rpm_m4_lucro_tot_18_brl='0.00',
            m1_custo_tot_imp_brl='0.00',
            m2_custo_tot_imp_brl='0.00',
            m3_custo_tot_imp_brl='0.00',
            m4_custo_tot_imp_brl='0.00',
            m1_disponibilidade='0.00',
            m2_disponibilidade='0.00',
            m3_disponibilidade='0.00',
            m4_disponibilidade='0.00';



select addIpCaptcha('127.1.2.3',1);
select delIpCaptcha('127.1.2.3');
select * from visitorwhitelist where visitip like '%127.1.2.3%';
select * from visitorwhitelist;

--traz todos que deram carga em precos nacionais
select      *        
from        fornecedor_estoque_historico 
where       preco>0
and         qtd>0
and         ultimo=1
and         fornecedor_id<10
limit       10;

--se deixou de dar carga em algum registro em precos nacionais
select      *        
from        fornecedor_estoque_historico 
where       preco>0
and         qtd>0
and         ultimo=1
and         ((p3<1) or (p7<1) or (p12<1) or (p18<1));

--se deixou de dar carga em algum registro em precos nacionais
select      fnd.pais_sigla,feh.*
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       feh.preco>0
and         feh.qtd>0
and         feh.ultimo=1
and         (
m1_custo_tot_inter_brl < 1 or
m2_custo_tot_inter_brl < 1 or
m3_custo_tot_inter_brl < 1 or
m4_custo_tot_inter_brl < 1 or
mdd_m1_vv_unit_brl < 1 or
mdd_m2_vv_unit_brl < 1 or
mdd_m3_vv_unit_brl < 1 or
mdd_m4_vv_unit_brl < 1 or
rpm_m1_vv_unit_7_brl < 1 or
rpm_m1_vv_unit_12_brl < 1 or
rpm_m1_vv_unit_18_brl < 1 or
rpm_m2_vv_unit_7_brl < 1 or
rpm_m2_vv_unit_12_brl < 1 or
rpm_m2_vv_unit_18_brl < 1 or
rpm_m3_vv_unit_7_brl < 1 or
rpm_m3_vv_unit_12_brl < 1 or
rpm_m3_vv_unit_18_brl < 1 or
rpm_m4_vv_unit_7_brl < 1 or
rpm_m4_vv_unit_12_brl < 1 or
rpm_m4_vv_unit_18_brl < 1 or
mdd_m1_lucro_tot_brl < 1 or
mdd_m2_lucro_tot_brl < 1 or
mdd_m3_lucro_tot_brl < 1 or
mdd_m4_lucro_tot_brl < 1 or
rpm_m1_lucro_tot_7_brl < 1 or
rpm_m2_lucro_tot_7_brl < 1 or
rpm_m3_lucro_tot_7_brl < 1 or
rpm_m4_lucro_tot_7_brl < 1 or
rpm_m1_lucro_tot_12_brl < 1 or
rpm_m2_lucro_tot_12_brl < 1 or
rpm_m3_lucro_tot_12_brl < 1 or
rpm_m4_lucro_tot_12_brl < 1 or
rpm_m1_lucro_tot_18_brl < 1 or
rpm_m2_lucro_tot_18_brl < 1 or
rpm_m3_lucro_tot_18_brl < 1 or
rpm_m4_lucro_tot_18_brl < 1 or
m1_custo_tot_imp_brl < 1 or
m2_custo_tot_imp_brl < 1 or
m3_custo_tot_imp_brl < 1 or
m4_custo_tot_imp_brl < 1)
and         lower(fnd.pais_sigla)='us';
and         lower(continente)='european';



INSERT INTO fornecedor_estoque_historico
(fornecedor_id,marca_id,partnumber,pu,puc,data_cotacao,disponibilidade_id,oferta,qtd,moeda_preco,moeda_preco_id,p3,p7,p12,p18,l3,l7,l12,l18,margem_lucro,preco_simp,aliquota_ipi,
moeda_custo,moeda_custo_id,custo,frete,frete_valor,frete_tempo)
SELECT fornecedor_id,marca_id,partnumber,pu,puc,data_cotacao,disponibilidade_id,oferta,qtd,moeda_preco,moeda_preco_id,p3,p7,p12,p18,l3,l7,l12,l18,margem_lucro,preco_simp,aliquota_ipi,
moeda_custo,moeda_custo_id,custo,frete,frete_valor,frete_tempo
FROM rc_ec_certo2;



insert into fornecedor_estoque_historico
(fornecedor_id,marca_id,partnumber,pu,puc,data_cotacao,disponibilidade_id,oferta,qtd,preco,moeda_preco,moeda_preco_id,aliquota_ipi,ultimo)
select 
34,143,'F-110179','F-110179','F110179',current_timestamp,999,1,6400,'1.20','R$','BRL',0,1;
update fornecedor_estoque_historico set p3 ='2.08351648352', l3 ='0.716', margem_lucro ='0.4' where pu ='F-110179' and marca_id ='143' and historico_id ='1' and fornecedor_id ='34' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p7 ='1.35984', l7 ='0.3189256', margem_lucro ='0.4' where pu ='F-110179' and marca_id ='143' and historico_id ='1' and fornecedor_id ='34' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p12 ='1.29984', l12 ='0.2118656', margem_lucro ='0.4' where pu ='F-110179' and marca_id ='143' and historico_id ='1' and fornecedor_id ='34' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p18 ='1.22784', l18 ='0.0899936', margem_lucro ='0.4' where pu ='F-110179' and marca_id ='143' and historico_id ='1' and fornecedor_id ='34' and preco >0 and ultimo =1;


/* Lote FAG 1 2000 pçs 6308 ZZC3 embalagem individual preço unitario R$18,20 */
insert into fornecedor_estoque_historico
(fornecedor_id,marca_id,partnumber,pu,puc,data_cotacao,disponibilidade_id,oferta,qtd,preco,moeda_preco,moeda_preco_id,aliquota_ipi,ultimo)
select 
622,128,'6308 ZZC3','6308-ZZC3','6308ZZC3',current_timestamp,999,1,2000,'18.20','R$','BRL',0,1;
update fornecedor_estoque_historico set p3 ='31.6', l3 ='27.576', margem_lucro ='0.4' where pu ='6308ZZC3' and marca_id ='128' and historico_id ='1' and fornecedor_id ='622' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p7 ='19.59776', l7 ='17.5265184', margem_lucro ='0.4' where pu ='6308ZZC3' and marca_id ='128' and historico_id ='1' and fornecedor_id ='622' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p12 ='18.68776', l12 ='16.6232784', margem_lucro ='0.4' where pu ='6308ZZC3' and marca_id ='128' and historico_id ='1' and fornecedor_id ='622' and preco >0 and ultimo =1;
update fornecedor_estoque_historico set p18 ='17.59576', l18 ='15.5459904', margem_lucro ='0.4' where pu ='6308ZZC3' and marca_id ='128' and historico_id ='1' and fornecedor_id ='622' and preco >0 and ultimo =1;


#query para deletar estes itens:
delete      from  fornecedor_estoque_historico as feh
where       feh.pu=(
            select      subfeh1.pu
            from        fornecedor_estoque_historico as subfeh1
            where       subfeh1.fornecedor_id in (
                        292, 430, 528,289
            )
            and          subfeh1.historico_id>1
            group by    subfeh1.pu,subfeh1.marca_id,subfeh1.fornecedor_id)
and         feh.marca_id=(
            select      subfeh2.marca_id
            from        fornecedor_estoque_historico as subfeh2
            where       subfeh2.fornecedor_id in (
                        292, 430, 528,289
            )
            and         subfeh2.historico_id>1
            group by    subfeh2.pu,subfeh2.marca_id,subfeh2.fornecedor_id)
);


update fornecedor_estoque_historico set preco_simp=preco where           preco>0
and             (
                preco_simp is null or
                preco_simp='' or
                preco_simp<0                 
)
and             (
                aliquota_ipi is null or
                aliquota_ipi ='' or
                aliquota_ipi <0                 
)
and             ultimo=1;

