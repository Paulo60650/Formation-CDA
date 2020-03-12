/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 27 févr. 2020
 */

USE `papyrus`;

DROP TABLE IF EXISTS `articles_a_commmander`;    

CREATE TABLE `articles_a_commmander`(
`codart` CHAR(4) NOT NULL,
`date` DATE,
`qte` INT,
CONSTRAINT `PK_articles_a_commmander` PRIMARY KEY (`date`)
);

DROP TRIGGER IF EXISTS `update_produits`;

DELIMITER |

CREATE TRIGGER `update_produits` AFTER UPDATE ON `produit`
    FOR EACH ROW
    BEGIN
    DECLARE `stk_warning` INT;
    SET `stk_warning` = (SELECT (`stkale` - `stkphy`) FROM `produit` WHERE `codart` = NEW.`codart`);
    IF `stk_warning`> 0 THEN
    INSERT INTO `articles_a_commmander` VALUES (NEW.`codart`,NOW(),`stk_warning`);
    END IF;
END |

DELIMITER ;

UPDATE `produit` SET `stkphy` = 10 WHERE `codart` = 'B001';