/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 28 févr. 2020
 */

-- 9
DROP PROCEDURE IF EXISTS `der_com`;

DELIMITER |

CREATE PROCEDURE `der_com`(
IN `nom_comp` VARCHAR(40))

    BEGIN
    SELECT Max(`orders`.`OrderDate`) AS `Date de dernière commande`
    FROM `orders`
    JOIN `customers` ON `customers`.`CustomerID` = `orders`.`CustomerID`
    WHERE `nom_comp` = `customers`.`CompanyName`;
END |

DELIMITER ;

CALL `der_com`('Du monde entier');

-- 10
DROP PROCEDURE IF EXISTS `del_liv_moy`;

DELIMITER |

CREATE PROCEDURE `del_liv_moy`()

    BEGIN
    SELECT ROUND(AVG(DATEDIFF(`ShippedDate`, `OrderDate`))) AS `Délai de livraison moyen en jours`
    FROM `orders`;
END |

DELIMITER ;

CALL `del_liv_moy`;