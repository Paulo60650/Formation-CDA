/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 20 févr. 2020
 */

DROP  DATABASE  IF  EXISTS exercice1;
CREATE  DATABASE exercice1;
USE exercice1;

CREATE TABLE Personne(
   perNum INT NOT NULL AUTO_INCREMENT,
   perNom VARCHAR(30) NOT NULL,
   perPrenom VARCHAR(30) NOT NULL,
   perAdresse VARCHAR(100) NOT NULL,
   perVille VARCHAR(30) NOT NULL,
   PRIMARY KEY(perNum)
);

CREATE TABLE Groupe(
   groNum INT NOT NULL AUTO_INCREMENT,
   groLibelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(groNum)
);

CREATE TABLE Appartient(
   perNum INT,
   groNum INT,
   PRIMARY KEY(perNum, groNum),
   FOREIGN KEY(perNum) REFERENCES Personne(perNum),
   FOREIGN KEY(groNum) REFERENCES Groupe(groNum)
);