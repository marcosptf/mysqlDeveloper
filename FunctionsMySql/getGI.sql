DELIMITER $$

USE `rpm_controlex`$$

DROP FUNCTION IF EXISTS `getGIGid`$$

CREATE DEFINER=`root`@`192.168.0.%` FUNCTION `getGIGid`(p_pu CHAR(100),p_marca_id INT) RETURNS INT(8)
    DETERMINISTIC
BEGIN
    DECLARE aux_GIG_id   INT DEFAULT 0;
    DECLARE dado,dado1,dado2,dado3,dado4,dado5,dado6,dado7,dado8,dado9,ueba CHAR(60);

    SELECT ig.GIG_id INTO aux_GIG_id FROM interchange_grupos ig
        INNER JOIN interchange i ON (i.I_id=ig.I_id AND i.puA=p_pu AND i.marca_idA=p_marca_id) 
        LIMIT 1; 

    IF (aux_GIG_id IS NULL OR aux_GIG_id=0) THEN
        
        SELECT ig.GIG_id INTO aux_GIG_id FROM interchange_grupos ig
            INNER JOIN interchange i ON (i.I_id=ig.I_id AND i.puB=p_pu AND i.marca_idB=p_marca_id) 
            LIMIT 1; 

    END IF;

    IF (aux_GIG_id IS NULL OR aux_GIG_id=0) THEN
        
        SELECT ig.GIG_id INTO aux_GIG_id FROM interchange_grupos ig
            INNER JOIN interchange i ON (i.I_id=ig.I_id AND i.puA=p_pu) 
            LIMIT 1; 

    END IF;

    IF (aux_GIG_id IS NULL OR aux_GIG_id=0) THEN
        
        SELECT ig.GIG_id INTO aux_GIG_id FROM interchange_grupos ig
            INNER JOIN interchange i ON (i.I_id=ig.I_id AND i.puB=p_pu) 
            LIMIT 1; 

    END IF;

/* return ueba; */
    RETURN aux_GIG_id;

END$$

DELIMITER ;