/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de catalogo_pecas_historico
********************************************************************/
drop function if exists validaData;
create function validaData(param char(15))
returns varchar(255)
deterministic
begin
declare dados,dados1,dados2,dados3,dados4 char(60);
    
    set dados1=(select lower(substring(param,7,4)));
    set dados2=(select lower(substring(param,4,2)));
    set dados3=(select lower(substring(param,1,2)));
    set dados =(select concat(dados1,'-',dados2,'-',dados3));

    return dados;
end;
