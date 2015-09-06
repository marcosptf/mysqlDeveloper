/*******************************************************************
*@author:Marcos Paulo
*@since:07/05/2012
*@task:Trigger Mysql na tabela pecas
*@desc:trigger para dar carga na tabela pecas toda vez que houver uma alteraï¿½ï¿½o de dados 
*nas tabelas fornecedor_estoque_historico e catalogo
********************************************************************/
CREATE TRIGGER atualizaPecasTriggerFEHInsert AFTER INSERT ON fornecedor_estoque_historico
FOR EACH ROW
BEGIN
        if  new.marca_id >0 and new.puc <> '' then           

            replace into pecas
            set     partnumber         = new.partnumber,
                    marca_id           = new.marca_id,
                    puc                = new.puc,
                    pu                 = new.pu;                    
            call cargaTabelaPecasTrigger(new.pu,new.marca_id);

        end if;  
END;
