DELIMITER $$

USE `rpm_controlex`$$

DROP FUNCTION IF EXISTS `limpaCharEscondidosPARTNUMBER`$$

CREATE DEFINER=`root`@`192.168.0.%` FUNCTION `limpaCharEscondidosPARTNUMBER`(partnumber CHAR(100)) RETURNS VARCHAR(255) CHARSET utf8
    DETERMINISTIC
BEGIN
DECLARE ueba CHAR(100);

SET ueba = REPLACE(CONVERT(partnumber USING ASCII),'?','-');
SET ueba = REPLACE(ueba,'\n','');
SET ueba = REPLACE(ueba,'\r','');
SET ueba = TRIM(BOTH '-' FROM ueba);
SET ueba = TRIM(ueba);
SET ueba = TRIM(BOTH '.' FROM ueba);
SET ueba = TRIM(BOTH CHAR(9) FROM ueba);

/* return ueba; */
RETURN ueba;

END$$

DELIMITER ;