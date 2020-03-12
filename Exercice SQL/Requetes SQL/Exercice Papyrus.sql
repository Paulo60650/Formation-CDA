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
SELECT nomfou AS "Nom du fournisseur"
FROM fournis
WHERE numfou =  09120;
-- ex2
SELECT DISTINCT numfou AS "Num�ro de fournisseur"
FROM fournis;
-- ex3
SELECT COUNT(numcom) AS "Nombre de commandes",
COUNT(DISTINCT numfou) AS "Nombre de fournisseurs"
FROM entcom;
-- ex4
SELECT codart AS "Code article",
libart AS "Libell� du produit",
stkphy AS "Stock",
stkale AS "Stock alert",
qteann AS "Quantit� annuelle"
FROM produit
WHERE (stkphy <= stkale AND qteann < 1000);
-- ex5
SELECT SUBSTRING(posfou, 1, 2) AS "Num�ro de d�partement",
nomfou AS "Num�ro de fournisseur"
FROM fournis
WHERE SUBSTRING(posfou, 1, 2) = 75
OR SUBSTRING(posfou, 1, 2) = 77
OR SUBSTRING(posfou, 1, 2) = 78
OR SUBSTRING(posfou, 1, 2) = 92
ORDER BY posfou DESC, nomfou;
-- ex6
SELECT numcom AS "Commande de mars et avril"
FROM entcom
WHERE datcom LIKE "%-03-%"
OR datcom LIKE "%-04-%";
-- ex7
SELECT numcom AS "Numero de Commande", 
datcom AS "Date de la commande"
FROM entcom 
WHERE datcom = (SELECT CAST(NOW() AS DATE))
AND obscom != "";
-- ex8
SELECT numcom AS "Num�ro de commande",
SUM(priuni * qteliv) AS "Total"
FROM ligcom
GROUP BY numcom
ORDER BY Total DESC;
-- ex9
SELECT numcom AS "Num�ro de commande",
SUM(priuni * qteliv) AS "Total"
FROM ligcom
WHERE qteliv >= 1000
GROUP BY numcom
HAVING Total > 10000;
-- ex10
SELECT fournis.nomfou AS "Nom du fournisseur",
entcom.numcom AS "Num�ro de commande",
entcom.datcom AS "Date de commande"
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou;
-- ex11
SELECT entcom.numcom AS "Num�ro de commande",
fournis.nomfou AS "Nom du fournisseur",
produit.libart AS "Libell� article",
priuni * qteliv AS "Total"
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
JOIN ligcom ON ligcom.numcom = entcom.numcom
JOIN produit ON produit.codart = ligcom.codart
WHERE obscom = "Commande urgente";
-- ex12
SELECT DISTINCT fournis.nomfou AS "Nom du fournisseur"
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
JOIN ligcom ON ligcom.numcom = entcom.numcom
WHERE ligcom.qteliv > 0;
-- ex13
SELECT numcom AS "Num�ro de commande",
datcom AS "Date de la commande"
FROM entcom
WHERE numfou = (
SELECT numfou
FROM entcom 
WHERE numcom = 70210);
-- ex14
SELECT produit.libart AS "Libell� de l'article",
vente.prix1 AS "Prix 1"
FROM produit
JOIN vente ON vente.codart = produit.codart
WHERE vente.prix1 < ALL (
SELECT prix1 
FROM vente
WHERE codart LIKE "R%");
-- ex15
SELECT DISTINCT fournis.nomfou AS "Nom du fournisseur", 
produit.libart AS "Libell� de l'article"
FROM fournis 
JOIN vente ON vente.numfou = fournis.numfou
JOIN produit ON produit.codart = vente.codart
WHERE produit.stkphy >= produit.stkale * 150 / 100
ORDER BY produit.libart, fournis.nomfou;
-- ex16
SELECT DISTINCT fournis.nomfou AS "Nom du fournisseur", 
produit.libart AS "Libell� de l'article"
FROM fournis 
JOIN vente ON vente.numfou = fournis.numfou
JOIN produit ON produit.codart = vente.codart
WHERE produit.stkphy >= produit.stkale * 150 / 100
AND vente.delliv <= 30
ORDER BY produit.libart, fournis.nomfou;
-- LES BESOINS DE MISE A JOUR
-- ex1
UPDATE vente
SET prix1 = prix1 * 1.04,
prix2 = prix2 * 1.02
WHERE numfou = 9180;
-- ex2
UPDATE vente 
SET prix2 = prix1
WHERE prix2 = 0;
-- ex3
UPDATE entcom
JOIN fournis ON fournis.numfou = entcom.numfou
SET entcom.obscom = CONCAT(entcom.obscom, "*****")
WHERE fournis.satisf < 5;
-- ex4
DELETE FROM vente
WHERE codart = I110;
DELETE FROM produit
WHERE codart = I110;