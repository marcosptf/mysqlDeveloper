/***************************************************************************************************************
* @author:Marcos Paulo																						   *
* @since:03/05/2012																						       *
*                																							   *
* Arquivos para subir da alteração de url amigavel                                                             *
* filtro.php 																								   *
* smarty/templates/filtro_resultados.tpl 																	   *
* rc_classes/peca_class_02.inc 																	               *
*                                                                                                              *
* script de criação da coluna partnumber_unico_compacto													       *
****************************************************************************************************************/

alter table oferta add partnumber_unico_compacto varchar(255) after partnumber_unico;

select * from oferta;

create table debug(
id int auto_increment primary key,
partnumber_unico_compacto character varying(150)
);

insert into debug
(id,partnumber_unico_compacto)
select
oferta_id,partnumber_unico
from oferta
order by oferta_id asc;

update oferta
set partnumber_unico_compacto=(select
replace((replace((replace(partnumber_unico_compacto,' ','')),'-','')),'/','')
from debug as d
where d.id=oferta.oferta_id);

drop table debug;

select oferta_id,partnumber_unico,partnumber_unico_compacto from oferta order by oferta_id asc;
