/*******************************************************************
*@author:Marcos Paulo
*@since:21/02/2013
*@task:querys para carga de dados da csn
*@desc:
********************************************************************/
ids de proposta separados:
12918
12919
12920
12921
12922
12923
12924
12937
12938


select * from rpm_cargas.zmmc0037_fe01_rol_limpa group by item order by item asc;
select * from rpm_cargas.cotacao_import;
select * from rpm_cargas.cotacao_itens_import;
select * from rpm_cargas.cotacao_itens;
select * from rpm_cargas.linha_cotacao_import;
select * from rpm_cargas.linha_cotacao;

########subideira#######################################
select * from rpm_cargas.cotacao       where cotacao_id  = '12938';
select * from rpm_cargas.cotacao_itens where cotacao_id  = '12938';
select * from rpm_cargas.linha_cotacao where cotacao_id  = '12938';
########################################################

#update      rpm_cargas.zmmc0037_fe01_rol_limpa
#set         partnumber  =   (select limpaPARTNUMBER(partnumber)),
#            pu          =   (select geraPU(limpaPARTNUMBER(pu))), 
#            marca_id    =    (select encontraMarcaID(marca));
select * from rpm_cargas.zmmc0037_fe01_rol_limpa where marca_id is null;

delete from rpm_cargas.cotacao              where cotacao_id  = '12938';
delete from rpm_cargas.cotacao_itens        where cotacao_id  = '12938';
delete from rpm_cargas.linha_cotacao        where cotacao_id  = '12938';
delete from rpm_cargas.linha_resposta       where proposta_id = '12938';
delete from rpm_cargas.cotacao_itens_import where cotacao_id  = '12938';
delete from rpm_cargas.linha_cotacao_import where cotacao_id  = '12938';



/* carga da tabela cotacao */
insert into     rpm_cargas.cotacao(
                cotacao_id, 
                cotacao_id_site, 
                cotacao_codigo, 
                nome, 
                contato, 
                telefone, 
                email, 
                pais, 
                uf, 
                destino, 
                imposto, 
                suframa, 
                icms_suframa, 
                ipi_suframa, 
                cnpj, 
                aceita_importacao, 
                ip, 
                usuario, 
                status, 
                data_cadastro, 
                usuario_cadastro, 
                origem, 
                origem_info, 
                nota, 
                data_receb, 
                itens_recencia1, 
                itens_recencia2, 
                itens_recencia3, 
                prioridade, 
                prioridade_novo, 
                data_transferencia, 
                carga_id
)
select      
                '12938', 
                cotacao_id_site, 
                cotacao_codigo, 
                nome, 
                contato, 
                telefone, 
                email, 
                pais, 
                uf, 
                destino, 
                imposto, 
                suframa, 
                icms_suframa, 
                ipi_suframa, 
                cnpj, 
                aceita_importacao, 
                ip, 
                usuario, 
                status, 
                data_cadastro, 
                usuario_cadastro, 
                origem, 
                origem_info, 
                'cotacao gerada da tabela => rpm_cargas.zmmc0037_fe01_rol_limpa', 
                data_receb, 
                itens_recencia1, 
                itens_recencia2, 
                itens_recencia3, 
                prioridade, 
                prioridade_novo, 
                data_transferencia, 
                '27'
from            rpm_cargas.cotacao_import;


/* carga itens import  */
INSERT INTO     rpm_cargas.cotacao_itens_import(
                cotacao_id, 
                cotacao_id_site, 
                item_id, 
                item_dentro_catalogo, 
                item_partnumber, 
                pu, 
                item_marca, 
                item_marca_id, 
                item_qtd, 
                item_obs, 
                ultilizacao,
                carga_id 
)
SELECT          
                '12938',
                id, 
                item, 
                material, 
                partnumber, 
                pu, 
                marca, 
                marca_id, 
                qtd, 
                concat(obs,' - ',regra), 
                utilizacao,
                '27'
FROM            rpm_cargas.zmmc0037_fe01_rol_limpa
group by        item
order by        item asc;



INSERT INTO     rpm_cargas.linha_cotacao_import(
                cotacao_id, 
                item_id, 
                pu, 
                partnumber, 
                marca_id, 
                marca, 
                qtde_item_cotacao, 
                obs,  
                carga_id
)
SELECT          
                '12938',
                item, 
                pu, 
                partnumber, 
                marca_id, 
                marca, 
                qtd, 
                concat(obs,' - ',regra), 
                '27'
FROM            rpm_cargas.zmmc0037_fe01_rol_limpa
where           id not in(
                select      id
                from        rpm_cargas.zmmc0037_fe01_rol_limpa as dados2
                group by    item
                order by    item asc
);


/* carga da tabela cotacao_itens  */
replace into     rpm_cargas.cotacao_itens(
                cotacao_id, 
                cotacao_id_site, 
                item_id, 
                item_dentro_catalogo, 
                item_partnumber, 
                pu, 
                item_peca_id, 
                item_marca, 
                item_marca_id, 
                item_qtd, 
                item_obs, 
                status_id, 
                data_cadastro, 
                marcas_aceitas, 
                dispon_imediata, 
                dispon_dez_dias, 
                dispon_trinta_dias, 
                dispon_cem_dias, 
                date_difer, 
                grupo_data_recencia, 
                moeda_preco, 
                moeda_id, 
                mostra_preco, 
                preco, 
                preco_fornecedor_id, 
                disponibilidade_id, 
                disponibilidade_fornecedor_id, 
                oferta, 
                tem_fornecedor, 
                prioridade, pais, 
                uf, 
                tipo_imposto, 
                imposto, 
                data_transferencia, 
                ultilizacao, 
                carga_id
)
select 
                '12938', 
                cotacao_id_site, 
                item_id, 
                item_dentro_catalogo, 
                item_partnumber, 
                pu, 
                item_peca_id, 
                item_marca, 
                item_marca_id, 
                item_qtd, 
                item_obs, 
                status_id, 
                data_cadastro, 
                marcas_aceitas, 
                dispon_imediata, 
                dispon_dez_dias, 
                dispon_trinta_dias, 
                dispon_cem_dias, 
                date_difer, 
                grupo_data_recencia, 
                moeda_preco, 
                moeda_id, 
                mostra_preco, 
                preco, 
                preco_fornecedor_id, 
                disponibilidade_id, 
                disponibilidade_fornecedor_id, 
                oferta, 
                tem_fornecedor, 
                prioridade, 
                pais, 
                uf, 
                tipo_imposto, 
                imposto, 
                data_transferencia, 
                ultilizacao,
                '27'            
from            rpm_cargas.cotacao_itens_import
where           pu is not null
and             pu !='';



/* carga tabela rpm_cargas.linha_cotacao  */
replace into     rpm_cargas.linha_cotacao(
                cotacao_id, 
                item_id, 
                linha_cotacao_resposta_id, 
                pu, 
                partnumber, 
                marca_id, 
                marca, 
                qtde_item_cotacao, 
                disponibilidade, 
                preco, 
                ipi, 
                moeda_preco, 
                obs, 
                timestamp, 
                fornecedor_id, 
                nome_fornecedor, 
                empresa, 
                lucro_mdd, 
                lucro_rpm, 
                carga_id
)
select 
                '12938', 
                item_id, 
                linha_cotacao_resposta_id, 
                pu, 
                partnumber, 
                marca_id, 
                marca, 
                qtde_item_cotacao, 
                disponibilidade, 
                preco, 
                ipi, 
                moeda_preco, 
                obs, 
                timestamp, 
                fornecedor_id, 
                nome_fornecedor, 
                empresa, 
                lucro_mdd, 
                lucro_rpm, 
                '27'
from        rpm_cargas.linha_cotacao_import;



/* carga tabela rpm_cargas.proposta */
replace into     rpm_cargas.proposta(
                proposta_id, 
                proposta_cod, 
                revisao, 
                nome, 
                contato, 
                telefone, 
                email, 
                pais, 
                uf, 
                destino, 
                imposto, 
                suframa, 
                icms_suframa, 
                ipi_suframa, 
                cnpj, 
                aceita_importacao, 
                usuario, 
                status, 
                data_cadastro, 
                usuario_cadastro, 
                nota
)
select      
                '12938', 
                cotacao_id_site, 
                '0001', 
                nome, 
                contato, 
                telefone, 
                email, 
                pais, 
                uf, 
                destino, 
                imposto, 
                suframa, 
                icms_suframa, 
                ipi_suframa, 
                cnpj, 
                aceita_importacao, 
                usuario, 
                status, 
                data_cadastro, 
                usuario_cadastro, 
                nota
from            rpm_cargas.cotacao;



/* carga tabela rpm_cargas.proposta_itens */
replace into     rpm_cargas.proposta_itens(
                proposta_id, 
                revisao, 
                item_id, 
                item_partnumber, 
                pu, 
                item_marca, 
                item_marca_id, 
                item_qtd, 
                item_obs, 
                data_cadastro, 
                marcas_aceitas, 
                moeda_preco, 
                preco, 
                preco_fornecedor_id, 
                disponibilidade, 
                oferta, 
                pais, 
                uf, 
                imposto
)
select          
                '12938', 
                '0001', 
                item_id, 
                item_partnumber, 
                pu, 
                item_marca, 
                item_marca_id, 
                item_qtd, 
                item_obs, 
                data_cadastro, 
                marcas_aceitas, 
                moeda_preco, 
                preco, 
                preco_fornecedor_id, 
                disponibilidade_id,
                oferta, 
                pais, 
                uf, 
                imposto
from            rpm_cargas.cotacao_itens;



/* carga tabela rpm_cargas.linha_resposta */
replace INTO     rpm_cargas.linha_resposta(
                proposta_id, 
                revisao, 
                item_id, 
                pu, 
                partnumber, 
                marca_id, 
                qtde_item_cotacao, 
                disponibilidade, 
                preco, 
                moeda_preco, 
                obs
)
select          
                '12938', 
                '0001', 
                item_id, 
                pu,
                item_partnumber,
                item_marca_id,
                item_qtd, 
                disponibilidade_id, 
                preco, 
                moeda_preco, 
                item_obs
from            rpm_cargas.cotacao_itens;




/* carga linha resposta */
replace into    rpm_cargas.linha_resposta(
                proposta_id, 
                revisao, 
                item_id, 
                pu, 
                partnumber, 
                marca_id, 
                qtde_item_cotacao, 
                disponibilidade, 
                preco, 
                ipi, 
                moeda_preco, 
                obs, 
                timestamp, 
                fornecedor_id, 
                nome_fornecedor
)
SELECT          
                '12938', 
                '0001',
                item_id, 
                pu, 
                partnumber, 
                marca_id, 
                qtde_item_cotacao, 
                disponibilidade, 
                preco, 
                ipi, 
                moeda_preco, 
                obs, 
                timestamp, 
                fornecedor_id, 
                nome_fornecedor
FROM            rpm_cargas.linha_cotacao;












/* querys para vincular fornecedores que são masi proximos dos itens solicitados pelo cliente */
UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12918;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12919;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12920;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12921;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12922;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12923;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12924;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12937;

UPDATE 		fornecedores_COTF AS cf,
		cotacao_itens     AS ci
SET 		cf.vinculado='1'
WHERE 		cf.proposta_id=ci.cotacao_id
AND 		cf.marca_id   =ci.item_marca_id
AND             cf.pu         =ci.pu
AND             cf.proposta_id=12938;


SELECT 		COUNT(*) 
FROM 		fornecedores_COTF 
WHERE 		proposta_id IN (
		12918,
		12919,
		12920,
		12921,
		12922,
		12923,
		12924,
		12937,
		12938
)
AND 		vinculado='1';

SELECT * FROM cotacao_negocio WHERE cotacao_id  IN (
		12918,
		12919,
		12920,
		12921,
		12922,
		12923,
		12924,
		12937,
		12938
)
GROUP BY cotacao_id;



/* update para setar todas as propostas para empresa2 (RPM) para sair na geracao do CSV */
UPDATE		linha_resposta 
SET		empresa='2'
WHERE 		proposta_id IN (
		12918,
		12919,
		12920,
		12921,
		12922,
		12923,
		12924,
		12937,
		12938
);

alter table rpm_homolex.cotacao_itens add ultilizacao varchar(25) after data_transferencia;
