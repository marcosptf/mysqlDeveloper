DELIMITER $$

USE `rpm_controlex`$$

DROP PROCEDURE IF EXISTS `geraRelRaridadeInterchange`$$

CREATE DEFINER=`root`@`192.168.0.%` PROCEDURE `geraRelRaridadeInterchange`(p_pn VARCHAR(100),p_pu VARCHAR(100),p_marca_id INT,p_marcanome VARCHAR(50),p_produto_id INT)
BEGIN

    DECLARE no_more_rows INT DEFAULT 0; 
    DECLARE num_rows INT DEFAULT 0;
    DECLARE prd_code,aux_infoFornBR VARCHAR(100);
    
    DECLARE aux_infoQtd, aux_infoNumForn, aux_pos1, aux_pos2 INT DEFAULT 0; 
    DECLARE aux_infoListaForn VARCHAR (255);

    DECLARE aux_GIG_id   INT DEFAULT 0;
    DECLARE c_marca_idA, c_marca_idB,c_produto_id, c_qtd_fornBR INT DEFAULT 0;
    DECLARE c_pnA,c_pnB, c_puA, c_puB, c_origem, c_marcanomeA, c_marcanomeB VARCHAR(100);
    
    DECLARE cur_product CURSOR FOR 
        SELECT i.pnA,i.pnB,i.puA,i.marca_idA,mA.nome AS marcaA,i.puB,i.marca_idB,mB.nome AS marcaB,i.origem FROM interchange AS i
            INNER JOIN  interchange_grupos AS ig ON ig.I_id=i.I_id
            INNER JOIN marca AS mA ON mA.marca_id = i.marca_idA
            INNER JOIN marca AS mB ON mB.marca_id = i.marca_idB
            AND ig.GIG_id=aux_GIG_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = 1;
    

    # Encontra o Grupo Global de Interchange
    SELECT getGIGid(p_pu, p_marca_id) INTO aux_GIG_id;

    # Encontra dados do tipo do produto
    SELECT nome_en,sigla_bearings INTO @produto_nome,@sigla_bearings FROM tipo_produto WHERE id=p_produto_id;

    OPEN cur_product; 

    #select FOUND_ROWS() into num_rows;

    interchange_loop: LOOP

        FETCH cur_product INTO c_pnA,c_pnB,c_puA,c_marca_idA,c_marcanomeA,c_puB,c_marca_idB,c_marcanomeB,c_origem;
        #c_partnumber, c_marca_id, c_pu, c_origem, c_marcanome, c_produto_id, c_produto_nome, c_sigla_bearings, c_qtd_fornBR; 
     
        IF no_more_rows THEN
            CLOSE cur_product;
            LEAVE interchange_loop;
        END IF;
    
        #select c_pnA,c_pnB,c_puA,c_marca_idA,c_marcanomeA,c_puB,c_marca_idB,c_marcanomeB,c_origem,@produto_nome,@sigla_bearings;
        
        #Select infoFornecedoresBR(c_puA,c_marca_idA) into aux_infoFornBR;
    
        #select LOCATE(';', aux_infoFornBR) INTO aux_pos1;
        #select LOCATE(';', aux_infoFornBR,aux_pos1+1) INTO aux_pos2;

        #SELECT SUBSTRING(aux_infoFornBR,aux_pos1 -1) INTO aux_infoNumForn;
        #SELECT SUBSTRING(aux_infoFornBR,aux_pos1 +1,(aux_pos2-aux_pos1+1)) INTO aux_infoQtd;
        #SELECT SUBSTRING_INDEX(aux_infoFornBR,';',-1) INTO aux_infoListaForn;

        #Insere linhas de interchange mascarados na tabela rel_raridade_interchange
        INSERT IGNORE rel_raridade_interchange (pn, pu, marca_id, marca, pn_inter, pu_inter, marca_interid, marcanome_inter,origem,produto_id, produto,sigla_bearings,qtd_fornecedoresBR_inter,qtd_estoqueBR_inter,fornecedoresBR_inter) 
            VALUES (p_pn, p_pu, p_marca_id,p_marcanome, c_pnA, c_puA, c_marca_idA,c_marcanomeA ,c_origem,p_produto_id,@produto_nome,@sigla_bearings,aux_infoNumForn,aux_infoQtd,aux_infoListaForn);

         INSERT IGNORE rel_raridade_interchange (pn, pu, marca_id, marca, pn_inter, pu_inter, marca_interid, marcanome_inter,origem,produto_id, produto,sigla_bearings,qtd_fornecedoresBR_inter,qtd_estoqueBR_inter,fornecedoresBR_inter) 
            VALUES (p_pn, p_pu, p_marca_id,p_marcanome, c_pnB, c_puB, c_marca_idB,c_marcanomeB ,c_origem,p_produto_id,@produto_nome,@sigla_bearings,aux_infoNumForn,aux_infoQtd,aux_infoListaForn);


    END LOOP interchange_loop; 

END$$

DELIMITER ;