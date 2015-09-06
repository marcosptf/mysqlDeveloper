/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
********************************************************************/
drop function if exists cargaTabelaPecas;
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


/* carga em pecas com todos os itens de feh */
replace into pecas
(partnumber,marca_id,puc,pu,moeda_preco,preco,preco_fornecedor,disponibilidade_id,oferta,mostra_preco,tem_fornecedor)
select 
f.partnumber,f.marca_id,f.puc,f.pu,'',0.00,0.00,3,0,0,1
from fornecedor_estoque_historico as f
group by f.pu,f.marca_id;


/* query para atualizar a pecas.disponibilidade_fornecedor_id com os fornecedores de melhor disponibilidade */
insert into pecas
(pu,puc,marca_id,partnumber,disponibilidade_fornecedor_id,disponibilidade_id,preco,preco_fornecedor,tem_fornecedor)
select    pu,puc,marca_id,partnumber,fornecedor_id,disponibilidade_id,preco,preco,1
from      fornecedor_estoque_historico
where     ultimo=1
and       mostra_preco=1
and       preco >0
and       qtd   >0
group by  pu,marca_id
order by  pu,marca_id,disponibilidade_id asc,data_cotacao desc
ON DUPLICATE KEY UPDATE disponibilidade_fornecedor_id = VALUES(disponibilidade_fornecedor_id), disponibilidade_id=VALUES(disponibilidade_id);

/*
200.000 = 25%
Acima de 100.000 = 30%
Acima de 50.00 = 35%
Normal = 40%
*/
/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço  e maior data de cotacao */
replace into pecas
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,tem_fornecedor,p3,p7,p12,p18)
select       
pu,marca_id,partnumber,puc,fornecedor_id,preco,preco,moeda_preco,mostra_preco,oferta,1,p3,p7,p12,p18
from         fornecedor_estoque_historico
where        ultimo=1
and          mostra_preco=1   
and          preco >0
and          qtd >0 
group by     pu,marca_id;




/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço  e maior data de cotacao 
para fornecedores US de acordo com a regra abaixo:
PECAS 	carga de FEH 	FEH
p3 	minimo entre 	p3 	`mdd_m1_vv_unit_brl` 	`mdd_m2_vv_unit_brl` 	`mdd_m3_vv_unit_brl` 	`mdd_m4_vv_unit_brl`
p7 	minimo entre 	p7 	`rpm_m1_vv_unit_7_brl` 	`rpm_m2_vv_unit_7_brl` 	`rpm_m3_vv_unit_7_brl` 	`rpm_m4_vv_unit_7_brl`
p12 	minimo entre 	p12 	`rpm_m1_vv_unit_12_brl` `rpm_m2_vv_unit_12_brl` `rpm_m3_vv_unit_12_brl` `rpm_m4_vv_unit_12_brl`
p18 	minimo entre 	p18 	`rpm_m1_vv_unit_18_brl` `rpm_m2_vv_unit_18_brl` `rpm_m3_vv_unit_18_brl` `rpm_m4_vv_unit_18_brl`
*/
replace into pecas
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,tem_fornecedor,p3,p7,p12,p18)
select      
pu,marca_id,partnumber,puc,fornecedor_id,preco,preco,moeda_preco,mostra_preco,oferta,1,p3,p7,p12,p18
from            fornecedor_estoque_historico as feh
where           feh.preco   >0
and             feh.ultimo  =1;



/* conta quantos foram atualizados */
select count(pu) into count2 from pecas;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);

/* retorna quantos registros foram afetados e finaliza a função */
RETURN dados;
end;


