/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de oferta.partnumber_unico_compacto
********************************************************************/
drop function if exists geraPUC;
CREATE FUNCTION geraPUC(partnumber varchar(100))
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

set dados = replace(partnumber,'-','');
set dados = replace(dados,'?','');
set dados = replace(dados,' ','');
set dados = replace(dados,'*','');
set dados = replace(dados,'/','');
set dados = replace(dados,'.','');
set dados = replace(dados,'"','');
	  
RETURN dados;
end;



