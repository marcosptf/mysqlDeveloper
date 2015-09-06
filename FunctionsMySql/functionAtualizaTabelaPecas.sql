/******************************************************************************** 
*Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque *
*********************************************************************************/
truncate table pecas_novo;
drop function atualizaPecas;

delimiter //
CREATE FUNCTION atualizaPecas()
RETURNS varchar(255)

deterministic
begin
declare count1,count2,count3 int;
declare dado,dados varchar(255);

select count(pu) into count1 from pecas_novo;

replace into pecas_novo
(partnumber,marca_id,puc,pu,moeda_preco,preco,disponibilidade_id,oferta)
select 
partnumber,marca_id,puc,pu,moeda_preco,
case 
    when qtd=0 or qtd is null then
        concat(cast(moeda_preco as char),'0.00')
    when qtd>0 then
        concat(cast(moeda_preco as char),cast(preco as char))
end as precos,    
disponibilidade_id,        
case 
    when oferta=1 then
    1
    else
    0
end as ofertas 
from   fornecedor_estoque
#where  mostra_preco=1 or oferta=1
group by pu,marca_id
order by preco,disponibilidade_id asc;

select count(pu) into count2 from pecas_novo;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);

RETURN dados;
end
//

#chamada da funcao
SELECT atualizaPecas();

