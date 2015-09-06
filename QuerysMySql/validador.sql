use rpm_homolex;

/* pega o arquivo .csv e realiza carga de dados para a tabela temporaria no MySql */
load data local infile '/var/www/html/validador/estoque.csv'
into table up_estoque_tmp
fields terminated by ';';

/* gera pu e puc */
update ignore up_estoque_tmp as feh
set     feh.puc=geraPUC(feh.partnumber),
        feh.pu =geraPU(feh.partnumber)
where   puc='' or puc is null;

/* descobrir marca automaticamente */
UPDATE 	 up_estoque_tmp AS rc,
         marca        AS mc	
SET      rc.marca_id  =mc.marca_id
WHERE    lower(trim(rc.marca))=lower(trim(mc.nome));

/* descobrir o fornecedor automaticamente */
UPDATE 	 up_estoque_tmp AS rc,
         fornecedor        AS fd
SET      rc.fornecedor_id =fd.fornecedor_id
WHERE    lower(trim(fd.nome))=lower(trim(rc.fornecedor));

/* descobrir tipo produto automaticamente */
UPDATE 	 up_estoque_tmp AS rc,
         tipo_produto        AS mc	
SET      rc.produto_id  =mc.id
WHERE    lower(trim(rc.produto))=lower(trim(mc.nome_pt));

/* carga de moeda_preco_id */
UPDATE up_estoque_tmp SET moeda_preco_id ='BRL' WHERE moeda_preco_id='R$';
UPDATE up_estoque_tmp SET moeda_preco_id ='USD' WHERE moeda_preco_id='$';

/* carga de dados da tabela temporaria para a FEH */
INSERT INTO fornecedor_estoque_historico(
fornecedor_id, marca_id, pu, data_cotacao, puc, partnumber, disponibilidade_id, oferta, qtd, moeda_preco_id, preco,mostra_preco,carga_id)
SELECT 
fornecedor_id, marca_id, pu, data_cotacao, puc, partnumber, disponibilidade_id,oferta, qtd, moeda_preco_id, moeda_preco,1,0
FROM up_estoque_tmp;	

