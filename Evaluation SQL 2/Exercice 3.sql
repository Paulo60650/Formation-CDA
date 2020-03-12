/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 28 févr. 2020
 */

DROP TRIGGER IF EXISTS `verif_country`;

DELIMITER |

CREATE TRIGGER `verif_country` BEFORE INSERT ON `order details`
    FOR EACH ROW
    BEGIN
    DECLARE `cli_country` VARCHAR(15);
    DECLARE `fourni_country` VARCHAR(15);

    SET `cli_country` = (SELECT DISTINCT `suppliers`.`Country` FROM `suppliers` 
    JOIN `products` ON `products`.`SupplierID` = `suppliers`.`SupplierID`
    JOIN `order details` ON `order details`.`ProductID` = `products`.`ProductID`
    WHERE `order details`.`ProductID` = NEW.`ProductID`);

    SET `fourni_country` = (SELECT DISTINCT `customers`.`Country` FROM `customers`
    JOIN `orders` ON `orders`.`CustomerID` = `customers`.`CustomerID`
    JOIN `order details` ON `order details`.`OrderID` = `orders`.`OrderID`
    WHERE `order details`.`OrderID` = NEW.`OrderID`);

    IF `cli_country` != `fourni_country`
    THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Livraison impossible';
    END IF;
END |

DELIMITER ;