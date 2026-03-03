# Exemple PostgreSQL + pgAdmin avec Docker
## Objectif
Créer un environnement de base de données avec :
 - Un conteneur **PostgreSQL**
 - Un conteneur **pgAdmin**

## PgAdmin
Pour installer pgAdmin, il faut le télécharger depuis le site : [text](https://www.pgadmin.org/download/)

### Accéder à pgAdmin
1. Lancer le programme
2. Ajouter un serveur
   1. Configurer le serveur :
      - **Nom** : `PostgreSQL-Vins`
      - **Host** : `127.0.0.1`
      - **Port** : `5432`
      - **Maintenance database** : `mydb`
      - **Username** : `postgres`
      - **Password** : `password`

### Initialisation de la base de données (PgAdmin)
- Cliquer sur mydb
- Cliquer droit sur mydb > Query Tool
- Ouvrir le fichier `init.sql` et exécuter les commandes SQL
- Vérifier que les tables sont bien créées dans le schéma public

### Initialisation de la base de données (CLI)
Dans un terminal : 
```bash
docker exec -it db-vins psql -U postgres -d mydb -f /db/init.sql
```

### Commandes utiles
Démarrer l'environnement :
```bash
docker-compose up -d
```
Arrêter les conteneurs :
```bash
docker-compose down
```
Voir les logs :
```bash
docker-compose logs -f -n10
```
Se connecter à PostgreSQL via le terminal :
```bash
docker exec -it b-vins psql -U postgres -d mydb
```

Les commandes de base dans PostgreSQL CLI :
- Lister les bases de données : `\l`
- Lister les tables de la base de données courante : `\dt`
- Lister les colonnes d'une table : `\d nom_table`
- Afficher les données d'une table : `SELECT * FROM nom_table;`


### Structure de la base de données
- `vins` : liste des vins
- `domaines` : chaque vin appartient à un domaine (relation 1:N)
- `vins_cepages` : table de jointure entre `vins` et `cepages`
- `cepages` : types de cépages utilisés dans les vins
