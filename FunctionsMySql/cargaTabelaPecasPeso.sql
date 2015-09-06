/* carga da tabela pecas_peso */

INSERT INTO pecas_produto
(pu,marca_id,produto_id,data_cadastro,origem,ultimo)
SELECT
pu,marca_id,1,ts,origem,1
FROM pecas;

update  pecas_produto   as pp,
        up_samech_aneis as aneis
set     pp.produto_id ='3'
where   pp.pu      =aneis.pu
and     pp.marca_id=aneis.marca_id;

update  pecas_produto   as pp,
        up_samech_retentores as aneis
set     pp.produto_id ='2'
where   pp.pu      =aneis.pu
and     pp.marca_id=aneis.marca_id;

update  pecas_produto   as pp,
        up_samech_outros as aneis
set     pp.produto_id ='4'
where   pp.pu      =aneis.pu
and     pp.marca_id=aneis.marca_id;

update  pecas_produto   as pp,
        up_eme as aneis
set     pp.produto_id =aneis.produto_id
where   pp.pu      =aneis.pu
and     pp.marca_id=aneis.marca_id;


update  pecas_produto   as pp,
        up_timken as aneis
set     pp.produto_id =aneis.produto_id
where   pp.pu      =aneis.pu
and     pp.marca_id=aneis.marca_id;

update pecas_produto set produto_id=2 where produto_id=5;