/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 24 f�vr. 2020
 */

-- ex1
SELECT * FROM employe;
-- ex2
SELECT nodept, nom, noregion
FROM dept;
-- ex3
SELECT nom AS "Nom de l'employ�", 
dateemb AS "Date d'embauche", 
nosup AS "Num�ro du sup�rieur", 
nodep AS "Num�ro du d�partement", 
salaire AS "Salaire" 
FROM employe;
-- ex4
SELECT nom AS "Nom de l'employ�",
titre AS "Titre"
FROM employe;
-- ex5
SELECT DISTINCT titre FROM employe;
-- ex6
SELECT nom AS "Nom de l'employ�",
noemp AS "Num�ro d'employ�",
nodep AS "Num�ro du d�partement"
FROM employe
WHERE titre = "secr�taire";
-- ex7
SELECT nom AS "Nom de l'employ�",
nodep AS "Num�ro du d�partement"
FROM employe
WHERE nodep > 40;
-- ex8
SELECT nom AS "Nom de l'employ�",
prenom AS "Prenom de l'employ�"
FROM employe 
WHERE nom < prenom;
-- ex9
SELECT nom AS "Nom de l'employ�",   
nodep AS "Num�ro du d�partement", 
salaire AS "Salaire"
FROM employe
WHERE titre = "repr�sentant"
AND nodep = 35
AND salaire > 20000;
-- ex10
SELECT nom AS "Nom de l'employ�",   
nodep AS "Num�ro du d�partement", 
salaire AS "Salaire"
FROM employe
WHERE titre = "repr�sentant" OR titre = "pr�sident";
-- ex11
SELECT nom AS "Nom de l'employ�",
titre AS "Titre",
nodep AS "Num�ro du d�partement", 
salaire AS "Salaire"
FROM employe
WHERE nodep = 34
AND (titre = "repr�sentant" OR titre = "secr�taire");
-- ex12
SELECT nom AS "Nom de l'employ�",
titre AS "Titre",
nodep AS "Num�ro du d�partement", 
salaire AS "Salaire"
FROM employe
WHERE titre = "repr�sentant"
OR (titre = "secr�taire" AND nodep = 34);
-- ex13
SELECT nom AS "Nom de l'employ�",
salaire AS "Salaire"
FROM employe 
WHERE (salaire > 20000 AND salaire < 30000);
-- ex15
SELECT nom AS "Nom de l'employ�"
FROM employe
WHERE (nom LIKE "h%");
-- ex16
SELECT nom AS "Nom de l'employ�"
FROM employe
WHERE (nom LIKE "%n");
-- ex17
SELECT nom AS "Nom de l'employ�"
FROM employe
WHERE (nom LIKE "__u%");
-- ex18
SELECT nom AS "Nom de l'employ�",
salaire AS "Salaire"
FROM employe 
WHERE nodep = 41
ORDER BY salaire;
-- ex19
SELECT nom AS "Nom de l'employ�",
salaire AS "Salaire"
FROM employe 
WHERE nodep = 41
ORDER BY salaire DESC;
-- ex20
SELECT nom AS "Nom de l'employ�",
titre AS "Titre",
salaire AS "Salaire"
FROM employe 
ORDER BY titre, salaire DESC;
-- ex21
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
salaire AS "Salaire"
FROM employe
ORDER BY tauxcom;
-- ex22
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom IS NULL;
-- ex23
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom IS NOT NULL;
-- ex24
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom < 15;
-- ex25
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire"
FROM employe
WHERE tauxcom > 15;
-- ex26
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire",
(salaire * tauxcom) / 100 AS "Commission"
FROM employe
WHERE tauxcom IS NOT NULL;
-- ex27
SELECT nom AS "Nom de l'employ�",
tauxcom As "Taux de commission",
titre AS "Titre",
salaire AS "Salaire",
(salaire * tauxcom) / 100 AS "Commission"
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom;
-- ex28
SELECT CONCAT(nom, " ", prenom) AS "Employ�"
FROM employe;
-- ex29
SELECT SUBSTRING(nom, 1, 5) AS "Nom de l'employ�"
FROM employe;
-- ex30
SELECT nom,
LOCATE("r", nom) AS "Rand du r dans les noms"
FROM employe;
-- ex31
SELECT nom,
UPPER(nom) AS "Nom en majuscule",
LOWER(nom) AS "Nom en minuscule"
FROM employe;
-- ex32
SELECT nom,
LENGTH(nom) AS "Longueur du nom"
FROM employe;