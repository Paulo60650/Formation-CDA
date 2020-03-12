/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 21 f�vr. 2020
 */

DROP DATABASE IF EXISTS `papyrus`;
-- Si la base de donn�e papyrus existe elle est supprim�e
CREATE DATABASE `papyrus`;
-- Cr�ation de la base de donn�e papyrus
USE `papyrus`;
-- Les commandes suivantes seront ins�r�es dans la base papyrus
CREATE TABLE `produit` (
--Cr�ation d'une table
	`codart` CHAR(4) NOT NULL,
	`libart` VARCHAR(30) NOT NULL,
	`stkale` INT NOT NULL,
	`stkphy` INT NOT NULL,
	`qteann` INT NOT NULL,
	`unimes` CHAR(5) NOT NULL,
	CONSTRAINT `PK_produit` PRIMARY KEY (`codart`)
-- D�clarartion de la cl� primaire du tableau 
);

CREATE TABLE fournis (
--Cr�ation d'une table
    `numfou` INT,
    `nomfou` VARCHAR(25) NOT NULL,
    `ruesfou` VARCHAR(50) NOT NULL,
    `posfou` CHAR(5) NOT NULL,
    `vilfou` VARCHAR(30) NOT NULL,
    `confou` VARCHAR(15) NOT NULL,
    `satisf` TINYINT(3) CHECK (`SATISF` BETWEEN 1 AND 10),
    CONSTRAINT `PK_fournis` PRIMARY KEY (`numfou`)
-- D�clarartion de la cl� primaire du tableau
);

CREATE TABLE entcom (
--Cr�ation d'une table
	`numcom` INT NOT NULL,
	`obscom` VARCHAR(50),
	`datcom` TIMESTAMP DEFAULT NOW(),
	`numfou` INT,
	CONSTRAINT `PK_entcom` PRIMARY KEY (`numcom`),
-- D�clarartion de la cl� primaire du tableau
	CONSTRAINT `FK_entcom_fournis` FOREIGN KEY (`numfou`) REFERENCES `fournis`(`numfou`)
 -- D�clarartion d'une cl� �trang�re li� � la table produit(via la cl� primaire pro_num)
);
CREATE INDEX `index` ON `entcom` (`NUMFOU`);

CREATE TABLE `ligcom` (
--Cr�ation d'une table
	`numlig` TINYINT(3) NOT NULL, 
	`qtecde` INT(10) NOT NULL, 
	`priuni` DECIMAL(9,2) NOT NULL, 
	`qteliv` INT(10), 
	`derliv` DATE NOT NULL, 
	`numcom` INT NOT NULL, 
	`codart` CHAR(4) NOT NULL, 
	CONSTRAINT `PK_ligcom` PRIMARY KEY (`numlig`, `numcom`),
-- D�clarartion de la cl� primaire du tableau qui est une cl� associ�e
	CONSTRAINT `FK_ligcom_entcom` FOREIGN KEY (`numcom`) REFERENCES `entcom`(`numcom`), 
	CONSTRAINT `FK_ligcom_ produit` FOREIGN KEY (`codart`) REFERENCES `produit`(`codart`)
 -- D�clarartion d'une cl� �trang�re li� � la table produit(via la cl� primaire pro_num)
);


CREATE TABLE `vente` (
--Cr�ation d'une table
	`numfou` INT NOT NULL,
	`codart` CHAR(4) NOT NULL,
	`delliv` INT NOT NULL, 
	`qte1` INT NOT NULL, 
	`prix1` DECIMAL(9,2) NOT NULL, 
	`qte2` INT, 
	`prix` DECIMAL(9,2), 
	`qte3` INT, 
	`prix3` DECIMAL(9,2),
	CONSTRAINT `PK_vente` PRIMARY KEY (`numfou`, `codart`),
-- D�clarartion de la cl� primaire du tableau qui est une cl� associ�e 
	CONSTRAINT `FK_vente_fournis` FOREIGN KEY (`numfou`) REFERENCES `fournis`(`numfou`), 
	CONSTRAINT `FK_vente_produit` FOREIGN KEY (`codart`) REFERENCES `produit`(`codart`)
 -- D�clarartion d'une cl� �trang�re li� � la table produit(via la cl� primaire pro_num)
);
