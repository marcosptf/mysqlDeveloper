DELIMITER $$

USE `rpm_controlex`$$

DROP FUNCTION IF EXISTS `encontraMarcaID`$$

CREATE DEFINER=`root`@`192.168.0.%` FUNCTION `encontraMarcaID`(pMarca CHAR(100)) RETURNS INT(5)
    DETERMINISTIC
BEGIN
 DECLARE resp1,resp2 INT(5);

SELECT marca_id INTO resp1 FROM marca
    WHERE LOWER(TRIM(nome))=LOWER(TRIM(pMarca));

IF resp1 IS NULL THEN
    SELECT marca_id INTO resp2 FROM marca_depara 
        WHERE LOWER(TRIM(variacao))=LOWER(TRIM(pMarca));
    RETURN resp2;
ELSE 
    RETURN resp1;
END IF;

END$$

DELIMITER ;