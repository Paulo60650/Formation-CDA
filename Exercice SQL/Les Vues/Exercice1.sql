/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 25 févr. 2020
 */
-- View 1	
CREATE OR REPLACE VIEW `v_hotel_station`
AS
SELECT `hotel`.`hot_nom` AS `Nom de l'hotel`,
`station`.`sta_nom` AS `Station`
FROM `hotel`
JOIN `station` ON `hotel`.`hot_sta_id` = `station`.`sta_id`;

-- View 2	
CREATE OR REPLACE VIEW `v_chambre_hotel`
AS
SELECT `chambre`.`cha_numero` AS `Chambre`,
`hotel`.`hot_nom` AS `Nom de l'hotel`
FROM `chambre`
JOIN `hotel` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`;

-- View 3	
CREATE OR REPLACE VIEW`v__reservation_client`
AS
SELECT `reservation`.`res_id` AS `Reservation`,
`client`.`cli_nom` AS `Nom du client`
FROM `reservation`
JOIN `client` ON `reservation`.`res_cha_id` = `client`.`cli_id`;

-- View 4	
CREATE OR REPLACE VIEW`v_chambre_hotel_station`
AS
SELECT `chambre`.`cha_numero` AS `Chambre`,
`hotel`.`hot_nom` AS `Nom de l'hotel`,
`station`.`sta_nom` AS `Station`
FROM `chambre`
JOIN `hotel` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`
JOIN `station` ON `hotel`.`hot_sta_id` = `station`.`sta_id`;

-- View 5	
CREATE OR REPLACE VIEW`v_reservation_client_hotel`
AS
SELECT `reservation`.`res_id` AS `Reservation`,
`client`.`cli_nom` AS `Nom du client`,
`hotel`.`hot_nom` AS `Nom de l'hotel`
FROM `reservation`
JOIN `client` ON `reservation`.`res_cha_id` = `client`.`cli_id`
JOIN `chambre` ON `reservation`.`res_cha_id` = `chambre`.`cha_id`
JOIN `hotel` ON `chambre`.`cha_hot_id` = `hotel`.`hot_id`;