DELIMITER $$

USE `rpm_controlex`$$

DROP FUNCTION IF EXISTS `infoFornecedoresBR`$$

CREATE DEFINER=`root`@`192.168.0.%` FUNCTION `infoFornecedoresBR`(p_pu CHAR(100),p_marca_id INT) RETURNS VARCHAR(255) CHARSET utf8
BEGIN
        DECLARE info_fornecedores VARCHAR(255);
            

       SELECT CONCAT(COUNT(feh.fornecedor_id),";",SUM(qtd),";",GROUP_CONCAT(f.nome)) INTO info_fornecedores FROM fornecedor_estoque_historico AS feh,fornecedor AS f 
		WHERE feh.pu=p_pu 
		AND feh.marca_id=p_marca_id
		AND feh.ultimo=1
		AND f.fornecedor_id=feh.fornecedor_id 
		AND f.pais_sigla = "BR";
		RETURN info_fornecedores;
END$$

DELIMITER ;