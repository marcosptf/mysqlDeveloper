/* function do renato */

delimiter //

CREATE FUNCTION qtdPuMarca(p_pu char(100),p_marca_id int)
 RETURNS INT 
 DETERMINISTIC

 BEGIN
  DECLARE estoque INT;
  select sum(qtd) into estoque from fornecedor_estoque_historico where pu=p_pu and marca_id=p_marca_id and ultimo=1;
  RETURN estoque;
 END 
//