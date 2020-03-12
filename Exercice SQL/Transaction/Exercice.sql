/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  80010-70-07
 * Created: 26 févr. 2020
 */

--Exercice 1

 START TRANSACTION;
 
    SELECT nomfou FROM fournis WHERE numfou=120;
 
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120; 
 
    SELECT nomfou FROM fournis WHERE numfou=120;

-- Je conclue que la modification n'est pas enrisgistrer ou annuler pour l'instant

-- Les données sont modifiables car la transaction n'est pas encore validée

-- La transaction n'est pas terminée

-- Pour rendre la modification permanente on ajoute COMMIT après UPDATE

  START TRANSACTION;
 
    SELECT nomfou FROM fournis WHERE numfou=120;
 
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120; 
 
    COMMIT;

-- Pour annuler la transaction on ajoute ROLLBACK après UPDATE

START TRANSACTION;
 
    SELECT nomfou FROM fournis WHERE numfou=120;
 
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120; 

    ROLLBACK;

-- Exercice 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

START TRANSACTION;
 
    SELECT nomfou FROM fournis WHERE numfou=120;
 
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120;

-- La modification est consultable car on demande de povoir lire les 
-- modifications de la transaction même sans avoir fait de commit.