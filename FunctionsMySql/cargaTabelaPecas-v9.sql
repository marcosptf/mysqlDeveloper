drop function if exists cargaTabelaPecas;
CREATE FUNCTION cargaTabelaPecas()

/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
*@version:cargaTabelaPecas-v9
*@release:esta versao contempla a nova estrutura de FEH desmembrada
********************************************************************/

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
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,tem_fornecedor,p3,p7,p12,p18,origem,disponibilidade_id)
select      
feh.pu,feh.marca_id,feh.partnumber,feh.puc,feh.fornecedor_id,feh.preco_simp,feh.preco_simp,feh.moeda_preco_id,feh.mostra_preco,feh.oferta,1,fn.p3,fn.p7,fn.p12,fn.p18,'F',feh.disponibilidade_id
from            fornecedor_estoque_historico as feh
left join       feh_nacional                 as fn  on feh.pu=fn.pu and feh.marca_id=fn.marca_id and feh.fornecedor_id=fn.fornecedor_id and feh.historico_id=fn.historico_id
where           feh.ultimo  =1;


/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço  e maior data de cotacao */
replace into pecas
(pu,marca_id,partnumber,puc,preco_fornecedor_id,preco_fornecedor,preco,moeda_preco,mostra_preco,oferta,tem_fornecedor,p3,p7,p12,p18,disponibilidade_fornecedor_id,disponibilidade_id,origem)
select       
feh.pu,feh.marca_id,feh.partnumber,feh.puc,feh.fornecedor_id,feh.preco_simp,feh.preco_simp,feh.moeda_preco_id,feh.mostra_preco,feh.oferta,1,fn.p3,fn.p7,fn.p12,fn.p18,feh.fornecedor_id,feh.disponibilidade_id,'F'
from         fornecedor_estoque_historico as feh
left join    feh_nacional                 as fn  on feh.pu=fn.pu and feh.marca_id=fn.marca_id and feh.fornecedor_id=fn.fornecedor_id and feh.historico_id=fn.historico_id
where        feh.ultimo=1
and          feh.mostra_preco=1   
and          feh.preco_simp >0
and          feh.qtd >0 
group by     feh.pu,feh.marca_id;


/* conta quantos foram atualizados */
select count(pu) into count2 from pecas;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);

/* retorna quantos registros foram afetados e finaliza a função */
RETURN dados;
end;


