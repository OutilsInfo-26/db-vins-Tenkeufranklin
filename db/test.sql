--Partie 1
--Question 1: Afficher tout les vins de la base de données
SELECT * FROM vins;

--Question 2: Afficher tous les domaines de la base de données.
SELECT * FROM domaines;

-- Question 3: Afficher tous les cépages de la base de données.
SELECT * FROM cepages;

--Partie 2
--Question 4: Afficher uniquement le nom et l'année de tous les vins.
SELECT nom, annee FROM vins;

--Question 5: Afficher uniquement le nom et le pays de tous les domaines.
SELECT nom, pays FROM domaines;

--Question 6: Afficher uniquement le nom et la couleur de tous les cépages.
SELECT nom, couleur FROM cepages;

--Partie 3
--Question 7: Afficher tous les vins dont l'année est 2016.
SELECT * FROM vins WHERE annee IN (2016);

--Question 8: Afficher tous les vins dont le prix est supérieur à 200 CHF.
SELECT * FROM vins WHERE prix > 200;

--Question 9: Afficher tous les domaines situés en France.
SELECT * FROM domaines WHERE pays LIKE 'France';

--Question 10: Afficher tous les cépages de couleur rouge.
SELECT * FROM cepages WHERE couleur LIKE 'Rouge';

--Question 11: Afficher les vins dont le prix est compris entre 50 et 150 CHF.
SELECT * FROM vins WHERE prix >= 50 AND prix <= 150;

--Partie 4:
--Question 12: Afficher les cépages qui n'ont aucun vin associé dans la base de données.
SELECT * FROM cepages WHERE id NOT IN (SELECT cepage_id FROM vins_cepages);

--Question 13: Afficher les domaines qui ne produisent aucun vin dans la base de données. 
SELECT * FROM domaines WHERE id NOT IN (SELECT domaine_id FROM vins);

--Question 14: Afficher les vins qui sont produits par un domaine français.
SELECT * FROM vins WHERE domaine_id IN (SELECT id FROM domaines WHERE pays LIKE 'France');

--Question 15: Afficher les vins qui utilisent un cépage d'origine espagnole.
SELECT * FROM vins 
WHERE id IN 
(SELECT vin_id FROM vins_cepages 
WHERE cepage_id IN
(SELECT id FROM cepages WHERE origine LIKE 'Espagne'));  

--Partie 5:
--Question 16: Afficher tous les vins triés par prix croissant
SELECT * FROM vins ORDER BY prix;

--Question 17: Afficher tous les vins triés par année décroissante (du plus récent au plus ancien).
SELECT * FROM vins ORDER BY annee DESC;

--Question 18: Afficher les vins dont le pays du domaine est 'France', triés par prix décroissant. 
SELECT * FROM vins 
WHERE domaine_id IN 
(SELECT id FROM domaines 
WHERE pays LIKE 'France')ORDER BY prix DESC;

--Partie 6:
--Question 19: Afficher le nom de chaque vin ainsi que le nom du domaine qui le produit.
SELECT vins.nom, domaines.nom FROM vins
JOIN domaines ON vins.domaine_id = domaines.id;

--Question 20: Afficher le nom de chaque vin, son année et le pays du domaine qui le produit.
SELECT vins.nom, vins.annee, domaines.pays FROM vins
JOIN domaines ON vins.domaine_id = domaines.id;

--Question 21: Afficher le nom de chaque vin ainsi que le nom de son (ou ses) cépage(s).
SELECT vins.nom, cepages.nom FROM vins
JOIN vins_cepages ON vins.id = vins_cepages.vin_id
JOIN cepages ON vins_cepages.cepage_id = cepages.id;

--Question 22: Afficher le nom du vin, le nom du domaine et le nom du cépage pour chaque association dans la base.
SELECT vins.nom, domaines.nom, cepages.nom FROM vins
JOIN domaines ON vins.domaine_id = domaines.id
JOIN vins_cepages ON vins.id = vins_cepages.vin_id
JOIN cepages ON vins_cepages.cepage_id = cepages.id;

--Partie 7:
--Question 23: Compter le nombre total de vins dans la base de données.
SELECT COUNT(*) FROM vins;

--Question 24: Trouver le prix le plus élevé parmi tous les vins.
SELECT MAX(prix) FROM vins;

-- Question 25: Trouver le prix le moins élevé parmi tous les vins.
SELECT MIN(prix) FROM vins;

-- Question 26: Calculer le prix moyen de tous les vins.

SELECT AVG(prix) AS prix_moyen FROM vins;
