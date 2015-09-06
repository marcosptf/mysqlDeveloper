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
