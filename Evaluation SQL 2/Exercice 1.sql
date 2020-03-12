/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 28 f�vr. 2020
 */

-- ex1
SELECT `CompanyName` AS `Soci�t�`,
`ContactName` AS `Contact`,
`Contacttitle` AS `Fonction`,
`Phone` AS `T�l�phone`
-- Je s�lectionne toutes les valeurs grace � SELECT � renvoyer en renommant les tables
--  pour l'affichage grace � AS 
FROM `customers`
-- Je donne la table o� se situe les valeurs � renvoyer
WHERE `Country` ='France';
-- WHERE sert a donner une condition obligatoire � la s�lection

-- ex2
SELECT `ProductName` AS `Produit`,
`UnitPrice` AS `Prix`
-- Je s�lectionne toutes les valeurs grace � SELECT � renvoyer en renommant les tables
--  pour l'affichage grace � AS 
FROM `products`
-- Je donne la table o� se situe les valeurs � renvoyer
JOIN `suppliers` ON `suppliers`.`SupplierID` = `products`.`SupplierID`
WHERE `CompanyName` = 'Exotic Liquids';
-- WHERE sert a donner une condition obligatoire � la s�lection

-- ex3
SELECT `suppliers`.`CompanyName` AS `Fournisseur`,
COUNT(`products`.`ProductID`) AS `Nbre produits`
FROM `suppliers`
JOIN `products` ON `products`.`SupplierID` = `suppliers`.`SupplierID`
-- Je joint les tables grace � leur cl�s �trang�res et/ou cl� primaire grace � JOIN
WHERE `Country` = 'France'
-- WHERE sert a donner une condition obligatoire � la s�lection
GROUP BY `products`.`SupplierID`
ORDER BY `Nbre produits` DESC;
-- J'utilise Order By avec DESC afin d'avoir une organisation d�croissante

-- ex4
SELECT `customers`.`CompanyName` AS `Client`,
COUNT(`orders`.`OrderID`) AS `Nbr commandes`
-- La fonction COUNT compte le nombre de valeur de ce qui lui est rentr� en paramettre
FROM `customers`
JOIN `orders` ON `orders`.`CustomerID` = `customers`.`CustomerID`
-- Je joint les tables grace � leur cl�s �trang�res et/ou cl� primaire grace � JOIN
WHERE `Country` = 'France'
-- WHERE sert a donner une condition obligatoire � la s�lection
GROUP BY `customers`.`CompanyName`
-- GROUP BY permet de regrouper par valeur identique
HAVING `Nbr commandes` > 10;
-- ex5
SELECT `customers`.`CompanyName` AS `Client`,
SUM(`order details`.UnitPrice * `order details`.`Quantity`) AS `CA`,
-- Grace � la fonction SUM j'additionne le total de chaque commande
`customers`.`Country` AS `Pays`
FROM `customers`
JOIN `orders` ON `orders`.`CustomerID` = `customers`.`CustomerID`
JOIN `order details` ON `order details`.`OrderID` = `orders`.`OrderID`
-- Je joint les tables grace � leur cl�s �trang�res et/ou cl� primaire grace � JOIN
GROUP BY `customers`.`CustomerID`
-- GROUP BY permet de regrouper par valeur identique
HAVING `CA` > 30000
-- HAVING me permet de donner une condition d'obligation � ce qui est regroup� par le 
-- GROUP BY comme le ferait un WHERE
ORDER BY `CA` DESC;
-- ex6
SELECT DISTINCT `customers`.`Country` AS `Pays`
-- L'ajout de DISTINCT retire tous les doublons de la liste
FROM `customers`
JOIN `orders` ON `orders`.`CustomerID` = `customers`.`CustomerID`
JOIN `order details` ON `order details`.`OrderID` = `orders`.`OrderID`
JOIN `products` ON `products`.`ProductID` = `order details`.`ProductID`
JOIN `suppliers` ON `suppliers`.`SupplierID` = `products`.`SupplierID`
-- Je joint toutes les tables grace � leur cl�s �trang�res et/ou cl� primaire en faisant le chemin jusque
-- la table dont j'ai besoin , � savoir suppliers les 2 tables dont j'ai besoin n'ont 
-- pas de cl�s �trang�res communes
WHERE `suppliers`.`CompanyName` = 'Exotic Liquids'
-- WHERE sert a donner une condition obligatoire � la s�lection
ORDER BY `customers`.`Country`;

-- ex7
SELECT SUM(`order details`.`UnitPrice` * `order details`.`Quantity`) AS `Montant Ventes 97`
-- Grace � la fonction SUM j'additionne le total de chaque commande
FROM `order details`
JOIN `orders` ON `orders`.`OrderID` = `order details`.`OrderID`
-- Je joint les tables grace � leur cl�s �trang�res et/ou cl� primaire grace � JOIN
WHERE `OrderDate` LIKE '1997%';
-- WHERE sert a donner une condition obligatoire � la s�lection
-- Comme c'est une date am�ricaine je dis ici que je veux que OrderDate commence par 1997
-- le % signifie peu importe ce qu'il y a derri�re 1997

-- ex8
SELECT MONTH(`orders`.`OrderDate`) AS `Mois_97`,
-- La fonction MONTH me permet de s�lectionner les mois des dates
SUM(`order details`.`UnitPrice` * `order details`.`Quantity`) AS `Montant Ventes`
-- Grace � la fonction SUM j'additionne le total de chaque commande
FROM `orders`
JOIN `order details` ON `order details`.`OrderID` = `orders`.`OrderID`
-- Je joint les tables grace � leur cl�s �trang�res et/ou cl� primaire grace � JOIN
WHERE `OrderDate` LIKE '1997%'
-- WHERE sert a donner une condition obligatoire � la s�lection
-- Comme c'est une date am�ricaine je dis ici que je veux que OrderDate commence par 1997
-- le % signifie peu importe ce qu'il y a derri�re 1997
GROUP BY `Mois_97`;

-- ex9
SELECT Max(`orders`.`OrderDate`) AS `Date de derni�re commande`
-- La fonction Max me permet ici de s�lectionner la date la plus r�cente �tant la plus avanc�
FROM `orders`
JOIN `customers` ON `customers`.`CustomerID` = `orders`.`CustomerID`
-- Je joint les tables grace � leur cl�s �trang�res et/ou cl� primaire grace � JOIN
WHERE `customers`.`CompanyName` = 'Du monde entier';
-- WHERE sert a donner une condition obligatoire � la s�lection

-- ex10
SELECT ROUND(AVG(DATEDIFF(`ShippedDate`, `OrderDate`))) AS `D�lai de livraison moyen en jours`
-- La fonction Round permet d'arrondir un r�sultat
-- La fonction AVG permet de faire une moyenne
-- La fonction DATEDIFF permet de trouver le nombre de jour entre 2 date
-- Mis en corr�lation elles me donnent le d�lai de livraison moyen
FROM `orders`;