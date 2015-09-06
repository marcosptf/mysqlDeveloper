/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
********************************************************************/
drop function atualizaPecasFunction;
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
(partnumber,marca_id,puc,pu,moeda_preco,preco,disponibilidade_id,oferta)
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
end as ofertas
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


/* query para atualizar a pecas.pecas.preco_fornecedor_id com os fornecedores de melhor preço */
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
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);
						  

/* retorna quantos registros foram afetados e finaliza a função */
RETURN dados;
end;

select atualizaPecasFunction();
