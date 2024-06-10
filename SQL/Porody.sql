DESCRIBE rodicky_cisar;

ALTER TABLE rodicky_cisar
MODIFY cis_anestezie_sc VARCHAR(255);

UPDATE  rodicky_cisar
SET cis_anestezie_sc = 'Spinální'
WHERE cis_anestezie_sc = '3';


DELIMITER //
CREATE PROCEDURE change_year()
BEGIN
    DECLARE i INT;
    SET i = 0;
    WHILE i <= 22 DO
        UPDATE rodicky_cisar
        SET cis_rok_porodu = 2000 + i
        WHERE cis_rok_porodu = 1 + i;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL change_year();


UPDATE rodicky_cisar
SET pocitadlo = 1
WHERE pocitadlo IS NULL;


CREATE OR REPLACE VIEW casarsky_rez_rodicky AS
    SELECT
        *
    FROM rodicky_cisar;
