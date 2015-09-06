/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql
*@desc:Funcao para atualizar a coluna disponibilidade na tabela FEH && Pecas
*Alterar logica de exibição de disponibilidade 
********************************************************************/
drop procedure if exists atualizaDisponibilidade; 
create procedure atualizaDisponibilidade()
begin

truncate table fornecedor_estoque_historico_tmp;
truncate table pecas_tmp;

insert into fornecedor_estoque_historico_tmp
(fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,
origem,mostra_preco)
select 
fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
case
    when disponibilidade_id=1 then
        0
    when disponibilidade_id=2 then
        5
    when disponibilidade_id=3 then
        999
end as disponibilidade_id,
oferta,qtd,moeda_preco,preco,
origem,mostra_preco
from fornecedor_estoque_historico;

update      fornecedor_estoque_historico     as feh,
            fornecedor_estoque_historico_tmp as tmp 
set         feh.disponibilidade_id=tmp.disponibilidade_id
where       feh.pu       = tmp.pu;


insert into pecas_tmp
(partnumber,marca_id,puc,pu,moeda_preco,mostra_preco,preco,preco_fornecedor,
preco_fornecedor_id,disponibilidade_id,disponibilidade_fornecedor_id,oferta,tem_fornecedor,ts)
select 
partnumber,marca_id,puc,pu,moeda_preco,mostra_preco,preco,preco_fornecedor,preco_fornecedor_id,
case
    when disponibilidade_id=1 then
        0
    when disponibilidade_id=2 then
        5
    when disponibilidade_id=3 then
        999
end as disponibilidade_id,disponibilidade_fornecedor_id,oferta,tem_fornecedor,ts
from   pecas;

update      pecas     as pc,
            pecas_tmp as tmp 
set         pc.disponibilidade_id=tmp.disponibilidade_id
where       pc.pu       = tmp.pu;

truncate table fornecedor_estoque_historico_tmp;
truncate table pecas_tmp;

end;

call atualizaDisponibilidade();