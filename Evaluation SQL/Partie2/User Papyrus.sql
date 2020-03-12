/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 21 févr. 2020
 */

CREATE USER 'util1'@'%' IDENTIFIED BY 'Roger';

GRANT ALL PRIVILEGES ON papyrus.* TO 'util1'@'%'
IDENTIFIED BY 'Roger';

CREATE USER 'util2'@'%' IDENTIFIED BY 'Federer';

GRANT SELECT ON papyrus.* TO 'util2'@'%'
IDENTIFIED BY 'Federer';

CREATE USER 'util3'@'%' IDENTIFIED BY 'Nadal';

GRANT SHOW VIEW ON papyrus.fournis TO 'util3'@'%'
IDENTIFIED BY '21GM';