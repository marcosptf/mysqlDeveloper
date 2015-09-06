use rpm_homolex;

/* carga em pecas */
truncate table pecas;
select cargaTabelaPecas();

/* carga de dados da tabela pecas para a tabela pecas_produto */
truncate table pecas_produto;
INSERT INTO pecas_produto
(pu,marca_id,produto_id,data_cadastro,origem,ultimo)
SELECT
pu,marca_id,1,ts,origem,1
FROM pecas;

#atualiza todos os dados para o produto_id correspondente
update pecas_produto as pp,up_samech_aneis3 as aneis set pp.produto_id ='3' where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id;
update pecas_produto as pp,up_samech_retentores3 as aneis set pp.produto_id ='2' where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id;
update pecas_produto as pp,up_samech_outros3 as aneis set pp.produto_id ='4' where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id;
update pecas_produto as pp,up_eme AS aneis set pp.produto_id =aneis.produto_id where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id and aneis.produto_id <> '';
update pecas_produto as pp,up_eme2 AS aneis set pp.produto_id =aneis.produto_id where pp.pu=aneis.pu and pp.marca_id=aneis.marca_id and aneis.produto_id <> '';

