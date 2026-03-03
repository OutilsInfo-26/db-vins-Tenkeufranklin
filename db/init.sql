DROP TABLE IF EXISTS vins CASCADE;
DROP TABLE IF EXISTS cepages CASCADE;
DROP TABLE IF EXISTS domaines CASCADE;
DROP TABLE IF EXISTS vins_cepages CASCADE;

CREATE TABLE domaines (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    pays VARCHAR(50),
    region VARCHAR(50)
);

CREATE TABLE vins (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    annee INT,
    prix DECIMAL,
    domaine_id INT,

    FOREIGN KEY (domaine_id) REFERENCES domaines(id)
);

CREATE TABLE cepages (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    origine VARCHAR(50),
    couleur VARCHAR(20)
);

CREATE TABLE vins_cepages (
    id SERIAL PRIMARY KEY,
    vin_id INT REFERENCES vins(id),
    cepage_id INT REFERENCES cepages(id),
    
    FOREIGN KEY (vin_id) REFERENCES vins(id),
    FOREIGN KEY (cepage_id) REFERENCES cepages(id)
);


INSERT INTO domaines (nom, pays, region) VALUES
('Château Margaux', 'France', 'Bordeaux'),
('Domaine de la Romanée-Conti', 'France', 'Bourgogne'),
('Antinori', 'Italie', 'Toscane'),
('Opus One', 'USA', 'Napa Valley'),
('Penfolds', 'Australie', 'Barossa Valley'),
('Catena Zapata', 'Argentine', 'Mendoza'),
('Concha y Toro', 'Chili', 'Maipo Valley'),
('Vega Sicilia', 'Espagne', 'Ribera del Duero'),
('Tokaji', 'Hongrie', 'Tokaj'),
('Château Musar', 'Liban', 'Bekaa Valley');

INSERT INTO domaines (nom, pays, region) VALUES
('Château Yquem', 'France', 'Sauternes'),
('Château de Beaucastel', 'France', 'Châteauneuf-du-Pape'),
('Château Lafite Rothschild', 'France', 'Pauillac'),
('Château Haut-Brion', 'France', 'Pessac-Léognan'),
('Château Cheval Blanc', 'France', 'Saint-Émilion');

INSERT INTO vins (nom, annee, prix, domaine_id) VALUES
('Château Yquem 2010', 2010, 450.00, 11),
('Châteauneuf-du-Pape 2016', 2016, 60.00, 12),
('Château Lafite Rothschild 2015', 2015, 1000.00, 13),
('Château Haut-Brion 2014', 2014, 850.00, 14),
('Château Cheval Blanc 2018', 2018, 950.00, 15),
('Château Pichon Baron 2016', 2016, 150.00, 13),
('Château Smith Haut Lafitte 2017', 2017, 120.00, 14),
('Château Clinet 2016', 2016, 130.00, 2),
('Clos des Papes 2015', 2015, 95.00, 12),
('Château Rieussec 2011', 2011, 75.00, 11);



-- Insertion de données dans vins

INSERT INTO vins (nom, annee, prix, domaine_id) VALUES
('Margaux 2015', 2015, 450.00, 1),
('La Tâche 2012', 2012, 3200.00, 2),
('Tignanello 2018', 2018, 90.00, 3),
('Opus One 2016', 2016, 350.00, 4),
('Grange 2015', 2015, 500.00, 5),
('Nicolás Catena Zapata 2017', 2017, 110.00, 6),
('Don Melchor 2018', 2018, 140.00, 7),
('Unico 2010', 2010, 400.00, 8),
('Aszú 5 Puttonyos 2013', 2013, 60.00, 9),
('Musar Red 2014', 2014, 50.00, 10);

INSERT INTO vins (nom, annee, prix, domaine_id) VALUES
('Château Yquem 2010', 2010, 450.00, 11),
('Châteauneuf-du-Pape 2016', 2016, 60.00, 12),
('Château Lafite Rothschild 2015', 2015, 1000.00, 13),
('Château Haut-Brion 2014', 2014, 850.00, 14),
('Château Cheval Blanc 2018', 2018, 950.00, 15),
('Château Pichon Baron 2016', 2016, 150.00, 13),
('Château Smith Haut Lafitte 2017', 2017, 120.00, 14),
('Château Clinet 2016', 2016, 130.00, 2),
('Clos des Papes 2015', 2015, 95.00, 12),
('Château Rieussec 2011', 2011, 75.00, 11);


-- Insertion de données dans cepages

INSERT INTO cepages (nom, origine, couleur) VALUES
('Cabernet Sauvignon', 'France', 'Rouge'),
('Merlot', 'France', 'Rouge'),
('Pinot Noir', 'France', 'Rouge'),
('Sangiovese', 'Italie', 'Rouge'),
('Syrah', 'France', 'Rouge'),
('Tempranillo', 'Espagne', 'Rouge'),
('Malbec', 'France', 'Rouge'),
('Chardonnay', 'France', 'Blanc'),
('Sauvignon Blanc', 'France', 'Blanc'),
('Furmint', 'Hongrie', 'Blanc');

-- Insertion de données dans vins_cepages

INSERT INTO vins_cepages (vin_id, cepage_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1),
(5, 5),
(6, 7),
(7, 1),
(8, 6),
(9, 10),
(10, 1),
(10, 2);

INSERT INTO vins_cepages (vin_id, cepage_id) VALUES
(11, 10), -- Château d'Yquem : Furmint ou Sémillon (ici on utilise Furmint)
(12, 5),  -- Châteauneuf-du-Pape : Syrah
(12, 2),  -- et Merlot
(13, 1),  -- Lafite : Cabernet Sauvignon
(13, 2),  -- et Merlot
(14, 1),  -- Haut-Brion : Cabernet Sauvignon
(14, 2),
(15, 2),  -- Cheval Blanc : Merlot
(15, 3),  -- et Pinot Noir
(16, 1),  -- Pichon Baron : Cabernet Sauvignon
(17, 8),  -- Smith Haut Lafitte : Chardonnay
(18, 2),  -- Clinet : Merlot
(19, 5),  -- Clos des Papes : Syrah
(20, 10);

-- Domaines sans vins associés
INSERT INTO domaines (nom, pays, region) VALUES
('Domaine Weinbach', 'France', 'Alsace'),
('Ridge Vineyards', 'USA', 'Santa Cruz Mountains'),
('Marchesi di Barolo', 'Italie', 'Piémont');

-- Cépages sans vins associés
INSERT INTO cepages (nom, origine, couleur) VALUES
('Riesling', 'Allemagne', 'Blanc'),
('Grenache', 'Espagne', 'Rouge'),
('Viognier', 'France', 'Blanc');