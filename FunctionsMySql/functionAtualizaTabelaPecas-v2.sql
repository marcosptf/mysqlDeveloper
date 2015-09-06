/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque
********************************************************************/

truncate table pecas;
drop function atualizaPecasFunction;

CREATE FUNCTION atualizaPecasFunction()
RETURNS varchar(255)

deterministic
begin
declare count1,count2,count3 int;
declare dado,dados varchar(255);

select count(pu) into count1 from pecas;

replace into pecas
(partnumber,marca_id,puc,pu,moeda_preco,preco,preco_fornecedor_id,disponibilidade_id,
disponibilidade_fornecedor_id,oferta)
select 
f.partnumber,f.marca_id,f.puc,f.pu,f.moeda_preco,f.preco,f.preco,f.disponibilidade_id,f.disponibilidade_id,
case 
     when ( 
         (select  max(feh.preco)
         from     fornecedor_estoque_historico as feh
         where    feh.preco >0     
         and      feh.qtd   >0     
         and      feh.puc=f.puc         
         order by feh.preco asc         
         limit 1) > f.preco
      )  then    
             1      
      else      
             0
end  as oferta                  
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo;

select count(pu) into count2 from pecas;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);

RETURN dados;
end


#chamada da funcao
SELECT atualizaPecasFunction();

