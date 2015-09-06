/*******************************************************************************
*Rotinas para dar carga de itens em producao
********************************************************************************/
/* criar novo id de carga */
insert into carga(descricao,arquivo_carga)values('Carga de Itens do fornecedor Parker','ListaPrecosParkerRPMAdesivos.csv;ListaPrecosParkerRPMKit.csv;ListaPrecosParkerRPMSeals.csv;');


/*criacao das tabelas com o mesmo nome da planilha .csv exe: tabela carga_numeroCarga_nomePlanilha */
ListaPrecosParkerRPMAdesivos.csv;ListaPrecosParkerRPMKit.csv;ListaPrecosParkerRPMSeals.csv;


/* descobrir fornecedor */
select * from fornecedor where lower(nome) like '%qui%'; 


/* descobrir marca */
select * from marca where lower(nome) like '%orio%';


/* descobrir marca automaticamente */
UPDATE 	 up_eme2 AS rc,
         marca        AS mc	
SET      rc.marca_id  =mc.marca_id
WHERE    lower(trim(rc.marca))=lower(trim(mc.nome));


/* descobrir o fornecedor automaticamente */
UPDATE 	 up_estoque_tmp AS rc,
         fornecedor        AS fd
SET      rc.fornecedor_id =fd.fornecedor_id
WHERE    lower(trim(fd.nome))=lower(trim(rc.fornecedor));


/* carga de moeda_preco_id */
UPDATE 	 up_estoque_tmp SET moeda_preco_id ='BRL' WHERE moeda_preco_id='R$';
UPDATE 	 up_estoque_tmp SET moeda_preco_id ='USD' WHERE moeda_preco_id='$';


/* descobrir tipo produto automaticamente */
UPDATE 	 up_eme2 AS rc,
         tipo_produto        AS mc	
SET      rc.produto_id  =mc.id
WHERE    lower(trim(rc.produto))=lower(trim(mc.nome_pt));

#se n descobrir o tipo cadastre =>
insert into tipo_produto
(id,nome_pt,nome_en,url_pt,url_en)
values
(65,'Bomba Hidraulica','Hydraulic Pump','bomba-hidraulica','hydraulic-pump'),
(66,'Tubo Extensao','Extension Pipes','tubo-extensao','extension-pipes'),
(67,'Kit Treinamento','Training KIT for Assembling and Disassembling','kit-treinamento','training-kit-for-assembling-and-disassembling');




/* rotina para gerar PU/PUC */
UPDATE IGNORE up_estoque_tmp AS feh
SET     feh.puc=geraPUC(feh.partnumber),
        feh.pu =geraPU(feh.partnumber);


/* cadastrar fornecedor e marcas */
INSERT INTO fornecedor(matriz_id,nome,tipo,nome_fantasia,razao_social,uf,cidade,pais_sigla,aliquota_icms)VALUES(0,'Brastates','F','Brastates','Brastates','SP','São Paulo','BR',18);
INSERT INTO marca(nome)VALUE('DHPT');


/* carga de dados da tabela rpm_cargas.pecas para a tabela rpm_cargas.pecas_produto */
#truncate table rpm_cargas.pecas_produto;
INSERT INTO rpm_cargas.pecas_produto
(pu,marca_id,produto_id,data_cadastro,origem,ultimo)
SELECT
pu,marca_id,1,ts,origem,1
FROM rpm_cargas.pecas;

#atualiza todos os dados para o produto_id correspondente
update rpm_cargas.pecas_produto as pp,up_samech_aneis3 as aneis set pp.produto_id ='3' where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id;
update rpm_cargas.pecas_produto as pp,up_samech_retentores3 as aneis set pp.produto_id ='2' where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id;
update rpm_cargas.pecas_produto as pp,up_samech_outros3 as aneis set pp.produto_id ='4' where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id;
update rpm_cargas.pecas_produto as pp,up_eme AS aneis set pp.produto_id =aneis.produto_id where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id and aneis.produto_id <> '';
update rpm_cargas.pecas_produto as pp,up_eme2 AS aneis set pp.produto_id =aneis.produto_id where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id and aneis.produto_id <> '';



/* Rotina para realizar carga de dados da tabela temporaria Samech para FEH */
truncate table rc_ec_samech;
/* carga na Samech das tabelas temporarias  */
insert into rc_ec_samech (id, fornecedor_id,marca_id,marca, data_cotacao, partnumber,pu,puc, disponibilidade_id, oferta, qtd, moeda_preco_id, preco_c_ipi, preco_s_ipi, aliquota_ipi, aliquota_icms,origem, mostra_preco,produto_id) 
(select null, case when Abreviacao='USA' then 627 ELSE 299 end,marca_id,Abreviacao,'2012-09-05',itemmaterial,pu,(select geraPUC(itemmaterial)),case when ( Est_Loja + Est_Fabr) > 0 then 1 else 15 end, 1, Est_Loja + Est_Fabr, 'BRL',case when Abreviacao='USA' then Tabela*(1-0.65) when Abreviacao='VED' then Tabela*(1-0.89) when Abreviacao='SAB' then Tabela*(1-0.5) end,case when Abreviacao='USA' then Tabela*(1-0.65) when Abreviacao='VED' then Tabela*(1-0.89) when Abreviacao='SAB' then Tabela*(1-0.5) end,0.00,18.00,"Lista preços SAMECH", 1,2
from up_samech_retentores3);

insert into rc_ec_samech (id, fornecedor_id,marca_id,marca, data_cotacao, partnumber,pu,puc, disponibilidade_id, oferta, qtd, moeda_preco_id, preco_c_ipi, preco_s_ipi, aliquota_ipi, aliquota_icms,origem, mostra_preco,produto_id) 
(select null, case when Abreviacao='USA' then 627 ELSE 299 end,marca_id,Abreviacao,'2012-09-05',itemmaterial,pu,(select geraPUC(itemmaterial)),case when ( Est_Loja + Est_Fabr) > 0 then 1 else 15 end, 1, Est_Loja + Est_Fabr, 'BRL',case when Abreviacao='USA' then Tabela*(1-0.65) when Abreviacao='VED' then Tabela*(1-0.93) end,case when Abreviacao='USA' then Tabela*(1-0.65) when Abreviacao='VED' then Tabela*(1-0.93) end,0.00,18.00,"Lista preços SAMECH", 1,3
from up_samech_aneis3);

insert into rc_ec_samech (id, fornecedor_id,marca_id,marca, data_cotacao, partnumber,pu,puc, disponibilidade_id, oferta, qtd, moeda_preco_id, preco_c_ipi, preco_s_ipi, aliquota_ipi, aliquota_icms,origem, mostra_preco,produto_id) 
(select null, case when Abreviacao='USA' then 627 ELSE 299 end,marca_id,Abreviacao,'2012-09-05',itemmaterial,pu,(select geraPUC(itemmaterial)),case when ( Est_Loja + Est_Fabr) > 0 then 1 else 15 end, 1, Est_Loja + Est_Fabr, 'BRL',case when Abreviacao='VED' then Tabela*(1-0.89) else Tabela*(1-0.65) end,case when Abreviacao='VED' then Tabela*(1-0.89) else Tabela*(1-0.65) end,0.00,18.00,"Lista preços SAMECH", 1,2
from up_samech_outros3);



/*Carga na FEH a partir da RC com filtro somente com as marcas 202  */
INSERT INTO rpm_cargas.fornecedor_estoque_historico(
fornecedor_id, marca_id, pu, data_cotacao, puc, partnumber, disponibilidade_id, oferta, qtd, moeda_preco_id, preco, preco_simp, p3, p7, p12, p18, l3,
 l7,  l12, l18, margem_lucro, vc_imp_bbi_25_30_fob, vc_imp_bbi_25_30_peso, vc_imp_bbi_7_10, vc_imp_alemanha, aliquota_ipi, frete, frete_valor,frete_tempo,
 mostra_preco,carga_id)
SELECT 
 fornecedor_id, marca_id, pu, data_cotacao, puc, partnumber, disponibilidade_id, 1, qtd, moeda_preco_id, preco_c_ipi, preco_s_ipi,
 p3, p7, p12, p18, l3, l7, l12, l18, margem_lucro, vc_imp_bbi_25_30_fob, vc_imp_bbi_25_30_peso, vc_imp_bbi_7_10, vc_imp_alemanha, aliquota_ipi,
 frete,frete_valor, frete_tempo, 1,7
 FROM rc_ec_samech
 where marca_id=202;	



/* rodar carga em rpm_cargas.pecas/rpm_cargas.pecas_produto/rpm_cargas.pecas_especificacao */
TRUNCATE TABLE rpm_cargas.pecas;
SELECT cargaTabelarpm_cargas.pecas();

insert ignore rpm_cargas.rpm_cargas.pecas_produto(
    pu,marca_id,produto_id,data_cadastro,origem
)
select
h,j,m,current_date,'Carga Id 14'
from rpm_cargas.rpm_cargas.up_estoque_debug;

insert into rpm_cargas.rpm_cargas.pecas_especificacao(
    pu,marca_id,fornecedor_id,especificacao_pt,especificacao_en,unidade,valor,ordem,publicar,eh_descricao
)
select 
h,j,l,'peso','weight','Kg',trim(q),1,1,0 
from rpm_cargas.rpm_cargas.up_estoque_debug;	



/* outras tabelas temporarias... */
delete from rpm_cargas.fornecedor_estoque_historico where (carga_id=3 or carga_id=4 or carga_id=5);
INSERT INTO rpm_cargas.fornecedor_estoque_historico(
fornecedor_id, marca_id, pu, data_cotacao, puc, partnumber, disponibilidade_id, oferta, qtd, moeda_preco_id, preco, preco_simp, p3, p7, p12, p18, l3,
 l7,  l12, l18, margem_lucro, vc_imp_bbi_25_30_fob, vc_imp_bbi_25_30_peso, vc_imp_bbi_7_10, vc_imp_alemanha, aliquota_ipi, frete, frete_valor,frete_tempo,
 mostra_preco,carga_id)
SELECT 
 fornecedor_id, marca_id, pu, data_cotacao, puc, partnumber, disponibilidade_id, 1, qtd, moeda_preco_id, preco_c_ipi, preco_s_ipi,
 p3, p7, p12, p18, l3, l7, l12, l18, margem_lucro, vc_imp_bbi_25_30_fob, vc_imp_bbi_25_30_peso, vc_imp_bbi_7_10, vc_imp_alemanha, aliquota_ipi,
 frete,frete_valor, frete_tempo, 1,3
 FROM rc_ec_samech
 where marca_id=202;
INSERT INTO rpm_cargas.fornecedor_estoque_historico(
fornecedor_id, marca_id, pu, puc, partnumber, disponibilidade_id, oferta, qtd,mostra_preco,carga_id)
SELECT 
fornecedor_id, marca_id, pu, puc, partnumber,disponinilidade,0, Estoque,0,4
FROM up_eme;	

INSERT INTO rpm_cargas.fornecedor_estoque_historico(
fornecedor_id, marca_id, pu, puc, partnumber, disponibilidade_id, oferta, qtd,mostra_preco,carga_id)
SELECT 
fornecedor_id, marca_id, pu, puc, partnumber,disponinilidade,0, Estoque,0,5
FROM up_timken;	


/* query para subir todos os itens de interchange para a pecas da nuvem */
INSERT INTO pecas(
		partnumber, 
		marca_id, 
		puc, 
		pu, 
		mostra_preco, 
		oferta,
		preco,
		origem
)
SELECT 
		pnA, 
		marca_idA, 
		pucA,
		puA, 
		'0', 
		'0',
		'0.00', 
		'I'
FROM 		interchange
WHERE           (puA,marca_idA) NOT IN (
		SELECT pu,marca_id
		FROM 	pecas
		
)
GROUP BY         puA,marca_idA;
		

INSERT INTO pecas(
		partnumber, 
		marca_id, 
		puc, 
		pu, 
		mostra_preco, 
		oferta,
		preco,
		origem
)
SELECT 
		pnB, 
		marca_idB, 
		pucB,
		puB, 
		'0', 
		'0',
		'0.00', 
		'I'
FROM 		interchange
WHERE           (puB,marca_idB) NOT IN (
		SELECT pu,marca_id
		FROM 	pecas
		
)
GROUP BY         puB,marca_idB;






/*******************************************************************************
*Rotinas para dar carga de itens com base nos itens de interchange
********************************************************************************/
TRUNCATE TABLE rpm_controlex.pecas;

/* query para subir todos os itens de interchange para a pecas da nuvem */
INSERT IGNORE INTO rpm_controlex.pecas(
		partnumber, 
		marca_id, 
		puc, 
		pu, 
		mostra_preco, 
		oferta,
		preco,
		origem
)
SELECT 
		pnA, 
		marca_idA, 
		pucA,
		puA, 
		'0', 
		'0',
		'0.00', 
		'I'
FROM 		rpm_controlex.interchange
GROUP BY        puA,marca_idA;
		

INSERT IGNORE INTO rpm_controlex.pecas(
		partnumber, 
		marca_id, 
		puc, 
		pu, 
		mostra_preco, 
		oferta,
		preco,
		origem
)
SELECT 
		pnB, 
		marca_idB, 
		pucB,
		puB, 
		'0', 
		'0',
		'0.00', 
		'I'
FROM 		rpm_controlex.interchange
GROUP BY         puB,marca_idB;

SELECT cargaTabelaPecas();

DELETE 	FROM rpm_controlex.pecas_produto
WHERE   (pu,marca_id) NOT IN (
	SELECT 		pu,marca_id
	FROM 		rpm_controlex.pecas		
);

INSERT IGNORE INTO rpm_controlex.pecas_produto(
    pu,marca_id,produto_id,data_cadastro,origem
)
SELECT
pu,marca_id,82,CURRENT_DATE,'carga para relatorio do bearing.net'
FROM rpm_controlex.pecas;


                                    #1.085.024
SELECT COUNT(*) FROM pecas;         #1.158.561
SELECT * FROM pecas_produto GROUP BY produto_id ORDER BY produto_id ASC; #









/*******************************************************************************
*Querys de debug para saber se a carga está correta
********************************************************************************/
/*verificar a quantidade de dados cargados  */
#a quantidade de itens na carga da feh deve ser um numero aproximado ao to total de itens na planilha
select count(*) from rpm_cargas.fornecedor_estoque_historico where carga_id=36;
select * from rpm_cargas.fornecedor_estoque_historico where carga_id=36;

#as tabelas rpm_cargas.pecas && rpm_cargas.pecas_produto devem religiosamente conter o mesmo numero de quantidade de rpm_cargas.pecas
select count(*) from rpm_cargas.cargaestoque;                   #22.442
select count(*) from rpm_cargas.fornecedor_estoque_historico;   #22.442
select count(*) from rpm_cargas.pecas_produto;                  #15.457
select count(*) from rpm_cargas.pecas;                          #15.457
select * from rpm_cargas.cargaestoque;                  
select * from rpm_cargas.pecas;                         
select * from rpm_cargas.pecas_produto;                 
select * from rpm_cargas.fornecedor_estoque_historico;  

/* consulta para verificar se existe em rpm_cargas.pecas itens que ñ tem preco e esta com mostra_preco=1 */
select count(*) from rpm_cargas.pecas where (preco is null or preco = '') and mostra_preco = 1;
select count(*) from rpm_cargas.pecas where (preco is null or preco = '') and oferta=1;
select count(*) from rpm_cargas.pecas where oferta=1;


/* corrigir erro de possiveis erros na rpm_cargas.pecas como de produtos com mostra preco=0 e sem preço */
update rpm_cargas.pecas set mostra_preco=0,oferta=0 where (preco is null or preco='') and mostra_preco=1;
update rpm_cargas.pecas set mostra_preco=0,oferta=0 where (preco is null or preco='') and oferta=1;


/* query para saber se existem algum item sem marca_id devidamente cadastrado */
delete from rpm_cargas.pecas where (marca_id=0 or marca_id is null or marca_id='');
delete from rpm_cargas.fornecedor_estoque_historico where (marca_id=0 or marca_id is null or marca_id='');
update cargaestoque set marca_id='224' where marca_id='SAB';
select marca_id from rpm_cargas.cargaestoque where (marca_id=0 or marca_id is null or marca_id='') group by marca_id;
select * from rpm_cargas.cargaestoque where (marca_id=0 or marca_id is null or marca_id='');
select * from rpm_cargas.pecas where (marca_id=0 or marca_id is null or marca_id='');
select * from rpm_cargas.fornecedor_estoque_historico where (marca_id=0 or marca_id is null or marca_id='') group by marca_origem;
select * from rpm_cargas.pecas_produto where (marca_id=0 or marca_id is null or marca_id='');


/* corrigir se existe marca_id nulas (id da marca RPM) */
update rpm_cargas.pecas set marca_id='273'  where (marca_id=0 or marca_id is null or marca_id='');
update rpm_cargas.fornecedor_estoque_historico set marca_id='273'  where (marca_id=0 or marca_id is null or marca_id='');
update rpm_cargas.pecas_produto set marca_id='273'  where (marca_id=0 or marca_id is null or marca_id='');


/* query para saber se existem algum item sem fornecedor_id devidamente cadastrado */
select * from rpm_cargas.fornecedor_estoque_historico where (fornecedor_id='' or fornecedor_id is null);
update rpm_cargas.fornecedor_estoque_historico set fornecedor_id='384' where (fornecedor_id='' or fornecedor_id is null);


/* query para saber se existem algum item sem produto_id devidamente cadastrado */
select * from rpm_cargas.pecas_produto where produto_id is null or produto_id='' group by produto_id asc;


/* querys para verificar se a carga de dados realizada em FEH com ultimo=1 esta funcionando Esta consulta não deve retornar resultados. */
SELECT feh.fornecedor_id, feh.pu,feh.marca_id,MAX(feh.ultimo) FROM rpm_cargas.fornecedor_estoque_historico AS feh
GROUP BY feh.fornecedor_id, feh.pu,feh.marca_id
HAVING MAX(feh.ultimo)=0;

SELECT feh.fornecedor_id, feh.pu,feh.marca_id,COUNT(feh.ultimo) FROM rpm_cargas.fornecedor_estoque_historico AS feh
WHERE feh.ultimo=1
GROUP BY feh.fornecedor_id, feh.pu,feh.marca_id
HAVING COUNT(feh.ultimo) > 1;


/* verificação se existe puc|pu nulos ou vazios */
delete from rpm_cargas.fornecedor_estoque_historico where (pu is null or pu='' or puc is null or puc='');
delete from rpm_cargas.pecas where (pu is null or pu='' or puc is null or puc='');
delete from rpm_cargas.pecas_produto where (pu is null or pu='');
select * from rpm_cargas.pecas where (pu is null or pu='' or puc is null or puc='');
select * from rpm_cargas.pecas_produto where (pu is null or pu='');
select * from rpm_cargas.fornecedor_estoque_historico where (pu is null or pu='' or puc is null or puc='');


/* consulta para verificar se a carga de preço rodou corretamente, não pode existir colunas 'p' vazias se existir preço e ultimo=1 */
select     count(*) from rpm_cargas.pecas where    (p3 is null or p3 = '') and preco>0 and mostra_preco=1;;
select     count(*) from rpm_cargas.fornecedor_estoque_historico where    (p3 is null or p3 = '') and preco>0 and ultimo=1;


/* verificação de preços, se existe algum valor calculado menor que o valor de preço em rpm_cargas.pecas */
#em rpm_cargas.pecas pode ter item com px errado, desde que esteja com mostra_preco=0 e oferta=0#
select count(*) from rpm_cargas.pecas;
select * from rpm_cargas.pecas where ((p3 < preco) or (p7 < preco) or (p12 < preco) or (p18 < preco));
update rpm_cargas.pecas set mostra_preco=0 where ((p3 < preco) or (p7 < preco) or (p12 < preco) or (p18 < preco));
select * from rpm_cargas.pecas where mostra_preco=1 and ((p3 < preco) or (p7 < preco) or (p12 < preco) or (p18 < preco));
select * from rpm_cargas.fornecedor_estoque_historico where ((p3 < preco) or (p7 < preco) or (p12 < preco) or (p18 < preco)) and ultimo=1 and mostra_preco=1;


/* carga de moeda_preco_id */
UPDATE 	 rpm_cargas.fornecedor_estoque_historico SET moeda_preco_id ='BRL' WHERE moeda_preco_id='R$' and ultimo=1;
UPDATE 	 rpm_cargas.fornecedor_estoque_historico SET moeda_preco_id ='USD' WHERE moeda_preco_id='$'  and ultimo=1;
SELECT * FROM rpm_cargas.fornecedor_estoque_historico group by moeda_preco_id;

/* retirar obrigatoriamente todas as referencias à marca trm */
update      rpm_cargas.pecas 
set         partnumber = substring(partnumber,3,length(partnumber)),
            puc        = substring(puc,3,length(puc)),
            pu         = substring(pu,7,length(pu))
where       lower(partnumber) regexp '^trm';

#retirar tranqueiras do puc
update rpm_cargas.pecas set puc=replace(replace(puc,',',''),'+','');


/* teste para saber se todos os itens que estavam na tabela tmp foram realmente subidos na rpm_cargas.pecas */
select * from rpm_cargas.up_estoque_debug where h not in (select pu from rpm_cargas.pecas);

/* subir tabela de marca/fornecedor para controlex/nuvem */
select * from rpm_cargas.fornecedor_estoque_historico where carga_id=36;
select * from rpm_cargas.fornecedor_estoque_historico;
select * from rpm_cargas.pecas_produto;
select * from rpm_cargas.pecas;

