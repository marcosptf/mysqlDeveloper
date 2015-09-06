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