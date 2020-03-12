/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 26 févr. 2020
 */
-- Exercice 1
DROP PROCEDURE IF EXISTS `lst_fournis`;

DELIMITER |

CREATE PROCEDURE `lst_fournis`()
 
BEGIN
    SELECT DISTINCT `numfou`
    FROM `entcom`;
END |

DELIMITER ;

CALL `lst_fournis`;
-- Exercice 2

DROP PROCEDURE IF EXISTS `lst_commandes`;

DELIMITER |

CREATE PROCEDURE `lst_commandes`(
IN `commentaire` VARCHAR(50))

BEGIN
    SELECT `entcom`.`numcom` AS `numéro_de_commande`,
    `fournis`.`nomfou` AS `nom_du_fournisseur`,
    `produit`.`libart` AS `libelle_article`,
    (`priuni` * `qteliv`) AS `total`
    FROM `fournis`
    JOIN `entcom` ON `entcom`.`numfou` = `fournis`.`numfou`
    JOIN `ligcom` ON `ligcom`.`numcom` = `entcom`.`numcom`
    JOIN `produit` ON `produit`.`codart` = `ligcom`.`codart` 
    WHERE `obscom` = `commentaire`; 
END |

DELIMITER ;

CALL `lst_commandes`('Commande urgente');

-- Exercice 3

DROP PROCEDURE IF EXISTS `ca_fournisseur`;

DELIMITER |

CREATE PROCEDURE `ca_fournisseur`(
IN `code_fou` INT(11),
IN `annee` YEAR)

BEGIN
    SELECT SUM(`ligcom`.`priuni` * `ligcom`.`qtecde`) AS `chiffre_affaire_potentiel`
    FROM `ligcom`
    JOIN `entcom` ON `entcom`.`numcom` = `ligcom`.`numcom`
    JOIN `fournis` ON `fournis`.`numfou` = `entcom`.`numfou`
    WHERE `fournis`.`numfou` = `code_fou`
    AND YEAR(`entcom`.`datcom`) = `annee`;
END |

DELIMITER ;

CALL `ca_fournisseur`(540, '2018');
    