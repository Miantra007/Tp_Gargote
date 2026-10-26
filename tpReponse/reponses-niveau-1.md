## A. Base de données

### 1.1 Script de migration
1) - Je choisis date_jour comme primary key
   - Car cette date ne peut pas etre repete 2 fois
2) - Il peut y avoir plusieurs plat du jour
   - pas de date

### 1.2 Données de test
3) - psql:niveau1_donnees.sql:35: ERROR:  new row for relation "plat" violates check constraint "ck_prix_plat"
DETAIL:  Failing row contains (16, tsaramaso, 0, 4, Pâte d'arachide, banane et farine de riz, cuite en feuille de b..., t).
- psql:niveau1_donnees.sql:39: ERROR:  duplicate key value violates unique constraint "ck_nom_plat"
DETAIL:  Key (nom)=(menakely) already exists.

## B. API et code métier

### 1.3 Le modèle `PlatModel`
{
    "id": 1,
    "nom": "Vary amin'anana",
    "prix": 2000,
    "id_categorie": 1,
    "description": "Sakafo matsiro",
    "disponnible": false
}

### 1.4 Filtrer les plats disponibles


### 1.5 Le plat du jour
