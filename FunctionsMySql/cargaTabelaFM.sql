/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Function Mysql na tabela pecas
*@desc:Funcao para atualizar a tabela de fornecedor_marca
********************************************************************/
CREATE FUNCTION cargaTabelaFM()
RETURNS varchar(255)

deterministic
begin
declare dado,dados varchar(255);

replace into fornecedor_marca
(marca_id,marca,empresa)
SELECT      
distinct(m.marca_id),m.nome AS nome_marca,f.nome AS empresa_fornecedor
FROM        fornecedor_estoque_historico AS o
INNER JOIN  marca as m ON m.marca_id=o.marca_id
INNER JOIN  fornecedor as f ON f.fornecedor_id=o.fornecedor_id;

set dados   = "Tabela fornecedor_marca Atualizada!";
	  
RETURN dados;
end;