/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de oferta.partnumber_unico_compacto
********************************************************************/
drop function if exists geraPUC;
CREATE FUNCTION geraPUC()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

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

set dados   = "Tabela fornecedor_estoque_historico Atualizada!";
	  
RETURN dados;
end;

drop table if exists debug;
create table debug(
  id int auto_increment primary key,
  partnumber_unico_compacto character varying(150)
);
select geraPUC();