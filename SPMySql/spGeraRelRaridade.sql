DELIMITER $$

USE `rpm_controlex`$$

DROP PROCEDURE IF EXISTS `geraRelRaridade`$$

CREATE DEFINER=`root`@`192.168.0.%` PROCEDURE `geraRelRaridade`()
BEGIN

    DECLARE no_more_rows, quantity_in_stock INT DEFAULT 0; 
    DECLARE num_rows INT DEFAULT 0;
    DECLARE prd_code,aux_infoFornBR VARCHAR(100);
    
    DECLARE aux_infoQtd, aux_infoNumForn, aux_pos1, aux_pos2 INT DEFAULT 0; 
    DECLARE aux_infoListaForn VARCHAR (255);

    DECLARE aux_GIG_id   INT DEFAULT 0;
    DECLARE c_marca_id, c_produto_id, c_qtd_fornBR INT DEFAULT 0;
    DECLARE c_partnumber, c_pu, c_origem, c_marcanome, c_produto_nome, c_sigla_bearings VARCHAR(100);
    
    DECLARE cur_product CURSOR FOR 
        SELECT p.partnumber, p.marca_id, p.pu, p.origem,m.nome AS marcanome, pp.produto_id,tp.nome_en AS produto_nome,tp.sigla_bearings, (SELECT qtdFornecedoresBR(p.pu,p.marca_id)) AS qtd_fornBR 
            FROM pecas AS p
            LEFT JOIN rel_raridade AS r ON (r.pu=p.pu AND r.marca_id = p.marca_id)
            INNER JOIN marca AS m ON (m.marca_id = p.marca_id)
            LEFT JOIN pecas_produto pp ON (pp.pu = p.pu AND pp.marca_id = p.marca_id)
            LEFT JOIN tipo_produto tp ON (tp.id = pp.produto_id)
            WHERE (r.pu IS NULL AND r.marca_id IS NULL) LIMIT 10000; 
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = 1;

    OPEN cur_product; 

    SELECT FOUND_ROWS() INTO num_rows;

    originais_loop: LOOP

        FETCH cur_product INTO c_partnumber, c_marca_id, c_pu, c_origem, c_marcanome, c_produto_id, c_produto_nome, c_sigla_bearings, c_qtd_fornBR; 
     
        IF no_more_rows THEN
            CLOSE cur_product;
            LEAVE originais_loop;
        END IF;
    
        SELECT infoFornecedoresBR(c_pu,c_marca_id) INTO aux_infoFornBR;
    
        SELECT LOCATE(';', aux_infoFornBR) INTO aux_pos1;
        SELECT LOCATE(';', aux_infoFornBR,aux_pos1+1) INTO aux_pos2;

        SELECT SUBSTRING(aux_infoFornBR,aux_pos1 -1) INTO aux_infoNumForn;
        SELECT SUBSTRING(aux_infoFornBR,aux_pos1 +1,(aux_pos2-aux_pos1+1)) INTO aux_infoQtd;
        SELECT SUBSTRING_INDEX(aux_infoFornBR,';',-1) INTO aux_infoListaForn;

        #Insere linhas de originais na tabela rel_raridade

        INSERT IGNORE rel_raridade_teste (pn, marca_id, marca,  pu, origem,produto_id, produto, sigla_bearings, qtd_fornecedoresBR,qtd_estoqueBR,fornecedoresBR) 
                                  VALUES ( c_partnumber, c_marca_id, c_marcanome, c_pu, c_origem,c_produto_id, c_produto_nome,c_sigla_bearings, aux_infoNumForn,aux_infoQtd,aux_infoListaForn);
    
        #CALL geraRelRaridadeInterchange(c_partnumber,c_pu, c_marca_id,c_marcanome,c_produto_id);
        
        


    END LOOP originais_loop; 

END$$

DELIMITER ;