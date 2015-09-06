################################################################################
#####################====>Pendencias / atrasos ou em andamento<====#############
################################################################################
<nao subiram/faltam terminar programacao/a tarefa das telas do Cotf e subidas parker entraram na frente como maior prioridade>
118-Nova regra de exibição de prazos no site
126-Apresentar no rpmbearings preço de exportação para itens de fornecedores no BR


+Concluidas:



+Em aguardo:
1.Nova estrutura de BD para especificações e imagens <email respondido>
2.Comandos (linha de comando) para geração de dump do controlex para ser acionado diariamente, com rotação semanal. <email respondido>
3.desenvolver estrutura BD para o Validador <email respondido>


+Em Desenvolvimento:


3.migracao de toda a programacao php/mysql para obedecer a nova estrutura de FEH; 
->alterar todos os caminhos que porventura venham realizar includes ou chamadas de rotinas do controlex
atualiza_prioridade_usuario.php
atualiza_status.php
rc_inter.php
smarty/templates/home_admin.tpl
smarty/templates/relativo.tpl
smarty/templates/relativo.tpl


->alterar conexao com banco para develex && alterar todo o sistema para que use apenas um arquivo de conn.php
includes/conn.php
includes/db_cfg.php
atualiza_prioridade_usuario.php
atualiza_status.php


->levantamento de todos os arquivos que estao usando o preco.class-vx.php e migra-los para preco.class-v5.php


->levantar todos os arquivos que contenham querys que necessite de migracao FEH



1.subir os precos corretos da Samech <1/2 hr para subida>;
2.item 126, exibir preco da exportacao no site <3 hr de MySql para adaptar a programacao do site>
4.migracao da pecas_peso => pecas_especificacao <1/2 hr de MySql>




-Bugs Urgentes:



+Ainda não iniciadas:
1.Estrutura de BD para propostas enviadas; 
2.Otimização da estrutura de BD para propostas;
3.Adaptação de programação e tela de detalhes dos sites para novo BD de especificaçoes e imagens <(depois que for aprovada a pecas_imagens)>
4.realizar migracao de function do php mysql => mysqli;
5.desenhar uma tela para o validador <após a aprovacao da estrutura MySql>;
6.unificar todas as conexoes com banco do controlex no /conn


+Bugs:
-o calculo de preco nacional esta com problemas no metodo Preco::getLucroRpmPresumido();
pq o valor esta saindo mais barato que o valor de compra, isto ocorre quando colocamos a getTabela lucro com 27%, quando calculamos com 40% isto nao acontece;
-precisamos urgentemente fazer uma interface html para a carga de itens no site pois isto esta estremamente trabalhoso, complexo e da margem para erros manuais;
-o preco dos produtos da marca 202 estão com problemas e estao mais caros que o normal.



+procedimento executando quando precisa voltar a linha de resposta da cotacao:
delete from proposta          where proposta_id='11355';
delete from proposta_itens    where proposta_id='11355';
delete from linha_resposta    where proposta_id='11355';
delete from fornecedores_COTF where proposta_id='11355';



            ----------------------------
<<existem marca_id=0 na pecas da nuvem>>
74-Geração de PU e PUC em FEH
1.Rotina para cálculo de preços de venda e lucro por PU/MARCA_ID E FORNECEDOR_ID para ser chamada quando um preço é atualizado via CotF, por exemplo. Trigger ?
2.Como fazer para dar carga em Pecas sem dar truncate?
3.Rotina para atualizar PU e MARCA_ID em Pecas.Trigger? 
4.automação das cargas de itens ao site;

<inserir codigos do gAds no jsNinja urgente!>
<baixar as musicas dos adols>
<converter>

Tarefas em andamento:


+Prontas para subir:


+Desenvolvimento:


+Pendentes:
-atualizar os itens de destaque para o site de ingles;
-corrigir todos os itens do site;
-botão comprar do site;


+Quase prontos:

alter table fornecedor_estoque_historico add m7_custo_tot_inter_brl decimal(10,2) default 0 after m5_custo_tot_inter_brl;
alter table fornecedor_estoque_historico add mdd_m7_vv_unit_brl decimal(10,2) default 0 after mdd_m5_vv_unit_brl;
alter table fornecedor_estoque_historico add rpm_m7_vv_unit_7_brl decimal(10,2) default 0 after rpm_m5_vv_unit_18_brl;
alter table fornecedor_estoque_historico add rpm_m7_vv_unit_12_brl decimal(10,2) default 0 after rpm_m5_vv_unit_7_brl;
alter table fornecedor_estoque_historico add rpm_m7_vv_unit_18_brl decimal(10,2) default 0 after rpm_m5_vv_unit_12_brl;
alter table fornecedor_estoque_historico add mdd_m7_lucro_tot_brl decimal(10,2) default 0 after mdd_m5_lucro_tot_brl;
alter table fornecedor_estoque_historico add rpm_m7_lucro_tot_7_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_7_brl;
alter table fornecedor_estoque_historico add rpm_m7_lucro_tot_12_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_12_brl;
alter table fornecedor_estoque_historico add rpm_m7_lucro_tot_18_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_18_brl;
alter table fornecedor_estoque_historico add m7_custo_tot_imp_brl decimal(10,2) default 0 after m5_custo_tot_imp_brl;
alter table fornecedor_estoque_historico add m7_disponibilidade decimal(10,2) default 0 after m5_disponibilidade;

alter table fornecedores_COTF add m7_custo_tot_inter_brl decimal(10,2) default 0 after m5_custo_tot_inter_brl;
alter table fornecedores_COTF add mdd_m7_vv_unit_brl decimal(10,2) default 0 after mdd_m5_vv_unit_brl;
alter table fornecedores_COTF add rpm_m7_vv_unit_7_brl decimal(10,2) default 0 after rpm_m5_vv_unit_18_brl;
alter table fornecedores_COTF  add rpm_m7_vv_unit_12_brl decimal(10,2) default 0 after rpm_m5_vv_unit_7_brl;
alter table fornecedores_COTF  add rpm_m7_vv_unit_18_brl decimal(10,2) default 0 after rpm_m5_vv_unit_12_brl;
alter table fornecedores_COTF  add mdd_m7_lucro_tot_brl decimal(10,2) default 0 after mdd_m5_lucro_tot_brl;
alter table fornecedores_COTF  add rpm_m7_lucro_tot_7_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_7_brl;
alter table fornecedores_COTF  add rpm_m7_lucro_tot_12_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_12_brl;
alter table fornecedores_COTF  add rpm_m7_lucro_tot_18_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_18_brl;
alter table fornecedores_COTF  add m7_custo_tot_imp_brl decimal(10,2) default 0 after m5_custo_tot_imp_brl;
alter table fornecedores_COTF  add m7_disponibilidade decimal(10,2) default 0 after m5_disponibilidade;

################################################################################
#####################====>Melhorias futuras<====################################
################################################################################

+ Inserir trigger para as rotinas de guardar a cotação entre as tabelas:
- cesta_cotacao
- cotacao_itens
- cotacao
- cotacao_log

+ Corrigir erro em produção:
-http://www.rpmdobrasil.com.br/rolamentos/marcas <ñ aparece imagem>




################################################################################
#####################====>Para subir<====#######################################
################################################################################


/**********************************************************
* @autor:Marcos Paulo
* @since:14/06/2012
* @desc :Busca de fornecedores
*Alterações para que o resultado de Busca por Fornecedores do Controle funcionem corretamente na nova estrutura:
***********************************************************/
1)Usar marca_id como chave no lugar do nome da marca na tabela fornecedor_marca. Apagar o campo Marca após isso.
a coluna marca_id ja existe, mas só falta apagar a coluna marca;

2)Inserir campo fornecedor_id na tabela fornecedor_marca e trazer os ids respectivos da tabela fornecedor. Apagar o campo Empresa após isso. 
alter table fornecedor_marca add fornecedor_id int(4);
update      fornecedor_marca as fm,
            fornecedor       as fd
set         fm.fornecedor_id = fd.fornecedor_id
where       lower(fd.nome)   = lower(fm.Empresa);
select * from fornecedor_marca;
/* alter table fornecedor_marca drop empresa; */


3)Incluir campo qualificador de Distribuidor de uma determinada marca (tinyint 1 de for_lf_marca) na tabela fornecedor_marca e importar esta informação de for_lf_marca
select * from for_lf_marca;
alter table fornecedor_marca add distribuidor int(1) default 0 not null;
update      fornecedor_marca as fm,
            for_lf_marca     as lf
set         fm.distribuidor  = lf.dist
where       lower(lf.marca)  = lower(fm.marca)
and         lf.dist>0;
select * from fornecedor_marca where distribuidor > 0;

4)Trazer os fornecedores por marca (pesquisa específica em Busca de fornecedores) na ordem de quantidade de peças que tem na FEH (ultimo=1), 
colocando a info de "(Distribuidor)" quando o fornecedor for distribuidor daquela marca (isso vem da tabela fornecedor_marca, depois das alterações 1 a 3 acima).
feito



5)Incluir campo Lote (Tinyint 1 de for_lf_marca) e trazer a info de lá (0= não é loteiro; 1=é loteiro) e garantir que o 
último bloco da pesquisa em Busca de fornecedores esteja trazendo estes registros (primeiro critério de ordenação é o Lote ASC). 
Apresentar a info "(#registros)(Lote)" ao lado do nome do fornecedor nos resultados de busca. 
select * from for_lf_marca where lote=true;
alter table fornecedor_marca add loteiro tinyint(1) default 0 not null;

update      fornecedor_marca as fm,
            for_lf_marca     as lf
set         fm.loteiro          = 1
where       lf.lote=true;
select * from fornecedor_marca where loteiro=1;


+ Arquivos:





################################################################################
#####################====>Em Desenvolvimento<====###############################
################################################################################
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



/*******************************************************************
*@author:Marcos Paulo
*@since:21/02/2013
*@task:192 - Inserir campo para cálculo geral de preço de venda na tela de análise de proposta
*@desc:
********************************************************************/
/smarty/templates/cont_cotf_bb.tpl
/js/postAjax.js
/ajax/salvaDadosConcorrente.js
/classes/acoes_proposta_class_03.php

CREATE TABLE `concorrente_preco` (
  `pu` varchar(150) NOT NULL DEFAULT '',
  `marca_id` int(7) NOT NULL,
  `historico_id` int(5) NOT NULL,
  `moeda_id` varchar(5) DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `usuario_id` int(2) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  `proposta_id` int(11) DEFAULT NULL,
  `revisao` int(4) DEFAULT NULL,
  `item_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`pu`,`marca_id`,`historico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

alter table  fornecedores_COTF add vinculado_recalculo_preco int(1) default 0 after vinculado;




/*******************************************************************************/

truncate table rpm_cargas.cargaestoque;
truncate table rpm_cargas.fornecedor_estoque_historico;
truncate table rpm_cargas.pecas;
truncate table rpm_cargas.pecas_produto;

insert into rpm_cargas.cargaestoque(
        partnumber, 
        pu, 
        puc, 
        marca_id, 
        fornecedor_id, 
        moeda_id, 
        tipo_produto_id, 
        carga_id, 
        preco_unitario_sem_imposto, 
        preco_unitacao_com_imposto, 
        ipi, 
        icms, 
        desconto, 
        peso, 
        quantidade, 
        descricao
)
select
        partnumber, 
        pu, 
        puc,        
        marca_id, 
        fornecedor_id, 
        moeda_preco_id, 
        '82',
        '28',
        preco_simp,
        (((aliquota_ipi/100) * (preco_simp)) + preco_simp),         
        aliquota_ipi,
        `aliquota ICMS`, 
        '',
        '',
        qtd, 
        ''
from    rpm_homolex.import_picard;

INSERT INTO rpm_cargas.fornecedor_estoque_historico(
fornecedor_id, marca_id,marca_origem,pu,data_cotacao, puc, partnumber, disponibilidade_id, oferta,mostra_preco, qtd, moeda_preco_id,preco_simp,preco,aliquota_ipi,obs,carga_id,ultimo)
SELECT 
fornecedor_id,marca_id,marca_id as marca_origem,pu,current_timestamp,puc,partnumber,1,0,1,quantidade,moeda_id,preco_unitario_sem_imposto,preco_unitario_sem_imposto,'0.00',descricao,carga_id,1
FROM rpm_cargas.cargaestoque;



select              * 
from                fornecedores_COTF 
where               proposta_id='12612' 
and                 (vinculado is null or vinculado=0 or vinculado<1)
and                 preco > 1
group by            pu,marca_id 
order by            l3 desc; 

select * from fornecedores_COTF where proposta_id='12612' and vinculado='1';

update          fornecedores_COTF
set             vinculado                   = 0,
                vinculado_recalculo_preco   = 0
where           proposta_id                 = '12612';









/*******************************************************************
*@author:Marcos Paulo
*@since:21/02/2013
*@task:upload estoque - homolex
*@desc:
********************************************************************/

arquivos:
/index.php
/templates/menu_adm.tpl
/templates/uploadEstoque.tpl
/classes/uploadEstoque.class.php
/js/uploadEstoque.class.js
/ajax/uploadEstoque.php



/*******************************************************************
*@author:Marcos Paulo
*@since:21/02/2013
*@task:178 - Incluir um novo status "Aguardando Follow-up"
*@desc:
********************************************************************/
Novos estatus:

a) "Enviado - Ag. Follow up"
- apenas Administradores podem selecionar este status
- Uma vez selecionado, o campo "followup" (a ser criado na tabela cotacao_notas) das notas já existentes desta cotação são atualizados para o valor "1".
- Operador não poderá acessar a tela de análise das cotações de prioridade inferiores à prioridade da maior cotação em aberto, em atendimento ou aguardando followup. 
Isto é, o status "Enviado- Ag. Follow up" terá um comportamento semelhante às cotações de status "em Aberto" e "em Atendimento" para efeito da regra de bloqueio da tela de análise.

b) "Enviado- Follow up feito"
- o operador só poderá alterar o status para "Enviado - Follow up feito" quando houverem novos comentários (campo "followup"=1) para esta cotação.
- Adminstrador pode trocar de status a qq momento em qq condição.
Administrator 2/21/2013 9:09 AM
O novo campo "followup" na tabela "cotacao_notas" deve receber o valor zero (0) por default para as novas notas.
Administrator 2/21/2013 9:12 AM


erros corrigidos=>
- Permite a alteração pra "Aberto, atendimento, enviado, cancelado, ped, aguard fornecedo" sem ter cadastrado um followup
- Esta bloqueando todas as cotações em aberto com prioridade = ou > em relação aquela que esta com o status "Aguardando follow-up"

insert into cotacao_status(status)values('Aguardando Follow-up');
insert into cotacao_status(status)values('Follow-up Feito');

arquivos alterados:
templates/cont_painel_cotacao.tpl
templates/detalhes_cotacao.tpl
templates/js/cotacao_dados.js
class/cotacao_class_01.php
class/cotacao_itens_class_01.php
ajax/cotacao_dados_ajax.php
ajax/nota_dados_ajax.php
ajax/status_atrib_ajax.php
js/gerais_cont_painel.js
js/status_atrib.js



/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração da regra de disponibilidade
*@desc:
********************************************************************/

ALTER TABLE global_conf ADD prazo_importacao_m5    INT(3) NULL AFTER prazo_importacao_m4;
ALTER TABLE global_conf ADD prazo_importacao_m1_en INT(3) NULL AFTER prazo_importacao_m5;
ALTER TABLE global_conf ADD prazo_importacao_m2_en INT(3) NULL AFTER prazo_importacao_m1_en;
ALTER TABLE global_conf ADD prazo_importacao_m3_en INT(3) NULL AFTER prazo_importacao_m2_en;
ALTER TABLE global_conf ADD prazo_importacao_m4_en INT(3) NULL AFTER prazo_importacao_m3_en;
ALTER TABLE global_conf ADD prazo_importacao_m5_en INT(3) NULL AFTER prazo_importacao_m4_en;
select      prazo_importacao_m1,
            prazo_importacao_m2,
            prazo_importacao_m3,
            prazo_importacao_m4,
            prazo_importacao_m5,
            prazo_importacao_m1_en,
            prazo_importacao_m2_en,
            prazo_importacao_m3_en,
            prazo_importacao_m4_en,
            prazo_importacao_m5_en 
from        global_conf;
select * from metodos_importacao;

truncate table metodos_importacao;
insert into metodos_importacao(id,metodo)values(1,'BBI 25~30 Preco FOB');
insert into metodos_importacao(id,metodo)values(2,'BBI 25~30 Peso');
insert into metodos_importacao(id,metodo)values(3,'BBI 7~10 Peso');
insert into metodos_importacao(id,metodo)values(4,'POMPEIA');
insert into metodos_importacao(id,metodo)values(5,'Albrecht DHL');
insert into metodos_importacao(id,metodo)values(6,'DHL 5');
select * from metodos_importacao;

update global_conf set prazo_importacao_m4='30';
update global_conf set prazo_importacao_m5='10';
update global_conf set prazo_importacao_m4_en='30';
update global_conf set prazo_importacao_m5_en='10';
select * from global_conf;

m4 = "25 a 30 dias"
para itens com forn. no exterior e com peso até 28 kilos  exibir prazo de "5 a 10 dias" ( DHL5 );

select disponibilidade_id from pecas group by disponibilidade_id;


/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:importacao DHL
*@desc:
********************************************************************/
alter table paises add dhl_zona int(1) not null;


update paises set dhl_zona=7 where sigla_pais='AF';
update paises set dhl_zona=6 where sigla_pais='AL';
update paises set dhl_zona=7 where sigla_pais='DZ';
update paises set dhl_zona=7 where sigla_pais='AS';
update paises set dhl_zona=5 where sigla_pais='AD';
update paises set dhl_zona=7 where sigla_pais='AO';
update paises set dhl_zona=3 where sigla_pais='AI';
update paises set dhl_zona=3 where sigla_pais='AG';
update paises set dhl_zona=1 where sigla_pais='AR';
update paises set dhl_zona=6 where sigla_pais='AM';
update paises set dhl_zona=3 where sigla_pais='AW';
update paises set dhl_zona=6 where sigla_pais='AU';
update paises set dhl_zona=5 where sigla_pais='AT';
update paises set dhl_zona=6 where sigla_pais='AZ';
update paises set dhl_zona=3 where sigla_pais='BS';
update paises set dhl_zona=6 where sigla_pais='BH';
update paises set dhl_zona=6 where sigla_pais='BD';
update paises set dhl_zona=3 where sigla_pais='BB';
update paises set dhl_zona=6 where sigla_pais='BY';
update paises set dhl_zona=5 where sigla_pais='BE';
update paises set dhl_zona=3 where sigla_pais='BZ';
update paises set dhl_zona=7 where sigla_pais='BJ';
update paises set dhl_zona=3 where sigla_pais='BM';
update paises set dhl_zona=7 where sigla_pais='BT';
update paises set dhl_zona=3 where sigla_pais='BO';
update paises set dhl_zona=3 where sigla_pais='XB';
update paises set dhl_zona=6 where sigla_pais='BA';
update paises set dhl_zona=7 where sigla_pais='BW';
update paises set dhl_zona=0 where sigla_pais='BR';
update paises set dhl_zona=6 where sigla_pais='BN';
update paises set dhl_zona=6 where sigla_pais='BG';
update paises set dhl_zona=7 where sigla_pais='BF';
update paises set dhl_zona=7 where sigla_pais='MM';
update paises set dhl_zona=7 where sigla_pais='BI';
update paises set dhl_zona=6 where sigla_pais='KH';
update paises set dhl_zona=7 where sigla_pais='CM';
update paises set dhl_zona=2 where sigla_pais='CA';
update paises set dhl_zona=7 where sigla_pais='IC';
update paises set dhl_zona=7 where sigla_pais='CV';
update paises set dhl_zona=7 where sigla_pais='GU';
update paises set dhl_zona=3 where sigla_pais='KY';
update paises set dhl_zona=7 where sigla_pais='CF';
update paises set dhl_zona=7 where sigla_pais='TD';
update paises set dhl_zona=1 where sigla_pais='CL';
update paises set dhl_zona=4 where sigla_pais='CN';
update paises set dhl_zona=6 where sigla_pais='AU';
update paises set dhl_zona=6 where sigla_pais='AU';
update paises set dhl_zona=3 where sigla_pais='CO';
update paises set dhl_zona=7 where sigla_pais='KM';
update paises set dhl_zona=7 where sigla_pais='CG';
update paises set dhl_zona=7 where sigla_pais='CD';
update paises set dhl_zona=7 where sigla_pais='CK';
update paises set dhl_zona=3 where sigla_pais='CR';
update paises set dhl_zona=7 where sigla_pais='CI';
update paises set dhl_zona=6 where sigla_pais='HR';
update paises set dhl_zona=3 where sigla_pais='CU';
update paises set dhl_zona=3 where sigla_pais='XC';
update paises set dhl_zona=5 where sigla_pais='CY';
update paises set dhl_zona=6 where sigla_pais='TR';
update paises set dhl_zona=5 where sigla_pais='CZ';
update paises set dhl_zona=5 where sigla_pais='DK';
update paises set dhl_zona=7 where sigla_pais='DJ';
update paises set dhl_zona=3 where sigla_pais='DM';
update paises set dhl_zona=3 where sigla_pais='DO';
update paises set dhl_zona=7 where sigla_pais='TP';
update paises set dhl_zona=7 where sigla_pais='MH';
update paises set dhl_zona=3 where sigla_pais='EC';
update paises set dhl_zona=6 where sigla_pais='EG';
update paises set dhl_zona=5 where sigla_pais='IE';
update paises set dhl_zona=3 where sigla_pais='SV';
update paises set dhl_zona=7 where sigla_pais='GQ';
update paises set dhl_zona=5 where sigla_pais='GB';
update paises set dhl_zona=7 where sigla_pais='ER';
update paises set dhl_zona=5 where sigla_pais='EE';
update paises set dhl_zona=7 where sigla_pais='ET';
update paises set dhl_zona=6 where sigla_pais='FK';
update paises set dhl_zona=6 where sigla_pais='FO';
update paises set dhl_zona=7 where sigla_pais='FJ';
update paises set dhl_zona=5 where sigla_pais='FI';
update paises set dhl_zona=5 where sigla_pais='FR';
update paises set dhl_zona=3 where sigla_pais='GF';
update paises set dhl_zona=7 where sigla_pais='PF';
update paises set dhl_zona=7 where sigla_pais='GA';
update paises set dhl_zona=7 where sigla_pais='GM';
update paises set dhl_zona=6 where sigla_pais='GE';
update paises set dhl_zona=5 where sigla_pais='DE';
update paises set dhl_zona=7 where sigla_pais='GH';
update paises set dhl_zona=5 where sigla_pais='GI';
update paises set dhl_zona=5 where sigla_pais='GB';
update paises set dhl_zona=5 where sigla_pais='GR';
update paises set dhl_zona=6 where sigla_pais='GL';
update paises set dhl_zona=3 where sigla_pais='GD';
update paises set dhl_zona=3 where sigla_pais='GP';
update paises set dhl_zona=7 where sigla_pais='GU';
update paises set dhl_zona=3 where sigla_pais='GT';
update paises set dhl_zona=5 where sigla_pais='GG';
update paises set dhl_zona=7 where sigla_pais='GN';
update paises set dhl_zona=7 where sigla_pais='GW';
update paises set dhl_zona=7 where sigla_pais='GQ';
update paises set dhl_zona=3 where sigla_pais='GY';
update paises set dhl_zona=3 where sigla_pais='HT';
update paises set dhl_zona=3 where sigla_pais='HN';
update paises set dhl_zona=4 where sigla_pais='HK';
update paises set dhl_zona=5 where sigla_pais='HU';
update paises set dhl_zona=6 where sigla_pais='IS';
update paises set dhl_zona=6 where sigla_pais='IN';
update paises set dhl_zona=6 where sigla_pais='ID';
update paises set dhl_zona=7 where sigla_pais='IR';
update paises set dhl_zona=7 where sigla_pais='IQ';
update paises set dhl_zona=5 where sigla_pais='GB';
update paises set dhl_zona=5 where sigla_pais='IE';
update paises set dhl_zona=6 where sigla_pais='FK';
update paises set dhl_zona=5 where sigla_pais='GB';
update paises set dhl_zona=6 where sigla_pais='IL';
update paises set dhl_zona=5 where sigla_pais='IT';
update paises set dhl_zona=7 where sigla_pais='CI';
update paises set dhl_zona=3 where sigla_pais='JM';
update paises set dhl_zona=4 where sigla_pais='JP';
update paises set dhl_zona=5 where sigla_pais='JE';
update paises set dhl_zona=6 where sigla_pais='JO';
update paises set dhl_zona=7 where sigla_pais='KZ';
update paises set dhl_zona=7 where sigla_pais='KE';
update paises set dhl_zona=7 where sigla_pais='KI';
update paises set dhl_zona=7 where sigla_pais='KP';
update paises set dhl_zona=4 where sigla_pais='KR';
update paises set dhl_zona=6 where sigla_pais='KW';
update paises set dhl_zona=7 where sigla_pais='KG';
update paises set dhl_zona=6 where sigla_pais='LA';
update paises set dhl_zona=5 where sigla_pais='LV';
update paises set dhl_zona=6 where sigla_pais='LB';
update paises set dhl_zona=7 where sigla_pais='LS';
update paises set dhl_zona=7 where sigla_pais='LR';
update paises set dhl_zona=7 where sigla_pais='LY';
update paises set dhl_zona=5 where sigla_pais='LI';
update paises set dhl_zona=5 where sigla_pais='LT';
update paises set dhl_zona=6 where sigla_pais='AU';
update paises set dhl_zona=5 where sigla_pais='LU';
update paises set dhl_zona=6 where sigla_pais='MO';
update paises set dhl_zona=6 where sigla_pais='MK';
update paises set dhl_zona=7 where sigla_pais='MG';
update paises set dhl_zona=7 where sigla_pais='MH';
update paises set dhl_zona=7 where sigla_pais='MW';
update paises set dhl_zona=6 where sigla_pais='MY';
update paises set dhl_zona=7 where sigla_pais='MV';
update paises set dhl_zona=7 where sigla_pais='ML';
update paises set dhl_zona=5 where sigla_pais='MT';
update paises set dhl_zona=7 where sigla_pais='AS';
update paises set dhl_zona=7 where sigla_pais='MH';
update paises set dhl_zona=3 where sigla_pais='MQ';
update paises set dhl_zona=7 where sigla_pais='MR';
update paises set dhl_zona=7 where sigla_pais='MU';
update paises set dhl_zona=7 where sigla_pais='YT';
update paises set dhl_zona=2 where sigla_pais='MX';
update paises set dhl_zona=6 where sigla_pais='MD';
update paises set dhl_zona=5 where sigla_pais='MC';
update paises set dhl_zona=7 where sigla_pais='MN';
update paises set dhl_zona=6 where sigla_pais='ME';
update paises set dhl_zona=3 where sigla_pais='MS';
update paises set dhl_zona=7 where sigla_pais='MA';
update paises set dhl_zona=7 where sigla_pais='MZ';
update paises set dhl_zona=7 where sigla_pais='MM';
update paises set dhl_zona=7 where sigla_pais='NA';
update paises set dhl_zona=7 where sigla_pais='NR';
update paises set dhl_zona=7 where sigla_pais='NP';
update paises set dhl_zona=5 where sigla_pais='NL';
update paises set dhl_zona=3 where sigla_pais='XN';
update paises set dhl_zona=7 where sigla_pais='NC';
update paises set dhl_zona=6 where sigla_pais='NZ';
update paises set dhl_zona=3 where sigla_pais='NI';
update paises set dhl_zona=7 where sigla_pais='NE';
update paises set dhl_zona=7 where sigla_pais='NG';
update paises set dhl_zona=7 where sigla_pais='NU';
update paises set dhl_zona=6 where sigla_pais='AU';
update paises set dhl_zona=7 where sigla_pais='MP';
update paises set dhl_zona=5 where sigla_pais='NO';
update paises set dhl_zona=6 where sigla_pais='OM';
update paises set dhl_zona=6 where sigla_pais='PK';
update paises set dhl_zona=3 where sigla_pais='PA';
update paises set dhl_zona=7 where sigla_pais='PG';
update paises set dhl_zona=1 where sigla_pais='PY';
update paises set dhl_zona=3 where sigla_pais='PE';
update paises set dhl_zona=4 where sigla_pais='PH';
update paises set dhl_zona=5 where sigla_pais='PL';
update paises set dhl_zona=5 where sigla_pais='PT';
update paises set dhl_zona=3 where sigla_pais='PR';
update paises set dhl_zona=6 where sigla_pais='QA';
update paises set dhl_zona=7 where sigla_pais='RE';
update paises set dhl_zona=5 where sigla_pais='RO';
update paises set dhl_zona=7 where sigla_pais='GU';
update paises set dhl_zona=6 where sigla_pais='RU';
update paises set dhl_zona=7 where sigla_pais='RW';
update paises set dhl_zona=7 where sigla_pais='ZA';
update paises set dhl_zona=7 where sigla_pais='MP';
update paises set dhl_zona=7 where sigla_pais='WS';
update paises set dhl_zona=3 where sigla_pais='MQ';
update paises set dhl_zona=7 where sigla_pais='MR';
update paises set dhl_zona=7 where sigla_pais='MU';
update paises set dhl_zona=7 where sigla_pais='YT';
update paises set dhl_zona=2 where sigla_pais='MX';
update paises set dhl_zona=6 where sigla_pais='MD';
update paises set dhl_zona=5 where sigla_pais='MC';
update paises set dhl_zona=7 where sigla_pais='MN';
update paises set dhl_zona=6 where sigla_pais='ME';
update paises set dhl_zona=3 where sigla_pais='MS';
update paises set dhl_zona=7 where sigla_pais='MA';
update paises set dhl_zona=7 where sigla_pais='MZ';
update paises set dhl_zona=7 where sigla_pais='MM';
update paises set dhl_zona=7 where sigla_pais='NA';
update paises set dhl_zona=7 where sigla_pais='NR';
update paises set dhl_zona=7 where sigla_pais='NP';
update paises set dhl_zona=5 where sigla_pais='NL';
update paises set dhl_zona=3 where sigla_pais='XN';
update paises set dhl_zona=7 where sigla_pais='NC';
update paises set dhl_zona=6 where sigla_pais='NZ';
update paises set dhl_zona=3 where sigla_pais='NI';
update paises set dhl_zona=7 where sigla_pais='NE';
update paises set dhl_zona=7 where sigla_pais='NG';
update paises set dhl_zona=7 where sigla_pais='NU';
update paises set dhl_zona=6 where sigla_pais='AU';
update paises set dhl_zona=7 where sigla_pais='MP';
update paises set dhl_zona=5 where sigla_pais='NO';
update paises set dhl_zona=6 where sigla_pais='OM';
update paises set dhl_zona=6 where sigla_pais='PK';
update paises set dhl_zona=3 where sigla_pais='PA';
update paises set dhl_zona=7 where sigla_pais='PG';
update paises set dhl_zona=1 where sigla_pais='PY';
update paises set dhl_zona=3 where sigla_pais='PE';
update paises set dhl_zona=4 where sigla_pais='PH';
update paises set dhl_zona=5 where sigla_pais='PL';
update paises set dhl_zona=5 where sigla_pais='PT';
update paises set dhl_zona=3 where sigla_pais='PR';
update paises set dhl_zona=6 where sigla_pais='QA';
update paises set dhl_zona=7 where sigla_pais='RE';
update paises set dhl_zona=5 where sigla_pais='RO';
update paises set dhl_zona=7 where sigla_pais='GU';
update paises set dhl_zona=6 where sigla_pais='RU';
update paises set dhl_zona=7 where sigla_pais='RW';
update paises set dhl_zona=7 where sigla_pais='ZA';
update paises set dhl_zona=7 where sigla_pais='MP';
update paises set dhl_zona=7 where sigla_pais='WS';
update paises set dhl_zona=6 where sigla_pais='UZ';
update paises set dhl_zona=7 where sigla_pais='VU';
update paises set dhl_zona=3 where sigla_pais='VE';
update paises set dhl_zona=6 where sigla_pais='VN';
update paises set dhl_zona=3 where sigla_pais='VG';
update paises set dhl_zona=3 where sigla_pais='VI';
update paises set dhl_zona=5 where sigla_pais='GB';
update paises set dhl_zona=7 where sigla_pais='FJ';
update paises set dhl_zona=7 where sigla_pais='WS';
update paises set dhl_zona=7 where sigla_pais='YE';
update paises set dhl_zona=7 where sigla_pais='ZM';
update paises set dhl_zona=7 where sigla_pais='ZW';
select * from paises;
269
select (361-110) as counter;
select (269-251) as counter;

CREATE TABLE dhl( 
    peso_kg DECIMAL(7,2) NOT NULL,
    zona1 FLOAT(10,2) UNSIGNED NOT NULL,
    zona2 FLOAT(10,2) UNSIGNED NOT NULL,
    zona3 FLOAT(10,2) UNSIGNED NOT NULL,
    zona4 FLOAT(10,2) UNSIGNED NOT NULL,
    zona5 FLOAT(10,2) UNSIGNED NOT NULL,
    zona6 FLOAT(10,2) UNSIGNED NOT NULL,
    zona7 FLOAT(10,2) UNSIGNED NOT NULL,
    PRIMARY KEY (peso_kg)
);

select * from paises where (dhl_zona='' or dhl_zona is null) and dhl_zona>0;  

/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:criaçao da tabela metodo_pais
*@desc:
********************************************************************/
- criação e população de tabela "metodo_pais", com metodo_id e pais_id (numero iso) como chave primária. 
Métodos 1 a 3, pais é US (ver o ID dele). Método 4, popular com países da europa. 

select * from paises;

drop table if exists metodo_pais;
create table metodo_pais(
    pais_id   int(5) not null primary key,
    metodo_id int(5) not null primary key
);

/*realiza ca carga no metodo pais para o metodo 1 */
insert into metodo_pais
(pais_id,metodo_id)
select 
pai.iso_id,1
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       lower(fnd.pais_sigla) = 'us'
group by    pai.iso_id;

/*realiza ca carga no metodo pais para o metodo 2 */
insert into metodo_pais
(pais_id,metodo_id)
select 
pai.iso_id,2
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       lower(fnd.pais_sigla) = 'us'
group by    pai.iso_id;

/*realiza ca carga no metodo pais para o metodo 3 */
insert into metodo_pais
(pais_id,metodo_id)
select 
pai.iso_id,3
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       lower(fnd.pais_sigla) = 'us'
group by    pai.iso_id;

/*realiza ca carga no metodo pais para o metodo 4 */
insert into metodo_pais
(pais_id,metodo_id)
select 
pai.iso_id,4
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
and         lower(continente)     = 'european'
and         pai.iso_id is not null
group by    pai.iso_id;

select * from metodo_pais;




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Normalização da tabela FEH com a coluna de moeda_preco_id
*@desc:
********************************************************************/
update   fornecedor_estoque_historico
set      moeda_preco_id='BRL'
where    lower(moeda_preco)=' r$' 
or       lower(moeda_preco)='r$'
or       lower(moeda_preco)='real';

update   fornecedor_estoque_historico
set      moeda_preco_id='USD'
where    lower(moeda_preco)='dolar';

update   fornecedor_estoque_historico
set      moeda_preco_id='EUR'
where    lower(moeda_preco)='eur'
or       lower(moeda_preco)='euro';

update   fornecedor_estoque_historico
set      moeda_preco_id='GBP'
where    lower(moeda_preco)='libra';


/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:criar 3 view para exibir valores de nacinais, importacao US e importacao EUR;
*@desc:
********************************************************************/
create view fornecedoresBR as 
select  feh.fornecedor_id  ,
	pu  ,
	marca_id  ,
	historico_id  ,
	data_cotacao  ,
	puc  ,
	partnumber  ,
	disponibilidade_id  ,
	oferta  ,
	qtd  ,
	moeda_preco  ,
	preco ,
	p3 ,
	p7 ,
	p12 ,
	p18 ,
	l3 ,
	l7 ,
	l12 ,
	l18 ,
	margem_lucro ,
	vc_imp_bbi_25_30_fob ,
	vc_imp_bbi_25_30_peso ,
	vc_imp_bbi_7_10 ,
	vc_imp_alemanha ,
	preco_simp ,
	aliquota_ipi ,
	moeda_custo  ,
	moeda_custo_id ,
	moeda_preco_id ,
	custo ,
	frete ,
	frete_valor ,
	frete_tempo  ,
	usuario_id  ,
	contato_id  ,
	origem  ,
	mostra_preco  ,
	ultimo  ,
	m1_custo_tot_inter_brl ,
	m2_custo_tot_inter_brl ,
	m3_custo_tot_inter_brl ,
	m4_custo_tot_inter_brl ,
	mdd_m1_vv_unit_brl ,
	mdd_m2_vv_unit_brl ,
	mdd_m3_vv_unit_brl ,
	mdd_m4_vv_unit_brl ,
	rpm_m1_vv_unit_7_brl ,
	rpm_m1_vv_unit_12_brl ,
	rpm_m1_vv_unit_18_brl ,
	rpm_m2_vv_unit_7_brl ,
	rpm_m2_vv_unit_12_brl ,
	rpm_m2_vv_unit_18_brl ,
	rpm_m3_vv_unit_7_brl ,
	rpm_m3_vv_unit_12_brl ,
	rpm_m3_vv_unit_18_brl ,
	rpm_m4_vv_unit_7_brl ,
	rpm_m4_vv_unit_12_brl ,
	rpm_m4_vv_unit_18_brl ,
	mdd_m1_lucro_tot_brl ,
	mdd_m2_lucro_tot_brl ,
	mdd_m3_lucro_tot_brl ,
	mdd_m4_lucro_tot_brl ,
	rpm_m1_lucro_tot_7_brl ,
	rpm_m2_lucro_tot_7_brl ,
	rpm_m3_lucro_tot_7_brl ,
	rpm_m4_lucro_tot_7_brl ,
	rpm_m1_lucro_tot_12_brl ,
	rpm_m2_lucro_tot_12_brl ,
	rpm_m3_lucro_tot_12_brl ,
	rpm_m4_lucro_tot_12_brl ,
	rpm_m1_lucro_tot_18_brl ,
	rpm_m2_lucro_tot_18_brl ,
	rpm_m3_lucro_tot_18_brl ,
	rpm_m4_lucro_tot_18_brl ,
	m1_custo_tot_imp_brl ,
	m2_custo_tot_imp_brl ,
	m3_custo_tot_imp_brl ,
	m4_custo_tot_imp_brl ,
	m1_disponibilidade ,
	m2_disponibilidade ,
	m3_disponibilidade ,
	m4_disponibilidade ,
	peso_kg ,
	rpm_export_vv_unit_brl ,
	mdd_export_vv_unit_brl ,
	rpm_export_lucro_unit_brl ,
	mdd_export_lucro_unit_brl ,
	matriz_id  ,
	matriz_filial ,
	nome  ,
	tipo ,
	nome_fantasia ,
	razao_social ,
	cnpj ,
	insc_est ,
	endereco ,
	bairro ,
	cep ,
	uf,
	cidade ,
	pais_sigla ,
	site ,
	email ,
	email2 ,
	tratamento ,
	contato,
	cargo,
	ddd_tel,
	tel,
	ddd_fax,
	fax,
	central  ,
	t_origem ,
	t_origem_id ,
	aliquota_icms,
	tributacao
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       feh.preco>0
and         feh.qtd>0
and         feh.ultimo=1
and         lower(fnd.pais_sigla) = 'br';

create view fornecedoresUSA as 
select  feh.fornecedor_id  ,
	pu  ,
	marca_id  ,
	historico_id  ,
	data_cotacao  ,
	puc  ,
	partnumber  ,
	disponibilidade_id  ,
	oferta  ,
	qtd  ,
	moeda_preco  ,
	preco ,
	p3 ,
	p7 ,
	p12 ,
	p18 ,
	l3 ,
	l7 ,
	l12 ,
	l18 ,
	margem_lucro ,
	vc_imp_bbi_25_30_fob ,
	vc_imp_bbi_25_30_peso ,
	vc_imp_bbi_7_10 ,
	vc_imp_alemanha ,
	preco_simp ,
	aliquota_ipi ,
	moeda_custo  ,
	moeda_custo_id ,
	moeda_preco_id ,
	custo ,
	frete ,
	frete_valor ,
	frete_tempo  ,
	usuario_id  ,
	contato_id  ,
	origem  ,
	mostra_preco  ,
	ultimo  ,
	m1_custo_tot_inter_brl ,
	m2_custo_tot_inter_brl ,
	m3_custo_tot_inter_brl ,
	m4_custo_tot_inter_brl ,
	mdd_m1_vv_unit_brl ,
	mdd_m2_vv_unit_brl ,
	mdd_m3_vv_unit_brl ,
	mdd_m4_vv_unit_brl ,
	rpm_m1_vv_unit_7_brl ,
	rpm_m1_vv_unit_12_brl ,
	rpm_m1_vv_unit_18_brl ,
	rpm_m2_vv_unit_7_brl ,
	rpm_m2_vv_unit_12_brl ,
	rpm_m2_vv_unit_18_brl ,
	rpm_m3_vv_unit_7_brl ,
	rpm_m3_vv_unit_12_brl ,
	rpm_m3_vv_unit_18_brl ,
	rpm_m4_vv_unit_7_brl ,
	rpm_m4_vv_unit_12_brl ,
	rpm_m4_vv_unit_18_brl ,
	mdd_m1_lucro_tot_brl ,
	mdd_m2_lucro_tot_brl ,
	mdd_m3_lucro_tot_brl ,
	mdd_m4_lucro_tot_brl ,
	rpm_m1_lucro_tot_7_brl ,
	rpm_m2_lucro_tot_7_brl ,
	rpm_m3_lucro_tot_7_brl ,
	rpm_m4_lucro_tot_7_brl ,
	rpm_m1_lucro_tot_12_brl ,
	rpm_m2_lucro_tot_12_brl ,
	rpm_m3_lucro_tot_12_brl ,
	rpm_m4_lucro_tot_12_brl ,
	rpm_m1_lucro_tot_18_brl ,
	rpm_m2_lucro_tot_18_brl ,
	rpm_m3_lucro_tot_18_brl ,
	rpm_m4_lucro_tot_18_brl ,
	m1_custo_tot_imp_brl ,
	m2_custo_tot_imp_brl ,
	m3_custo_tot_imp_brl ,
	m4_custo_tot_imp_brl ,
	m1_disponibilidade ,
	m2_disponibilidade ,
	m3_disponibilidade ,
	m4_disponibilidade ,
	peso_kg ,
	rpm_export_vv_unit_brl ,
	mdd_export_vv_unit_brl ,
	rpm_export_lucro_unit_brl ,
	mdd_export_lucro_unit_brl ,
	matriz_id  ,
	matriz_filial ,
	nome  ,
	tipo ,
	nome_fantasia ,
	razao_social ,
	cnpj ,
	insc_est ,
	endereco ,
	bairro ,
	cep ,
	uf,
	cidade ,
	pais_sigla ,
	site ,
	email ,
	email2 ,
	tratamento ,
	contato,
	cargo,
	ddd_tel,
	tel,
	ddd_fax,
	fax,
	central  ,
	t_origem ,
	t_origem_id ,
	aliquota_icms,
	tributacao
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       feh.preco>0
and         feh.qtd>0
and         feh.ultimo=1
and         lower(fnd.pais_sigla) = 'us';

create view fornecedoresEUR as 
select  feh.fornecedor_id  ,
	pu  ,
	marca_id  ,
	historico_id  ,
	data_cotacao  ,
	puc  ,
	partnumber  ,
	disponibilidade_id  ,
	oferta  ,
	qtd  ,
	moeda_preco  ,
	preco ,
	p3 ,
	p7 ,
	p12 ,
	p18 ,
	l3 ,
	l7 ,
	l12 ,
	l18 ,
	margem_lucro ,
	vc_imp_bbi_25_30_fob ,
	vc_imp_bbi_25_30_peso ,
	vc_imp_bbi_7_10 ,
	vc_imp_alemanha ,
	preco_simp ,
	aliquota_ipi ,
	moeda_custo  ,
	moeda_custo_id ,
	moeda_preco_id ,
	custo ,
	frete ,
	frete_valor ,
	frete_tempo  ,
	usuario_id  ,
	contato_id  ,
	origem  ,
	mostra_preco  ,
	ultimo  ,
	m1_custo_tot_inter_brl ,
	m2_custo_tot_inter_brl ,
	m3_custo_tot_inter_brl ,
	m4_custo_tot_inter_brl ,
	mdd_m1_vv_unit_brl ,
	mdd_m2_vv_unit_brl ,
	mdd_m3_vv_unit_brl ,
	mdd_m4_vv_unit_brl ,
	rpm_m1_vv_unit_7_brl ,
	rpm_m1_vv_unit_12_brl ,
	rpm_m1_vv_unit_18_brl ,
	rpm_m2_vv_unit_7_brl ,
	rpm_m2_vv_unit_12_brl ,
	rpm_m2_vv_unit_18_brl ,
	rpm_m3_vv_unit_7_brl ,
	rpm_m3_vv_unit_12_brl ,
	rpm_m3_vv_unit_18_brl ,
	rpm_m4_vv_unit_7_brl ,
	rpm_m4_vv_unit_12_brl ,
	rpm_m4_vv_unit_18_brl ,
	mdd_m1_lucro_tot_brl ,
	mdd_m2_lucro_tot_brl ,
	mdd_m3_lucro_tot_brl ,
	mdd_m4_lucro_tot_brl ,
	rpm_m1_lucro_tot_7_brl ,
	rpm_m2_lucro_tot_7_brl ,
	rpm_m3_lucro_tot_7_brl ,
	rpm_m4_lucro_tot_7_brl ,
	rpm_m1_lucro_tot_12_brl ,
	rpm_m2_lucro_tot_12_brl ,
	rpm_m3_lucro_tot_12_brl ,
	rpm_m4_lucro_tot_12_brl ,
	rpm_m1_lucro_tot_18_brl ,
	rpm_m2_lucro_tot_18_brl ,
	rpm_m3_lucro_tot_18_brl ,
	rpm_m4_lucro_tot_18_brl ,
	m1_custo_tot_imp_brl ,
	m2_custo_tot_imp_brl ,
	m3_custo_tot_imp_brl ,
	m4_custo_tot_imp_brl ,
	m1_disponibilidade ,
	m2_disponibilidade ,
	m3_disponibilidade ,
	m4_disponibilidade ,
	peso_kg ,
	rpm_export_vv_unit_brl ,
	mdd_export_vv_unit_brl ,
	rpm_export_lucro_unit_brl ,
	mdd_export_lucro_unit_brl ,
	matriz_id  ,
	matriz_filial ,
	nome  ,
	tipo ,
	nome_fantasia ,
	razao_social ,
	cnpj ,
	insc_est ,
	endereco ,
	bairro ,
	cep ,
	uf,
	cidade ,
	pais_sigla ,
	site ,
	email ,
	email2 ,
	tratamento ,
	contato,
	cargo,
	ddd_tel,
	tel,
	ddd_fax,
	fax,
	central  ,
	t_origem ,
	t_origem_id ,
	aliquota_icms,
	tributacao
from        fornecedor_estoque_historico as feh
left join   fornecedor                   as fnd on feh.fornecedor_id=fnd.fornecedor_id  
left join   paises                       as pai on fnd.pais_sigla=pai.sigla_pais
where       feh.preco>0
and         feh.qtd>0
and         feh.ultimo=1
and         lower(continente)     = 'european';





/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:ordenação da busca de pecas no site
*@desc:
********************************************************************/

/****************************************************
*criacao e carga da coluna quantidade da tabela pecas
*****************************************************/
alter table pecas add quantidade int default 0;
update   pecas as pc,
         fornecedor_estoque_historico as feh
set      pc.quantidade=feh.qtd
where    pc.pu        =feh.pu
and      pc.marca_id  =feh.marca_id;
select * from pecas;


/****************************************************
*criação da novas colunas 
-origem 'F'=>fornecedor 'C'=>catalogo
-origem_id => historico_id
-data_cotacao => armazena a ultima data de cadstro daquele pu/marca_id
-deletar a tem_fornecedor
*****************************************************/
alter table pecas add  origem        char(1)   default 'C';
alter table pecas add  origem_id     int(4)    default 0;
alter table pecas add  data_cadastro date      default null;
-- alter table pecas drop tem_fornecedor;
select * from pecas;

/* versão 2 da carga de tabela pecas */
select cargaTabelaPecas();






/**********************************************************
* @autor:Marcos Paulo
* @since:20/06/2012
* @desc :Botão Comprar
***********************************************************/
+ Pendencias:
-Alterar a trigger da FEH para trazer as novas colunas de preço;

Necessidades:

1) Atualizar preços dos itens de venda nacional, importação, exportação, back to back.
    Neste caso, o preço de venda deve ser calculado com base na margem de lucro tabelada, para cada caso (Venda pela RPM, Venda pela MDD).
    Além do preço, os lucros correspondentes tb devem ser calculados.
    
    // parametros passados
    // parametros retornados/disponibilizados

2) Recalcular Lucros, Margens, Custos com base nos preços de venda e outras variáveis sugeridos pela equipe de venda.
    
    // parametros passados
    // parametros retornados/disponibilizados



+MySql:
call cargaPrecoImposto();
cargaPrecoImposto.sql


+ Tabelas:
select * from pecas where preco>0;
select * from pecas group by moeda_preco;
select trim(lower(moeda_preco)),moeda_id from pecas group by moeda_preco;
select * from fornecedor_estoque_historico group by moeda_preco;
select distinct(moeda_preco) from fornecedor_estoque_historico;
select distinct(moeda_preco) from oferta;
select distinct(moeda_custo) from oferta;
select * from cesta_cotacao order by data_cadastro desc;
select * from cotacao_itens;

select * from tipo_moeda;

alter table fornecedor_estoque_historico add moeda_id int after moeda_preco;
alter table pecas add moeda_id int after moeda_preco;
alter table cesta_cotacao add moeda_id int after moeda_preco;
alter table cotacao_itens add moeda_id int after moeda_preco;


update  pecas
set     moeda_id='1'
where   trim(lower(moeda_preco))='r$';

update  fornecedor_estoque_historico
set     moeda_id='1'
where   trim(lower(moeda_preco))='r$'
or      trim(lower(moeda_preco))='real';

update  fornecedor_estoque_historico
set     moeda_id='2'
where   trim(lower(moeda_preco))='dolar';

update  fornecedor_estoque_historico
set     moeda_id='3'
where   trim(lower(moeda_preco))='euro'
or      trim(lower(moeda_preco))='eur';

update  fornecedor_estoque_historico
set     moeda_id='4'
where   trim(lower(moeda_preco))='libra';

select * from fornecedor_estoque_historico;

alter table fornecedor_estoque_historico add ultimo int(1) default 0 not null;
alter table fornecedor_estoque_historico add m1_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_custo_tot_inter_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m1_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_vv_unit_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m1_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_lucro_tot_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_lucro_tot_7_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_lucro_tot_12_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m1_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_lucro_tot_18_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m1_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_custo_tot_imp_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m1_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m2_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m3_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add m4_disponibilidade decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_export_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_export_vv_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_export_lucro_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_export_lucro_unit_brl decimal(10,2) default 0;
alter table fornecedor_estoque_historico add peso_kg decimal(10,2) default 0;


alter table fornecedor_estoque_historico add m5_custo_tot_inter_brl decimal(10,2) default 0 after m4_custo_tot_inter_brl;
alter table fornecedor_estoque_historico add mdd_m5_vv_unit_brl decimal(10,2) default 0 after mdd_m4_vv_unit_brl;
alter table fornecedor_estoque_historico add rpm_m5_vv_unit_7_brl decimal(10,2) default 0 after rpm_m4_vv_unit_18_brl;
alter table fornecedor_estoque_historico add rpm_m5_vv_unit_12_brl decimal(10,2) default 0 after rpm_m5_vv_unit_7_brl;
alter table fornecedor_estoque_historico add rpm_m5_vv_unit_18_brl decimal(10,2) default 0 after rpm_m5_vv_unit_12_brl;
alter table fornecedor_estoque_historico add mdd_m5_lucro_tot_brl decimal(10,2) default 0 after mdd_m4_lucro_tot_brl;
alter table fornecedor_estoque_historico add rpm_m5_lucro_tot_7_brl decimal(10,2) default 0 after rpm_m4_lucro_tot_7_brl;
alter table fornecedor_estoque_historico add rpm_m5_lucro_tot_12_brl decimal(10,2) default 0 after rpm_m4_lucro_tot_12_brl;
alter table fornecedor_estoque_historico add rpm_m5_lucro_tot_18_brl decimal(10,2) default 0 after rpm_m4_lucro_tot_18_brl;
alter table fornecedor_estoque_historico add m5_custo_tot_imp_brl decimal(10,2) default 0 after m4_custo_tot_imp_brl;
alter table fornecedor_estoque_historico add m5_disponibilidade decimal(10,2) default 0 after m4_disponibilidade;


alter table fornecedores_COTF add m7_custo_tot_inter_brl decimal(10,2) default 0 after m5_custo_tot_inter_brl;
alter table fornecedores_COTF add mdd_m7_vv_unit_brl decimal(10,2) default 0 after mdd_m5_vv_unit_brl;
alter table fornecedores_COTF add rpm_m7_vv_unit_7_brl decimal(10,2) default 0 after rpm_m5_vv_unit_18_brl;
alter table fornecedores_COTF  add rpm_m7_vv_unit_12_brl decimal(10,2) default 0 after rpm_m5_vv_unit_7_brl;
alter table fornecedores_COTF  add rpm_m7_vv_unit_18_brl decimal(10,2) default 0 after rpm_m5_vv_unit_12_brl;
alter table fornecedores_COTF  add mdd_m7_lucro_tot_brl decimal(10,2) default 0 after mdd_m5_lucro_tot_brl;
alter table fornecedores_COTF  add rpm_m7_lucro_tot_7_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_7_brl;
alter table fornecedores_COTF  add rpm_m7_lucro_tot_12_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_12_brl;
alter table fornecedores_COTF  add rpm_m7_lucro_tot_18_brl decimal(10,2) default 0 after rpm_m5_lucro_tot_18_brl;
alter table fornecedores_COTF  add m7_custo_tot_imp_brl decimal(10,2) default 0 after m5_custo_tot_imp_brl;
alter table fornecedores_COTF  add m7_disponibilidade decimal(10,2) default 0 after m5_disponibilidade;






alter table fornecedor_estoque_historico add mdd_m1_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m2_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m3_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m4_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add mdd_m5_custo_imp decimal(10,2) default 0 after mdd_m4_custo_imp;
alter table fornecedor_estoque_historico add rpm_m1_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m2_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m3_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m4_custo_imp decimal(10,2) default 0;
alter table fornecedor_estoque_historico add rpm_m5_custo_imp decimal(10,2) default 0 after rpm_m4_custo_imp;

ALTER TABLE fornecedor_estoque_historico ADD carga_id INT(5) UNSIGNED;

CREATE TABLE `Carga` (
  `carga_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(250) DEFAULT NULL,
  `data_carga` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`carga_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE global_conf ADD prazo_importacao_m1 INT(3) NULL AFTER comissao_ernest;
ALTER TABLE global_conf ADD prazo_importacao_m2 INT(3) NULL AFTER prazo_importacao_m1;
ALTER TABLE global_conf ADD prazo_importacao_m3 INT(3) NULL AFTER prazo_importacao_m2;
ALTER TABLE global_conf ADD prazo_importacao_m4 INT(3) NULL AFTER prazo_importacao_m3;
ALTER TABLE global_conf ADD prazo_importacao_m5 INT(3) NULL AFTER prazo_importacao_m4;

update  fornecedor_estoque_historico as feh,
        pecas_peso                   as pps
set     feh.peso_kg  = pps.peso_KG
where   feh.pu       = pps.pu
and     feh.marca_id = pps.marca_id;
select * from fornecedor_estoque_historico where preco>0 and ultimo=1; 

alter table pecas add p3_disponibilidade decimal(10,2) default 0 after p3;
alter table pecas add p3_fornecedor_id   decimal(10,2) default 0 after p3_disponibilidade;
alter table pecas add p7_disponibilidade decimal(10,2) default 0 after p7;
alter table pecas add p7_fornecedor_id   decimal(10,2) default 0 after p7_disponibilidade;
select * from pecas;

alter table pecas add p7_min decimal(10,2) default 0 after p7;
alter table fornecedor_estoque_historico drop p3_min;
alter table fornecedor_estoque_historico drop p7_min;
alter table fornecedor_estoque_historico drop p12_min;
alter table fornecedor_estoque_historico drop p18_min;


CREATE TABLE `cotacao` (
  `cotacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `cotacao_codigo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `contato` varchar(255) NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `uf` varchar(20) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `imposto` varchar(255) NOT NULL,
  `suframa` varchar(3) NOT NULL,
  `icms_suframa` decimal(10,2) NOT NULL,
  `ipi_suframa` decimal(10,2) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `aceita_importacao` varchar(3) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `usuario` int(2) unsigned NOT NULL,
  `status` int(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `usuario_cadastro` int(2) unsigned DEFAULT '0',
  `origem` varchar(255) DEFAULT NULL,
  `origem_info` varchar(255) DEFAULT NULL,
  `nota` text,
  `data_receb` datetime DEFAULT NULL,
  `itens_recencia1` int(5) DEFAULT '0',
  `itens_recencia2` int(5) DEFAULT '0',
  `itens_recencia3` int(5) DEFAULT '0',
  `prioridade` char(1) DEFAULT NULL,
  `prioridade_novo` int(1) DEFAULT NULL,
  PRIMARY KEY (`cotacao_id`),
  KEY `i1` (`data_cadastro`),
  KEY `i2` (`usuario`,`status`,`data_cadastro`)
) ENGINE=MyISAM AUTO_INCREMENT=4726 DEFAULT CHARSET=utf8;

+ Levantamento de arquivos para alteração para normalização de banco de dados:
ajax/cesta_cotacao_ajax.php
classes/cesta_cotacao_class_01.php
ajax/cotacao_dados_ajax.php
index.php
form_cotacao.php
filtro.php
classes/preco_class.php
rc_classes/peca_class_04_rc.inc
ajax/valorImpostoDetalhesAjax.php

controlex/ajax/cotacao_fornecedor_ajax.php
controlex/classes/cot_f_class.php
controlex/ajax/cotf_dados_ajax.php
controlex/ajax/cotacao_dados_ajax.php

CREATE TABLE `metodos_importacao` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `metodo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `metodos_importacao` (`id`, `metodo`)
VALUES
 (1, 'BBI 25-30 Preço FOB'),
 (2, 'BBI 25-30 Peso'),
 (3, 'BBI 7-10 Peso'),
 (4, 'Pompeia');


DROP TABLE IF EXISTS `tipo_moeda`;
CREATE TABLE `tipo_moeda` (
  `moeda_id` char(3) NOT NULL DEFAULT '',
  `nome` varchar(50) NOT NULL,
  `simbolo` char(5) NOT NULL,
  PRIMARY KEY (`moeda_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
LOCK TABLES `tipo_moeda` WRITE;
INSERT INTO `tipo_moeda` (`moeda_id`, `nome`, `simbolo`)
VALUES
('BRL','Real','R$'),
('USD','Dolar','US$'),
('EUR','Euro','€'),
('GBP','Libra','£');
select * from tipo_moeda;

select * from fornecedor_estoque_historico;
select * from pecas;


ALTER TABLE fornecedor_estoque_historico ADD moeda_custo_id DECIMAL(10,2) AFTER moeda_custo;
ALTER TABLE fornecedor_estoque_historico ADD moeda_preco_id DECIMAL(10,2) AFTER moeda_custo_id;

select * from global_conf;

drop table global_conf;
create table global_conf(
    i_federal_lucro_nacional        decimal(10,4),
    i_federal_lucro_internacional   decimal(10,4),
    i_federal_simples_nacional      decimal(10,4),
    i_federal_simples_internacional decimal(10,4),
    icms_venda_rpm                  decimal(10,4),
    icms_compra_bbi                 decimal(10,4),
    pickup_bbi                      decimal(10,4),
    valor_nota_bbi                  decimal(10,4),
    taxa_servico_bbi                decimal(10,2),
    taxa_peso_07_a_10_bbi           decimal(10,4),
    taxa_peso_25_a_30_bbi           decimal(10,4),
    taxa_peso_albrecht_bbi          decimal(10,4),
    ipi_bbi                         decimal(10,4),
    taxa_dolar                      decimal(10,4),
    taxa_euro                       decimal(10,4),
    taxa_libra                      decimal(10,4),
    taxa_cambio                     decimal(10,4),
    icms_compra_albrecht            decimal(10,4),
    pickup_pompeia                  decimal(10,4),
    comissao_ernest                 decimal(10,4)
);



insert into global_conf
            (i_federal_lucro_nacional,
            i_federal_lucro_internacional,
            i_federal_simples_nacional,
            i_federal_simples_internacional,
            icms_venda_rpm,
            icms_compra_bbi,pickup_bbi,
            valor_nota_bbi,
            taxa_servico_bbi,
            taxa_peso_07_a_10_bbi,
            taxa_peso_25_a_30_bbi,
            taxa_peso_albrecht_bbi,
            ipi_bbi,
            taxa_dolar,
            taxa_euro,
            taxa_libra,
            taxa_cambio,
            icms_compra_albrecht,
            pickup_pompeia,
            comissao_ernest)
values
            ('0.06',
            '0.04',
            '0.09',
            '0.06',
            '0.18',
            '0.18',
            '50.00',
            '0.30',
            '1.8',
            '75.00',
            '32.00',
            '40.00',
            '0.12',
            '2.20',
            '2.90',
            '3.30',
            '50.00',
            '0.03',
            '70.00',
            '0.1');

select * from  global_conf;







CREATE PROCEDURE cargaTabelaPecasPeso()
BEGIN


CREATE TABLE IF NOT EXISTS pecas_peso_tmp(
pu              VARCHAR(100) DEFAULT NULL,
marca_id        INT(6) UNSIGNED NOT NULL,
peso_KG         DECIMAL(11,6),
peso_LB         DECIMAL(11,6),
data_cadastro   TIMESTAMP DEFAULT NOW(),
origem          VARCHAR(255),
PRIMARY KEY (pu,marca_id)
);

UPDATE  pecas_peso_1 AS pp
SET     pp.ultimo=1
WHERE   pp.pu IN (
 SELECT     pc.pu
 FROM       pecas_peso_tmp AS pc
 WHERE      pp.pu=pc.pu
 AND        pp.marca_id=pc.marca_id
 GROUP BY   pc.pu,pc.marca_id 
 ORDER BY   pc.data_cadastro
);

INSERT INTO pecas_peso_tmp
(pu,marca_id,peso_KG,peso_LB,origem)
SELECT
partnumber_unico,323,(REPLACE(valor,',','.') * 2.20462262),(REPLACE(valor,',','.')),'Sistema: robo Consolidated'
FROM    aux_consolidated_produto_specs
WHERE   LOWER(especificacao)='wgt. lbs';

INSERT INTO pecas_peso_tmp
(pu,marca_id,peso_KG,peso_LB,origem)
SELECT
partnumber_unico,marca_id,(REPLACE(valor,',','.')),(REPLACE(valor,',','.') * 0.45359237),'Sistema: robo Medias'
FROM    aux_medias_produto_specs
WHERE LOWER(especificacao)='m (kg)';

INSERT INTO pecas_peso_tmp
(pu,marca_id,peso_KG,peso_LB,origem)
SELECT
partnumber_unico,111,(REPLACE(valor,',','.')),(REPLACE(valor,',','.') * 0.45359237),'Sistema: robo SKF'
FROM    aux_produto_specs
WHERE LOWER(especificacao)='massa(kg)';

END;

select * from aux_consolidated_produto_specs;
select * from aux_medias_produto_specs;
select * from aux_produto_specs;


subir tabela paises do homologa;

alter table pecas add p3  decimal(10,2) after preco;
alter table pecas add p7  decimal(10,2) after p3;
alter table pecas add p12 decimal(10,2) after p7;
alter table pecas add p18 decimal(10,2) after p12;
alter table pecas add f_id_simples  decimal(10,2) after p18;
alter table pecas add f_id_lucro  decimal(10,2) after f_id_simples;
select * from pecas;

alter table fornecedor_estoque_historico add p3  decimal(10,2) after preco;
alter table fornecedor_estoque_historico add p7  decimal(10,2) after p3;
alter table fornecedor_estoque_historico add p12 decimal(10,2) after p7;
alter table fornecedor_estoque_historico add p18 decimal(10,2) after p12;
alter table fornecedor_estoque_historico add l3  decimal(10,2) after p18;
alter table fornecedor_estoque_historico add l7  decimal(10,2) after l3;
alter table fornecedor_estoque_historico add l12 decimal(10,2) after l7;
alter table fornecedor_estoque_historico add l18 decimal(10,2) after l12;
alter table fornecedor_estoque_historico add margem_lucro decimal(10,2) after l18;
alter table fornecedor_estoque_historico add vc_imp_bbi_25_30_fob decimal(10,2) after margem_lucro;
alter table fornecedor_estoque_historico add vc_imp_bbi_25_30_peso decimal(10,2) after vc_imp_bbi_25_30_fob;
alter table fornecedor_estoque_historico add vc_imp_bbi_7_10 decimal(10,2) after vc_imp_bbi_25_30_peso;
alter table fornecedor_estoque_historico add vc_imp_alemanha decimal(10,2) after vc_imp_bbi_7_10;     
alter table fornecedor_estoque_historico add frete_bbi float(10,2) after vc_imp_alemanha;
alter table fornecedor_estoque_historico add frete_albrecht float(10,2) after frete_bbi;
select * from fornecedor_estoque_historico limit 10;  


/**********************************************************
* @autor:Sidnei Cerqueira
* @since:14/06/2012
* @desc :novas colunas para atualizar itens do CotF
***********************************************************/
ALTER TABLE fornecedor_estoque_historico ADD frete VARCHAR( 3 ) COLLATE utf8_general_ci NULL AFTER custo;
ALTER TABLE fornecedor_estoque_historico ADD frete_valor DECIMAL( 10,2 ) COLLATE utf8_general_ci NULL AFTER frete;
ALTER TABLE fornecedor_estoque_historico ADD frete_tempo INT( 3 ) COLLATE utf8_general_ci NULL AFTER frete_valor;
ALTER TABLE fornecedor_estoque_historico ADD obs text COLLATE utf8_general_ci NULL AFTER mostra_preco;

#valor do dollar em real
http://download.finance.yahoo.com/d/quotes.csv?s=USDBRL=X&f=sl1d1t1c1ohgv&e=.csv

#valor do Euro em real
http://download.finance.yahoo.com/d/quotes.csv?s=EURBRL=X&f=sl1d1t1c1ohgv&e=.csv

#valor do Real Brasileiro
#valor do Dolar Americano
#valor do Euro
#valor da Libra Britânica 
#comentarios e observações 

drop table cotacaoMoeda;
create table cotacaoMoeda(
    dataCotacaoMoeda    timestamp not null default now() primary key,
    valorBRL            decimal(10,2), 
    valorUSD            decimal(10,2), 
    valorEUR            decimal(10,2), 
    valorGPB            decimal(10,2), 
    observacoes         varchar(255)   
);
select * from wedelhas_homolog.cotacaoMoeda;
truncate table cotacaoMoeda;

update fornecedor set tributacao=0;    
update fornecedor_estoque_historico set aliquota_ipi=0;    
alter table fornecedor modify tributacao decimal(10,2);
alter table fornecedor drop sigla_pais;

alter table cesta_cotacao add pais varchar(55);
alter table cesta_cotacao add uf   char(2);
alter table cesta_cotacao add imposto integer;
alter table cesta_cotacao add tipo_imposto integer;
select * from cesta_cotacao order by data_cadastro desc

alter table cotacao_itens add pais varchar(55);
alter table cotacao_itens add uf   char(2);
alter table cotacao_itens add imposto decimal(10,2);
alter table cotacao_itens add tipo_imposto integer;
select * from cotacao_itens order by data_cadastro desc;

#carga de dados na coluna de icms da tabela de fornecedor
update fornecedor as fnd
set    fnd.aliquota_icms=(
       select         icms_compra                      
       from           estados as est       
       where          fnd.uf=est.uf
);


/*****************************************************
  carga de pecas nas colunas p3 / p7 / p12 / p18      
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

select preco,p3,p7,p12,p18 from pecas where preco>0;





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








/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Trigger Mysql na tabela pecas
*@desc:trigger para dar carga na tabela pecas toda vez que houver uma alteraï¿½ï¿½o de dados 
*nas tabelas fornecedor_estoque_historico e catalogo
********************************************************************/
CREATE TRIGGER atualizaPecasTriggerFEHInsert AFTER INSERT ON fornecedor_estoque_historico
FOR EACH ROW
BEGIN
        if  new.marca_id >0 and new.puc <> '' then           

            replace into pecas
            set     partnumber         = new.partnumber,
                    marca_id           = new.marca_id,
                    puc                = new.puc,
                    pu                 = new.pu;                    
            call cargaTabelaPecasTrigger(new.pu,new.marca_id);

        end if;  
END;



CREATE TABLE `fornecedor_duplicado` (
  `fornecedor_id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `matriz_id` int(7) unsigned NOT NULL,
  `matriz_filial` char(1) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  `nome_fantasia` varchar(250) DEFAULT '',
  `razao_social` varchar(250) DEFAULT '',
  `cnpj` varchar(20) DEFAULT '',
  `insc_est` varchar(50) DEFAULT '',
  `endereco` varchar(250) DEFAULT '',
  `bairro` varchar(250) DEFAULT '',
  `cep` varchar(50) DEFAULT '',
  `uf` varchar(10) DEFAULT '',
  `cidade` varchar(250) DEFAULT '',
  `pais_sigla` varchar(50) NOT NULL,
  `site` varchar(250) DEFAULT '',
  `email` varchar(250) DEFAULT NULL,
  `email2` varchar(250) DEFAULT NULL,
  `tratamento` varchar(20) DEFAULT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `ddd_tel` varchar(10) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `ddd_fax` varchar(10) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `central` varchar(255) DEFAULT NULL,
  `t_origem` varchar(250) DEFAULT '',
  `t_origem_id` varchar(50) DEFAULT '',
  `obs` text,
  `aliquota_icms` decimal(10,2) DEFAULT NULL,
  `tributacao` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`fornecedor_id`),
  UNIQUE KEY `pais_sigla` (`pais_sigla`,`fornecedor_id`),
  KEY `fornecedor` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=544 DEFAULT CHARSET=utf8$$



[15:37:57] Renato J. Carvalho: delimiter $$

CREATE TABLE `fornecedor_estoque_historico_duplicado` (
  `fornecedor_id` int(4) unsigned NOT NULL,
  `pu` varchar(100) NOT NULL DEFAULT '',
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) NOT NULL AUTO_INCREMENT,
  `data_cotacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `puc` varchar(100) DEFAULT NULL,
  `partnumber` varchar(100) NOT NULL,
  `disponibilidade_id` int(1) unsigned DEFAULT NULL,
  `oferta` int(1) unsigned DEFAULT NULL,
  `qtd` int(11) unsigned DEFAULT NULL,
  `moeda_preco` varchar(10) DEFAULT NULL,
  `preco` decimal(12,2) NOT NULL,
  `p3` decimal(10,2) DEFAULT NULL,
  `p7` decimal(10,2) DEFAULT NULL,
  `p12` decimal(10,2) DEFAULT NULL,
  `p18` decimal(10,2) DEFAULT NULL,
  `l3` decimal(10,2) DEFAULT NULL,
  `l7` decimal(10,2) DEFAULT NULL,
  `l12` decimal(10,2) DEFAULT NULL,
  `l18` decimal(10,2) DEFAULT NULL,
  `margem_lucro` decimal(10,2) DEFAULT NULL,
  `vc_imp_bbi_25_30_fob` decimal(10,2) DEFAULT NULL,
  `vc_imp_bbi_25_30_peso` decimal(10,2) DEFAULT NULL,
  `vc_imp_bbi_7_10` decimal(10,2) DEFAULT NULL,
  `vc_imp_alemanha` decimal(10,2) DEFAULT NULL,
  `preco_simp` decimal(10,2) DEFAULT NULL,
  `aliquota_ipi` decimal(6,2) DEFAULT NULL,
  `moeda_custo` varchar(10) DEFAULT NULL,
  `moeda_custo_id` decimal(10,2) DEFAULT NULL,
  `moeda_preco_id` decimal(10,2) DEFAULT NULL,
  `custo` decimal(12,2) DEFAULT NULL,
  `frete` varchar(3) DEFAULT NULL,
  `frete_valor` decimal(10,2) DEFAULT NULL,
  `frete_tempo` int(3) DEFAULT NULL,
  `usuario_id` int(3) DEFAULT NULL,
  `contato_id` int(11) DEFAULT NULL,
  `origem` varchar(100) DEFAULT NULL,
  `mostra_preco` int(1) unsigned DEFAULT '0',
  `obs` text,
  `ultimo` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fornecedor_id`,`pu`,`marca_id`,`historico_id`),
  KEY `i2` (`ultimo`,`fornecedor_id`),
  KEY `i1` (`pu`,`marca_id`,`ultimo`,`partnumber`,`puc`),
  KEY `i3` (`partnumber`,`fornecedor_id`,`marca_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8$$







+ Arquivos:
smarty/templates/filtro_resultados.tpl
smarty/templates/filtro_detalhe.tpl
smarty/templates/boxFiltro.tpl
smarty/templates/cotacao.tpl
js/boxes_imposto.js
classes/preco.class.php
classes/cesta_cotacao_class_01.php
classes/cotacao_items_class_01.php
rc_classes/peca_class_04_rc.inc
ajax/valorImpostoDetalhesAjax.php
ajax/cesta_cotacao_ajax.php
ajax/salvaQtdeCarrinho.php
cron/atualizaValoresMoeda.php
/cotacaoMoeda <com permisao de escrita de preferencia 777>
filtro.php
form_cotacao.php
index.php

-->foi adicionado impostos por item
/controlex/index.php
/controlex/cad_cotacao.php
/controlex/smarty/templates/cad_cota.tpl
/controlex/classes/cotacao_itens_class_01.php

Marcos:
- desenvolver a função de cálculo de lucro a partir da planilha. Usar o algoritmo abaixo como modelo, fazer os demais e implementar em PHP.
- estou vendo o algoritmo para desenvolver uma função de calculo do valor de venda a partir da margem do lucro.






################################################################################
#####################====>Para Homologar<====###################################
################################################################################
/**********************************************************
* @autor:Marcos Paulo
* @since:14/06/2012
* @desc :nova coluna puc na tabela catalogo_pecas_historico
* ñ esta dando carga, pois esta com problema de chave
***********************************************************/
drop table catalogo_pecas_historico;

CREATE TABLE `catalogo_pecas_historico` (
  `catalogo_id` int(4) unsigned NOT NULL,
  `pu` varchar(255) DEFAULT NULL,   
  `puc` varchar(255) DEFAULT NULL,   
  `marca_id` int(6) unsigned NOT NULL,
  `historico_id` int(4) unsigned NOT NULL AUTO_INCREMENT,  
  `partnumber` varchar(100) NOT NULL,
  `catalogo_tipo` varchar(1) NOT NULL,
  data_cadastro  timestamp not null DEFAULT now(),
  PRIMARY KEY (`catalogo_id`,`pu`,`marca_id`,`historico_id`)
) ENGINE=MyISAM AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;

truncate table catalogo_pecas_historico;
select cargaTabelaCPH();
select * from catalogo_pecas_historico;

drop function cargaTabelaCPH;
CREATE FUNCTION cargaTabelaCPH()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

insert into `catalogo_pecas_historico` 
(`catalogo_id`,`marca_id`,`pu`,puc,`partnumber`,`catalogo_tipo`)
select 
oferta.fornecedor_id,marca_id,partnumber_unico,
replace((replace((replace(partnumber_unico,' ','')),'-','')),'/','') as puc,
referencia,'C'
from oferta
join fornecedor on fornecedor.fornecedor_id=oferta.fornecedor_id
where fornecedor.tipo='C'
group by marca_id,partnumber_unico
order by data_insercao desc;

set dados   = "Tabela catalogo_pecas_historico Atualizada!";
	  
RETURN dados;
end;



+ Arquivos:







/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:inserir grid de catalogo na busca dde fornecedores       <corrigido>
********************************************************************/
+ Arquivos:




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:corrigir bug no controlex (skype)                        <corrigido> 
********************************************************************/
+ Arquivos:




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:Busca de fornecedores ainda lê info de tabelas da estrutura antiga <corrigido>
********************************************************************/
+ Arquivos:
















################################################################################
#####################====>já subido em produção<====############################
################################################################################
Marcos:
(Manhã)
- criação e população de tabela "metodo_pais", com metodo_id e pais_id (numero iso) como chave primária. Métodos 1 a 3, pais é US (ver o ID dele). Método 4, popular com países da europa.===>true
- atualizar como mostra_preço = 1 para os itens subidos nos ultimos 2 dias de ec_certo e ec_certo2.===>true
- carregar itens na FEH > Pecas.(passarei a relação) para atualização no site.===>continue
- verificar rotina de alteração de imposto na visualização de resultados do site. Não está funcionando.
(Tarde) 
- instalar CENTOS no servidor + Mysql + Apache + PHP

+correção da subida de ontem
Subir preco_s_imposto para a coluna preco_simp de FEH
Calcular coluna preco (= preco_simp x (1 + IPI) ) e gravar na coluna preco de FEH
Obter moeda_preco_id a partir da coluna moeda_preco
Gravar mostra_preco em FEH como está em rc_ec_certo (desde que preco ou preco_simp > 0)
Refazer ultimo=1
rodar novamente rotina de lucros e valores de venda
Atualizar aliquota de icms na tabela de fornecedor. Qdo for 3, alterar a tributação do fornecedor para 1 (segundo tabela enquadramento_imposto). Cuidado para não deixar fornecedor que já tem icms, sem icms! 

+carga de novos itens
Produto: F-110179 – 6400 peças – preço de custo 
Quantidade: 6400 peças
Marca: INA
Custo: R$ 1,20
Fornecedor: GIHROS
ICMS: 12%
IPI: 0%
Acabei de receber um lote FAG.

2000 pçs 6308 ZZC3 embalagem individual preço unitario R$18,20
2000 pçs 6310 ZZC3 embalagem industrial caixa com 22pçs preço unitario R$30,80

Faça ja seus pedidos.
Me add no MSN : eduardo_celtarolamentos@hotmail.com
Atenciosamente:Eduardo
Celta rolamentos.


/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:esta exibindo o numero errado de itens no site           <corrigindo>  <subido em producao>
********************************************************************/
smarty/templates/filtro_resultados.tpl




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:alterações de arquivos do /controlex que estavam redirecionando ainda para o /controle <corrigido> <subido em producao>
********************************************************************/
+ Arquivos:




/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:Alterar "Imposto: sim ou não - por ICMS: 18% ou 3% no form de cotação
javascript do imposto por estado
insuframa validação para gravar os impostos;
********************************************************************/
+ Arquivos:
index.php
classes/paises_class_01.php
smarty/templates/cotacao.tpl
smarty/templates/cotacao_en.tpl
js/form_cotacao.js               
controlex/ajax/cotacao_dados_ajax.php
controlex/classses/cotacao_class_01.php

controlex/index.php
controlex/cad_cotacao.php
controlex/smarty/templates/cad_cota.tpl     
controlex/classes/paises_class_01.php

retirar a coluna cotacao.suframa


DROP TABLE IF EXISTS `tipo_imposto`;
CREATE TABLE `tipo_imposto` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `empresa` varchar(20) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Dumping data for table tipo_imposto
#

LOCK TABLES `tipo_imposto` WRITE;
/*!40000 ALTER TABLE `tipo_imposto` DISABLE KEYS */;
INSERT INTO `tipo_imposto` VALUES (0,'MDD','ICMS 3%');
INSERT INTO `tipo_imposto` VALUES (1,'RPM','ICMS Vari&aacute;vel de acordo com estado');
INSERT INTO `tipo_imposto` VALUES (2,'RPM','Suframa');
/*!40000 ALTER TABLE `tipo_imposto` ENABLE KEYS */;
UNLOCK TABLES;




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


+ Arquivos:
filtro.php
pecas_class_04_rc.inc
smarty/templates/filtro_resultados.tpl
smarty/templates/filtro_detalhes.tpl
controlex/class/cotacao_class01.php



/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:alteração
*@desc:Cotações de mesmo cliente em horários diferentes são gravadas como uma só    <corrigido>
********************************************************************/
+ Arquivos:
/classes/cotacao_class_01.php





