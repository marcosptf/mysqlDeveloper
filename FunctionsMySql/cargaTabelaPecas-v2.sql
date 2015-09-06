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
(partnumber,marca_id,puc,pu,mostra_preco,tem_fornecedor,origem_id)
select      cph.partnumber,
            cph.marca_id,            
            replace((replace((replace(cph.pu,' ','')),'-','')),'/','') as puc,
            cph.pu,
            '0',
            '0',
            cph.historico_id
from        catalogo_pecas_historico as cph;

/* carga em pecas com todos os itens de feh que tenha quantidade */
replace into pecas
(partnumber,marca_id,puc,pu,moeda_preco,preco,preco_fornecedor,disponibilidade_id,oferta,mostra_preco,origem,origem_id,quantidade,tem_fornecedor)
select 
f.partnumber,f.marca_id,f.puc,f.pu,'',0.00,0.00,3,0,0,'F',f.historico_id,f.qtd,1
from fornecedor_estoque_historico as f
where f.ultimo=1
and   f.qtd >0 
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
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,origem,origem_id,data_cadastro,tem_fornecedor,p3,p7,p12,p18,quantidade)
select       
pu,marca_id,partnumber,puc,fornecedor_id,preco,preco,
moeda_preco,mostra_preco,oferta,'F',historico_id,max(data_cotacao),1,p3,p7,p12,p18,qtd
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
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,origem,origem_id,data_cadastro,tem_fornecedor,quantidade,p3,p7,p12,p18)

select      
pu,marca_id,partnumber,puc,fornecedor_id,preco,preco,
moeda_preco,mostra_preco,oferta,'F',historico_id,data_cotacao,1,qtd,

/* critério do p3 para saber quem tem o menor valor deste fornecedor */
case 
    when (mdd_m1_vv_unit_brl < mdd_m2_vv_unit_brl) or (mdd_m1_vv_unit_brl < mdd_m3_vv_unit_brl) or (mdd_m1_vv_unit_brl < mdd_m4_vv_unit_brl) then
        mdd_m1_vv_unit_brl

    when (mdd_m2_vv_unit_brl < mdd_m1_vv_unit_brl) or (mdd_m2_vv_unit_brl < mdd_m3_vv_unit_brl) or (mdd_m2_vv_unit_brl < mdd_m4_vv_unit_brl) then
        mdd_m2_vv_unit_brl

    when (mdd_m3_vv_unit_brl < mdd_m1_vv_unit_brl) or (mdd_m3_vv_unit_brl < mdd_m2_vv_unit_brl) or (mdd_m3_vv_unit_brl < mdd_m4_vv_unit_brl) then
        mdd_m3_vv_unit_brl

    when (mdd_m4_vv_unit_brl < mdd_m1_vv_unit_brl) or (mdd_m4_vv_unit_brl < mdd_m2_vv_unit_brl) or (mdd_m4_vv_unit_brl < mdd_m3_vv_unit_brl) then
        mdd_m4_vv_unit_brl
        
    else
        mdd_m1_vv_unit_brl
end as p3,

/* critério do p7 para saber quem tem menor preco de p7 */
case 
    when (rpm_m1_vv_unit_7_brl < rpm_m2_vv_unit_7_brl) or (rpm_m1_vv_unit_7_brl < rpm_m3_vv_unit_7_brl) or (rpm_m1_vv_unit_7_brl < rpm_m4_vv_unit_7_brl) then
        rpm_m1_vv_unit_7_brl  

    when (rpm_m2_vv_unit_7_brl < rpm_m1_vv_unit_7_brl) or (rpm_m2_vv_unit_7_brl < rpm_m3_vv_unit_7_brl) or (rpm_m2_vv_unit_7_brl < rpm_m4_vv_unit_7_brl) then
        rpm_m2_vv_unit_7_brl

    when (rpm_m3_vv_unit_7_brl < rpm_m1_vv_unit_7_brl) or (rpm_m3_vv_unit_7_brl < rpm_m2_vv_unit_7_brl) or (rpm_m3_vv_unit_7_brl < rpm_m4_vv_unit_7_brl) then
        rpm_m3_vv_unit_7_brl

    when (rpm_m4_vv_unit_7_brl < rpm_m1_vv_unit_7_brl) or (rpm_m4_vv_unit_7_brl < rpm_m2_vv_unit_7_brl) or (rpm_m4_vv_unit_7_brl < rpm_m3_vv_unit_7_brl) then
        rpm_m4_vv_unit_7_brl
        
    else
        rpm_m1_vv_unit_7_brl
end as p7,

/* critério do p12 para saber quem tem menor preco de p12 */
case 
    when (rpm_m1_vv_unit_12_brl < rpm_m2_vv_unit_12_brl) or (rpm_m1_vv_unit_12_brl < rpm_m3_vv_unit_12_brl) or (rpm_m1_vv_unit_12_brl < rpm_m4_vv_unit_12_brl) then
        rpm_m1_vv_unit_12_brl  

    when (rpm_m2_vv_unit_12_brl < rpm_m1_vv_unit_12_brl) or (rpm_m2_vv_unit_12_brl < rpm_m3_vv_unit_12_brl) or (rpm_m2_vv_unit_12_brl < rpm_m4_vv_unit_12_brl) then
        rpm_m2_vv_unit_12_brl

    when (rpm_m3_vv_unit_12_brl < rpm_m1_vv_unit_12_brl) or (rpm_m3_vv_unit_12_brl < rpm_m2_vv_unit_12_brl) or (rpm_m3_vv_unit_12_brl < rpm_m4_vv_unit_12_brl) then
        rpm_m3_vv_unit_12_brl

    when (rpm_m4_vv_unit_12_brl < rpm_m1_vv_unit_12_brl) or (rpm_m4_vv_unit_12_brl < rpm_m2_vv_unit_12_brl) or (rpm_m4_vv_unit_12_brl < rpm_m3_vv_unit_12_brl) then
        rpm_m4_vv_unit_12_brl
        
    else
        rpm_m1_vv_unit_12_brl
end as p12,

/* critério do p18 para saber quem tem menor preco de p18 */
case 
    when (rpm_m1_vv_unit_18_brl < rpm_m2_vv_unit_18_brl) or (rpm_m1_vv_unit_18_brl < rpm_m3_vv_unit_18_brl) or (rpm_m1_vv_unit_18_brl < rpm_m4_vv_unit_18_brl) then
        rpm_m1_vv_unit_18_brl  

    when (rpm_m2_vv_unit_18_brl < rpm_m1_vv_unit_18_brl) or (rpm_m2_vv_unit_18_brl < rpm_m3_vv_unit_18_brl) or (rpm_m2_vv_unit_18_brl < rpm_m4_vv_unit_18_brl) then
        rpm_m2_vv_unit_18_brl

    when (rpm_m3_vv_unit_18_brl < rpm_m1_vv_unit_18_brl) or (rpm_m3_vv_unit_18_brl < rpm_m2_vv_unit_18_brl) or (rpm_m3_vv_unit_18_brl < rpm_m4_vv_unit_18_brl) then
        rpm_m3_vv_unit_18_brl

    when (rpm_m4_vv_unit_18_brl < rpm_m1_vv_unit_18_brl) or (rpm_m4_vv_unit_18_brl < rpm_m2_vv_unit_18_brl) or (rpm_m4_vv_unit_18_brl < rpm_m3_vv_unit_18_brl) then
        rpm_m4_vv_unit_18_brl
        
    else
        rpm_m1_vv_unit_18_brl
end as p18

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


