/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 26 févr. 2020
 */
-- View 1	
CREATE OR REPLACE VIEW `v_global_cde`
AS
SELECT `codart`,
SUM(`qtecde`) AS `QteTot`,
SUM(`qtecde` * `priuni`) AS `PrixTot`
FROM `ligcom`
GROUP BY `codart`;

-- View 2
CREATE OR REPLACE VIEW `v_ventes-I100`
AS
SELECT * FROM `vente`
WHERE `codart` = 'I100';

-- View 3
CREATE OR REPLACE VIEW `v_ventesI100_grobrigan`
AS 
SELECT * FROM `v_ventesI100`
WHERE `numfou` = '00120';