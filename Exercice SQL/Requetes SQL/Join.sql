/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 24 f�vr. 2020
 */

-- JOINTURES
-- ex1
SELECT prenom, nodep, noregion
FROM employe 
JOIN dept ON employe.nodep = dept.nodept;
-- ex2
SELECT nodep AS "Numero de d�partement",
dept.nom AS "Nom du departement", 
employe.nom AS "Nom de l'employ�"
FROM employe 
JOIN dept ON employe.nodep =  dept.nodept
ORDER BY nodep;
-- ex3
SELECT employe.nom AS "Employ�s du d�partement distribution" 
FROM employe 
JOIN dept ON employe.nodep = dept.nodept 
WHERE dept.nom = "distribution";
-- AUTO-JOINTURES
-- ex4
SELECT tab1.nom AS "Nom employ�", 
tab1.salaire AS "Salaire de employ�",  
tab2.nom AS "Nom du sup�rieur", 
tab2.salaire AS "Salaire du sup�rieur"
FROM employe AS tab1
JOIN employe AS tab2 ON tab2.noemp = tab1.nosup
WHERE tab1.salaire > tab2.salaire; 
-- SOUS-REQU�TES
-- ex5
SELECT nom, titre
FROM employe
WHERE titre IN
(SELECT titre FROM employe WHERE nom ="amartakaldire")
AND nom != "amartakaldire";
-- ex6
SELECT nom AS "Nom employ�",
salaire AS "Salaire de employ�",
nodep AS "Num�ro du d�partement" 
FROM employe
WHERE salaire > ALL
(SELECT MIN(salaire) FROM employe WHERE nodep = 31)
ORDER BY nodep, salaire;
-- ex7
SELECT nom AS "Nom employ�",
salaire AS "Salaire de employ�",
nodep AS "Num�ro du d�partement" 
FROM employe
(SELECT salaire FROM employe WHERE nodep = 31)
ORDER BY nodep, salaire;
-- ex8
SELECT nom AS "Nom employ�",
titre AS "Titre"
FROM employe
WHERE nodep = 31 AND titre = ANY
(SELECT titre FROM employe WHERE nodep = 32);
-- ex9
SELECT nom AS "Nom employ�",
titre AS "Titre"
FROM employe
WHERE nodep = 31 AND titre != ALL
(SELECT titre FROM employe WHERE nodep = 32);
-- ex10
SELECT nom AS "Nom employ�",
titre AS "Titre",
salaire AS "Salaire de employ�"
FROM employe
WHERE titre = (SELECT titre FROM employe WHERE nom = "fairent") 
AND salaire = (SELECT salaire FROM employe WHERE nom = "fairent")
AND nom != "fairent";
-- REQU�TES EXTERNES
-- ex11
SELECT dept.nodept AS "Num�ro du d�partement", 
dept.nom AS " Nom du d�partement", 
employe.nom AS "Nom employ�"
FROM dept
LEFT JOIN employe ON nodept = nodep
ORDER BY nodep;
-- UTILISATION DE FONCTIONS DE GROUPES
-- ex12
SELECT titre AS "Titre",
Count(noemp) AS "Nombre d'employ�"
FROM employe
GROUP BY titre;
-- ex13
SELECT noregion AS "Num�ro de r�gion",
AVG(employe.salaire) AS "Salaire moyen",
SUM(employe.salaire) AS "Somme des salaires"
FROM employe 
JOIN dept ON employe.nodep = dept.nodept
GROUP BY noregion;
-- LA CLAUSE HAVING
-- ex14
SELECT nodep AS "Num�ro du d�partement", 
Count(noemp) AS "Nombre d'employ�"
FROM employe
GROUP BY nodep
HAVING COUNT(*) >= 3;
-- ex15
SELECT SUBSTRING(nom, 1, 1) AS "Initiale",
COUNT(SUBSTRING(nom, 1, 1)) AS "Occurence"
FROM employe 
GROUP BY Initiale
HAVING Occurence >= 3;
-- ex16
SELECT Min(salaire) AS "Salaire minimum",
Max(salaire) AS "Salaire maximum",
MAX(salaire) - MIN(salaire) AS "Diff�rence entre max et min"
FROM employe;
-- ex17
SELECT COUNT(Distinct titre) AS "Nombre de titre diff�rents"
FROM employe;
-- ex18
SELECT titre AS "Titre",
COUNT(titre) "Nombre d'employ�"
FROM employe
GROUP BY titre;
-- ex19
SELECT DISTINCT titre AS "Titre",
AVG(salaire) AS "Salaire moyen"
FROM employe
GROUP BY titre
HAVING AVG(salaire) > 
(SELECT AVG(salaire) FROM employe WHERE titre = "repr�sentant");
-- ex20
SELECT COUNT(salaire) AS "Nombre de salaire renseign�",
COUNT(tauxcom) AS "Nombre de taux de commission renseign�"
FROM employe;