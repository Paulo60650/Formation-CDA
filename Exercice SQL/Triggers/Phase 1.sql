/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 27 févr. 2020
 */

-- 1
DROP TRIGGER IF EXISTS `modif_reservation`;

DELIMITER |

CREATE TRIGGER `modif_reservation` BEFORE UPDATE ON `reservation`
    FOR EACH ROW
    BEGIN 
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Il est impossible de modifier les reservations';
    END |
DELIMITER ;

UPDATE `reservation` SET `res_prix` = 4.2 WHERE `res_id` = 1;
-- 2
DROP TRIGGER IF EXISTS `insert_reservation`;

DELIMITER |

CREATE TRIGGER `insert_reservation` AFTER INSERT ON `reservation`
    FOR EACH ROW
    BEGIN
    DECLARE `nbres` INT;
    SET `nbres` = (SELECT COUNT(`res_id`) FROM `reservation`
    JOIN `chambre` ON `chambre`.`cha_id` = `reservation`.`res_cha_id`
    JOIN `hotel` ON `hotel`.`hot_id` = `chambre`.`cha_hot_id`);

    IF `nbres` > 10 THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Ajout de réservation impossible';
    END IF;
END |

DELIMITER ;

INSERT INTO `reservation` (`res_cha_id`, `res_cli_id`, `res_date`, `res_date_debut`, `res_date_fin`, `res_prix`, `res_arrhes`)VALUES
(11, 1, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700),
(10, 1, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700),
(10, 2, '2017-01-10', '2017-07-01', '2017-07-15', 220, 700);

-- 3
DROP TRIGGER IF EXISTS `insert_reservation2`;

DELIMITER |

CREATE TRIGGER `insert_reservation2` AFTER INSERT ON `reservation`
    FOR EACH ROW 
    BEGIN
    DECLARE `nbres_cli` INT;
    SET `nbres_cli` = (SELECT COUNT(`res_cli_id`)FROM `reservation`
    WHERE `res_cli_id` = NEW.`res_cli_id`);

    IF `nbres_cli` > 3 THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Vous avez déjà assez de réservation';
    END IF;
END |

DELIMITER ;

-- 4
DROP TRIGGER IF EXISTS `insert_chambre`;

DELIMITER |

CREATE TRIGGER `insert_chambre` AFTER INSERT ON `chambre`
    FOR EACH ROW
    BEGIN
    DECLARE `cap_hotel` INT;
    SET `cap_hotel` = (SELECT SUM(`cha_capacite`) FROM `chambre`
    WHERE `cha_hot_id` = NEW.`cha_hot_id`);

    IF `cap_hotel` > 50 THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Capacité maximum atteinte';
    END IF;
END |

DELIMITER ; 

INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (210, 7, 10, 1);