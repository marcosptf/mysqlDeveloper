use wedelhas_devel2;
select * from oferta;
select * from fornecedor_estoque_historico;

/* trazer de cada cotação, só a mais atual  */
alter table fornecedor_estoque add oferta INT(1) NOT NULL DEFAULT 0;
alter table fornecedor_estoque add mostra_preco INT(1) NOT NULL DEFAULT 0 ;
select * from fornecedor_estoque;

oferta.status_id =>
2 => oferta
1 => mostra preco			
0 => sob consulta			

CREATE TABLE IF NOT EXISTS `fornecedor_estoque_historico` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `partnumber` VARCHAR(100) NOT NULL ,
  `marca_id` INT(6) UNSIGNED NOT NULL,
  `historico_id` INT(4) NOT NULL auto_increment,
  `data_cotacao` timestamp NOT NULL DEFAULT now() ,
  `puc` VARCHAR(255) NULL ,
  `pu` VARCHAR(255) CHARACTER SET 'latin1' NULL ,
  `disponibilidade_id` INT(1) UNSIGNED NULL ,
  `oferta` INT(1) UNSIGNED NULL DEFAULT NULL ,
  `qtd` INT(11) UNSIGNED NULL ,
  `moeda_preco` VARCHAR(10) CHARACTER SET 'latin1' NULL ,
  `preco` DECIMAL(12,2) NOT NULL ,
  `moeda_custo` VARCHAR(10) CHARACTER SET 'latin1' NULL ,
  `custo` DECIMAL(12,2) ,
  `usuario_id` INT(3) NULL ,
  `origem` VARCHAR(100) NULL ,
  PRIMARY KEY (`fornecedor_id`, `partnumber`, `marca_id`, `historico_id`) );


select distinct fornecedor_id,partnumber,marca_id,historico_id;
select distinct fornecedor_id,partnumber,marca_id,historico_id;

select historico_id,fornecedor_id,partnumber,marca_id,data_cotacao,pu,puc,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,origem
from fornecedor_estoque_historico
where fornecedor_id=30 and marca_id=111 and partnumber='22328 CCK/C3W33' 
#and historico_id=max(historico_id) 
#group by fornecedor_id,partnumber,marca_id
#having historico_id=max(historico_id)
/* (
                        select max(historico_id) 
                        from   fornecedor_estoque_historico
                        where fornecedor_id=30 and marca_id=111 and partnumber='22328 CCK/C3W33'
                     )
*/                     
order by historico_id asc
limit 10;



select 
f.fornecedor_id,f.partnumber,f.marca_id,f.historico_id,f.data_cotacao,f.puc,f.pu,
f.disponibilidade_id,f.oferta,f.qtd,f.moeda_preco,f.preco,f.moeda_custo,f.custo,f.origem
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo
where f.fornecedor_id=30 and f.marca_id=111 and f.partnumber='22328 CCK/C3W33';


select count(historico_id) from fornecedor_estoque_historico where historico_id>1 order by historico_id desc;
select * from fornecedor_estoque_historico where historico_id>1 order by historico_id desc;
select * from fornecedor_estoque;



insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,historico_id,data_cotacao,puc,pu,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem)
select 
fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,oferta_id,qtd,moeda_preco,
preco,moeda_custo,custo,'Atualização de Estrutura de BD MySql.'
from oferta

insert into fornecedor_estoque
(fornecedor_id,partnumber,marca_id,data_cotacao,puc,pu,
disponibilidade_id,qtd,moeda_preco,preco,moeda_custo,custo)
select 
f.fornecedor_id,f.partnumber,f.marca_id,f.data_cotacao,f.puc,f.pu,
f.disponibilidade_id,f.qtd,f.moeda_preco,f.preco,f.moeda_custo,f.custo
from (
    select fornecedor_id,partnumber,marca_id,max(historico_id) as ultimo
    from fornecedor_estoque_historico 
    group by fornecedor_id,partnumber,marca_id
) as x inner join fornecedor_estoque_historico as f on f.fornecedor_id = x.fornecedor_id 
and f.partnumber = x.partnumber
and f.marca_id = x.marca_id
and f.historico_id = x.ultimo;

select  feh.partnumber,feh.fornecedor_id,feh.marca_id,feh.historico_id
from    fornecedor_estoque as fe
inner   join fornecedor_estoque_historico as feh on fe.partnumber=feh.partnumber 
and     fe.fornecedor_id=feh.fornecedor_id
and     fe.marca_id     =feh.marca_id
order by feh.historico_id desc

#tabelas q faltam ser popupladas
select * from fornecedor_meios;
select * from catalogo;

select fornecedor_id,nome from fornecedor;

insert into fornecedor_novo
(fornecedor_id,nome)
select 
fornecedor_id,nome from fornecedor;

insert into fornecedor_contato
(fornecedor_id,nome,email)
select     f.fornecedor_id,flm.empresa,flm.email
from       fornecedor   as f, for_lf_marca as flm 
where      flm.empresa like f.nome;

select * from fornecedor_contato order by contato_id asc;
select * from fornecedor_contato;


select fornecedor_id,nome from fornecedor;
select * from for_lf_marca;

select     f.fornecedor_id,f.nome,flm.empresa,flm.contato,flm.email
from       fornecedor   as f, for_lf_marca as flm 
where      flm.empresa like f.nome;


CREATE TABLE IF NOT EXISTS `fornecedor_contato_meios` (
  `fornecedor_id` INT(4) UNSIGNED NOT NULL ,
  `contato_id` INT(3) NOT NULL ,
  `meio_id` INT(2) NOT NULL AUTO_INCREMENT ,
  `meio_tipo` VARCHAR(255) NULL DEFAULT NULL ,
  `meio_valor` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`meio_id`, `fornecedor_id`, `contato_id`) );
  
select * from pecas_novo;
select * from oferta;

insert into fornecedor_contato_meios
(fornecedor_id,contato_id,meio_tipo,meio_valor)
select      fornecedor_id,contato_id,
            case
                when flm.telefones <> '' and flm.email <> '' then
                'Email / Telefone'
                when flm.telefones =  '' and flm.email <> '' then
                'Email'
                when flm.telefones <>  '' and flm.email = '' then
                'Telefone'
            end  as tipo,  
            CONCAT(flm.telefones,' / ',flm.email) as dados  
from        for_lf_marca       as flm
left join   fornecedor_contato as fc on lower(fc.nome)=lower(flm.empresa);

select * from fornecedor_contato_meios;


select      fornecedor_id,contato_id,flm.dist,flm.lote,flm.marca,flm.empresa,flm.contato,
            flm.telefones,flm.email,flm.extra,flm.endereco,flm.cidade,flm.estado 
from        for_lf_marca       as flm
left join   fornecedor_contato as fc on lower(fc.nome)=lower(flm.empresa);

select fornecedor_id,contato_id,meio_id,meio_tipo,meio_valor
from   fornecedor_contato_meios;

/***************************************************************************************/
#    Criar rotina que atualiza dados da tab Pecas a partir de Fornecedor_estoque

select  fornecedor_id,partnumber,marca_id,puc,pu,disponibilidade_id,qtd,moeda_preco,preco,
        moeda_custo,custo,produto_id,data_cotacao,oferta,mostra_preco 
from    fornecedor_estoque;
select partnumber,marca_id,puc,pu,moeda_preco,preco,disponibilidade_id,oferta from pecas_novo;

select moeda_preco,preco,disponibilidade_id,mostra_preco,oferta from fornecedor_estoque;
select moeda_preco,preco,disponibilidade_id,oferta from pecas_novo;

/* mostra preco */
select moeda_preco,preco,pu,marca_id,fornecedor_id,qtd,oferta,disponibilidade_id,
case 
    when qtd=0 or qtd is null then
        0
    when qtd>0 then
        concat(cast(moeda_preco as char(10)),cast(preco as char(10)))
end as precos,    
case 
    when oferta=1 then
    1
    else
    0
end as ofertas,
case
    when disponibilidade_id=1 then 
        'Imediata'
    when disponibilidade_id=2 then
        'Até 5 dias'
    when disponibilidade_id=3 then
        'Sob consulta'
end as disponibilidade,        
case 
    when (preco>0 and qtd>0) or oferta=1 then
        0
    else
        1
end as preco_sobconsulta

from   fornecedor_estoque
#where  mostra_preco=1 or oferta=1
where  preco >0
group by pu,marca_id
order by preco,disponibilidade_id asc;



replace into pecas_novo
(partnumber,marca_id,puc,pu,moeda_preco,preco,disponibilidade_id,oferta)
select 
partnumber,marca_id,puc,pu,moeda_preco,
case 
    when qtd=0 or qtd is null then
        concat(cast(moeda_preco as char),'0.00')
    when qtd>0 then
        concat(cast(moeda_preco as char),cast(preco as char))
end as precos,    
disponibilidade_id,        
case 
    when oferta=1 then
    1
    else
    0
end as ofertas 
from   fornecedor_estoque
#where  mostra_preco=1 or oferta=1
group by pu,marca_id
order by preco,disponibilidade_id asc;

A rotina deve atualizar na tabela Peca as informações:
 moeda_preco
 preco
 disponibilidade_id
 mostra_preco
 oferta
 preco_sobconsulta

<moeda_preco>  e <preco>:
 Deve-se trazer o menor preço, e sua respectiva moeda (R$ por exemplo), de uma determinada peça 
 (PU/Marca) da tabela de fornecedor_estoque onde o campo <mostra_preco> é 1 (TRUE) ou o campo <oferta> é 1 (TRUE).
 Caso encontre esta peça em oferta junto a apenas um fornecedor, deverá trazer moeda e preço dele, 
 marcar <oferta> como 1 (TRUE) e ignorar demais preços em outros fornecedores.
 Caso encontre esta peça em oferta em mais de um fornecedor, trazer o menor valor de preço, 
 e marcar <oferta> como 1 (TRUE).
 Se o campo <qtd> for zero ou nulo, o preço da peça neste fornecedor deve ser ignorado.

<disponibilidade_id>:
 Corresponde ao campo <situacao_id> da tabela Oferta: 0= imediada, 1=Até 5 dias, 2= Sob consulta.
 Deve trazer a menor disponibilidade, isto é, a de entrega mais imediata da peça dentre os fornecedores que trabalham com ela cuja <qtd> em estoque é maior que zero na tabela fornecedor_estoque.
 
<oferta>:
 Caso encontre esta peça em oferta junto a apenas um fornecedor, deverá trazer moeda e preço dele, marcar <oferta> como 1 (TRUE) e ignorar demais preços em outros fornecedores.
 Caso encontre esta peça em oferta em mais de um fornecedor, trazer o menor valor de preço, e marcar <oferta> como 1 (TRUE).
 Traz 1 (TRUE) caso o item esteja em oferta.

<preco_sobconsulta>:
 Recebe 0 (FALSE) quando:
 Algum preço para esta peça é encontrado e gravado em <preco> conforme condições para este preenchimento conforme descrito acima.
 Alguma oferta para esta peça é encontrada e gravado 1 (TRUE) em <oferta> conforme condições para este preenchimento conforme descrito acima.
 Recebe 1 (TRUE) quando:
 Não é encontrado nenhum preço ou oferta deste produto (considerando <qtd> > 0 e <mostra_preco> = 1 no estoque do fornecedor.
 Quando uma peça tem <preco_sobconsulta> = 0 (FALSE), é apresentado "Sob Consulta" na info de preço do site (resultado de pesquisa e detalhe da peça).


/*
atualiza as seguintes informações
 moeda_preco
 preco
 disponibilidade_id
 mostra_preco
 oferta
 preco_sobconsulta

*/

truncate table pecas_novo;
select * from pecas_novo;
select * from pecas_novo;
select count(pu) from pecas_novo;
select count(pu) from fornecedor_estoque;
select * from fornecedor_estoque;
/* antes de rodar atualização 718400 */
/* apos rodar atualização  */

/*população de dados na tabela pecas_novo */
insert into pecas_novo (partnumber, marca_id, pu,puc) 
select referencia, marca_id, partnumber_unico,partnumber_unico_compacto 
from oferta
group by referencia,marca_id
order by referencia,marca_id;



/******************************************************************************** 
*Funcao para atualizar a tabela de pecas com dados da tabela fornecedor_estoque *
*********************************************************************************/
truncate table pecas_novo;
drop function atualizaPecas;


delimiter //
CREATE FUNCTION atualizaPecas()
RETURNS varchar(255)

deterministic
begin
declare count1,count2,count3 int;
declare dado,dados varchar(255);

select count(pu) into count1 from pecas_novo;

replace into pecas_novo
(partnumber,marca_id,puc,pu,moeda_preco,preco,disponibilidade_id,oferta)
select 
partnumber,marca_id,puc,pu,moeda_preco,
case 
    when qtd=0 or qtd is null then
        concat(cast(moeda_preco as char),'0.00')
    when qtd>0 then
        concat(cast(moeda_preco as char),cast(preco as char))
end as precos,    
disponibilidade_id,        
case 
    when oferta=1 then
    1
    else
    0
end as ofertas 
from   fornecedor_estoque
#where  mostra_preco=1 or oferta=1
group by pu,marca_id
order by preco,disponibilidade_id asc;

select count(pu) into count2 from pecas_novo;
set count3 = ( if(count1=0 or count1 is null,count2,count1  - count2)); 
set dado   = " Peças foram atualizadas.";
set dados  = concat(cast(count3 as char),dado);

RETURN dados;
end
//

#chamada da funcao
SELECT atualizaPecas();










/***************************************************************************************/
select * from oferta;
select * from pecas_novo;
select * from fornecedor_marca;
select * from fornecedor_estoque;

SELECT      SQL_CALC_FOUND_ROWS o.*,
            pu                 as partnumber_unico,
            puc                as partnumber_unico_compacto,
            m.empresa          as marca,
            disponibilidade_id as situacao_id,
            oferta             as status_id,
            qtd                as oferta_id,
            partnumber         as referencia
FROM        fornecedor_estoque o 
LEFT JOIN   fornecedor_marca   m ON o.marca_id = m.marca_id
WHERE       o.marca_id!=1
and         (
                (pu LIKE '6200')
            or
                (puc LIKE '6200')
            )
GROUP BY o.marca_id DESC, pu
ORDER BY o.marca_id DESC, pu,preco DESC;




SELECT SQL_CALC_FOUND_ROWS o.*, m.empresa as marca 
FROM fornecedor_estoque o 
LEFT JOIN fornecedor_marca m ON o.marca_id = m.marca_id 
WHERE o.marca_id= and ( 
(pu LIKE '6200%') or (puc LIKE '6200%') 
) 
GROUP BY o.marca_id DESC, pu 
ORDER BY o.marca_id DESC, pu,preco DESC ;



select * from oferta;
select * from for_lf_marca;
select * from marca;
select * from pecas_novo;
select marca_id, from oferta;
select Marca,Empresa,marca_id from fornecedor_marca;
truncate table fornecedor_marca;

SELECT          oferta     as oferta_id,
                partnumber as referencia 
FROM            pecas_novo o
WHERE           o.marca_id=115
#and             (pu LIKE '$pu%')  
GROUP BY        o.marca_id,disponibilidade_id DESC,pu
ORDER BY        o.marca_id,disponibilidade_id DESC,pu,preco DESC 
LIMIT           1



select * from pecas_novo; 
select * from fornecedor_novo; 
select * from fornecedor_contato; <falta script de carga> 
select * from fornecedor_contato_meios;  
select * from fornecedor_marca;  <falta script de carga> 
select * from fornecedor_estoque; 
select * from fornecedor_estoque_historico; 
select * from catalogo; <falta script de carga> 

rolamento rolmax 6200 zz id_oferta ==> 226570

select        * from pecas_novo where pu='';
select * from oferta limit 1;
select * from aux_familia limit 1;

 where oferta_id=226570;
partnumber_unico='6200-z-z'

select        partnumber,
              marca_id,
              puc,
              pu,
              moeda_preco,
              preco,
              disponibilidade_id,
              oferta 
from          pecas_novo 
where         puc='6200zz'
and           marca_id=123
order by      oferta,disponibilidade_id asc
limit         1;

select count(partnumber) 
from pecas_novo

select * 
from fornecedor_estoque_historico
#where lower(puc) like '%6200zz%'
where puc='6200zz' and marca_id=123
order by disponibilidade_id desc

insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,historico_id,data_cotacao,puc,pu,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem,ultimo)
select 
fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,oferta_id,qtd,moeda_preco,
preco,moeda_custo,custo,'Atualização de Estrutura de BD MySql.'
from oferta;


case 

    when  oferta_id=(
        select oferta_id     
        from      oferta 
        group by  partnumber_unico,fornecedor_id,marca_id 
        order by  oferta_id desc
        limit 1
    )    then 
    1
    else  
    0    

end as ultimo


select    pu,fornecedor_id,marca_id,

case 
    when  of.historico_id=(
        select    o.historico_id     
        from      fornecedor_estoque_historico  as o       
        where     o.pu=of.pu
        and       o.fornecedor_id=of.fornecedor_id
        and       o.marca_id=of.marca_id         
        group by  o.pu,o.fornecedor_id,o.marca_id 
        order by  o.historico_id desc
        limit 1
    )    then 
    1
    else  
    0    
end as ultimo

from      fornecedor_estoque_historico as of

group by  pu,fornecedor_id,marca_id 
order by  oferta_id desc

limit 100

SELECT * from fornecedor_estoque_historico;


/* esta com erro ñ conseguimos criar indices */
create index fornecedor_estoque_historico_index 
on fornecedor_estoque_historico 
(pu,puc,marca_id,fornecedor_id);

select distinct pu,puc,marca_id,fornecedor_id
from fornecedor_estoque_historico




--------------------------------------------------------------------------------
create table debug(
id int auto_increment primary key,
partnumber_unico_compacto character varying(150)
);

truncate table debug;
insert into debug
(id,partnumber_unico_compacto)
select
oferta_id,referencia
from oferta_aux_subir
order by oferta_id asc;

update oferta_aux_subir
set puc=(select
replace((replace((replace(partnumber_unico_compacto,' ','')),'-','')),'/','')
from debug as d
where d.id=oferta_aux_subir.oferta_id);

select oferta_id,referencia,puc 
from oferta_aux_subir
order by oferta_id asc;

select * from oferta_aux_subir;
truncate table debug;
select * from debug;

alter table oferta_aux_subir add puc VARCHAR(255)  after partnumber_unico;

/* Atualizando a tabela fornecedor_estoque_historico   */

truncate table fornecedor_estoque_historico;

insert into fornecedor_estoque_historico
(fornecedor_id,partnumber,marca_id,historico_id,data_cotacao,puc,pu,
disponibilidade_id,oferta,qtd,moeda_preco,preco,moeda_custo,custo,
origem)
select 
fornecedor_id,referencia,marca_id,data_insercao,partnumber_unico,
partnumber_unico_compacto,situacao_id,oferta_id,qtd,moeda_preco,
preco,moeda_custo,custo,'Atualização de Estrutura de BD MySql.'
from oferta;

select * from fornecedor_estoque_historico limit 10;







