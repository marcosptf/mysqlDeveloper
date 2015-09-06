/*****************************************************
  carga de pecas nas colunas p3 / p7 / p12 / p18  da tabela pecas    
*********************************************************/

call cargaPecasImpostoBrasil();

create procedure cargaPecasImpostoBrasil()
begin

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
 
end;
