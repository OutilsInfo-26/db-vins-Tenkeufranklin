# Exercices SQL — Base de données des vins

## Consigne

Enregistrer toutes les réponses dans le fichier `test.sql`.
Chaque requête doit être précédée d'un commentaire indiquant le numéro de la question, par exemple :

```sql
-- Question 1
SELECT ...
```

---

## Tables disponibles

- `domaines` : id, nom, pays, region
- `vins` : id, nom, annee, prix, domaine_id
- `cepages` : id, nom, origine, couleur
- `vins_cepages` : id, vin_id, cepage_id

---

## Partie 1 — SELECT de base

**Question 1**
Afficher tous les vins de la base de données.

**Question 2**
Afficher tous les domaines de la base de données.

**Question 3**
Afficher tous les cépages de la base de données.

---

## Partie 2 — Choisir les attributs

**Question 4**
Afficher uniquement le nom et l'année de tous les vins.

**Question 5**
Afficher uniquement le nom et le pays de tous les domaines.

**Question 6**
Afficher uniquement le nom et la couleur de tous les cépages.

---

## Partie 3 — SELECT + WHERE

**Question 7**
Afficher tous les vins dont l'année est 2016.

**Question 8**
Afficher tous les vins dont le prix est supérieur à 200 CHF.

**Question 9**
Afficher tous les domaines situés en France.

**Question 10**
Afficher tous les cépages de couleur rouge.

**Question 11**
Afficher les vins dont le prix est compris entre 50 et 150 CHF.

---

## Partie 4 — IN / NOT IN avec sous-requête

**Question 12**
Afficher les cépages qui n'ont aucun vin associé dans la base de données.
*(Utiliser `NOT IN` avec un `SELECT` sur la table `vins_cepages`.)*

**Question 13**
Afficher les domaines qui ne produisent aucun vin dans la base de données.
*(Utiliser `NOT IN` avec un `SELECT` sur la table `vins`.)*

**Question 14**
Afficher les vins qui sont produits par un domaine français.
*(Utiliser `IN` avec un `SELECT` sur la table `domaines`.)*

**Question 15**
Afficher les vins qui utilisent un cépage d'origine espagnole.
*(Utiliser `IN` avec un `SELECT` sur la table `vins_cepages`, puis sur la table `cepages`.)*

---

## Partie 5 — ORDER BY

**Question 16**
Afficher tous les vins triés par prix croissant.

**Question 17**
Afficher tous les vins triés par année décroissante (du plus récent au plus ancien).

**Question 18**
Afficher les vins dont le pays du domaine est 'France', triés par prix décroissant.
*(Pour l'instant, chercher les domaine_id correspondants dans la table domaines.)*

---

## Partie 6 — JOIN

**Question 19**
Afficher le nom de chaque vin ainsi que le nom du domaine qui le produit.

**Question 20**
Afficher le nom de chaque vin, son année et le pays du domaine qui le produit.

**Question 21**
Afficher le nom de chaque vin ainsi que le nom de son (ou ses) cépage(s).

**Question 22**
Afficher le nom du vin, le nom du domaine et le nom du cépage pour chaque association dans la base.

---

## Partie 7 — Agrégats (COUNT, MAX, MIN, AVG)

**Question 23**
Compter le nombre total de vins dans la base de données.

**Question 24**
Trouver le prix le plus élevé parmi tous les vins.

**Question 25**
Trouver le prix le moins élevé parmi tous les vins.

**Question 26**
Calculer le prix moyen de tous les vins.
