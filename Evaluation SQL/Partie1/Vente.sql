/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 24 f�vr. 2020
 */

DROP DATABASE IF EXISTS Vente;
-- Si la base de donn�e Vente existe elle est supprim�e
CREATE DATABASE Vente;
-- Cr�ation de la base de donn�e Vente
USE Vente;
-- Les commandes suivantes seront ins�r�es dans la base 
-- On d�clare les tables avec uniquement des cl�s primaires avant cellescontenant des cl�s �trang�res
CREATE TABLE produit(
-- Cr�ation d'une table. Utilisation de int car nous voulons des nombres et de 
-- VARCHAR car nous voulons une string, le (50) est donner une limite de 50 caract�res
	pro_num	INT,
	pro_lib	VARCHAR(50),
	pro_desc VARCHAR(50),
	PRIMARY KEY (pro_num));
-- D�clarartion de la cl� primaire du tableau
CREATE TABLE client(
-- Cr�ation d'une table 
	cli_num	INT AUTO_INCREMENT, 
	cli_nom	VARCHAR(50),
	cli_adres VARCHAR(50), 
	cli_tel	VARCHAR(30),
	PRIMARY KEY (cli_num));
-- D�clarartion de la cl� primaire du tableau
CREATE INDEX `index` ON `client`(`cli_nom`);
-- D�claration d'un index sur cli_nom 
CREATE TABLE commande(
-- Cr�ation d'une table 
	com_num	INT AUTO_INCREMENT, 
	com_cli_num INT,
	com_date DATETIME,
	com_obs	VARCHAR(50),
	PRIMARY KEY (com_num),
    -- D�clarartion de la cl� primaire du tableau
	FOREIGN KEY (com_cli_num) REFERENCES client(cli_num)
    -- D�clarartion d'une cl� �trang�re li� � la table client(via la cl� primaire cli_num)
	);

CREATE TABLE vente(
	vnt_com_num INT, 
	vnt_pro_num INT, 
	vnt_est_qte INT, 
	PRIMARY KEY (vnt_com_num, vnt_pro_num),
      -- D�clarartion d'une cl� primaire 
	FOREIGN KEY (vnt_com_num) REFERENCES commande(com_num),
     -- D�clarartion d'une cl� �trang�re li� � la table commande(via la cl� primaire com_num)
	FOREIGN KEY (vnt_pro_num) REFERENCES produit(pro_num)
     -- D�clarartion d'une cl� �trang�re li� � la table produit(via la cl� primaire pro_num)
	);