/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de catalogo
********************************************************************/
CREATE FUNCTION cargaTabelaCatalogo()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

insert into catalogo
(fornecedor_id,nome,descricao)
select 
fornecedor_id,nome,'carga de dados da tabela fornecedor_estoque_historico'
from fornecedor
where lower(tipo)='c';

set dados   = "Tabela catalogo Atualizada!";
	  
RETURN dados;
end;